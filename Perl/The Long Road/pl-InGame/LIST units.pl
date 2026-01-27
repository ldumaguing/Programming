#!/usr/bin/env perl

use strict;
use warnings;
use diagnostics;
use DBI;
use v5.42;

# ***************************************************************************************
my $argNum = @ARGV;
if ( $argNum < 1 ) {
    say "pl-InGame/'LIST units.pl' 1";
    exit;
}

my $conn = DBI->connect( "dbi:SQLite:dbname=db/TLR.db", "", "" );
my $stmt =
    "SELECT id, unit_name, unit_id, img_id, faction, "
  . "loc_x, loc_y, status, curr_MF FROM instance WHERE "
  . "scenario_id = "
  . $ARGV[0]
  . " ORDER BY faction, unit_name";
my $rs = $conn->prepare($stmt);
$rs->execute();

my $faction = "";
while ( my @ROW = $rs->fetchrow_array() ) {
    if ( $faction ne $ROW[4] ) {
        $faction = $ROW[4];
        say "****************************** " . $faction;
    }
    if ( get_carrier( $ROW[0] ) > 0 ) {
        say $ROW[0] . ": " . $ROW[1] . " (" . $ROW[5] . ", " . $ROW[6] . ")";
    }
    else {
        say "yo---";
    }
}
$rs->finish();

$conn->disconnect();

# ***************************************************************************************
sub get_carrier {
    my ($carree_id) = @_;
    my $carrier_id = 0;

    my $stmt_1 = "SELECT Bee FROM relation WHERE Aye = " . $carree_id;
    my $rs1    = $conn->prepare($stmt);
    $rs1->execute();
    while ( my @ROW = $rs1->fetchrow_array() ) {
        say "yo " . $stmt_1;
        $carrier_id = $ROW[0];
    }

    $rs1->finish();

    return 0;
}

