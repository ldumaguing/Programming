#!/usr/bin/env perl

use strict;
use warnings;
use diagnostics;

use v5.40.3;

# ***************************************************************************************
my %attributes;
my $count = 0;

while (<ARGV>) {
   $count++;
   if ($count > 6) {last;}
   my $aString = $_;
   my @anArray = split(" ", $aString);
   $anArray[0] =~ s/://;
   $attributes{$anArray[0]} = $anArray[1];
}

#say %attributes;
#say $attributes{'STR'};
my $d4 = int(rand 4) + 1;
if ($d4 == 1) {
   roll_1();
} elsif ($d4 == 2) {
   roll_2();
} elsif ($d4 == 3) {
   roll_3();
} else {
   roll_4();
}

# ***********************************************
sub roll_1 {
   #say "Destitute";
   #say $attributes{'TOU'};
   $attributes{'TOU'} += 1;
   #say $attributes{'TOU'};
   mod_attrib();
   my $d6  = int(rand 6) + 1;
   if ($d6 == 1) {
      r1_1();
   } elsif ($d6 == 2) {
      r1_2();
   } elsif ($d6 == 3) {
      r1_3();
   } elsif ($d6 == 4) {
      r1_4();
   } elsif ($d6 == 5) {
      r1_5();
   } else {
      r1_6();
   }
}

# -------------------------------
sub r1_1 {
   say "Hobo";
   say "   +1 Survival";
   say "   Specialization in Urban Survival";
}

# -------------------------------
sub r1_2 {
   say "Beggar";
   say "   +1 Influence";
}

# -------------------------------
sub r1_3 {
   say "Pickpocket";
   say "   +1 Stealth";
   say "   Specialization in Pickpocketing";
}

# -------------------------------
sub r1_4 {
   say "Street Urchin";
   say "   +1 Stealth";
   say "   Specialization in Evasion";
}

# -------------------------------
sub r1_5 {
   say "Factory Worker";
   say "   +1 Technical";
}

# -------------------------------
sub r1_6 {
   say "Prostitute";
   say "   +1 Influence";
   say "   Specialization in Seduction";
}

# *************************************
sub roll_2 {
   say "Struggling";
}

# *************************************
sub roll_3 {
   say "Comfortable";
}

# *************************************
sub roll_4 {
   say "Wealthy";
}

# ***********************************************
sub mod_attrib {
   print "STR: " . $attributes{"STR"};
   modifier($attributes{"STR"});
   print "INT: " . $attributes{"INT"};
   modifier($attributes{"INT"});
   print "WIT: " . $attributes{"WIT"};
   modifier($attributes{"WIT"});
   print "AGL: " . $attributes{"AGL"};
   modifier($attributes{"AGL"});
   print "TOU: " . $attributes{"TOU"};
   modifier($attributes{"TOU"});
   print "CHA: " . $attributes{"CHA"};
   modifier($attributes{"CHA"});
   say "";
}

# ***************************************************************************************
sub modifier {
   my ($x) = @_;
   if ($x == 3) {
      say " (-3)";
   } elsif ($x >= 18) {
      say " (+3)";
   } elsif ($x >= 16) {
      say " (+2)"
   } elsif ($x >= 13) {
      say " (+1)";
   } elsif ($x >= 9) {
      say "";
   } elsif ($x >= 6) {
      say " (-1)";
   } elsif ($x >= 4) {
      say " (-2)";
   };
}








