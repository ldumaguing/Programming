#!/usr/bin/env perl

use strict;
use warnings;
use diagnostics;
use DBI;
use v5.42;

# pl/'GAME - generate canvas.pl'   scenario/1-Recon.txt   1

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
my $pix_x        = 0;
my $pix_y        = 0;

my $filename    = $ARGV[0];
my $scenario_id = $ARGV[1];

open my $fh, '<', $filename or die "Cannot open $filename: $!";

$stmt =
  "SELECT txt_val FROM scenario WHERE key = 'maps' AND id = " . $scenario_id;
$rs = $conn->prepare($stmt);
$rs->execute();
while ( my @ROW = $rs->fetchrow_array() ) {
    my $line = $ROW[0];
    define_dims($line);
}
$rs->finish();

$stmt =
  "SELECT num1, num2 FROM scenario WHERE key = 'map_dim' AND id = "
  . $scenario_id;
$rs = $conn->prepare($stmt);
$rs->execute();
while ( my @ROW = $rs->fetchrow_array() ) {
    $pix_x = $ROW[0] * $column_count;
    $pix_y = $ROW[1] * $row_count;

}
$rs->finish();

say $pix_x;
say $pix_y;

$conn->disconnect();

# ***************************************************************
sub define_dims {
    my ($line) = @_;
    $row_count = split /_/, $line;
    my @rows = split /_/, $line;
    foreach my $x (@rows) {
        $x =~ s/^,//;
        my $Y = split /,/, $x;
        if ( $Y > $column_count ) { $column_count = $Y; }
    }
}

