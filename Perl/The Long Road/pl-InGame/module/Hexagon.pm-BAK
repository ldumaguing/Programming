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

my @args        = ();
my $counter     = 0;
my @path        = ();
my @three_hexes = ( 0, 0, 0 );
my $dir_ang     = 0;
my @nearest_hex = ();

# ***************************************************************************************
sub scan_terrain {
    @args = @_;

    my $conn1 = DBI->connect( "dbi:SQLite:dbname=db/TLR.db", "", "" );
    my $stmt1 =
        "SELECT flag1, flag2 FROM terrain_instance WHERE "
      . "gameName = '"
      . $args[0] . "'" . " AND "
      . "loc_x = "
      . $args[1] . " AND "
      . "loc_y = "
      . $args[2];
    my $rs1 = $conn1->prepare($stmt1);
    $rs1->execute();
    while ( my @ROW = $rs1->fetchrow_array() ) {
        translate_flags($ROW[0], $ROW[1]);
    }

    $conn1->disconnect();
}
# ***********************************************
sub translate_flags {
    @args = @_;
    my $flag1 = $args[0];
    my $flag2 = $args[1];

    if ($flag1 & (1<<0)) { say "hill"; }
    if ($flag1 & (1<<13)) { say "rolling"; }
    if ($flag1 & (1<<14)) { say "forest"; }
    if ($flag1 & (1<<15)) { say "town"; }
}

# ***************************************************************************************
sub is_cultivated {
    @args = @_;

    my $is_it = 0;

    my $conn1 = DBI->connect( "dbi:SQLite:dbname=db/TLR.db", "", "" );
    my $stmt1 =
        "SELECT * FROM terrain_instance WHERE "
      . "gameName = '"
      . $args[0] . "'" . " AND "
      . "loc_x = "
      . $args[1] . " AND "
      . "loc_y = "
      . $args[2] . " AND "
      . "(flag2 & (1 << 1))";
    my $rs1 = $conn1->prepare($stmt1);
    $rs1->execute();
    while ( my @ROW = $rs1->fetchrow_array() ) {
        $is_it = 1;
    }

    $conn1->disconnect();

    return $is_it;
}

# ***************************************************************************************
sub is_hill {
    @args = @_;

    my $is_it = 0;

    #say $args[0] . "," . $args[1] . "," . $args[2];

    my $conn1 = DBI->connect( "dbi:SQLite:dbname=db/TLR.db", "", "" );
    my $stmt1 =
        "SELECT * FROM terrain_instance WHERE "
      . "gameName = '"
      . $args[0] . "'" . " AND "
      . "loc_x = "
      . $args[1] . " AND "
      . "loc_y = "
      . $args[2] . " AND "
      . "(flag1 & (1 << 0))";
    #say $stmt1;
    my $rs1 = $conn1->prepare($stmt1);
    $rs1->execute();

    while ( my @ROW = $rs1->fetchrow_array() ) {
        $is_it = 1;
    }

    $conn1->disconnect();

    return $is_it;
}

# ***************************************************************************************
sub get_cart_distance {
    @args = @_;
    my $From_X = $args[0] * $X_hex;
    my $To_X   = $args[2] * $X_hex;
    my $From_Y = 0;
    my $To_Y   = 0;

    #say $From_X . "," . $From_Y;
    #say $To_X . "," . $To_Y;
    #say "---";

    if ( $args[0] % 2 ) {    # is From_X even
        $From_Y = $args[1];
    }
    else {
        $From_Y = $args[1] + 0.5;
    }
    if ( $args[2] % 2 ) {    # is To_X even
        $To_Y = $args[3];
    }
    else {
        $To_Y = $args[3] + 0.5;
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
    if ( $args[0] % 2 ) {    # is From_X even
        $From_Y = $args[1];
    }
    else {
        $From_Y = $args[1] + 0.5;
    }
    if ( $args[2] % 2 ) {    # is To_X even
        $To_Y = $args[3];
    }
    else {
        $To_Y = $args[3] + 0.5;
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
    else {
        if ( $adjacent == 0 ) {       # N
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

    @adjHex;
}

# *********************************************************
sub get_hex_distance {
    @args = @_;

    my @hex_cursor = ( $args[0], $args[1] );
    my @hex_to     = ( $args[2], $args[3] );

    if (
        get_cart_distance( $hex_cursor[0], $hex_cursor[1], $hex_to[0],
            $hex_to[1] ) <= 1.1
      )
    {
        $counter++;
        return $counter;
    }

    $counter++;

    my $From_X = $hex_cursor[0] * $X_hex;
    my $To_X   = $hex_to[0] * $X_hex;
    my $From_Y = 0;
    my $To_Y   = 0;
    if ( $From_X % 2 ) {    # is From_X odd
        $From_Y = $hex_cursor[1] + 0.5;
    }
    else {
        $From_Y = $hex_cursor[1];
    }
    if ( $hex_to[0] % 2 ) {    # is To_X odd
        $To_Y = $hex_to[1] + 0.5;
    }
    else {
        $To_Y = $hex_to[1];
    }

    my @adj_hex = ( 0, 0 );

    my $most_acute = 360;
    foreach my $adjacent_hex_dir (@three_hexes) {
        @adj_hex =
          get_adjacent_hex( $hex_cursor[0], $hex_cursor[1], $adjacent_hex_dir );
        my $degs =
          get_degrees( $adj_hex[0], $adj_hex[1], $hex_to[0], $hex_to[1] );

        my $delta = abs( $degs - $dir_ang );

        if ( $delta < $most_acute ) {
            $most_acute  = $delta;
            @nearest_hex = ( $adj_hex[0], $adj_hex[1] );
        }
    }

    get_hex_distance( $nearest_hex[0], $nearest_hex[1], $hex_to[0],
        $hex_to[1] );
}

# *********************************************************
sub init_path {
    @args    = @_;
    $dir_ang = get_degrees( $args[0], $args[1], $args[2], $args[3] );
    $counter = 0;

    @path        = ();            # seems variables are static
    @three_hexes = ( 0, 0, 0 );

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

    $dir_ang %= 360;
}

# *********************************************************
sub get_path {
    @args = @_;

    my @hex_cursor = ( $args[0], $args[1] );
    my @hex_to     = ( $args[2], $args[3] );

    push @path, $args[0];
    push @path, $args[1];

    if (
        get_cart_distance( $hex_cursor[0], $hex_cursor[1], $hex_to[0],
            $hex_to[1] ) <= 1.1
      )
    {
        push @path, $hex_to[0];
        push @path, $hex_to[1];

        return @path;
    }

    my $From_X = $hex_cursor[0] * $X_hex;
    my $To_X   = $hex_to[0] * $X_hex;
    my $From_Y = 0;
    my $To_Y   = 0;
    if ( $From_X % 2 ) {    # is From_X odd
        $From_Y = $hex_cursor[1] + 0.5;
    }
    else {
        $From_Y = $hex_cursor[1];
    }
    if ( $hex_to[0] % 2 ) {    # is To_X odd
        $To_Y = $hex_to[1] + 0.5;
    }
    else {
        $To_Y = $hex_to[1];
    }

    my @adj_hex = ( 0, 0 );

    my $most_acute = 360;
    foreach my $adjacent_hex_dir (@three_hexes) {
        @adj_hex =
          get_adjacent_hex( $hex_cursor[0], $hex_cursor[1], $adjacent_hex_dir );
        my $degs =
          get_degrees( $adj_hex[0], $adj_hex[1], $hex_to[0], $hex_to[1] );

        my $delta = abs( $degs - $dir_ang );

        if ( $delta <= $most_acute ) {
            $most_acute  = $delta;
            @nearest_hex = ( $adj_hex[0], $adj_hex[1] );
        }
    }

    get_path( $nearest_hex[0], $nearest_hex[1], $hex_to[0], $hex_to[1] );
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

