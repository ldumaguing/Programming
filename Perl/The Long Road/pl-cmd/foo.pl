#!/usr/bin/env perl

use strict;
use warnings;
use diagnostics;
use POSIX;
#use Math::Trig;
# use List::Util qw(uniq);

use v5.42;

use lib "pl-cmd/module";
use Hexagon;

my $dist = get_cart_distance( 0, 0, 20, 20 );
$dist = get_cart_distance( 20, 20, 0, 0 );
say $dist;

#get_hex_distance( 10, 10, 20, 20 );





