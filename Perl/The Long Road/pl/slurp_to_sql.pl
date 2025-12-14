#!/usr/bin/env perl

use strict;
use warnings;
use diagnostics;

use v5.42;

my $scenario_num = 0;
my $name = "";
my $map = "";
my $zeroXzero = "";
my $upperRight = "";
my $lowerRight = "";
my $hexCount = "";

# ***************************************************************************************
use DBI;
my $conn = DBI->connect("dbi:SQLite:dbname=db/TLR.db","","");

my $filename = $ARGV[0];

if (defined $filename) {
   slurp();
   spew();
   spew_derivitives();
} else {
   say "empty";
}

$conn->disconnect();

# *********************************************************
sub spew_derivitives {
   say "yo";
}

# *********************************************************
sub spew {
   # ********** name
   my $sql_stmt = "INSERT INTO scenario (id, key, txt_val) VALUES ("
                   . $scenario_num . ", "
                   . "'name'" . ", "
                   . "'" . $name . "'"
                   . ")";
   my $stmt = $conn->prepare($sql_stmt);
   $stmt->execute();
   
   # ********** map
   $sql_stmt = "INSERT INTO scenario (id, key, txt_val) VALUES ("
                   . $scenario_num . ", "
                   . "'map'" . ", "
                   . "'" . $map . "'"
                   . ")";
   $stmt = $conn->prepare($sql_stmt);
   $stmt->execute();
   
   # ********** 0x0
   my @data = split(/,/, $zeroXzero);
   $sql_stmt = "INSERT INTO scenario (id, key, num1, num2) VALUES ("
                   . $scenario_num . ", "
                   . "'0x0'" . ", "
                   . $data[0] . ", "
                   . $data[1]
                   . ")";
   $stmt = $conn->prepare($sql_stmt);
   $stmt->execute();
   
   # ********** upperRight
   @data = split(/,/, $upperRight);
   $sql_stmt = "INSERT INTO scenario (id, key, num1, num2) VALUES ("
                   . $scenario_num . ", "
                   . "'upperRight'" . ", "
                   . $data[0] . ", "
                   . $data[1]
                   . ")";
   $stmt = $conn->prepare($sql_stmt);
   $stmt->execute();
   
   # ********** lowerRight
   @data = split(/,/, $lowerRight);
   $sql_stmt = "INSERT INTO scenario (id, key, num1, num2) VALUES ("
                   . $scenario_num . ", "
                   . "'lowerRight'" . ", "
                   . $data[0] . ", "
                   . $data[1]
                   . ")";
   $stmt = $conn->prepare($sql_stmt);
   $stmt->execute();
   
   # ********** hexCount
   @data = split(/,/, $hexCount);
   $sql_stmt = "INSERT INTO scenario (id, key, num1, num2) VALUES ("
                   . $scenario_num . ", "
                   . "'hexCount'" . ", "
                   . $data[0] . ", "
                   . $data[1]
                   . ")";
   $stmt = $conn->prepare($sql_stmt);
   $stmt->execute();
   
   $stmt->finish();
}

# *********************************************************
sub slurp {
   open my $fh, '<', $filename or die "Cannot open $filename: $!";

   while (my $line = <$fh>) {
     chomp $line; # Remove trailing newline character
     last if($line =~ /END/);

     if($line =~ /scenario_num/) {
        my @num = $line =~ /[0-9].*/g;
        $scenario_num = $num[0];
     }
     if($line =~ /name/) {
        my @vals = $line =~ /\ [a-zA-Z0-9].*/g;
        $name = $vals[0];
        $name =~ tr/ //d;
     }
     if($line =~ /map/) {
        my @vals = $line =~ /\ [a-zA-Z0-9].*/g;
        $map = $vals[0];
        my @A = $map =~ /[a-zA-Z0-9].*/g;
        $map = $A[0];
     }
     if($line =~ /0x0/) {
        my @vals = $line =~ /\ [a-zA-Z0-9].*/g;
        my $foo = $vals[0];
        $foo =~ s/^\s+//;
        $zeroXzero = $foo;
     }
     if($line =~ /upperRight/) {
        my @vals = $line =~ /\ [a-zA-Z0-9].*/g;
        my $foo = $vals[0];
        $foo =~ s/^\s+//;
        $upperRight = $foo;
     }
     if($line =~ /lowerRight/) {
        my @vals = $line =~ /\ [a-zA-Z0-9].*/g;
        my $foo = $vals[0];
        $foo =~ s/^\s+//;
        $lowerRight = $foo;
     }
     if($line =~ /hexCount/) {
        my @vals = $line =~ /\ [0-9].*/g;
        my $foo = $vals[0];
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



