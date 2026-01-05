#!/usr/bin/env perl

use strict;
use warnings;
use diagnostics;
use DBI;
use v5.42;

# ***************************************************************************************
my $conn = DBI->connect( "dbi:SQLite:dbname=db/TLR.db", "", "" );

my $filename  = $ARGV[0];
my $fname     = $filename;
my $letterRef = ord('A') + 1;

$fname =~ s/scenario\///;
$fname =~ s/\.txt//;

say $fname;
open my $fh, '<', $filename or die "Cannot open $filename: $!";

my $line = "";
while ( $line = <$fh> ) {
    chomp $line;
    last if ( $line =~ /^END/ );
    next if ( $line =~ /^$/ );

    say $line;
}

close $fh;
$conn->disconnect();

# ***************************************************************************************

