#!/usr/bin/env perl

use strict;
use warnings;
use diagnostics;

#use feature 'say';
use v5.40.3;

# *************************************************************************************************
print "yo\n";

say "fish";   # automatic \n

say "";
my $name = 'Ayeka';

my ($age, $title, $last) = (22, 'Princess', 'Jurai');

my $full_name = "$title $name \"Tenchi\" $last";
say $full_name;

$full_name = qq{$title $name "Tenchi" $last};
say $full_name;

my $yellow_submarine = <<"END";
In the town
where I was born
lived a man who sailed to sea.
And he talked
about his life
in a ...
--- $full_name
END

say $yellow_submarine;

# %c : character
# %s : string
# %d : decimal
# %u : unsigned integer
# %f : float
# %e : float (scientific notation)

my $aFloat = .12345678901;
printf("%.3f\n", $aFloat);
printf("%.3f\n", $aFloat + .1);

say "";
local $a = 123;
local $b = 456;
say $a, " ", $b;
local ($a, $b) = ($b, $a);
say $a, " ", $b;

say "";
say 5**4;
say "Random from 0 to 10 = ", int(rand 11);
local $a = 6;
say "6++ = ", $a++;
local $a = 6;
say "++6 = ", ++$a;

say "";
local $a = 6;
if ($a < 6) {
   say "<6";
} else {
   say ">=6";
}

# string comparison uses
# eq  ne  lt  le  gt  ge
if ('a' eq 'b') {
   say "true";
} else {
   say "false";
}

unless(!1) {   # enter block if condition is false; opposite of IF
   say "not true";
} else {
   say "test";
}

local $a = 100;
say (($a == 100) ? "true 100" : "false 100");
say (($a == 90) ? "true 90" : "false 90");

say "";
for(my $i = 0; $i < 5; $i++) {
   say $i;
}

say "";
my $i = 1;
while ($i < 10000) {
   if($i % 2 == 0) {   # skip even numbers
      $i++;
      next;   # aka, continue
   }

   if($i == 7) {last;}   # aka, break; exit while loop

   say $i;
   $i++;
}

say "";
my $TheNumber = 7;
my $guess;   # note: no value is assigned
do {
   say "Guess a number between 1 and 10";
   $guess = <ARGV>;   # input from keyboard
} while $guess != $TheNumber;
say "you got it.";

say "";
my @anArray = ("Moe", "Curly", "Larry", 1, 2, 3);
say $anArray[1], " ", $anArray[4];
push(@anArray, 100);
say $anArray[6];
say scalar(@anArray);
pop(@anArray);
say scalar(@anArray);
say $#anArray;   # index of the last element
say @anArray;

say "";
my %character = (
   "name" => "Redner",
   "STA" => 10,
   "INT" => 10,
   "WIS" => 10,
   "class" => "Magic User"
);
say $character{'name'} . ' - ' . $character{'class'};
$character{'DEX'} = 10;
say %character;
say $character{'name'} if exists $character{'name'};
say $character{'name'} if exists $character{'xxx'};
delete $character{'STA'};
say %character;

say "";
my $aString = "abcdefghijklmnopqrstuvwxyz";
say substr($aString, 7, 4);   # hijk
$aString =~ s/def/FISH123/;
say $aString;





