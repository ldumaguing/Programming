#!/usr/bin/env perl

use strict;
use warnings;
use diagnostics;

use v5.42;

use DBI;
my $conn = DBI->connect( "dbi:SQLite:dbname=db/TLR.db", "", "" );
my $rs   = undef;

my $A_val = ord('A');
my $stmt  = "delete from terrain";
$rs = $conn->prepare($stmt);
$rs->execute();

# ***********************
# x: -1 to 17 (19)
# y: -1 to 11 (13)
#
# ***********************

foreach my $mapLetter ( 'A' .. 'D' ) {
    foreach my $letter ( 'A' .. 'S' ) {
        my $x = ord($letter) - $A_val - 1;
        foreach my $num ( -1 .. 11 ) {
            my $numY = $num + 1;
            $stmt =
                "INSERT INTO terrain (mapFile, hexID, loc_x, loc_y) values ("
              . "'Map "
              . $mapLetter . "', '"
              . $letter
              . $numY . "', "
              . $x . ", "
              . $num . ")";
            if ( !( $x % 2 ) ) {
                if ( $num < 0 ) { next; }
            }
            $rs = $conn->prepare($stmt);
            $rs->execute();
        }
    }
}

$rs->finish();
$conn->disconnect();

