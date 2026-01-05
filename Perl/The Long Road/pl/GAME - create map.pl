#!/usr/bin/env perl

use strict;
use warnings;
use diagnostics;
use DBI;
use v5.42;

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

# say $map_dim;

close $fh;
$conn->disconnect();

# ***************************************************************************************
sub instantiate_map {
    my ($mapStr) = @_;
    my @maps     = split /,/, $mapStr;
    my $row      = 0;
    my $col      = 0;
    foreach my $letter (@maps) {

        if ( $letter =~ /_/ ) {
            $col = 0;
            $row += 1;
            next;
        }

        new_map( $col, $row, $letter );
        $col += 1;
    }
}

# *********************************************************
sub new_map {
    my ( $col, $row, $letter ) = @_;
    return if ( $letter =~ /\./ );

    my $mapFile = "Map " . $letter;

    say $gameName . "," . $col . "," . $row . ": " . $mapFile;
    my $sqlSTMT =
      "SELECT loc_x, loc_y, flag1, flag2 FROM terrain WHERE mapFile = '"
      . $mapFile . "' order by loc_x, loc_y";
    my $stmt = $conn->prepare($sqlSTMT);
    $stmt->execute();

    say "***************************************************";
    while ( my @sqlROW = $stmt->fetchrow_array() ) {
        my $a = $sqlROW[0] + (19 * $col);
        my $b = $sqlROW[1] + (13 * $row);
        my $c = $sqlROW[2];
        my $d = $sqlROW[3];

        say $a . "," . $b . "," . $c . "," . $d;
    }

    $stmt->finish();
}

