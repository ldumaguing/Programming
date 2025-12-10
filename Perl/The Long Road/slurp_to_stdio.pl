#!/usr/bin/env perl

use strict;
use warnings;
use diagnostics;

use v5.40.3;

# ***************************************************************************************
my $filename = $ARGV[0];

if (defined $filename) {
   foo();
} else {
   say "empty";
}

# *********************************************************
sub foo {
   open my $fh, '<', $filename or die "Cannot open $filename: $!";

   while (my $line = <$fh>) {
     chomp $line; # Remove trailing newline character
     print "Read line: $line\n";
   }

close $fh;
}



