#!/usr/bin/env perl

use strict;
use warnings;
use diagnostics;

use v5.42;

my $line = "";
my $stmt = "";

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

        if ( $line =~ /hill:/ ) {
            register_hill();
        }
    }

    close $fh;
}

# *********************************************************
sub register_hill {
    my $A = ord('A');
    $line =~ s/hill:\ *//;
    $line =~ tr/[a-z]/[A-Z]/;
    my $rs = undef;

    my @hexes = split /,/, $line;
    foreach my $hexID (@hexes) {
        my $letter = substr( $hexID, 0, 1 );
        my $x      = ord($letter);
        $x -= $A;
        $x -= 1;
        my $y = substr( $hexID, 1 );
        $stmt =
            "UPDATE terrain set flag1 = (flag1 | (1 << 0)) WHERE "
          . "mapFile = '"
          . $fname
          . "' and "
          . "hexID = '"
          . $hexID . "'";

        $rs = $conn->prepare($stmt);
        $rs->execute();
    }

    $rs->finish();

}

