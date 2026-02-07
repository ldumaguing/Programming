#!/usr/bin/env perl

use strict;
use warnings;
use diagnostics;
use DBI;
use v5.42;

# ***************************************************************************************
my $argNum = @ARGV;
if ( $argNum < 1 ) {
    say "pl-InGame/'START game.pl' 1";
    exit;
}

my $conn = DBI->connect( "dbi:SQLite:dbname=db/TLR.db", "", "" );
my $stmt = "DELETE FROM scenario WHERE key = 'currScenario'";
my $rs   = $conn->prepare($stmt);
$rs->execute();

$stmt =
    "INSERT INTO scenario (id, key, num1) VALUES ("
  . 0 . ", "
  . "'currScenario', "
  . $ARGV[0] . ")";
$rs = $conn->prepare($stmt);
$rs->execute();

$stmt =
  "SELECT num1 FROM scenario WHERE key = 'turns'" . " AND id = " . $ARGV[0];
$rs = $conn->prepare($stmt);
$rs->execute();
my $turns;
while ( my @ROW = $rs->fetchrow_array() ) {
    $turns = $ROW[0];
}

$stmt =
    "UPDATE scenario SET num2 = 1"
  . " WHERE key = 'turns'"
  . " AND id = "
  . $ARGV[0];
$rs = $conn->prepare($stmt);
$rs->execute();

$rs->finish();
$conn->disconnect();







