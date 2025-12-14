#!/usr/bin/env perl

use strict;
use warnings;
use diagnostics;

use v5.42;

my $scenario_num = 1;
my $faction = 0;

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
        $faction = (1 << 1);
        next;
     }
     if($line =~ /American/) {
        $faction = (1 << 0);
        next;
     }
     

     if (($line =~ /:/) & ($faction != 0)) {
        say $line;
     }   
     
     
     
     
     
     
     
   }
   
   close $fh;
   
   say "> " . $faction;
}



