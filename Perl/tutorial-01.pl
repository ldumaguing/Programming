#!/usr/bin/env perl

use strict;
use warnings;
use diagnostics;

use v5.40.3;

# *************************************************************************************************
my @anArray = ("Moe", "Curly", "Larry", 1, 2, 3);
foreach my $x (@anArray) {
   say $x;
}

say "";
my $count = 1;
while($count <= 10) {
   say $count;
   $count++;
}











