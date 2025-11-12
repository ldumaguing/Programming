#!/usr/bin/env perl

use strict;
use warnings;
use diagnostics;

use v5.40.3;

while (<ARGV>) {
   my $aString = $_;
   print $aString;
}

say "";

#my $d41 = int(rand 41) + 1;
my $d41 = 1;
if ($d41 == 1) {
   roll_01();
} elsif ($d41 == 2) {
   roll_02();
} elsif ($d41 == 3) {
   roll_03();
} elsif ($d41 == 4) {
   roll_04();
} elsif ($d41 == 5) {
   roll_05();
} elsif ($d41 == 6) {
   roll_06();
} elsif ($d41 == 7) {
   roll_07();
} elsif ($d41 == 8) {
   roll_08();
} elsif ($d41 == 9) {
   roll_09();
} elsif ($d41 == 10) {
   roll_10();
} elsif ($d41 == 11) {
   roll_11();
} elsif ($d41 == 12) {
   roll_12();
} elsif ($d41 == 13) {
   roll_13();
} elsif ($d41 == 14) {
   roll_14();
} elsif ($d41 == 15) {
   roll_15();
} elsif ($d41 == 16) {
   roll_16();
} elsif ($d41 == 17) {
   roll_17();
} elsif ($d41 == 18) {
   roll_18();
} elsif ($d41 == 19) {
   roll_19();
} elsif ($d41 == 20) {
   roll_20();
} elsif ($d41 == 21) {
   roll_21();
} elsif ($d41 == 22) {
   roll_22();
} elsif ($d41 == 23) {
   roll_23();
} elsif ($d41 == 24) {
   roll_24();
} elsif ($d41 == 25) {
   roll_25();
} elsif ($d41 == 26) {
   roll_26();
} elsif ($d41 == 27) {
   roll_27();
} elsif ($d41 == 28) {
   roll_28();
} elsif ($d41 == 29) {
   roll_29();
} elsif ($d41 == 30) {
   roll_30();
} elsif ($d41 == 31) {
   roll_31();
} elsif ($d41 == 32) {
   roll_32();
} elsif ($d41 == 33) {
   roll_33();
} elsif ($d41 == 34) {
   roll_34();
} elsif ($d41 == 35) {
   roll_35();
} elsif ($d41 == 36) {
   roll_36();
} elsif ($d41 == 37) {
   roll_37();
} elsif ($d41 == 38) {
   roll_38();
} elsif ($d41 == 39) {
   roll_39();
} elsif ($d41 == 40) {
   roll_40();
} else {
   roll_41();
}

# ***************************************************************************************
sub roll_01 {
   say "\n***** Archaeologist *****";
   say "\nArchaeologists dig through the sands of time, unearthing relics of bygone civilizations and piecing together the stories of the past.";
   say "\nStarting Skill Points: 6";
   say "\nPrimary Attribute: Intelligence";
   say "\nSkill Set: Art, Investigation, Survival, Knowledge, Technical, Linguistic Proficiency";
   say "\nChoice of Free Perk: Network of Contacts, Danger Sense, Fast Healer, Polyglot, Scavenger, Wealthy";
   say "\nUnique Feat: Relic Hunter: Archaeologists possess a unique expertise in discovering and preserving ancient artefacts, receiving a +1 bonus to Knowledge and Survival rolls related to archaeological explorations.";
   say "\nStarting Gear: Ancient maps, digging tools, rugged backpack, dictionaries, survival kit.";
}

sub roll_02 { say "Avenging Angel"; }
sub roll_03 { say "Conspiracy Theorist"; }
sub roll_04 { say "Cop"; }
sub roll_05 { say "Cult Leader"; }
sub roll_06 { say "Cybermancer"; }
sub roll_07 { say "Daredevil"; }
sub roll_08 { say "Dream Magician"; }
sub roll_09 { say "Explorer"; }
sub roll_10 { say "Femme Fatale"; }
sub roll_11 { say "Gambler"; }
sub roll_12 { say "Hacker"; }
sub roll_13 { say "Hired Killer"; }
sub roll_14 { say "Hustler"; }
sub roll_15 { say "Martial Artist"; }
sub roll_16 { say "Medic/Doctor"; }
sub roll_17 { say "Mercenary"; }
sub roll_18 { say "Mobster"; }
sub roll_19 { say "Necromancer"; }
sub roll_20 { say "Occultist"; }
sub roll_21 { say "Pagan Conjurer"; }
sub roll_22 { say "Paranormal Investigator"; }
sub roll_23 { say "Performer"; }
sub roll_24 { say "Pilot"; }
sub roll_25 { say "Politician"; }
sub roll_26 { say "Priest"; }
sub roll_27 { say "Private Eye"; }
sub roll_28 { say "Professor"; }
sub roll_29 { say "Psychic"; }
sub roll_30 { say "Reporter"; }
sub roll_31 { say "Serial Killer"; }
sub roll_32 { say "Sex Magician"; }
sub roll_33 { say "Shaman"; }
sub roll_34 { say "Smuggler"; }
sub roll_35 { say "Soldier"; }
sub roll_36 { say "Spy"; }
sub roll_37 { say "Terrorist"; }
sub roll_38 { say "Thief"; }
sub roll_39 { say "Traditional Conjurer"; }
sub roll_40 { say "Urbanomancer"; }
sub roll_41 { say "War Veteran"; }





