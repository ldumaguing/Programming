#!/usr/bin/env perl

use strict;
use warnings;
use diagnostics;
use DBI;
use v5.38.2;

use lib "pl/module";
use Embark;

# pl/'GAME - execute commands.pl'   scenario/1-Recon.txt   1

# ***************************************************************************************
my $argNum = @ARGV;
if ( $argNum < 2 ) {
    say "pl/'GAME - execute commands.pl'   scenario/1-Recon.txt   1";
    exit;
}

my $conn        = DBI->connect( "dbi:SQLite:dbname=db/TLR.db", "", "" );
my $filename    = $ARGV[0];
my $scenario_id = $ARGV[1];
open my $fh, '<', $filename or die "Cannot open $filename: $!";

my $stmt = "DELETE FROM relation";
my $rs   = $conn->prepare($stmt);
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
        embarking( $conn, $line );
        next;
    }
}

close $fh;
$conn->disconnect();

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
      . $fields[1];
    my $rs = $conn->prepare($stmt);
    $rs->execute();
    $rs->finish();
}

