#!/usr/bin/env perl

use strict;
use warnings;
use diagnostics;

use v5.42;

my $scenario_num = 1;

# ***************************************************************************************
use DBI;
my $conn = DBI->connect( "dbi:SQLite:dbname=db/TLR.db", "", "" );

my $stmt = "select txt_val from scenario where id = " . $scenario_num . " and key = 'map'";
my $rs = $conn->prepare($stmt);
$rs->execute();
my $img_map = $rs->fetchrow_array();
$rs->finish();

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










$stmt = "select num1, num2 from scenario where id = " . $scenario_num . " and key = 'map_dim'";
$rs = $conn->prepare($stmt);
$rs->execute();
my ($dimX, $dimY) = $rs->fetchrow_array();
$rs->finish();

my $html_2 = <<"END";
   </div>


   <canvas id="myCanvas"  width="$dimX" height="$dimY">
      Sorry, your browser does not support canvas.
   </canvas>

   <script>
      const canvas = document.getElementById("myCanvas");
      const ctx = canvas.getContext("2d");
END

# ***************************************************************************************
print $html_1;

my $stmt = "select img_id, name from v_img_filename where scenario_id = " . $scenario_num;
my $rs = $conn->prepare($stmt);
$rs->execute();

while ( my ($A, $B) = $rs->fetchrow_array() ) {
    say "      <img src=\"TLR/" . $B . "\"" .  " id=\"img" . $A . "\">";
}

say $html_2;















$conn->disconnect();



