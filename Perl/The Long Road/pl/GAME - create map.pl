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

    foreach my $letter (@maps) {
        if ( $letter =~ /_/ ) {
            $col = 0;
            $row += 1;
            next;
        }

        new_map( $col, $row, $letter );
        $col += 1;
    }
}

# *********************************************************
sub new_map {
    my ( $col, $row, $letter ) = @_;
    return if ( $letter =~ /\./ );

    my $mapFile = "Map " . $letter;

    my $sqlSTMT =
      "SELECT loc_x, loc_y, flag1, flag2, hexID FROM terrain WHERE mapFile = '"
      . $mapFile
      . "' order by loc_x, loc_y";
    my $stmt = $conn->prepare($sqlSTMT);
    $stmt->execute();

    my $hexSlot_x = 0;
    my $trigger_x = -1;
    while ( my @sqlROW = $stmt->fetchrow_array() ) {
        my $a = $sqlROW[0];
        my $b = $sqlROW[1] + ( 13 * $row );
        my $c = $sqlROW[2];
        my $d = $sqlROW[3];

        if ( $trigger_x != $a ) {
            $trigger_x = $a;
            $hexSlot_x += 1;
        }
        my $actual_col = $hexSlot_x + ( $col * 18 );
        if ( ( $col > 0 ) and ( $a < 0 ) ) {    # ----- lacing
            my $stmt1 =
                "SELECT flag1 "
              . "FROM terrain_instance WHERE gameName = '"
              . $gameName
              . "' and "
              . "loc_x = "
              . ( 19 + $a ) . " and "
              . "loc_y = "
              . $b;

            my $rs1 = $conn->prepare($stmt1);
            $rs1->execute();

            my $flag1 = "";
            while ( my @oldROW = $rs1->fetchrow_array() ) {
                $flag1 = $oldROW[0];
            }

            $rs1->finish();

            # **************
            $stmt1 =
                "SELECT flag1 "
              . "FROM terrain WHERE mapFile = '"
              . $mapFile
              . "' and "
              . "loc_x = "
              . $a . " and "
              . "loc_y = "
              . $b;

            $rs1 = $conn->prepare($stmt1);
            $rs1->execute();

            my $flag1a = "";
            while ( my @oldROW = $rs1->fetchrow_array() ) {
                $flag1a = $oldROW[0];
            }

            $rs1->finish();

            if ( $flag1a != $flag1 ) {
                $stmt1 =
                    "UPDATE terrain_instance SET flag1 = "
                  . ( $flag1a | $flag1 )
                  . " WHERE gameName = '"
                  . $gameName
                  . "' and "
                  . "loc_x = "
                  . $actual_col . " and "
                  . "loc_y = "
                  . $b;
                $rs1 = $conn->prepare($stmt1);
                $rs1->execute();
                $rs1->finish();
            }
        }
        else {
            my $actual_col = $hexSlot_x + ( $col * 18 );
            my $stmt1 =
                "INSERT INTO terrain_instance "
              . "(gameName, loc_x, loc_y, flag1, flag2) values (" . "'"
              . $gameName . "', "
              . $actual_col . ", "
              . $b . ", "
              . $c . ", "
              . $d . ")";

            my $rs1 = $conn->prepare($stmt1);
            $rs1->execute();
            $rs1->finish();
        }
    }

    $stmt->finish();
}

