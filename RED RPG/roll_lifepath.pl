#!/usr/bin/env perl

use strict;
use warnings;
use diagnostics;

use v5.40.3;

# ***************************************************************************************
my $d20 = int(rand 20) + 1;
if ($d20 == 1) {
   roll_1();
} elsif ($d20 == 2) {
   roll_2();
} elsif ($d20 == 3) {
   roll_3();
} elsif ($d20 == 4) {
   roll_4();
} elsif ($d20 == 5) {
   roll_5();
} elsif ($d20 == 6) {
   roll_6();
} elsif ($d20 == 7) {
   roll_7();
} elsif ($d20 == 8) {
   roll_8();
} elsif ($d20 == 9) {
   roll_9();
} elsif ($d20 == 10) {
   roll_10();
} elsif ($d20 == 11) {
   roll_11();
} elsif ($d20 == 12) {
   roll_12();
} elsif ($d20 == 13) {
   roll_13();
} elsif ($d20 == 14) {
   roll_14();
} elsif ($d20 == 15) {
   roll_15();
} elsif ($d20 == 16) {
   roll_16();
} elsif ($d20 == 17) {
   roll_17();
} elsif ($d20 == 18) {
   roll_18();
} elsif ($d20 == 19) {
   roll_19();
} else {
   roll_20();
}

# ***************************************************************************************
sub roll_1 {
   say "Uncovered old letters revealing a family " .
   "secret tied to a historical crime.";
   say "   +1 Investigation";
   say "   Photographic Memory";
   say "   (Emotional Baggage)";
}

# ---------------------------------------------------------------------------------------
sub roll_2 {
   say "Escaped from a burning building, " .
   "leading to a new perspective on life.";
   say "   +1 Survival";
   say "   Daredevil";
}

# ---------------------------------------------------------------------------------------
sub roll_3 {
   say "Became entangled in a political scandal " .
   "without direct involvement.";
   say "   +1 Influence";
   say "   (Infamous)";
}

# ---------------------------------------------------------------------------------------
sub roll_4 {
   say "Invented a minor but popular " .
   "technological item.";
   say "   +1 Technical";
   say "   Wealthy";
}

# ---------------------------------------------------------------------------------------
sub roll_5 {
   say "Lost a significant other to a mysterious " .
   "disappearance.";
   say "   +1 Investigation";
   say "   (Depression)";
}

# ---------------------------------------------------------------------------------------
sub roll_6 {
   say "Acted as a key witness in a high-profile " .
   "trial.";
   say "   +1 Influence";
   say "   Eloquent";
   say "   (Enemy)";
}

# ---------------------------------------------------------------------------------------
sub roll_7 {
   say "Survived a hostage situation during " .
   "a heist.";
   say "   +1 Influence";
   say "   Enhanced Pain Tolerance";
}

# ---------------------------------------------------------------------------------------
sub roll_8 {
   say "Led a successful community project.";
   say "   +1 Influence";
   say "   Commanding Aura";
}

# ---------------------------------------------------------------------------------------
sub roll_9 {
   say "Discovered and restored a rare and " .
   "classic car/painting/antiquity.";
   say "   +1 Technical";
   say "   Grease Monkey";
}

# ---------------------------------------------------------------------------------------
sub roll_10 {
   say "Were diagnosed with a rare disease and " .
   "then cured under mysterious " .
   "circumstances.";
   say "   +1 Medicine";
   say "   Fast Healer";
}

# ---------------------------------------------------------------------------------------
sub roll_11 {
   say "Saved someone from an imminent " .
   "threat, becoming a local hero.";
   say "   +1 Athletics";
   say "   Fame";
}

# ---------------------------------------------------------------------------------------
sub roll_12 {
   say "Your talent sparked a major social " .
   "movement.";
   say "   +1 Performance";
   say "   Network of Contacts";
}

# ---------------------------------------------------------------------------------------
sub roll_13 {
   say "Experienced financial ruin due to a " .
   "fraudulent business partner.";
   say "   +1 Investigation";
   say "   (Poor)";
}

# ---------------------------------------------------------------------------------------
sub roll_14 {
   say "Wrote an influential paper/poem/" .
   "novels that caught the attention of the " .
   "scientific/artistic community.";
   say "   +1 Knowledge";
   say "   Fame";
}

# ---------------------------------------------------------------------------------------
sub roll_15 {
   say "Found yourself lost in a foreign country " .
   "with no money or documents.";
   say "   +1 Survival";
   say "   Cultural Chameleon";
}

# ---------------------------------------------------------------------------------------
sub roll_16 {
   say "Identified a new species while on a " .
   "volunteer trip to a remote island.";
   say "   +1 Knowledge";
   say "   Fame";
}

# ---------------------------------------------------------------------------------------
sub roll_17 {
   say "Were falsely imprisoned for a crime, " .
   "then exonerated by DNA evidence years " .
   "later.";
   say "   +1 Law";
   say "   (Post-Traumatic Stress Disorder)";
}

# ---------------------------------------------------------------------------------------
sub roll_18 {
   say "Broke a significant sports record in an " .
   "unexpected victory.";
   say "   +1 Athletics";
   say "   Natural Athlete";
}

# ---------------------------------------------------------------------------------------
sub roll_19 {
   say "Returned to school to earn a degree later " .
   "in life, inspiring others.";
   say "   +1 Knowledge";
   say "   Eloquent";
}

# ---------------------------------------------------------------------------------------
sub roll_20 {
   say "Survived a near-death experience in the " .
   "wilderness.";
   say "   +1 Survival";
   say "   Fearless";
}




