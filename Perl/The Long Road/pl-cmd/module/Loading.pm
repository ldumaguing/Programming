#!/usr/bin/env perl

use strict;
use warnings;
use diagnostics;

use v5.42;

my @args = ();

# ***************************************************************************************
sub load_Leg_to_Transporter {
    @args = @_;
    my $unit_Leg         = $args[0];
    my $unit_transporter = $args[1];

    say $unit_Leg;
    say $unit_transporter;
}

