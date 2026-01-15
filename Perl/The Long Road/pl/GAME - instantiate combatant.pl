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

my $gameName    = "";
my $stmt        = "";
my $faction     = 0;      # _flag1_ field of the _unit_ table
my $instance_id = 1000;

open my $fh, '<', $filename or die "Cannot open $filename: $!";

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
        $faction = 2;
        next;
    }
    if ( $line =~ /^American/ ) {
        $faction = 1;
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
        "SELECT id FROM unit WHERE name = '"
      . $unit
      . "' and (flag1 & "
      . $faction . ")";
    my $rs = $conn->prepare($stmt);
    $rs->execute();

    while ( my @ROW = $rs->fetchrow_array() ) {
        say ">>> " . $ROW[0] . ", " . $unit . ": " . $count;
        for ( my $i = 0 ; $i < $count ; $i++ ) {
            say $instance_id;
            $instance_id++;
        }
    }

    $rs->finish();
}

