#!/usr/bin/env perl

use strict;
use warnings;
use diagnostics;

use feature 'say';
use feature 'switch';
use v5.40;

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
my $a = 123;
my $b = 456;
say $a, " ", $b;
($a, $b) = ($b, $a);
say $a, " ", $b;

say "";
say 5**4;
say "Random from 0 to 10 = ", int(rand 11);
$a = 6;
say "6++ = ", $a++;
$a = 6;
say "++6 = ", ++$a;

say "";
$a = 6;
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






