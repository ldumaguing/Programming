#!/usr/bin/env perl

use strict;
use warnings;
use diagnostics;

use v5.42;

my $conn = undef;
my $stmt = "";

sub embarking {
    my @args = @_;

    $conn = $args[0];
    my @fields = split /\ /, $args[1];
    say $fields[1];    # Aye
    say $fields[2];    # Bee
    if ( is_leg_unit( $fields[1] ) ) {
        say "leg";
        if ( is_can_carry_leg_unit( $fields[2] ) ) {
            say "can carry";
        }
    }
    else { }
}

# ***************************************************************************************
sub is_can_carry_leg_unit {
    my @args  = @_;
    my $is_it = 0;

    $stmt = "SELECT img_id FROM instance WHERE id = " . $args[0];
    my $rs = $conn->prepare($stmt);
    $rs->execute();
    while ( my @ROW = $rs->fetchrow_array() ) {

    }
    $rs->finish();

    return $is_it;
}

# ***************************************************************************************
sub is_leg_unit {
    my @args  = @_;
    my $is_it = 0;

    $stmt = "SELECT img_id FROM instance WHERE id = " . $args[0];
    my $rs = $conn->prepare($stmt);
    $rs->execute();
    while ( my @ROW = $rs->fetchrow_array() ) {
        $stmt =
            "SELECT * FROM img WHERE id = "
          . $ROW[0]
          . " AND (flag2 & (1 << 15))";
        my $rs1 = $conn->prepare($stmt);
        $rs1->execute();
        while ( my @ROW1 = $rs1->fetchrow_array() ) {
            $is_it = 1;
        }
        $rs1->finish();
    }
    $rs->finish();

    return $is_it;
}
