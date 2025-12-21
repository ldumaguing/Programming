#!/usr/bin/env perl

use strict;
use warnings;
use diagnostics;
use POSIX;

#use Math::Trig;
# use List::Util qw(uniq);

use v5.42;

# my $pi = 4 * atan2(1, 1);
# my $deg2rad = $pi / 180.0;
# my $X_hex = cos($deg2rad * 30.0);

my $X_hex = cos( ( ( 4 * atan2( 1, 1 ) ) / 180.0 ) * 30.0 );
say $X_hex;
say "";

# say sin(30 * ($pi/180.0));

my $x = get_hex_distance();
say $x;

sub get_hex_distance {
    444;
}

