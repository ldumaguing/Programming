#!/usr/bin/env perl

use strict;
use warnings;
use diagnostics;

use v5.40.3;

# *************************************************************************************************
my $arg1 = $ARGV[0];

if ( defined $arg1 ) {
    say $arg1;
}
else {
    say "empty";
}

# say $arg1;

