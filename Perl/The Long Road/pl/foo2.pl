#!/usr/bin/env perl

use strict;
use warnings;
use diagnostics;

use v5.42;

my $scenario_num = 1;

# ***************************************************************************************
use DBI;
my $conn = DBI->connect( "dbi:SQLite:dbname=db/TLR.db", "", "" );

spew_derivitives();

$conn->disconnect();

# *********************************************************
sub spew_derivitives {
    my $stmt =
      "select num1, num2 from scenario where id = ? and key = '0x0' limit 1";
    my $rs = $conn->prepare($stmt);
    $rs->execute($scenario_num);
    my ( $Ax, $Ay ) = $rs->fetchrow_array();

    $stmt =
"select num1, num2 from scenario where id = ? and key = 'lowerRight' limit 1";
    $rs = $conn->prepare($stmt);
    $rs->execute($scenario_num);
    my ( $Bx, $By ) = $rs->fetchrow_array();

    $stmt =
"select num1, num2 from scenario where id = ? and key = 'hexCount' limit 1";
    $rs = $conn->prepare($stmt);
    $rs->execute($scenario_num);
    my ( $Cx, $Cy ) = $rs->fetchrow_array();
    $Cx -= 1;
    $Cy -= 1;

    my $hex_width  = ( $Bx - $Ax ) / $Cx;
    my $hex_height = ( $By - $Ay ) / $Cy;
    my $shift_down = $hex_height / 2.0;

    $stmt =
        "INSERT INTO scenario (id, key, num1, num2, num3) VALUES ("
      . $scenario_num . ", "
      . "'hexInfo'" . ", "
      . $hex_width . ", "
      . $hex_height . ", "
      . $shift_down . ")";
    $rs = $conn->prepare($stmt);
    $rs->execute();

    $rs->finish();
}

