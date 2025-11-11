#!/usr/bin/env perl

use strict;
use warnings;
use diagnostics;

use v5.40.3;

# ***************************************************************************************
my %attributes = (
   "STR" => (int(rand 6)+1)+(int(rand 6)+1)+(int(rand 6)+1),
   "INT" => (int(rand 6)+1)+(int(rand 6)+1)+(int(rand 6)+1),
   "WIT" => (int(rand 6)+1)+(int(rand 6)+1)+(int(rand 6)+1),
   "AGL" => (int(rand 6)+1)+(int(rand 6)+1)+(int(rand 6)+1),
   "TOU" => (int(rand 6)+1)+(int(rand 6)+1)+(int(rand 6)+1),
   "CHA" => (int(rand 6)+1)+(int(rand 6)+1)+(int(rand 6)+1)
);

print "STR: " . $attributes{"STR"};
modifier($attributes{"STR"});
print "INT: " . $attributes{"INT"};
modifier($attributes{"INT"});
print "WIT: " . $attributes{"WIT"};
modifier($attributes{"WIT"});
print "AGL: " . $attributes{"AGL"};
modifier($attributes{"AGL"});
print "TOU: " . $attributes{"TOU"};
modifier($attributes{"TOU"});
print "CHA: " . $attributes{"CHA"};
modifier($attributes{"CHA"});

my $total = $attributes{"STR"} +
$attributes{"INT"} +
$attributes{"WIT"} +
$attributes{"AGL"} +
$attributes{"TOU"} +
$attributes{"CHA"};

say "     " . ($total - 60) . " total";

# ***************************************************************************************
sub modifier {
   my ($x) = @_;
   if ($x == 3) {
      say " (-3)";
   } elsif ($x >= 18) {
      say " (+3)";
   } elsif ($x >= 16) {
      say " (+2)"
   } elsif ($x >= 13) {
      say " (+1)";
   } elsif ($x >= 9) {
      say "";
   } elsif ($x >= 6) {
      say " (-1)";
   } elsif ($x >= 4) {
      say " (-2)";
   };
}
