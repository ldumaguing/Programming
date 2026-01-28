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
if ( $x < 2 ) {
    say "pl-InGame/QUERY\ LOS.pl '0,0'  '10,10'   hex locations";
    say "                       '1234' '5678'    unit ids";
    say "                       '1234' '10,10'   mix";
    say "                       '0,0'  '5678'    mix";
    exit;
}

my $scenario_id = 0;

my $conn = DBI->connect( "dbi:SQLite:dbname=db/TLR.db", "", "" );

my $stmt = "SELECT num1 FROM scenario WHERE key = 'currScenario'";
my $rs   = $conn->prepare($stmt);
$rs->execute();
while ( my @ROW = $rs->fetchrow_array() ) {
    $scenario_id = $ROW[0];
}

$rs->finish();
$conn->disconnect();

my @from = ();
my @to   = ();

# ***** from
if ( $args[0] =~ /,/ ) {
    my @Aye = split /,/, $args[0];
    push @from, $Aye[0];
    push @from, $Aye[1];
}
else {
    @from = get_hex_loc( $args[0] );
}

# ***** to
if ( $args[1] =~ /,/ ) {
    my @Aye = split /,/, $args[1];
    push @to, $Aye[0];
    push @to, $Aye[1];
}
else {
    @to = get_hex_loc( $args[1] );
}

clear_path( $from[0], $from[1], $to[0], $to[1] );
my @path1 = get_path( $from[0], $from[1], $to[0], $to[1] );
#clear_path( $to[0], $to[1], $from[0], $from[1] );
#my @path2 = get_path( $to[0], $to[1], $from[0], $from[1] );
foreach my ( $i, $j ) (@path1) {
    say $i . "," . $j;
    next;    # increment one more iteration
}
#say "---";
#foreach my ( $i1, $j1 ) (@path2) {
#    say $i1 . "," . $j1;
#    next;    # increment one more iteration
#}

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

