#!/usr/bin/env perl

use strict;
use warnings;
use diagnostics;
use DBI;
use v5.38.2;

use lib "pl-InGame/module";
use Hexagon;

say get_cart_distance( 2, 0, 2, -1 );
say get_cart_distance( 2, 0, 3, 0 );
say "";
say get_degrees( 2, 0, 2, -1 );
say get_degrees( 2, 0, 3, 0 );
say get_degrees( 2, 0, 4, 0 );
say get_degrees( 2, 0, 1, 0 );
say get_degrees( 2, 0, 0, 0 );

