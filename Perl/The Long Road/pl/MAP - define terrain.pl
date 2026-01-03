#!/usr/bin/env perl

use strict;
use warnings;
use diagnostics;

use v5.42;

my $line = "";
my $stmt = "";

my $modeNum = 0;

# ***************************************************************************************
use DBI;
my $conn = DBI->connect( "dbi:SQLite:dbname=db/TLR.db", "", "" );

my $filename  = $ARGV[0];
my $fname     = $filename;
my $letterRef = ord('A') + 1;

$fname =~ s/db\///;
$fname =~ s/\.txt//;

if ( defined $filename ) {
    slurp();
}
else {
    say "empty";
}

$conn->disconnect();

# *********************************************************
sub slurp {
    open my $fh, '<', $filename or die "Cannot open $filename: $!";

    while ( $line = <$fh> ) {
        chomp $line;    # Remove trailing newline character
        last if ( $line =~ /END/ );

        if ( $line =~ /^$/ )       { $modeNum = 0; next; }
        if ( $line =~ /HILL \*/ )  { $modeNum = 1; next; }
        if ( $line =~ /ROAD \*/ )  { $modeNum = 2; next; }
        if ( $line =~ /RIVER \*/ ) { $modeNum = 3; next; }

        if ( $modeNum == 1 ) { register_hill(); }
        if ( $modeNum == 2 ) { register_road(); }
        if ( $modeNum == 3 ) { register_river(); }
    }

    close $fh;
}

# *********************************************************
# B1: 0,0
sub register_river {
    $line =~ tr/[a-z]/[A-Z]/;
    say $line;
    my ( $hex, $spines ) = split /:/, $line;
    my $X = ord( substr( $hex, 0, 1 ) ) - $letterRef;
    my $Y = int( substr( $hex, 1 ) ) - 1;

    #say $X;
    #say $Y;
    if   ( $X % 2 ) { odd_X(); }
    else            { even_X( $X, $Y, $spines ); }
}

# ***************************
sub odd_X {
}

# ***************************
sub even_X {
    my ( $X, $Y, $spines ) = @_;
    say "yo: " . $spines;
}

# *********************************************************
sub register_road {
    my $exits = 0;
    $line =~ tr/[a-z]/[A-Z]/;
    my @hexes = split /:/, $line;

    if ( $hexes[1] =~ /A/ ) { $exits = $exits | ( 1 << 0 ); }
    if ( $hexes[1] =~ /B/ ) { $exits = $exits | ( 1 << 1 ); }
    if ( $hexes[1] =~ /C/ ) { $exits = $exits | ( 1 << 2 ); }
    if ( $hexes[1] =~ /D/ ) { $exits = $exits | ( 1 << 3 ); }
    if ( $hexes[1] =~ /E/ ) { $exits = $exits | ( 1 << 4 ); }
    if ( $hexes[1] =~ /F/ ) { $exits = $exits | ( 1 << 5 ); }
    $exits = $exits << 1;

    $stmt =
        "UPDATE terrain set flag1 = (flag1 | "
      . $exits
      . ") WHERE "
      . "mapFile = '"
      . $fname
      . "' and "
      . "hexID = '"
      . $hexes[0] . "'";

    my $rs = $conn->prepare($stmt);
    $rs->execute();
    $rs->finish();
}

# *********************************************************
sub register_hill {
    $line =~ tr/[a-z]/[A-Z]/;
    my $rs = undef;

    my @hexes = split /,/, $line;
    foreach my $hexID (@hexes) {
        $stmt =
            "UPDATE terrain set flag1 = (flag1 | (1 << 0)) WHERE "
          . "mapFile = '"
          . $fname
          . "' and "
          . "hexID = '"
          . $hexID . "'";

        $rs = $conn->prepare($stmt);
        $rs->execute();
        $rs->finish();
    }
}

