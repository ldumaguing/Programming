#!/usr/bin/env perl

use strict;
use warnings;
use diagnostics;

use v5.42;

my $scenario_num = 1;
my $faction = "";

# ***************************************************************************************
use DBI;
my $conn = DBI->connect("dbi:SQLite:dbname=db/TLR.db","","");

my $filename = $ARGV[0];

if (defined $filename) {
   slurp2();
} else {
   say "empty";
}

$conn->disconnect();

# THE END
# *********************************************************
sub slurp2 {
   open my $fh, '<', $filename or die "Cannot open $filename: $!";

   while (my $line = <$fh>) {
     chomp $line; # Remove trailing newline character
     last if($line =~ /END/);




     if($line =~ /Soviet/) {
        $faction = $line;
        next;
     }
     if($line =~ /American/) {
        $faction = $line;
        next;
     }
     

       if (($line =~ /:/) & ($faction ne "")) {
        say $line;
     }   
     
     
     
     
     
     
     
   }
   
   close $fh;
}



