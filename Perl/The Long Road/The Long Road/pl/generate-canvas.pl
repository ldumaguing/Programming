#!/usr/bin/env perl

use strict;
use warnings;
use diagnostics;

use v5.42;

my $scenario_num = 1;
my @zeroXzero = ();
my @hexInfo = ();

# ***************************************************************************************
use DBI;
my $conn = DBI->connect( "dbi:SQLite:dbname=db/TLR.db", "", "" );

my $stmt = "select txt_val from scenario where id = " . $scenario_num . " and key = 'map'";
my $rs = $conn->prepare($stmt);
$rs->execute();
my $img_map = $rs->fetchrow_array();

my $html_1 = <<"END";
<!DOCTYPE html>
<html>

<head>
   <meta charset="UTF-8">
   <title>The Long Road</title>
   <style type="text/css">
      body {
         margin: 0;
      }
   </style>
</head>

<body>
   <div style="display:none;">
      <img src="TLR/$img_map" id="map0">
END

# ******************************************
$stmt = "select num1, num2 from scenario where id = " . $scenario_num . " and key = '0x0'";
$rs = $conn->prepare($stmt);
$rs->execute();
my ($A, $B) = $rs->fetchrow_array();
push(@zeroXzero, $A, $B);

$stmt = "select num1, num2, num3 from scenario where id = " . $scenario_num . " and key = 'hexInfo'";
$rs = $conn->prepare($stmt);
$rs->execute();
($A, $B, my $C) = $rs->fetchrow_array();
push(@hexInfo, $A, $B, $C);

# ******************************************
$stmt = "select num1, num2 from scenario where id = " . $scenario_num . " and key = 'map_dim'";
$rs = $conn->prepare($stmt);
$rs->execute();
my ($dimX, $dimY) = $rs->fetchrow_array();

my $html_2 = <<"END";
   </div>

   <canvas id="myCanvas"  width="$dimX" height="$dimY">
      Sorry, your browser does not support canvas.
   </canvas>

   <script>
      const canvas = document.getElementById("myCanvas");
      const ctx = canvas.getContext("2d");
      const map0 = document.getElementById("map0");
END

# ***************************************************************************************
print $html_1;

$stmt = "select img_id, name from v_img_filename where scenario_id = " . $scenario_num;
$rs = $conn->prepare($stmt);
$rs->execute();
while ( my ($A, $B) = $rs->fetchrow_array() ) {
    say "      <img src=\"TLR/" . $B . "\"" .  " id=\"img" . $A . "\">";
}

print $html_2;

$stmt = "select img_id, name from v_img_filename where scenario_id = " . $scenario_num;
$rs = $conn->prepare($stmt);
$rs->execute();
while ( my ($A, $B) = $rs->fetchrow_array() ) {
    say "      const img" . $A . " = document.getElementById(\"img" . $A . "\");";
}

say "";
say "      map0.addEventListener(\"load\", (e) => {";
say "         ctx.drawImage(map0, 0, 0);";

place_imgs();

say "      });";
say "   </script> ";
say "</body>";
say "</html>";

$rs->finish();
$conn->disconnect();
# ***** THE END

# ***************************************************************************************
sub place_imgs {
    $stmt = "select img_id, loc_x, loc_y from instance where status = (1 << 0) and scenario_id = " . $scenario_num;
    $rs = $conn->prepare($stmt);
    $rs->execute();
    while ( my ($A, $B, $C) = $rs->fetchrow_array() ) {
        my $x = ($B * $hexInfo[0]) + $zeroXzero[0];
        my $y = ($C * $hexInfo[1]) + $zeroXzero[1];
        if($B % 2 != 0) {
            $y += $hexInfo[2];
        }
        say "         ctx.drawImage(img" . $A . ", " . $x . ", " . $y . ");";
    }
}


















