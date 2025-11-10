#!/usr/bin/env perl

use strict;
use warnings;
use diagnostics;

use v5.40.3;
# *************************************************************************************************
my %attribute = (
   "STR" => (int(rand 6)+1)+(int(rand 6)+1)+(int(rand 6)+1),
   "INT" => (int(rand 6)+1)+(int(rand 6)+1)+(int(rand 6)+1),
   "WIT" => (int(rand 6)+1)+(int(rand 6)+1)+(int(rand 6)+1),
   "AGL" => (int(rand 6)+1)+(int(rand 6)+1)+(int(rand 6)+1),
   "TOU" => (int(rand 6)+1)+(int(rand 6)+1)+(int(rand 6)+1),
   "CHA" => (int(rand 6)+1)+(int(rand 6)+1)+(int(rand 6)+1)
);

print "STR: " . $attribute{"STR"};
modifier($attribute{"STR"});
print "INT: " . $attribute{"INT"};
modifier($attribute{"INT"});
print "WIT: " . $attribute{"WIT"};
modifier($attribute{"WIT"});
print "AGL: " . $attribute{"AGL"};
modifier($attribute{"AGL"});
print "TOU: " . $attribute{"TOU"};
modifier($attribute{"TOU"});
print "CHA: " . $attribute{"CHA"};
modifier($attribute{"CHA"});

my $total = $attribute{"STR"} +
$attribute{"INT"} +
$attribute{"WIT"} +
$attribute{"AGL"} +
$attribute{"TOU"} +
$attribute{"CHA"};

say $total/60 . " (1.8 max; 0.3 min)";

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
