#!/usr/bin/env perl

use strict;
use warnings;
use diagnostics;

use v5.40.3;

# *************************************************************************************************
foo();
say "";
foo1("fish");
say "";
foo2("Moe", "Curly", "Larry");
say "";
foo3("Moe", "Curly", "Larry");
say "";
say foo4();

say "";
my @anArray = ("Moe", "Curly", "Larry", 1, 2, 3);
say @anArray;
my @x = shift @anArray;
say @anArray;



# *************************************************************************************************
sub foo4 {
   return "Hello, world.";
}

sub foo3 {
   my ($x, $y, $z) = @_;
   say $x;
   say $y;
   say $z;
}

sub foo2 {
   my @x = @_;
   say @x;
   say $x[1];
}

sub foo1 {
   my ($x) = @_;
   say $x;
}

sub foo {
   say "bar";
}















