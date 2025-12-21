#!/usr/bin/env perl

use strict;
use warnings;
use diagnostics;

# use List::Util qw(uniq);
use Math::Trig;

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
    @args   = @_;
    $From_X = $args[0] * $X_hex;
    $To_X   = $args[2] * $X_hex;
    if ( $args[0] % 2 ) {    # is From_X odd
        $From_Y = $args[1] + 0.5;
    }
    else {
        $From_Y = $args[1];
    }
    if ( $args[2] % 2 ) {    # is To_X odd
        $To_Y = $args[3] + 0.5;
    }
    else {
        $To_Y = $args[3];
    }

    my $X = $To_X - $From_X;
    my $Y = $To_Y - $From_Y;
    $X *= $X;
    $Y *= $Y;

    sqrt( $X + $Y );
}

# **********
sub getCartDist {
    my $X = $To_X - $From_X;
    my $Y = $To_Y - $From_Y;
    $X *= $X;
    $Y *= $Y;

    sqrt( $X + $Y );
}

# *********************************************************
sub get_degrees {
    @args   = @_;
    $From_X = $args[0] * $X_hex;
    $To_X   = $args[2] * $X_hex;
    if ( $args[0] % 2 ) {    # is From_X odd
        $From_Y = $args[1] + 0.5;
    }
    else {
        $From_Y = $args[1];
    }
    if ( $args[2] % 2 ) {    # is To_X odd
        $To_Y = $args[3] + 0.5;
    }
    else {
        $To_Y = $args[3];
    }

    my $X    = $To_X - $From_X;
    my $Y    = $To_Y - $From_Y;
    my $degs = rad2deg( atan2( abs($Y), abs($X) ) );

    if ( ( $X >= 0 ) and ( $Y >= 0 ) ) {
        $degs = 360.0 - $degs;
    }
    if ( ( $X < 0 ) and ( $Y >= 0 ) ) {
        $degs = 180.0 + $degs;
    }
    if ( ( $X < 0 ) and ( $Y < 0 ) ) {
        $degs = 180.0 - $degs;
    }

    if ( $degs >= 360.0 ) {
        $degs = 0.0;
    }

    $degs;
}

# **********
sub getDeg {
    my $X    = $To_X - $From_X;
    my $Y    = $To_Y - $From_Y;
    my $degs = rad2deg( atan2( abs($Y), abs($X) ) );

    if ( ( $X >= 0 ) and ( $Y >= 0 ) ) {
        $degs = 360.0 - $degs;
    }
    if ( ( $X < 0 ) and ( $Y >= 0 ) ) {
        $degs = 180.0 + $degs;
    }
    if ( ( $X < 0 ) and ( $Y < 0 ) ) {
        $degs = 180.0 - $degs;
    }

    if ( $degs >= 360.0 ) {
        $degs = 0.0;
    }

    $degs;
}

# *********************************************************
sub get_hex_distance {
    @args   = @_;
    $From_X = $args[0] * $X_hex;
    $To_X   = $args[2] * $X_hex;
    if ( $args[0] % 2 ) {    # is From_X odd
        $From_Y = $args[1] + 0.5;
    }
    else {
        $From_Y = $args[1];
    }
    if ( $args[2] % 2 ) {    # is To_X odd
        $To_Y = $args[3] + 0.5;
    }
    else {
        $To_Y = $args[3];
    }

    say "yo";

}

