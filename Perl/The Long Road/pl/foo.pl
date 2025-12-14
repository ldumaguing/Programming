#!/usr/bin/env perl

use strict;
use warnings;
use diagnostics;

use v5.42;

my $scenario_num = 1;

# ***************************************************************************************
use DBI;
my $conn = DBI->connect("dbi:SQLite:dbname=db/TLR.db","","");


spew_derivitives();



$conn->disconnect();

# *********************************************************
sub spew_derivitives {
   # ********** 0x0   
   my $stmt = "select num1, num2 from scenario where id = ? and key = '0x0' limit 1";
   my $sth = $conn->prepare($stmt);
   $sth->execute($scenario_num);
   my ($Ax, $Ay) = $sth->fetchrow_array();
   say $Ax;
   say $Ay;
   
   $stmt = "select num1, num2 from scenario where id = ? and key = 'lowerRight' limit 1";
   $sth = $conn->prepare($stmt);
   $sth->execute($scenario_num);
   my ($Bx, $By) = $sth->fetchrow_array();
   say $Bx;
   say $By;
   

   
   $sth->finish();
   
   
   
   
   
   
}

