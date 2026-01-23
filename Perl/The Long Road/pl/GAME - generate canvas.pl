#!/usr/bin/env perl

use strict;
use warnings;
use diagnostics;
use DBI;
use v5.42;
use List::Util qw(uniq);

# pl/'GAME - generate canvas.pl'   scenario/1-Recon.txt   1

# ***************************************************************************************
my @map_imgs =
  qw(TRL_Map_A_Final.jpg TRL_Map_B_Final.jpg TRL_Map_C_Final.jpg TLR_Map_D_Final.jpg);

# *****
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
END

# ***************************************************************************************
my $argNum = @ARGV;
if ( $argNum < 2 ) {
    say "pl/'GAME - generate canvas.pl'   scenario/1-Recon.txt   1";
    exit;
}

my $conn  = DBI->connect( "dbi:SQLite:dbname=db/TLR.db", "", "" );
my $stmt  = "";
my $rs    = undef;
my $count = 0;

my $row_count    = 0;
my $column_count = 0;
my $map_w        = 0;
my $map_h        = 0;
my $pix_x        = 0;
my $pix_y        = 0;
my $line         = "";

my $filename    = $ARGV[0];
my $scenario_id = $ARGV[1];

open my $fh, '<', $filename or die "Cannot open $filename: $!";

$stmt =
  "SELECT txt_val FROM scenario WHERE key = 'maps' AND id = " . $scenario_id;
$rs = $conn->prepare($stmt);
$rs->execute();
while ( my @ROW = $rs->fetchrow_array() ) {
    $line = $ROW[0];
    define_dims();
}
$rs->finish();

$stmt =
  "SELECT num1, num2 FROM scenario WHERE key = 'map_dim' AND id = "
  . $scenario_id;
$rs = $conn->prepare($stmt);
$rs->execute();
while ( my @ROW = $rs->fetchrow_array() ) {
    $map_h = $ROW[1];
    $map_w = $ROW[0];
    $pix_x = $map_w * $column_count;
    $pix_y = $map_h * $row_count;
}
$rs->finish();

say $html_1;
say "<body>\n   <div style=\"display:none;\">";
$count = 0;
foreach my $m (@map_imgs) {
    say "      <img src=\"TLR/" . $m . "\"" . " id=\"map" . $count . "\">";
    $count++;
}
register_imgs();
say "   </div>\n";

# ***************************************************************
say "   <canvas id=\"myCanvas\" width=" . $pix_x . " height=" . $pix_y . ">";
say "      Sorry, your browser does not support canvas.\n   </canvas>\n";
say "   <script>";
say "      const canvas = document.getElementById(\"myCanvas\");";
say "      const ctx = canvas.getContext(\"2d\");";
for my $i ( 1 .. scalar(@map_imgs) ) {
    say "      const map"
      . ( $i - 1 )
      . " = document.getElementById(\"map"
      . ( $i - 1 ) . "\");";
}

place_maps();

say "   </script>\n</body>\n</html>";

$conn->disconnect();

# ***************************************************************************************
sub register_imgs {
    my @unit_ids1 = ();
    $stmt = "SELECT distinct(unit_id) FROM instance";
    my $rs1 = $conn->prepare($stmt);
    $rs1->execute();
    while ( my @ROW = $rs1->fetchrow_array() ) {
        $stmt =
          "SELECT front, back, front1, back1 FROM unit WHERE id = " . $ROW[0];
        my $rs2 = $conn->prepare($stmt);
        $rs2->execute();
        while ( my @ROW1 = $rs2->fetchrow_array() ) {
            push( @unit_ids1, $ROW1[0], $ROW1[1], $ROW1[2], $ROW1[3] );
        }
        $rs2->finish();
    }
    $rs1->finish();

    my @uniq_unit_ids1 = uniq @unit_ids1;
    foreach my $i (@uniq_unit_ids1) {
        $stmt = "SELECT name FROM img WHERE id = " . $i;
        my $rs2 = $conn->prepare($stmt);
        $rs2->execute();
        while ( my @ROW1 = $rs2->fetchrow_array() ) {
            say "      <img src=\"TLR/"
              . $ROW1[0] . "\""
              . " id=\"img"
              . $i . "\">";
        }
        $rs2->finish();
    }
}

# ***************************************************************************************
sub place_maps {
    my @plates     = split /,/, $line;
    my $x_multiply = 0;
    my $y_multiply = 0;
    foreach my $plate (@plates) {
        if ( $plate =~ /_/ ) { $y_multiply++; $x_multiply = 0; }
        else {
            if ( $plate =~ /[abcd]/ ) {
                rotate_map( $plate, $x_multiply, $y_multiply );
                $x_multiply++;
                next;
            }
            say "\n      map"
              . ( ord($plate) - ord('A') )
              . ".addEventListener(\"load\", (e) => {";
            say "         ctx.drawImage(map"
              . ( ord($plate) - ord('A') ) . ", "
              . ( $map_w * $x_multiply ) . ", "
              . ( $map_h * $y_multiply ) . ");";
            say "      });";
            $x_multiply++;
        }
    }
}

# *****************
sub rotate_map {
    my ( $plate, $x_multiply, $y_multiply ) = @_;
    $plate = uc($plate);

    say "\n      map"
      . ( ord($plate) - ord('A') )
      . ".addEventListener(\"load\", (e) => {";
    say "         ctx.save();";
    say "         ctx.translate("
      . ( ( $map_w * $x_multiply ) + $map_w ) . ", "
      . ( ( $map_h * $y_multiply ) + $map_h ) . ");";
    say "         ctx.rotate(180*Math.PI/180);";
    say "         ctx.drawImage(map"
      . ( ord($plate) - ord('A') ) . ", " . "0, 0" . ");";
    say "         ctx.restore();";
    say "      });";
}

# ***************************************************************************************
sub define_dims {
    $row_count = split /_/, $line;
    my @rows = split /_/, $line;
    foreach my $x (@rows) {
        $x =~ s/^,//;
        my $Y = split /,/, $x;
        if ( $Y > $column_count ) { $column_count = $Y; }
    }
}

