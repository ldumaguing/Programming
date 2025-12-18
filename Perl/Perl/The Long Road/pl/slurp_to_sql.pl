#!/usr/bin/env perl

use strict;
use warnings;
use diagnostics;

use v5.42;

use lib "pl/module";
use Populate;

our $scenario_num = 0;
our $name         = "";
our $map          = "";
our $zeroXzero    = "";
our $upperRight   = "";
our $lowerRight   = "";
our $hexCount     = "";

# ***************************************************************************************
use DBI;
our $conn = DBI->connect( "dbi:SQLite:dbname=db/TLR.db", "", "" );

our $filename = $ARGV[0];

if ( defined $filename ) {
    slurp();
    spew();
    spew_derivitives();
    register_units();
}
else {
    say "empty";
}

$conn->disconnect();

# *********************************************************
sub spew_derivitives {
    my $stmt =
      "select num1, num2 from scenario where id = ? and key = '0x0' limit 1";
    my $rs = $conn->prepare($stmt);
    $rs->execute($scenario_num);
    my ( $Ax, $Ay ) = $rs->fetchrow_array();

    $stmt =
"select num1, num2 from scenario where id = ? and key = 'lowerRight' limit 1";
    $rs = $conn->prepare($stmt);
    $rs->execute($scenario_num);
    my ( $Bx, $By ) = $rs->fetchrow_array();

    $stmt =
"select num1, num2 from scenario where id = ? and key = 'hexCount' limit 1";
    $rs = $conn->prepare($stmt);
    $rs->execute($scenario_num);
    my ( $Cx, $Cy ) = $rs->fetchrow_array();
    $Cx -= 1;
    $Cy -= 1;

    my $hex_width  = ( $Bx - $Ax ) / $Cx;
    my $hex_height = ( $By - $Ay ) / $Cy;
    my $shift_down = $hex_height / 2.0;

    $stmt =
        "INSERT INTO scenario (id, key, num1, num2, num3) VALUES ("
      . $scenario_num . ", "
      . "'hexInfo'" . ", "
      . $hex_width . ", "
      . $hex_height . ", "
      . $shift_down . ")";
    $rs = $conn->prepare($stmt);
    $rs->execute();

    $rs->finish();
}

# *********************************************************
sub spew {
    my $sql_stmt = "delete from scenario where id = " . $scenario_num;
    my $stmt = $conn->prepare($sql_stmt);
    $stmt->execute();
    
    $sql_stmt = "delete from instance where scenario_id = " . $scenario_num;
    $stmt = $conn->prepare($sql_stmt);
    $stmt->execute();
    
    # ********** name
    $sql_stmt =
        "INSERT INTO scenario (id, key, txt_val) VALUES ("
      . $scenario_num . ", "
      . "'name'" . ", " . "'"
      . $name . "'" . ")";
    $stmt = $conn->prepare($sql_stmt);
    $stmt->execute();

    # ********** map
    $sql_stmt =
        "INSERT INTO scenario (id, key, txt_val) VALUES ("
      . $scenario_num . ", " . "'map'" . ", " . "'"
      . $map . "'" . ")";
    $stmt = $conn->prepare($sql_stmt);
    $stmt->execute();

    # ********** 0x0
    my @data = split( /,/, $zeroXzero );
    $sql_stmt =
        "INSERT INTO scenario (id, key, num1, num2) VALUES ("
      . $scenario_num . ", " . "'0x0'" . ", "
      . $data[0] . ", "
      . $data[1] . ")";
    $stmt = $conn->prepare($sql_stmt);
    $stmt->execute();

    # ********** upperRight
    @data = split( /,/, $upperRight );
    $sql_stmt =
        "INSERT INTO scenario (id, key, num1, num2) VALUES ("
      . $scenario_num . ", "
      . "'upperRight'" . ", "
      . $data[0] . ", "
      . $data[1] . ")";
    $stmt = $conn->prepare($sql_stmt);
    $stmt->execute();

    # ********** lowerRight
    @data = split( /,/, $lowerRight );
    $sql_stmt =
        "INSERT INTO scenario (id, key, num1, num2) VALUES ("
      . $scenario_num . ", "
      . "'lowerRight'" . ", "
      . $data[0] . ", "
      . $data[1] . ")";
    $stmt = $conn->prepare($sql_stmt);
    $stmt->execute();

    # ********** hexCount
    @data = split( /,/, $hexCount );
    $sql_stmt =
        "INSERT INTO scenario (id, key, num1, num2) VALUES ("
      . $scenario_num . ", "
      . "'hexCount'" . ", "
      . $data[0] . ", "
      . $data[1] . ")";
    $stmt = $conn->prepare($sql_stmt);
    $stmt->execute();

    $stmt->finish();
}

# *********************************************************
sub slurp {
    open my $fh, '<', $filename or die "Cannot open $filename: $!";

    while ( my $line = <$fh> ) {
        chomp $line;    # Remove trailing newline character
        last if ( $line =~ /END/ );

        if ( $line =~ /scenario_num/ ) {
            my @num = $line =~ /[0-9].*/g;
            $scenario_num = $num[0];
        }
        if ( $line =~ /name/ ) {
            my @vals = $line =~ /\ [a-zA-Z0-9].*/g;
            $name = $vals[0];
            $name =~ tr/ //d;
        }
        if ( $line =~ /map/ ) {
            my @vals = $line =~ /\ [a-zA-Z0-9].*/g;
            $map = $vals[0];
            my @A = $map =~ /[a-zA-Z0-9].*/g;
            $map = $A[0];
        }
        if ( $line =~ /0x0/ ) {
            my @vals = $line =~ /\ [a-zA-Z0-9].*/g;
            my $foo  = $vals[0];
            $foo =~ s/^\s+//;
            $zeroXzero = $foo;
        }
        if ( $line =~ /upperRight/ ) {
            my @vals = $line =~ /\ [a-zA-Z0-9].*/g;
            my $foo  = $vals[0];
            $foo =~ s/^\s+//;
            $upperRight = $foo;
        }
        if ( $line =~ /lowerRight/ ) {
            my @vals = $line =~ /\ [a-zA-Z0-9].*/g;
            my $foo  = $vals[0];
            $foo =~ s/^\s+//;
            $lowerRight = $foo;
        }
        if ( $line =~ /hexCount/ ) {
            my @vals = $line =~ /\ [0-9].*/g;
            my $foo  = $vals[0];
            $foo =~ s/^\s+//;
            $hexCount = $foo;
        }
    }

    close $fh;

    # say "scenarion_num: " . $scenario_num;
    # say "name:          " . $name;
    # say "map:           " . $map;
    # say "0x0:           " . $zeroXzero;
    # say "upperRight:    " . $upperRight;
    # say "lowerRight:    " . $lowerRight;
    # say "hexCount:      " . $hexCount;
}

