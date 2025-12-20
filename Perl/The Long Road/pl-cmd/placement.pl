#!/usr/bin/env perl

use strict;
use warnings;
use diagnostics;

use v5.42;
use DBI;
my $conn = DBI->connect( "dbi:SQLite:dbname=db/TLR.db", "", "" );
my $filename = $ARGV[0];

if ( defined $filename ) {
    foo();
}
else {
    say "empty";
}


$conn->disconnect();

# *********************************************************
sub foo {
    open my $fh, '<', $filename or die "Cannot open $filename: $!";
    my $rs = undef;

    while ( my $line = <$fh> ) {
        chomp $line;    # Remove trailing newline character
        last if ( $line =~ /END/ );
        
        if ( $line =~ /\[place\]/ ) {
            my @aArray = split(' ', $line);
            my $stmt = "UPDATE instance set loc_x = " . $aArray[2] . ", "
                . "loc_y = " . $aArray[3] . ", "
                . "status = 1 "
                . "WHERE id = " . $aArray[1];
            $rs = $conn->prepare($stmt);
            $rs->execute();
        }
    }

    $rs->finish();
    close $fh;
}


