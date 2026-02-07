#!/usr/bin/env perl

use strict;
use warnings;
use diagnostics;
use DBI;
use v5.42;

use lib "pl-InGame/module";
use Embark;

# ***************************************************************************************
my $argNum = @ARGV;
if ( $argNum < 1 ) {
    say "pl/'GAME - execute commands.pl'   scenario/1-Recon.txt";
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

my $filename = $ARGV[0];

open my $fh, '<', $filename or die "Cannot open $filename: $!";

$stmt = "DELETE FROM relation";
$rs   = $conn->prepare($stmt);
$rs->execute();
$rs->finish();

my $line = "";
while ( $line = <$fh> ) {
    chomp $line;
    last if ( $line =~ /^END/ );
    next if ( $line =~ /^[\*#\/;\-=]/ );
    next if ( $line =~ /^$/ );

    if ( $line =~ /\[place\]/ ) {
        placement();
        next;
    }
    if ( $line =~ /\[embark\]/ ) {
        embarking( $conn, $line, $scenario_id );
        next;
    }
}

$conn->disconnect();
close $fh;

# ***************************************************************************************
sub placement {
    $line =~ s/\ *\ /\ /g;
    my @fields = split /\ /, $line;

    $stmt =
        "UPDATE instance set loc_x = "
      . $fields[2]
      . ", loc_y = "
      . $fields[3]
      . ", status = 1"
      . " WHERE id = "
      . $fields[1]
      . " AND scenario_id = "
      . $scenario_id;
    my $rs = $conn->prepare($stmt);
    $rs->execute();
    $rs->finish();
}

