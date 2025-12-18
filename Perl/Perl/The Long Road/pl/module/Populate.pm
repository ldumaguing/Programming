#!/usr/bin/env perl

use strict;
use warnings;
use diagnostics;
use List::Util qw(uniq);

use v5.42;

our $scenario_num;
our $name;
our $map;
our $zeroXzero;
our $upperRight;
our $lowerRight;
our $hexCount;
our $filename;

my $faction      = -1;
my $faction_name = "";
my @img_ids      = qw();

# ***************************************************************************************
use DBI;
our $conn = DBI->connect( "dbi:SQLite:dbname=db/TLR.db", "", "" );

sub register_units {
    open my $fh, '<', $filename or die "Cannot open $filename: $!";

    my $sql_stmt = "delete from instance where scenario_id = " . $scenario_num;
    my $stmt     = $conn->prepare($sql_stmt);
    $stmt->execute();

    my $instanceID = 1000;

    while ( my $line = <$fh> ) {
        chomp $line;    # Remove trailing newline character
        last if ( $line =~ /END/ );

        if ( $line =~ /American/ ) {
            $faction      = 0;
            $faction_name = "American";
            next;
        }
        if ( $line =~ /Soviet/ ) {
            $faction      = 1;
            $faction_name = "Soviet";
            next;
        }

        if ( $line eq '' ) {
            $faction = -1;
        }

        if ( $faction >= 0 ) {
            if ( $line =~ /:/ ) {
                $_ = $line;
                my @unit = split /:/, $_;
                my $name = $unit[0];
                my $num  = $unit[1];

                $sql_stmt =
"SELECT id, front, back, front1, back1, name from unit where name = '"
                  . $name
                  . "' and flag1 & (1 << "
                  . $faction
                  . ") limit 1";
                $stmt = $conn->prepare($sql_stmt);
                $stmt->execute();
                my ( $unit_id, $front_id, $back_id, $front1_id, $back1_id ) =
                  $stmt->fetchrow_array();
                push( @img_ids, $front_id, $back_id, $front1_id, $back1_id );

                for ( 1 .. $num ) {
                    $sql_stmt =
"INSERT INTO instance (id, scenario_id, unit_name, faction, unit_id, img_id) values ("
                      . $instanceID . ", "
                      . $scenario_num . ", " . "'"
                      . $name . "', " . "'"
                      . $faction_name . "', "
                      . $unit_id . ", "
                      . $front_id . ")";
                    $stmt = $conn->prepare($sql_stmt);
                    $stmt->execute();

                    $instanceID++;
                }
            }
        }
    }

    close $fh;

    my @uniq_ids = uniq @img_ids;
    foreach my $ids (@uniq_ids) {
        $sql_stmt =
            "INSERT INTO scenario (id, key, num4) VALUES ("
          . $scenario_num . ", " . "'"
          . $ids . "', "
          . -1 . ")";
        $stmt = $conn->prepare($sql_stmt);
        $stmt->execute();
    }
}

1;

