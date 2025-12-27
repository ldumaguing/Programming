#!/usr/bin/env perl

use strict;
use warnings;
use diagnostics;

use v5.42;

use DBI;
my $conn = DBI->connect( "dbi:SQLite:dbname=db/TLR.db", "", "" );
my $rs   = undef;

my $A_val = ord('A');

foreach my $mapLetter ( 'A' .. 'D' ) {
    foreach my $letter ( 'A' .. 'S' ) {
        my $x = ord($letter) - $A_val - 1;
        foreach my $num ( 0 .. 12 ) {
            my $stmt =
                "INSERT INTO terrain (mapFile, hexID, loc_x, loc_y) values ("
              . "'Map "
              . $mapLetter . "', '"
              . $letter
              . ( $num + 1 ) . "', "
              . $x . ", "
              . $num . ")";

            $rs = $conn->prepare($stmt);
            $rs->execute();
        }
    }
}
$rs->finish();
$conn->disconnect();

