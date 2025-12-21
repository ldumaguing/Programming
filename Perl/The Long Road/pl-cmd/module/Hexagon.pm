#!/usr/bin/env perl

use strict;
use warnings;
use diagnostics;
# use List::Util qw(uniq);
use POSIX;
#use Math::Trig;

use v5.42;

# my $pi = 4 * atan2(1, 1);
# my $deg2rad = $pi / 180.0;
# my $X_hex = cos($deg2rad * 30.0);
my $X_hex = cos( ( ( 4 * atan2( 1, 1 ) ) / 180.0 ) * 30.0 );

my @args = ();

my $From_X = 0;
my $From_Y = 0;
my $To_X   = 0;
my $To_Y   = 0;
    
# ***************************************************************************************
sub get_cart_distance {
    @args = @_;
    $From_X = $args[0] * $X_hex;
    $From_Y = $args[1];
    $To_X   = $args[2] * $X_hex;
    $To_Y   = $args[3];

    my $X = $To_X - $From_X;
    my $Y = $To_Y - $From_Y;
    $X *= $X;
    $Y *= $Y;
    
    sqrt ($X + $Y);
}
# *********************************************************
sub get_hex_distance {

}


