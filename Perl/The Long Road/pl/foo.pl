#!/usr/bin/env perl

use strict;
use warnings;
use diagnostics;

use v5.42;

my @alphabet = ( 'A' .. 'Z' );

foreach my $letter (@alphabet) {
    say $letter;
}

