#!/usr/bin/env perl

use strict;
use warnings;
use diagnostics;
use DBI;
use v5.42;

# ***************************************************************************************
my $conn = DBI->connect( "dbi:SQLite:dbname=db/TLR.db", "", "" );

my $filename = $ARGV[0];
my $fname    = $filename;
$fname =~ s/scenario\///;
$fname =~ s/\.txt//;

my $letterRef = ord('A') + 1;
my $gameName  = "";
my $map_dim   = "";

open my $fh, '<', $filename or die "Cannot open $filename: $!";

my $line = "";
while ( $line = <$fh> ) {
    chomp $line;
    last if ( $line =~ /^END/ );
    next if ( $line =~ /^$/ );

    if ( $line =~ /^name/ ) {
        my @X = split /:/, $line;
        $gameName = $X[1];
        next;
    }
    if ( $line =~ /^map_dim/ ) {
        my @X = split /:/, $line;
        $map_dim = $X[1];
        next;
    }
    if ( $line =~ /^maps/ ) {
        my @X = split /:/, $line;
        instantiate_map( $X[1] );
        next;
    }
}

close $fh;
$conn->disconnect();

# ***************************************************************************************
sub instantiate_map {
    my ($mapStr) = @_;
    my @maps     = split /,/, $mapStr;
    my $row      = 0;
    my $col      = 0;

    my $stmt =
      "DELETE FROM terrain_instance WHERE gameName = '" . $gameName . "'";
    my $rs = $conn->prepare($stmt);
    $rs->execute();
    $rs->finish();

    $stmt = "DELETE FROM spine_instance WHERE gameName = '" . $gameName . "'";
    $rs   = $conn->prepare($stmt);
    $rs->execute();
    $rs->finish();

    foreach my $letter (@maps) {
        if ( $letter =~ /_/ ) {
            $col = 0;
            $row += 1;
            next;
        }
        imprint_map( $col, $row, $letter );
        spine_placement( $col, $row, $letter );
        $col += 1;
    }
}

# *********************************************************
sub spine_placement {
    my ( $col, $row, $letter ) = @_;
    return if ( $letter =~ /\./ );

    my $mapFile = "Map " . $letter;

    my $stmt =
        "SELECT loc_x, loc_y, spine, flag1 FROM spine WHERE "
      . "mapFile = '"
      . $mapFile . "'";
    my $rs = $conn->prepare($stmt);
    $rs->execute();

    while ( my @ROW = $rs->fetchrow_array() ) {
        my $a = $ROW[0] + ( $col * 18 ) + 1;
        my $b = $ROW[1] + ( $row * 12 );
        my $c = $ROW[2];                       # ----- terrain spine
        my $d = $ROW[3];                       # ----- terrain flag1

        my $stmt1 =
            "INSERT INTO spine_instance "
          . "(gameName, loc_x, loc_y, spine, flag1) values (" . "'"
          . $gameName . "', "
          . $a . ", "
          . $b . ", "
          . $c . ", "
          . $d . ")";
        my $rs1 = $conn->prepare($stmt1);
        $rs1->execute();
        $rs1->finish();
    }
    $rs->finish();
}

# *********************************************************
sub imprint_map {
    my ( $col, $row, $letter ) = @_;
    return if ( $letter =~ /\./ );

    if ( ( $col == 0 ) and ( $row == 0 ) ) {
        placement_A( $col, $row, $letter );
    }
    else {
        if ( $row == 0 ) {
            placement_B( $col, $row, $letter );
        }
        else {
            if ( $col == 0 ) {
                placement_C( $col, $row, $letter );
            }
            else {
                placement_D( $col, $row, $letter );
            }
        }
    }
}

# ************************************* todo
sub placement_D {
    my ( $col, $row, $letter ) = @_;
    say "blend top & left sides: " . $letter;

    my $mapFile = "Map " . $letter;

    my $stmt =
        "SELECT loc_x, loc_y, flag1, flag2 FROM terrain WHERE "
      . "mapFile = '"
      . $mapFile . "'";
    say $stmt;
    my $rs = $conn->prepare($stmt);
    $rs->execute();

    while ( my @ROW = $rs->fetchrow_array() ) {
        my $a = $ROW[0] + ( $col * 18 ) + 1;
        my $b = $ROW[1] + ( $row * 12 );
        my $c = $ROW[2];                       # ----- terrain flag1
        my $d = $ROW[3];                       # ----- terrain flag2

        if ( ( $ROW[0] < 0 ) or ( $ROW[1] < 0 ) ) {
            say ".. "
              . $a . ","
              . $b . ","
              . $c . ","
              . $d . ": "
              . $ROW[0] . ","
              . $ROW[1];
        }
        else {
            my $stmt1 =
                "INSERT INTO terrain_instance "
              . "(gameName, loc_x, loc_y, flag1, flag2) values (" . "'"
              . $gameName . "', "
              . $a . ", "
              . $b . ", "
              . $c . ", "
              . $d . ")";
            my $rs1 = $conn->prepare($stmt1);
            $rs1->execute();
            $rs1->finish();
        }
    }
    $rs->finish();
}

# *************************************
sub placement_C {
    my ( $col, $row, $letter ) = @_;

    # say "blend top side: " . $letter;

    my $mapFile = "Map " . $letter;

    my $stmt =
        "SELECT loc_x, loc_y, flag1, flag2 FROM terrain WHERE "
      . "mapFile = '"
      . $mapFile . "'";
    say $stmt;
    my $rs = $conn->prepare($stmt);
    $rs->execute();

    while ( my @ROW = $rs->fetchrow_array() ) {
        my $a = $ROW[0] + ( $col * 18 ) + 1;
        my $b = $ROW[1] + ( $row * 12 );
        my $c = $ROW[2];                       # ----- terrain flag1
        my $d = $ROW[3];                       # ----- terrain flag2

        if ( $ROW[1] < 0 ) {
            my $stmt1 =
                "SELECT flag1, flag2 FROM terrain_instance WHERE "
              . "gameName = '"
              . $gameName
              . "' AND "
              . "loc_x = "
              . $a . " AND "
              . "loc_y = "
              . $b;

            my $rs1 = $conn->prepare($stmt1);
            $rs1->execute();
            my $flag1 = 0;
            my $flag2 = 0;

            while ( my @oldROW = $rs1->fetchrow_array() ) {
                $flag1 = $oldROW[0];
                $flag2 = $oldROW[1];
            }

            $stmt1 =
                "UPDATE terrain_instance SET "
              . "flag1 = "
              . ( $flag1 | $c )
              . " WHERE "
              . "gameName = '"
              . $gameName
              . "' AND "
              . "loc_x = "
              . $a . " AND "
              . "loc_y = "
              . $b;
            $rs1 = $conn->prepare($stmt1);
            $rs1->execute();

            $rs1->finish();
        }
        else {
            my $stmt1 =
                "INSERT INTO terrain_instance "
              . "(gameName, loc_x, loc_y, flag1, flag2) values (" . "'"
              . $gameName . "', "
              . $a . ", "
              . $b . ", "
              . $c . ", "
              . $d . ")";
            my $rs1 = $conn->prepare($stmt1);
            $rs1->execute();
            $rs1->finish();
        }
    }
    $rs->finish();
}

# *************************************
sub placement_B {
    my ( $col, $row, $letter ) = @_;

    # say "blend left side: " . $letter;

    my $mapFile = "Map " . $letter;

    my $stmt =
        "SELECT loc_x, loc_y, flag1, flag2 FROM terrain WHERE "
      . "mapFile = '"
      . $mapFile . "'";
    my $rs = $conn->prepare($stmt);
    $rs->execute();

    while ( my @ROW = $rs->fetchrow_array() ) {
        my $a = $ROW[0] + ( $col * 18 ) + 1;
        my $b = $ROW[1];
        my $c = $ROW[2];
        my $d = $ROW[3];
        if ( $ROW[0] < 0 ) {
            my $stmt1 =
                "SELECT flag1, flag2 FROM terrain_instance WHERE "
              . "gameName = '"
              . $gameName
              . "' AND "
              . "loc_x = "
              . $a . " AND "
              . "loc_y = "
              . $b;

            my $rs1 = $conn->prepare($stmt1);
            $rs1->execute();
            my $flag1 = 0;
            my $flag2 = 0;

            while ( my @oldROW = $rs1->fetchrow_array() ) {
                $flag1 = $oldROW[0];
                $flag2 = $oldROW[1];
            }

            $stmt1 =
                "UPDATE terrain_instance SET "
              . "flag1 = "
              . ( $flag1 | $c )
              . " WHERE "
              . "gameName = '"
              . $gameName
              . "' AND "
              . "loc_x = "
              . $a . " AND "
              . "loc_y = "
              . $b;
            $rs1 = $conn->prepare($stmt1);
            $rs1->execute();

            $rs1->finish();
        }
        else {
            my $stmt1 =
                "INSERT INTO terrain_instance "
              . "(gameName, loc_x, loc_y, flag1, flag2) values (" . "'"
              . $gameName . "', "
              . $a . ", "
              . $b . ", "
              . $c . ", "
              . $d . ")";
            my $rs1 = $conn->prepare($stmt1);
            $rs1->execute();
            $rs1->finish();
        }
    }
    $rs->finish();
}

# *************************************
sub placement_A {
    my ( $col, $row, $letter ) = @_;

    # say "upper/left corner - stamp it: " . $letter;

    my $mapFile = "Map " . $letter;

    my $X = $letter;
    $X =~ tr/A-Z/a-z/;

    my $stmt = "";
    if ( $X eq $letter ) {
        placement_180( $col, $row, $letter );
        $stmt = "SELECT loc_x, loc_y, flag1, flag2 FROM terrain_temp";
    }
    else {
        $stmt =
            "SELECT loc_x, loc_y, flag1, flag2 FROM terrain WHERE "
          . "mapFile = '"
          . $mapFile . "'";
    }

    my $rs = $conn->prepare($stmt);
    $rs->execute();

    while ( my @ROW = $rs->fetchrow_array() ) {
        my $a = $ROW[0] + 1;
        my $b = $ROW[1];
        my $c = $ROW[2];
        my $d = $ROW[3];

        my $stmt1 =
            "INSERT INTO terrain_instance "
          . "(gameName, loc_x, loc_y, flag1, flag2) values (" . "'"
          . $gameName . "', "
          . $a . ", "
          . $b . ", "
          . $c . ", "
          . $d . ")";
        my $rs1 = $conn->prepare($stmt1);
        $rs1->execute();
        $rs1->finish();
    }
    $rs->finish();
}

# *************************************
sub placement_180 {
    my ( $col, $row, $letter ) = @_;

    $letter =~ tr/a-z/A-Z/;
    my $mapFile = "Map " . $letter;

    my $stmt = "DELETE FROM terrain_temp";
    my $rs   = $conn->prepare($stmt);
    $rs->execute();
    $rs->finish();

    $stmt =
        "SELECT loc_x, loc_y, flag1, flag2 FROM terrain WHERE "
      . "mapFile = '"
      . $mapFile . "'";
    $rs = $conn->prepare($stmt);
    $rs->execute();

    while ( my @ROW = $rs->fetchrow_array() ) {
        my $a = 16 - $ROW[0];
        my $b = 10 - $ROW[1];
        my $c = rotate_180( $ROW[2] );
        my $d = $ROW[3];

        my $stmt1 =
            "INSERT INTO terrain_temp (loc_x, loc_y, flag1, flag2) VALUES ("
          . $a . ", "
          . $b . ", "
          . $c . ", "
          . $d . ")";
        my $rs1 = $conn->prepare($stmt1);
        $rs1->execute();
        $rs1->finish();
    }
    $rs->finish();
}

# *************************************
sub rotate_180 {
    my ($word) = @_;

    # ***
    my $no_roads = $word & 57345;
    my $road     = $word & 126;
    $road = $road >> 1;

    my $rd = $road << 3;
    $rd = $rd & 63;
    my $b        = $road >> 3;
    my $road_180 = $rd | $b;

    # ***
    my $tunnel_road = $word & 8064;
    $tunnel_road = $tunnel_road >> 7;

    my $tn = $tunnel_road << 3;
    $tn = $tn & 63;
    my $bb              = $tunnel_road >> 3;
    my $tunnel_road_180 = $tn | $bb;

    return ( $road_180 << 1 ) | $no_roads | ( $tunnel_road_180 << 7 );
}

