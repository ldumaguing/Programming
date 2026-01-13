#!/usr/bin/env perl

use strict;
use warnings;
use diagnostics;
use DBI;
use v5.42;

# pl/'GAME - instantiate combatant.pl' scenario/1-Recon.txt

# ***************************************************************************************
my $conn = DBI->connect( "dbi:SQLite:dbname=db/TLR.db", "", "" );

my $filename = $ARGV[0];
my $fname    = $filename;
$fname =~ s/scenario\///;
$fname =~ s/\.txt//;

my $letterRef = ord('A') + 1;
my $gameName  = "";
my $map_dim   = "";

open my $fh, '<', $filename or die "Cannot open $filename: $!";

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
    if ( $line =~ /^map_dim/ ) {
        my @X = split /:/, $line;
        $map_dim = $X[1];
        next;
    }
    if ( $line =~ /^maps/ ) {
        my @X = split /:/, $line;
        instantiate_map( $X[1] );
        next;
    }
}

close $fh;
$conn->disconnect();

# ***************************************************************************************
