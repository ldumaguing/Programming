#!/usr/bin/env perl

use strict;
use warnings;
use diagnostics;
use DBI;
use v5.42;

use lib "pl-InGame/module";
use Hexagon;

# ***************************************************************************************
my @args = @ARGV;

my $x = @ARGV;
say $x;


my $scenario_id = 0;

my $conn = DBI->connect( "dbi:SQLite:dbname=db/TLR.db", "", "" );

my $stmt = "SELECT num1 FROM scenario WHERE key = 'currScenario'";
my $rs   = $conn->prepare($stmt);
$rs->execute();
while ( my @ROW = $rs->fetchrow_array() ) {
    $scenario_id = $ROW[0];
}



say $args[0];
say $args[1];

say get_hex_distance( 0, 0, 10, 10 );

