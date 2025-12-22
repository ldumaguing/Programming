#!/usr/bin/env perl

use strict;
use warnings;
use diagnostics;

#use Math::Trig;
# use List::Util qw(uniq);

use v5.42;

use lib "pl-cmd/module";
use Hexagon;

#say get_cart_distance( 10, 10, 12, 10 );
#say get_degrees( 10, 10, 12, 12 );

#my @foo = get_adjacent_hex ( 10, 10, 0 );
#say $foo[0] . ", " .$foo[1] . " --- N";
#@foo = get_adjacent_hex ( 10, 10, 1 );
#say $foo[0] . ", " .$foo[1] . " --- NE";
#@foo = get_adjacent_hex ( 10, 10, 2 );
#say $foo[0] . ", " .$foo[1] . " --- SE";
#@foo = get_adjacent_hex ( 10, 10, 3 );
#say $foo[0] . ", " .$foo[1] . " --- S";
#@foo = get_adjacent_hex ( 10, 10, 4 );
#say $foo[0] . ", " .$foo[1] . " --- SW";
#@foo = get_adjacent_hex ( 10, 10, 5 );
#say $foo[0] . ", " .$foo[1] . " --- NW";

my $foo = get_hex_distance( 1, 0, 7, 10 );
say ">>> " . $foo;







