#!/usr/bin/env perl

use strict;
use warnings;
use diagnostics;

use v5.40.3;

# ***************************************************************************************
my %attributes;
my $count = 0;

while (<ARGV>) {
   $count++;
   if ($count > 6) {last;}
   my $aString = $_;
   my @anArray = split(" ", $aString);
   $anArray[0] =~ s/://;
   $attributes{$anArray[0]} = $anArray[1];
}

say %attributes;
say $attributes{'STR'};




