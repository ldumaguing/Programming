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

my @args    = ();
my $counter = 0;
my @path    = ();

# ***************************************************************************************
sub get_cart_distance {
    @args = @_;
    my $From_X = $args[0] * $X_hex;
    my $To_X   = $args[2] * $X_hex;
    my $From_Y = 0;
    my $To_Y   = 0;
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

# *********************************************************
sub get_degrees {
    @args = @_;
    my $From_X = $args[0] * $X_hex;
    my $To_X   = $args[2] * $X_hex;
    my $From_Y = 0;
    my $To_Y   = 0;
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

# *********************************************************
sub get_adjacent_hex {
    @args = @_;
    my @hex_cursor = ( $args[0], $args[1] );
    my $adjacent   = $args[2];

    my @adjHex = ( 0, 0 );
    if ( $hex_cursor[0] % 2 ) {
        if ( $adjacent == 0 ) {    # N
            @adjHex = ( $hex_cursor[0], $hex_cursor[1] - 1 );
        }
        elsif ( $adjacent == 1 ) {    # NE
            @adjHex = ( $hex_cursor[0] + 1, $hex_cursor[1] );
        }
        elsif ( $adjacent == 2 ) {    # SE
            @adjHex = ( $hex_cursor[0] + 1, $hex_cursor[1] + 1 );
        }
        elsif ( $adjacent == 3 ) {    # S
            @adjHex = ( $hex_cursor[0], $hex_cursor[1] + 1 );
        }
        elsif ( $adjacent == 4 ) {    # SW
            @adjHex = ( $hex_cursor[0] - 1, $hex_cursor[1] + 1 );
        }
        else {                        # NW
            @adjHex = ( $hex_cursor[0] - 1, $hex_cursor[1] );
        }
    }
    else {
        if ( $adjacent == 0 ) {       # N
            @adjHex = ( $hex_cursor[0], $hex_cursor[1] - 1 );
        }
        elsif ( $adjacent == 1 ) {    # NE
            @adjHex = ( $hex_cursor[0] + 1, $hex_cursor[1] - 1 );
        }
        elsif ( $adjacent == 2 ) {    # SE
            @adjHex = ( $hex_cursor[0] + 1, $hex_cursor[1] );
        }
        elsif ( $adjacent == 3 ) {    # S
            @adjHex = ( $hex_cursor[0], $hex_cursor[1] + 1 );
        }
        elsif ( $adjacent == 4 ) {    # SW
            @adjHex = ( $hex_cursor[0] - 1, $hex_cursor[1] );
        }
        else {                        # NW
            @adjHex = ( $hex_cursor[0] - 1, $hex_cursor[1] - 1 );
        }
    }

    @adjHex;
}

# *********************************************************
sub get_hex_distance {
    @args = @_;

    my @hex_cursor = ( $args[0], $args[1] );
    my @hex_to     = ( $args[2], $args[3] );
    if ( $hex_cursor[0] == $hex_to[0] ) {
        if ( $hex_cursor[1] == $hex_to[1] ) {
            return $counter;
        }
    }

    $counter += 1;

    my $From_X = $args[0] * $X_hex;
    my $To_X   = $args[2] * $X_hex;
    my $From_Y = 0;
    my $To_Y   = 0;
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

    my $dir_ang = get_degrees( $args[0], $args[1], $args[2], $args[3] );

    #say $dir_ang . " degs";

    #my $degMOD90 = $dir_ang % 90.0;
    #say $degMOD90 . " (degs % 90)";
    my @three_hexes = ( 0, 0, 0 );
    if ( ( 60 <= $dir_ang ) and ( 120 > $dir_ang ) ) {
        @three_hexes = ( 5, 0, 1 );
    }
    if ( ( 0 <= $dir_ang ) and ( 60 > $dir_ang ) ) {
        @three_hexes = ( 0, 1, 2 );
    }
    if ( ( 300 <= $dir_ang ) ) {
        @three_hexes = ( 1, 2, 3 );
    }
    if ( ( 240 <= $dir_ang ) and ( 300 > $dir_ang ) ) {
        @three_hexes = ( 2, 3, 4 );
    }
    if ( ( 180 <= $dir_ang ) and ( 240 > $dir_ang ) ) {
        @three_hexes = ( 3, 4, 5 );
    }
    if ( ( 120 <= $dir_ang ) and ( 180 > $dir_ang ) ) {
        @three_hexes = ( 4, 5, 0 );
    }

    my @adj_hex = ( 0, 0 );
    my $ref_deg = $dir_ang % 180.0;

    my $most_acute = 360;
    foreach my $adjacent_hex_dir (@three_hexes) {
        @adj_hex = get_adjacent_hex( $args[0], $args[1], $adjacent_hex_dir );

        #print $adj_hex[0] . ", " . $adj_hex[1] . " --- ";
        my $delta = abs(
            (
                ( get_degrees( $args[0], $args[1], $adj_hex[0], $adj_hex[1] ) )
                % 180
            ) - $ref_deg
        );

        if ( $most_acute > $delta ) {
            $most_acute = $delta;
            @hex_cursor = ( $adj_hex[0], $adj_hex[1] );
        }
    }

    #say "most acute: " . $most_acute;
    #say $hex_cursor[0] . " " . $hex_cursor[1];

    get_hex_distance( $hex_cursor[0], $hex_cursor[1], $hex_to[0], $hex_to[1] );
}

# *********************************************************
sub clear_path {
    @path = ();    # seems variables are static
}

# *********************************************************
sub get_path {
    @args = @_;

    my @hex_cursor = ( $args[0], $args[1] );
    my @hex_to     = ( $args[2], $args[3] );
    if ( $hex_cursor[0] == $hex_to[0] ) {
        if ( $hex_cursor[1] == $hex_to[1] ) {
            push @path, $args[2];
            push @path, $args[3];
            return @path;
        }
    }

    push @path, $args[0];
    push @path, $args[1];

    my $From_X = $args[0] * $X_hex;
    my $To_X   = $args[2] * $X_hex;
    my $From_Y = 0;
    my $To_Y   = 0;
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

    my $dir_ang = get_degrees( $args[0], $args[1], $args[2], $args[3] );

    #say $dir_ang . " degs";

    #my $degMOD90 = $dir_ang % 90.0;
    #say $degMOD90 . " (degs % 90)";
    my @three_hexes = ( 0, 0, 0 );
    if ( ( 60 <= $dir_ang ) and ( 120 > $dir_ang ) ) {
        @three_hexes = ( 5, 0, 1 );
    }
    if ( ( 0 <= $dir_ang ) and ( 60 > $dir_ang ) ) {
        @three_hexes = ( 0, 1, 2 );
    }
    if ( ( 300 <= $dir_ang ) ) {
        @three_hexes = ( 1, 2, 3 );
    }
    if ( ( 240 <= $dir_ang ) and ( 300 > $dir_ang ) ) {
        @three_hexes = ( 2, 3, 4 );
    }
    if ( ( 180 <= $dir_ang ) and ( 240 > $dir_ang ) ) {
        @three_hexes = ( 3, 4, 5 );
    }
    if ( ( 120 <= $dir_ang ) and ( 180 > $dir_ang ) ) {
        @three_hexes = ( 4, 5, 0 );
    }

    my @adj_hex = ( 0, 0 );
    my $ref_deg = $dir_ang % 180.0;

    my $most_acute = 360;
    foreach my $adjacent_hex_dir (@three_hexes) {
        @adj_hex = get_adjacent_hex( $args[0], $args[1], $adjacent_hex_dir );

        #print $adj_hex[0] . ", " . $adj_hex[1] . " --- ";
        my $delta = abs(
            (
                ( get_degrees( $args[0], $args[1], $adj_hex[0], $adj_hex[1] ) )
                % 180
            ) - $ref_deg
        );

        if ( $most_acute > $delta ) {
            $most_acute = $delta;
            @hex_cursor = ( $adj_hex[0], $adj_hex[1] );
        }
    }

    #say "most acute: " . $most_acute;
    #say $hex_cursor[0] . " " . $hex_cursor[1];

    get_path( $hex_cursor[0], $hex_cursor[1], $hex_to[0], $hex_to[1] );
}

# ***************************************************************************************
# ************* NOTES

# Hexagon
# A   0   N    ( 60 <= deg) and (120 > deg)
# B   1   NE   (  0 <= deg) and ( 60> deg)
# C   2   SE   (300 <= deg)
# D   3   S    (240 <= deg) and (300 > deg)
# E   4   SW   (180 <= deg) and (240 > deg)
# F   5   NW   (120 <= deg) and (180 > deg)

