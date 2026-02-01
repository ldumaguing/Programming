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
    my @fields      = split /\ /, $args[1];
    my $scenario_id = $args[2];

    #say $fields[1];    # Aye
    #say $fields[2];    # Bee
    if ( is_same_hex( $fields[1], $fields[2] ) == 0 ) {
        say "they must be in the same hex location";
        return;
    }
    if ( is_leg_unit( $fields[1] ) ) {
        if ( is_can_carry_leg_unit( $fields[2] ) ) {
            embark( $fields[1], 1, $fields[2] );
        }
        else { say "can't carry'"; }
        return;
    }
    if ( is_leg_recon_unit( $fields[1] ) ) {
        if ( is_can_carry_leg_recon_unit( $fields[2] ) ) {
            embark( $fields[1], 1, $fields[2] );
        }
        else { say "can't carry'"; }
    }
}

# ***************************************************************************************
sub is_same_hex {
    my ( $aye, $bee ) = @_;
    my $is_it = 0;
    my @A     = ();
    my @B     = ();

    # ***** get aye's loc_x, loc_y
    $stmt = "SELECT loc_x, loc_y FROM instance where id = " . $aye;
    my $rs = $conn->prepare($stmt);
    $rs->execute();
    while ( my @ROW = $rs->fetchrow_array() ) {
        push @A, $ROW[0];
        push @A, $ROW[1];
    }

    # ***** get bee's loc_x, loc_y
    $stmt = "SELECT loc_x, loc_y FROM instance where id = " . $bee;
    $rs   = $conn->prepare($stmt);
    $rs->execute();
    while ( my @ROW = $rs->fetchrow_array() ) {
        push @B, $ROW[0];
        push @B, $ROW[1];
    }

    $rs->finish();

    if ( ( $A[0] == $B[0] ) and ( $A[1] == $B[1] ) ) {
        $is_it = 1;
    }

    return $is_it;
}

# ***************************************************************************************
sub embark {
    my ( $aye, $rtype, $bee ) = @_;
    $stmt =
        "INSERT INTO relation (Aye, rType, Bee) VALUES ("
      . $aye . ", "
      . $rtype . ", "
      . $bee . ")";
    my $rs = $conn->prepare($stmt);
    $rs->execute();

    $stmt = "UPDATE instance SET status = (status & ~(1)) where id = " . $aye;
    $rs   = $conn->prepare($stmt);
    $rs->execute();

    $rs->finish();
}

# ***************************************************************************************
sub is_can_carry_leg_recon_unit {
    my @args  = @_;
    my $is_it = 0;

    $stmt = "SELECT img_id FROM instance WHERE id = " . $args[0];
    my $rs = $conn->prepare($stmt);
    $rs->execute();
    while ( my @ROW = $rs->fetchrow_array() ) {
        $stmt =
            "SELECT * FROM img WHERE id = "
          . $ROW[0]
          . " AND (flag1 & (1 << 13))"
          . " AND (flag1 & (1 << 14))";
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

# ***************************************************************************************
sub is_can_carry_leg_unit {
    my @args  = @_;
    my $is_it = 0;

    $stmt = "SELECT img_id FROM instance WHERE id = " . $args[0];
    my $rs = $conn->prepare($stmt);
    $rs->execute();
    while ( my @ROW = $rs->fetchrow_array() ) {
        $stmt =
            "SELECT * FROM img WHERE id = "
          . $ROW[0]
          . " AND (flag1 & (1 << 13))";
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

# ***************************************************************************************
sub is_leg_recon_unit {
    my @args  = @_;
    my $is_it = 0;

    $stmt = "SELECT img_id FROM instance WHERE id = " . $args[0];
    my $rs = $conn->prepare($stmt);
    $rs->execute();
    while ( my @ROW = $rs->fetchrow_array() ) {
        $stmt =
            "SELECT * FROM img WHERE id = "
          . $ROW[0]
          . " AND (flag2 & (1 << 15))"
          . " AND (flag2 & (1 << 8))";
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
