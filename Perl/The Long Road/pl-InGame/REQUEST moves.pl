#!/usr/bin/env perl

use strict;
use warnings;
use diagnostics;
use DBI;
use v5.42;

#use lib "pl-InGame/module";
#use Hexagon;

# ***************************************************************************************
my @args = @ARGV;

my $x = @ARGV;
if ( $x < 2 ) {
    say "pl-InGame/REQUEST\ moves.pl '1234'  'S3'  'SE3' ...";
    say "                              unit id";
    say "                              N, S, NW, NE, SW, or SE";
    exit;
}

my $scenario_id = 0;
my $currTurn    = 0;

my $conn = DBI->connect( "dbi:SQLite:dbname=db/TLR.db", "", "" );

my $stmt = "SELECT num1 FROM scenario WHERE key = 'currScenario'";
my $rs   = $conn->prepare($stmt);
$rs->execute();
while ( my @ROW = $rs->fetchrow_array() ) {
    $scenario_id = $ROW[0];
}

$stmt =
  "SELECT num2 FROM scenario WHERE key = 'turns'" . " AND id = " . $scenario_id;
$rs = $conn->prepare($stmt);
$rs->execute();
while ( my @ROW = $rs->fetchrow_array() ) {
    $currTurn = $ROW[0];
}

$stmt =
"INSERT INTO request (scenario_id, turn_num, sub_turn, subject, verb, object) VALUES ("
  . $scenario_id . ", "
  . $currTurn . ", " . "1, "
  . $args[0] . ", "
  . "'move'" . ", " . "'"
  . $args[1] . "')";
$rs->finish();
$conn->disconnect();

