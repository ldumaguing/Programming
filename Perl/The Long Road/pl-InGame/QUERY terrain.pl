#!/usr/bin/env perl

use strict;
use warnings;
use diagnostics;
use DBI;
use v5.38.2;

use lib "pl-InGame/module";
use Hexagon;

# ***************************************************************************************
my @args = @ARGV;

my $x = @ARGV;
if ( $x < 1 ) {
    say "pl-InGame/QUERY\\ terrain.pl '0,0'   hex location";
    say "                            '1234'  unit id";
    exit;
}

my $scenario_id = 0;
my $game_name   = "";

my $conn = DBI->connect( "dbi:SQLite:dbname=db/TLR.db", "", "" );

my $stmt = "SELECT num1 FROM scenario WHERE key = 'currScenario'";
my $rs   = $conn->prepare($stmt);
$rs->execute();
while ( my @ROW = $rs->fetchrow_array() ) {
    $scenario_id = $ROW[0];
}

$stmt =
  "SELECT txt_val FROM scenario WHERE key = 'name' AND id = " . $scenario_id;
$rs = $conn->prepare($stmt);
$rs->execute();
while ( my @ROW = $rs->fetchrow_array() ) {
    $game_name = $ROW[0];
}

my @from = ();

# ***** from
if ( $args[0] =~ /,/ ) {
    my @Aye = split /,/, $args[0];
    push @from, $Aye[0];
    push @from, $Aye[1];
}
else {
    @from = get_hex_loc( $args[0] );
}

if ( is_hill( $game_name, $from[0], $from[1] ) ) {
    say "hill";
}

$rs->finish();
$conn->disconnect();

# ***************************************************************************************
sub get_hex_loc {
    my @args    = @_;
    my @hex_loc = ();

    my $stmt_1 =
        "SELECT loc_x, loc_y FROM instance WHERE scenario_id = "
      . $scenario_id
      . " AND id = "
      . $args[0];
    my $rs1 = $conn->prepare($stmt_1);
    $rs1->execute();
    while ( my @ROW = $rs1->fetchrow_array() ) {
        push @hex_loc, $ROW[0];
        push @hex_loc, $ROW[1];
    }
    $rs1->finish();

    $x = @hex_loc;
    if ( $x == 0 ) {
        say "unit id " . $args[0] . " doesn't exist";
        exit;
    }

    return @hex_loc;
}

