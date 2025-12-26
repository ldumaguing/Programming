#!/usr/bin/env perl

use strict;
use warnings;
use diagnostics;

use v5.42;

my $line = "";

# ***************************************************************************************
use DBI;
my $conn = DBI->connect( "dbi:SQLite:dbname=db/TLR.db", "", "" );

my $filename = $ARGV[0];
my $fname    = $filename;
$fname =~ s/db\///;

if ( defined $filename ) {
    slurp();
}
else {
    say "empty";
}

$conn->disconnect();

# *********************************************************
sub slurp {
    open my $fh, '<', $filename or die "Cannot open $filename: $!";

    while ( $line = <$fh> ) {
        chomp $line;    # Remove trailing newline character
        last if ( $line =~ /END/ );

        if ( $line =~ /hill:/ ) {
            register_hill();
        }
    }

    close $fh;
}

# *********************************************************
sub register_hill {
    $line =~ s/hill:\ *//;

    my @hexes = split /,/, $line;
    foreach my $hexID (@hexes) {
        say $hexID;
    }
}



















