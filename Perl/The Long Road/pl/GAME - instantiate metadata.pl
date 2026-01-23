#!/usr/bin/env perl

use strict;
use warnings;
use diagnostics;
use DBI;
use v5.42;

# pl/'GAME - instantiate metadata.pl'   scenario/1-Recon.txt   1

# ***************************************************************************************
my $argNum = @ARGV;
if ( $argNum < 2 ) {
    say "pl/'GAME - instantiate metadata.pl'   scenario/1-Recon.txt   1";
    exit;
}

my $conn = DBI->connect( "dbi:SQLite:dbname=db/TLR.db", "", "" );

my $filename    = $ARGV[0];
my $scenario_id = $ARGV[1];

my $stmt = "";

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
        my $gameName = $X[1];
        $stmt =
            "INSERT INTO scenario (key, id, txt_val) VALUES ('name', "
          . $scenario_id . ", '"
          . $gameName . "')";
        $rs = $conn->prepare($stmt);
        $rs->execute();
        $rs->finish();
        next;
    }
    if ( $line =~ /^upperLeft/ ) {
        twoValues( $line, "upperLeft" );
        next;
    }
    if ( $line =~ /^upperRight/ ) {
        twoValues( $line, "upperRight" );
        next;
    }
    if ( $line =~ /^lowerRight/ ) {
        twoValues( $line, "lowerRight" );
        next;
    }
    if ( $line =~ /^hexCount/ ) {
        twoValues( $line, "hexCount" );
        next;
    }
    if ( $line =~ /^maps/ ) {
        stringValue( $line, "maps" );
        next;
    }
    if ( $line =~ /^turns/ ) {
        oneValue( $line, "turns" );
        next;
    }
    if ( $line =~ /^scenario_id/ ) {
        oneValue( $line, "scenario_id" );
        next;
    }
    if ( $line =~ /^map_dim/ ) {
        twoValues( $line, "map_dim" );
        next;
    }
}

close $fh;
$conn->disconnect();

# ***************************************************************************************
sub oneValue {
    my ( $line, $key ) = @_;
    my @X = split /:/, $line;
    $stmt =
        "INSERT INTO scenario (key, id, num1) VALUES ('"
      . $key . "', "
      . $scenario_id . ", '"
      . $X[1] . "')";
    $rs = $conn->prepare($stmt);
    $rs->execute();
    $rs->finish();
}

# ***************************************************************************************
sub stringValue {
    my ( $line, $key ) = @_;
    my @X = split /:/, $line;
    $stmt =
        "INSERT INTO scenario (key, id, txt_val) VALUES ('"
      . $key . "', "
      . $scenario_id . ", '"
      . $X[1] . "')";
    $rs = $conn->prepare($stmt);
    $rs->execute();
    $rs->finish();
}

# ***************************************************************************************
sub twoValues {
    my ( $line, $key ) = @_;
    my @X         = split /:/, $line;
    my $upperLeft = $X[1];
    my @Y         = split /,/, $upperLeft;
    $stmt =
        "INSERT INTO scenario (key, id, num1, num2) VALUES ('"
      . $key . "', "
      . $scenario_id . ", "
      . $Y[0] . ", "
      . $Y[1] . ")";
    $rs = $conn->prepare($stmt);
    $rs->execute();
    $rs->finish();
}

