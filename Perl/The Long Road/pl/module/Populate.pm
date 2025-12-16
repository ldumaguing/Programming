#!/usr/bin/env perl

use strict;
use warnings;
use diagnostics;

use v5.42;

our $scenario_num;
our $name;
our $map;
our $zeroXzero;
our $upperRight;
our $lowerRight;
our $hexCount;
our $filename;

my $faction = 0;

# ***************************************************************************************
use DBI;
our $conn = DBI->connect("dbi:SQLite:dbname=db/TLR.db","","");

sub add_units {
   open my $fh, '<', $filename or die "Cannot open $filename: $!";

   while (my $line = <$fh>) {
      chomp $line; # Remove trailing newline character
      last if($line =~ /END/);
      
      if($line =~ /American/) {
         $faction = 1;
         next;
      }
      if($line =~ /Soviet/) {
         $faction = 2;
         next;
      }

      if($line eq '') {
         $faction = 0;
      }

      if($faction > 0) {
         if($line =~ /:/) {
            say $line;
         }
      }

      
      
      
      
      
      
      
      
      
   }

   close $fh;
}

1;




