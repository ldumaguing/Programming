#!/usr/bin/env perl

use strict;
use warnings;
use diagnostics;

use v5.40.3;

my $scenario_num = 0;
my $name = "";
my $map = "";

# ***************************************************************************************
use DBI;
my $conn = DBI->connect("dbi:SQLite:dbname=db/TLR.db","","");

my $filename = $ARGV[0];

if (defined $filename) {
   slurp();
} else {
   say "empty";
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
   }
   
   close $fh;
   
   say "scenarion_num: " . $scenario_num;
   say "name:          " . $name;
   say "map:           " . $map;
}



