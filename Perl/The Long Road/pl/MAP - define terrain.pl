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

my $filename = $ARGV[0];
my $fname    = $filename;

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

        if ( $modeNum == 1 ) { register_hill(); }
        if ( $modeNum == 2 ) { register_road(); }

        if ( $line =~ /HILL \*/ ) { $modeNum = 1; }
        if ( $line =~ /ROAD \*/ ) { $modeNum = 2; }

    }

    close $fh;
}

# *********************************************************
sub register_road {
    if ( $line =~ /^$/ ) { return; }

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
    if ( $line =~ /^$/ ) { return; }

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

