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

my $d6 = int(rand 6) + 1;
if ($d6 == 1) {
   roll_1();
} elsif ($d6 == 2) {
   roll_2();
} elsif ($d6 == 3) {
   roll_3();
} elsif ($d6 == 4) {
   roll_4();
} elsif ($d6 == 5) {
   roll_5();
} else {
   roll_6();
}
say "";

# ***********************************************
sub roll_5 {
   $attributes{'TOU'} += 1;
   mod_attrib();
   say "Your wealth was almost limitless.";
   my $d6  = int(rand 6) + 1;
   if ($d6 == 1) {
      r5_1();
   } elsif ($d6 == 2) {
      r5_2();
   } elsif ($d6 == 3) {
      r5_3();
   } elsif ($d6 == 4) {
      r5_4();
   } elsif ($d6 == 5) {
      r5_5();
   } else {
      r5_6();
   }
}

# -------------------------------
sub r5_1 {
   say "Heir to a Business Empire";
   say "   +2 Influence";
   say "   Specialization in Leadership";
}

# -------------------------------
sub r5_2 {
   say "Celebrity";
   say "   +1 Influence";
   say "   +1 Performance";
}

# -------------------------------
sub r5_3 {
   say "Entrepreneur";
   say "   +1 Influence";
   say "   +1 Technical";
   say "   Specialization in Advanced Computing";
}

# -------------------------------
sub r5_4 {
   say "Art Collector";
   say "   +1 Influence";
   say "   +1 Art";
   say "   Specialization in " . roll_art();
}

# ...............
sub roll_art {
   my $d9 = int(rand 9) + 1;
   if ($d9 == 1) {
      return "Augmented Reality Installations";
   } elsif ($d9 == 2) {
      return "Digital Arts";
   } elsif ($d9 == 3) {
      return "Elemental Manipulation";
   } elsif ($d9 == 4) {
      return "Holographic Art";
   } elsif ($d9 == 5) {
      return "Nanotech Sculpting";
   } elsif ($d9 == 6) {
      return "Painting";
   } elsif ($d9 == 7) {
      return "Psychic Imagery";
   } elsif ($d9 == 8) {
      return "Sculpture";
   } else {
      return "Performance Art";
   }
}

# -------------------------------
sub r5_5 {
   say "Dillettante";
   say "   +2 Influence";
   say "   Specialization in Charm";
}

# -------------------------------
sub r5_6 {
   say "Banker";
   say "   +1 Influence";
   say "   +1 Knowledge";
}

# ***********************************************
sub roll_6 {
   $attributes{'CHA'} += 1;
   mod_attrib();
   say "Your beginnings were marked by extreme wealth and power.";
   my $d6  = int(rand 6) + 1;
   if ($d6 == 1) {
      r6_1();
   } elsif ($d6 == 2) {
      r6_2();
   } elsif ($d6 == 3) {
      r6_3();
   } elsif ($d6 == 4) {
      r6_4();
   } elsif ($d6 == 5) {
      r6_5();
   } else {
      r6_6();
   }
}
   
# -------------------------------
sub r6_1 {
   say "Heir to a Royal Title";
   say "   +1 Influence";
}
   
# -------------------------------
sub r6_2 {
   say "Large Company Owner";
   say "   +1 Influence";
   say "   Specialization in Diplomacy";
}
   
# -------------------------------
sub r6_3 {
   say "High-Powered Lawyer";
   say "   +1 Knowledge";
   say "   Specialization in Law";
}
   
# -------------------------------
sub r6_4 {
   say "Political Operative";
   say "   +1 Influence";
   say "   Specialization in Deception";
}
   
# -------------------------------
sub r6_5 {
   say "Major Shareholder";
   say "   +1 Knowledge";
}

# -------------------------------
sub r6_6 {
   say "Major Celebrity";
   say "   +1 Performance";
}

# ***********************************************
sub roll_1 {
   $attributes{'TOU'} += 1;
   mod_attrib();
   say "Life began in the grip of poverty, where every day was a struggle for survival.";
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
   $attributes{'WIT'} += 1;
   mod_attrib();
   say "Raised in a working-class environment with constant financial uncertainty.";
   my $d6  = int(rand 6) + 1;
   if ($d6 == 1) {
      r2_1();
   } elsif ($d6 == 2) {
      r2_2();
   } elsif ($d6 == 3) {
      r2_3();
   } elsif ($d6 == 4) {
      r2_4();
   } elsif ($d6 == 5) {
      r2_5();
   } else {
      r2_6();
   }
}

# -------------------------------
sub r2_1 {
   say "Grifter";
   say "   +1 Influence";
   say "   Specialization in Deception";
}

# -------------------------------
sub r2_2 {
   say "Hustler";
   say "   +1 Influence";
   say "   Specialization in Fast Talking";
}

# -------------------------------
sub r2_3 {
   say "Out of Work Veteran";
   say "   +1 Ranged Combat";
   say "   Specialization in Firearms";
}

# -------------------------------
sub r2_4 {
   say "Struggling Artist";
   say "   +1 Art";
   say "   Specialization in Performance Art";
}

# -------------------------------
sub r2_5 {
   say "Day Labourer";
   say "   +1 Technical";
   say "   Specialization in Repair";
}

# -------------------------------
sub r2_6 {
   say "Thief";
   say "   +1 Stealth";
   say "   Specialization in Lockpicking";
}

# *************************************
sub roll_3 {
   $attributes{'INT'} += 1;
   mod_attrib();
   say "A stable middle-class upbringing offered a balanced and secure early life.";
   my $d6  = int(rand 6) + 1;
   if ($d6 == 1) {
      r3_1();
   } elsif ($d6 == 2) {
      r3_2();
   } elsif ($d6 == 3) {
      r3_3();
   } elsif ($d6 == 4) {
      r3_4();
   } elsif ($d6 == 5) {
      r3_5();
   } else {
      r3_6();
   }
}

# -------------------------------
sub r3_1 {
   say "Small Business Owner";
   say "   +1 Influence";
}

# -------------------------------
sub r3_2 {
   say "Athlete";
   say "   +1 Athletics";
   say "   Specialization in Endurance Running";
}

# -------------------------------
sub r3_3 {
   say "Nurse/Healer";
   say "   +1 Medicine";
   say "   Specialization in Field Medicine";
}

# -------------------------------
sub r3_4 {
   say "School Teacher";
   say "   +1 Knowledge";
   say "   Specialization in Education";
}

# -------------------------------
sub r3_5 {
   say "Musician";
   say "   +1 Performance";
   say "   Specialization in Music";
}

# -------------------------------
sub r3_6 {
   say "Traveling Salesman";
   say "   +1 Influence";
   say "   Specialization in Deception";
}

# *************************************
sub roll_4 {
   $attributes{'CHA'} += 1;
   mod_attrib();
   say "Affluence and a superior education characterized your early years.";
   my $d6  = int(rand 6) + 1;
   if ($d6 == 1) {
      r4_1();
   } elsif ($d6 == 2) {
      r4_2();
   } elsif ($d6 == 3) {
      r4_3();
   } elsif ($d6 == 4) {
      r4_4();
   } elsif ($d6 == 5) {
      r4_5();
   } else {
      r4_6();
   }
}
   
# -------------------------------
sub r4_1 {
   say "Socialite";
   say "   +1 Influence";
   say "   Specialization in Carousing";
}
   
# -------------------------------
sub r4_2 {
   say "Playboy/Playgirl";
   say "   +1 Influence";
   say "   Specialization in Charm";
}  

# -------------------------------
sub r4_3 {
   say "Businessman";
   say "   +1 Influence";
   say "   Specialization in Diplomacy";
}

# -------------------------------
sub r4_4 {
   say "Professional Athlete";
   say "   +1 Athletics";
   say "   Specialization in Carousing";
}

# -------------------------------
sub r4_5 {
   say "Lawyer";
   say "   +1 Knowledge";
   say "   Specialization in Law";
}

# -------------------------------
sub r4_6 {
   say "Medical Doctor";
   say "   +1 Medicine";
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
   if ($x >= 20 and $x < 90) {
      $x -= 20;
      $x = int ($x/10) + 4;
      say " (+" . $x . ")";
      return;
   }
   if ($x >= 90) {
      $x -= 90;
      $x = int ($x/20) + 11;
      say " (+" . $x . ")";
      return;
   }
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








