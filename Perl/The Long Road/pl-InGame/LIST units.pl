#!/usr/bin/env perl

use strict;
use warnings;
use diagnostics;
use DBI;
use v5.42;

# ***************************************************************************************
my $scenario_id = 0;

my $conn = DBI->connect( "dbi:SQLite:dbname=db/TLR.db", "", "" );

my $stmt = "SELECT num1 FROM scenario WHERE key = 'currScenario'";
my $rs   = $conn->prepare($stmt);
$rs->execute();
while ( my @ROW = $rs->fetchrow_array() ) {
    $scenario_id = $ROW[0];
}

$stmt =
    "SELECT id, unit_name, unit_id, img_id, faction, "
  . "loc_x, loc_y, status, curr_MF FROM instance WHERE "
  . "scenario_id = "
  . $scenario_id
  . " ORDER BY faction, unit_name";
$rs = $conn->prepare($stmt);
$rs->execute();

my $faction = "";
while ( my @ROW = $rs->fetchrow_array() ) {
    if ( $faction ne $ROW[4] ) {
        $faction = $ROW[4];
        say "****************************** " . $faction;
    }
    my $carrier_id = get_carrier( $ROW[0] );
    if ( $carrier_id <= 0 ) {
        say $ROW[0] . ": " . $ROW[1] . " (" . $ROW[5] . "," . $ROW[6] . ")";
    }
    else {
        say $ROW[0] . ": " . $ROW[1] . " (inside " . $carrier_id . ")";
    }
}
$rs->finish();

$conn->disconnect();

# ***************************************************************************************
sub get_carrier {
    my ($carree_id) = @_;
    my $carrier_id = 0;

    my $stmt_1 = "SELECT Bee FROM relation WHERE Aye = " . $carree_id;
    my $rs1    = $conn->prepare($stmt_1);
    $rs1->execute();
    while ( my @ROW = $rs1->fetchrow_array() ) {
        $carrier_id = $ROW[0];
    }

    $rs1->finish();

    return $carrier_id;
}

