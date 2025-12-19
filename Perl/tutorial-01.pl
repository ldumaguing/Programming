#!/usr/bin/env perl

use strict;
use warnings;
use diagnostics;

use v5.40.3;

# *************************************************************************************************
my @anArray = ( "Moe", "Curly", "Larry", 1, 2, 3 );
foreach my $x (@anArray) {
    say $x;
}

say "";
my $count = 1;
while ( $count <= 10 ) {
    say $count;
    $count++;
}

say "";
$count = 1;
unless ( $count > 5 ) {    # not a loop.  Enter block if condition is false.
    say $count;
    $count++;
}
say $count;

say "";
$count = 1;
do {
    say $count;
    $count++;
} while ( $count <= 5 );

say "";
for ( my $i = 0 ; $i <= 10 ; $i++ ) {
    next if ( $i % 2 == 0 );    # skip even numbers
    say $i;
}

say "";
for ( my $i = 0 ; $i <= 10 ; $i++ ) {
    last if ( $i == 7 );        # exit loop if 7
    say $i;
}

# say "";
# for (my $i = 0; $i <= 10; $i++) {
#    redo if ($i == 7);   # do the loop one more time, but doesn't exit block.
#    say $i;
# }

say "";
for my $i ( 0 .. 10 ) {
    say $i;
}
