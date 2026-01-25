#!/usr/bin/env perl

use strict;
use warnings;
use diagnostics;

use v5.42;

my @args = ();

# ***************************************************************************************
sub move_unit {
    @args = @_;
    my $unit = $args[0];

    say "unit: " . $unit;
}

