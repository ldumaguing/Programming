#!/usr/bin/env perl

use strict;
use warnings;
use diagnostics;
use DBI;
use v5.42;

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

my $line = "";
while ( $line = <$fh> ) {
    chomp $line;
    last if ( $line =~ /^END/ );
    next if ( $line =~ /^[\*#\/;\-]/ );
    next if ( $line =~ /^$/ );

    if ( $line =~ /\[place\]/ ) {
        placement();
        next;
    }
}

close $fh;
$conn->disconnect();

# ***************************************************************************************
sub placement {
    $line =~ s/\ *\ /\ /g;
    my @args = split /\ /, $line;

    my $stmt =
        "UPDATE instance set loc_x = "
      . $args[2]
      . ", loc_y = "
      . $args[3]
      . ", status = 1"
      . " WHERE id = "
      . $args[1];
    my $rs = $conn->prepare($stmt);
    $rs->execute();
    $rs->finish();
}

