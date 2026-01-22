#!/usr/bin/env perl

use strict;
use warnings;
use diagnostics;
use DBI;
use v5.42;

# pl/'GAME - generate canvas.pl'   scenario/1-Recon.txt   1

# ***************************************************************************************
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
END

# ***************************************************************************************
my $argNum = @ARGV;
if ( $argNum < 2 ) {
    say "pl/'GAME - generate canvas.pl'   scenario/1-Recon.txt   1";
    exit;
}

my $conn = DBI->connect( "dbi:SQLite:dbname=db/TLR.db", "", "" );
my $stmt = "";
my $rs   = undef;

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

# ***************************************************************
my @plates     = split /,/, $line;
my $x_multiply = 0;
my $y_multiply = 0;
foreach my $plate (@plates) {
    say $plate . " " . $x_multiply . "," . $y_multiply;
    $x_multiply++;
    if ( $plate =~ /_/ ) { $y_multiply++; $x_multiply = 0; }
}

say $map_w;
say $map_h;
say $pix_x;
say $pix_y;

$conn->disconnect();

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

