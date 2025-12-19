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

    while ( my $line = <$fh> ) {
        chomp $line;    # Remove trailing newline character
        last if ( $line =~ /END/ );
        
        if ( $line =~ /\[place\]/ ) {
            my @aArray = split(' ', $line);
            say $aArray[0];
            say $aArray[1];
            say $aArray[2];
            say $aArray[3];
        }
    }

    close $fh;
}


