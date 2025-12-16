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

my $faction = -1;

# ***************************************************************************************
use DBI;
our $conn = DBI->connect("dbi:SQLite:dbname=db/TLR.db","","");

sub register_units {
   open my $fh, '<', $filename or die "Cannot open $filename: $!";

   while (my $line = <$fh>) {
      chomp $line; # Remove trailing newline character
      last if($line =~ /END/);
      
      if($line =~ /American/) {
         $faction = 0;
         next;
      }
      if($line =~ /Soviet/) {
         $faction = 1;
         next;
      }

      if($line eq '') {
         $faction = -1;
      }

      if($faction >= 0) {
         if($line =~ /:/) {
            $_ = $line;
            my @unit = split /:/, $_;
            my $name = $unit[0];
            my $num = $unit[1];
            say "select * from unit where name = '" . $name . "' and flag1 & (1 << " . $faction . ")";
         }
      }

      
#    select * from unit where name = 'Infantry' and flag1 & (1 << 0);
      
      
      
      
      
      
      
   }

   close $fh;
}

1;




