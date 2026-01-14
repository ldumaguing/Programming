#!/usr/bin/env perl

use strict;
use warnings;
use diagnostics;
use DBI;
use v5.42;

# pl/'GAME - instantiate combatant.pl'   scenario/1-Recon.txt   1

# ***************************************************************************************
my $argNum = @ARGV;
say $argNum;
if ( $argNum < 2 ) {
    say "pl/'GAME - instantiate combatant.pl'   scenario/1-Recon.txt   1";
    exit;
}

my $conn = DBI->connect( "dbi:SQLite:dbname=db/TLR.db", "", "" );

my $filename    = $ARGV[0];
my $scenario_id = $ARGV[1];

my $gameName = "";
my $stmt     = "";

open my $fh, '<', $filename or die "Cannot open $filename: $!";

$stmt = "delete from scenario where id = " . $scenario_id;
my $rs = $conn->prepare($stmt);
$rs->execute();
$rs->finish();

my $line = "";
while ( $line = <$fh> ) {
    chomp $line;
    last if ( $line =~ /^END/ );
    next if ( $line =~ /^$/ );

    if ( $line =~ /^name/ ) {
        my @X = split /:/, $line;
        $gameName = $X[1];
        next;
    }

    say $line . ", " . $gameName;
}

close $fh;
$conn->disconnect();

# ***************************************************************************************
