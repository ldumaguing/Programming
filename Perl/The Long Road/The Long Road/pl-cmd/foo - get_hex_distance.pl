#!/usr/bin/env perl

use strict;
use warnings;
use diagnostics;

use v5.42;

use lib "pl-cmd/module";
use Hexagon;

my $foo = get_hex_distance( 1, 0, 7, 10 );
say ">>> " . $foo;







