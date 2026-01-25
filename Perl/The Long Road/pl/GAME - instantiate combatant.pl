#!/usr/bin/env perl

use strict;
use warnings;
use diagnostics;
use DBI;
use v5.42;

# pl/'GAME - instantiate combatant.pl'   scenario/1-Recon.txt   1

# ***************************************************************************************
my $argNum = @ARGV;
if ( $argNum < 2 ) {
    say "pl/'GAME - instantiate combatant.pl'   scenario/1-Recon.txt   1";
    exit;
}

my $conn = DBI->connect( "dbi:SQLite:dbname=db/TLR.db", "", "" );

my $filename    = $ARGV[0];
my $scenario_id = $ARGV[1];

my $gameName     = "";
my $stmt         = "";
my $faction      = 0;      # _flag1_ field of the _unit_ table
my $faction_name = "";
my $instance_id  = 1000;

open my $fh, '<', $filename or die "Cannot open $filename: $!";

$stmt = "DELETE FROM instance";
my $rs = $conn->prepare($stmt);
$rs->execute();
$rs->finish();

my $line = "";
while ( $line = <$fh> ) {
    chomp $line;
    last if ( $line =~ /^END/ );
    next if ( $line =~ /^\*\*\*/ );
    next if ( $line =~ /^$/ );

    if ( $line =~ /^name/ ) {
        my @X = split /:/, $line;
        $gameName = $X[1];
        next;
    }
    if ( $line =~ /^Soviet/ ) {
        $faction      = 2;
        $faction_name = "Soviet";
        next;
    }
    if ( $line =~ /^American/ ) {
        $faction      = 1;
        $faction_name = "American";
        next;
    }

    instantiate();
}

close $fh;
$conn->disconnect();

# ***************************************************************************************
sub instantiate {
    my @KeyVal = split /:/, $line;
    my $unit   = $KeyVal[0];
    my $count  = $KeyVal[1];

    # ***** get unit's ID
    my $stmt =
        "SELECT id, front FROM unit WHERE name = '"
      . $unit
      . "' and (flag1 & "
      . $faction . ")";
    my $rs = $conn->prepare($stmt);
    $rs->execute();

    while ( my @ROW = $rs->fetchrow_array() ) {
        for ( my $i = 0 ; $i < $count ; $i++ ) {
            my $curr_MF = get_MF( $ROW[1] );
            $stmt =
                "INSERT INTO instance"
              . " (curr_MF, id, scenario_id, unit_name, unit_id, img_id, faction)"
              . " VALUES ("
              . $curr_MF . ", "
              . $instance_id . ", "
              . $scenario_id . ", '"
              . $unit . "', "
              . $ROW[0] . ", "
              . $ROW[1] . ", '"
              . $faction_name . "'" . ")";
            my $rs1 = $conn->prepare($stmt);
            $rs1->execute();
            $rs1->finish();

            $instance_id++;
        }
    }

    $rs->finish();
}

# ***************************************************************************************
sub get_MF {
    my ($img_id) = @_;

    my $MF = 0;

    $stmt = "SELECT mf_val FROM img WHERE id = " . $img_id;
    my $rs1 = $conn->prepare($stmt);
    $rs1->execute();
    while ( my @ROW = $rs1->fetchrow_array() ) {
        $MF = $ROW[0];
    }

    $rs1->finish();

    return $MF;
}

