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

#my $d43 = int(rand 43) + 1;
my $d43 = 16;
if ($d43 == 1) {
   roll_01();
} elsif ($d43 == 2) {
   roll_02();
} elsif ($d43 == 3) {
   roll_03();
} elsif ($d43 == 4) {
   roll_04();
} elsif ($d43 == 5) {
   roll_05();
} elsif ($d43 == 6) {
   roll_06();
} elsif ($d43 == 7) {
   roll_07();
} elsif ($d43 == 8) {
   roll_08();
} elsif ($d43 == 9) {
   roll_09();
} elsif ($d43 == 10) {
   roll_10();
} elsif ($d43 == 11) {
   roll_11();
} elsif ($d43 == 12) {
   roll_12();
} elsif ($d43 == 13) {
   roll_13();
} elsif ($d43 == 14) {
   roll_14();
} elsif ($d43 == 15) {
   roll_15();
} elsif ($d43 == 16) {
   roll_16();
} elsif ($d43 == 17) {
   roll_17();
} elsif ($d43 == 18) {
   roll_18();
} elsif ($d43 == 19) {
   roll_19();
} elsif ($d43 == 20) {
   roll_20();
} elsif ($d43 == 21) {
   roll_21();
} elsif ($d43 == 22) {
   roll_22();
} elsif ($d43 == 23) {
   roll_23();
} elsif ($d43 == 24) {
   roll_24();
} elsif ($d43 == 25) {
   roll_25();
} elsif ($d43 == 26) {
   roll_26();
} elsif ($d43 == 27) {
   roll_27();
} elsif ($d43 == 28) {
   roll_28();
} elsif ($d43 == 29) {
   roll_29();
} elsif ($d43 == 30) {
   roll_30();
} elsif ($d43 == 31) {
   roll_31();
} elsif ($d43 == 32) {
   roll_32();
} elsif ($d43 == 33) {
   roll_33();
} elsif ($d43 == 34) {
   roll_34();
} elsif ($d43 == 35) {
   roll_35();
} elsif ($d43 == 36) {
   roll_36();
} elsif ($d43 == 37) {
   roll_37();
} elsif ($d43 == 38) {
   roll_38();
} elsif ($d43 == 39) {
   roll_39();
} elsif ($d43 == 40) {
   roll_40();
} elsif ($d43 == 41) {
   roll_41();
} elsif ($d43 == 42) {
   roll_42();
} else {
   roll_43();
}

# ***************************************************************************************
sub roll_01 {
   say "\nArchaeologist";
   say "=============";
   say "Archaeologists dig through the sands of time, unearthing relics of bygone civilizations and piecing together the stories of the past.";
   say "\nStarting Skill Points: 6";
   say "\nPrimary Attribute: Intelligence";
   say "\nSkill Set: Art, Investigation, Survival, Knowledge, Technical, Linguistic Proficiency";
   say "\nChoice of Free Perk: Network of Contacts, Danger Sense, Fast Healer, Polyglot, Scavenger, Wealthy";
   say "\nUnique Feat: Relic Hunter: Archaeologists possess a unique expertise in discovering and preserving ancient artefacts, receiving a +1 bonus to Knowledge and Survival rolls related to archaeological explorations.";
   say "\nStarting Gear: Ancient maps, digging tools, rugged backpack, dictionaries, survival kit.";
}

sub roll_02 {
   say "\nAvenging Angel";
   say "==============";
   say "Marked by tragedy and fuelled by vengeance, Avenging Angels are solitary warriors who walk the path of retribution.";
   say "\nStarting Skill Points: 6";
   say "\nPrimary Attribute: Strength";
   say "\nSkill Set: Melee Combat, Ranged Combat, Athletics, Survival, Influence, Stealth";
   say "\nChoice of Free Perk: Ambidextrous, Network of Contacts, Danger Sense, Fast Healer, Lightning Reflexes, Lucky";
   say "\nUnique Feat: Vengeful Fury: Avenging Angels can tap into their deep reservoirs of anger to overwhelm their foes, granting them a +3 bonus to all combat-related rolls for 3 combat rounds (can be used once per combat).";
   say "\nStarting Gear: Reinforced coat, custom handgun, tracker device, amulet/heirloom, night vision goggles, personal diary.";
}

sub roll_03 {
   say "\nConspiracy Theorist";
   say "===================";
   say "Conspiracy Theorists seek the hidden truths behind the façades of everyday normalcy. They aim to expose the secret workings of powers that manipulate the world from behind the scenes.";
   say "\nStarting Skill Points: 5";
   say "\nPrimary Attribute: Charisma";
   say "\nSkill Set: Investigation, Technical, Knowledge, Urban Savvy, Linguistic Proficiency, Stealth";
   say "\nChoice of Free Perk: Network of Contacts, Photographic Memory, Untraceable, Grease Monkey, Lucky, Scavenger";
   say "\nUnique Feat: Pattern Recognition: Conspiracy Theorists have a keen eye for connections others miss, gaining a +3 bonus to Investigation rolls when linking seemingly unrelated events.";
   say "\nStarting Gear: Encrypted laptop, conspiracy books, bug detector, disguise kit, secure phone, mask.";
}

sub roll_04 {
   say "\nCop";
   say "===";
   say "Dedicated to upholding the law, Cops navigate the thin blue line with a keen sense of justice and a firm hand. Facing dangers both mundane and supernatural, they are often first on the scene.";
   say "\nStarting Skill Points: 6";
   say "\nPrimary Attribute: Wits";
   say "\nSkill Set: Investigation, Ranged Combat, Urban Savvy, Influence, Vehicle Combat, Hand-to-Hand Combat";
   say "\nChoice of Free Perk: Network of Contacts, Danger Sense, Photographic Memory, Fast Healer, Gunslinger, Stunt Driver";
   say "\nUnique Feat: Crime Scene Skills: Cops gain a +1 bonus to all Investigation rolls.";
   say "\nStarting Gear: Police badge, handcuffs, body camera, tactical flashlight, pepper spray, handgun.";
}

sub roll_05 {
   say "\nCult Leader";
   say "===========";
   say "With a magnetic personality and a doctrine of seductive lies, Cult Leaders enthral followers, weaving a web of control and devotion.";
   say "\nStarting Skill Points: 5";
   say "\nPrimary Attribute: Charisma";
   say "\nSkill Set: Influence, Performance, Occult, Knowledge, Linguistic Proficiency, Stealth";
   say "\nChoice of Free Perk: Iron Will, Lucky, Polyglot, Sexually Alluring, Retainers, Wealthy";
   say "\nUnique Feat: Mesmeric Influence: Cult Leaders exert a powerful influence over others, gaining a +2 bonus on Influence rolls, ensuring their followers' loyalty.";
   say "\nStarting Gear: Robes, sacred texts, incense, ornate pendant, list of contacts, handgun, safe house key.";
}

sub roll_06 {
   say "\nCybermancer";
   say "===========";
   say "In the digital age, Cybermancers weave their magic through circuits and silicon. They are the techno-shamans whose sanctuaries are laden with servers and screens, casting spells that manipulate the fabric of the virtual world to their will.";
   say "\nStarting Skill Points: 4";
   say "\nPrimary Attribute: Intelligence";
   say "\nSkill Set: Technical, Investigation, Knowledge, Linguistic Proficiency, Urban Savvy, Stealth";
   say "\nChoice of Free Perk: Allies, Company Support, Photographic Memory, Shadow, Untraceable, Wealthy";
   say "\nUnique Feat: Digital Dominion: Cybermancers possess unparalleled prowess in digital manipulation, receiving a +1 bonus to all hacking rolls.";
   say "\nStarting Gear: Laptop, VR headset, signal scrambler, custom software, digital forensics kit, encrypted external hard drive.";
}

sub roll_07 {
   say "\nDaredevil";
   say "=========";
   say "Thrill-seekers and adrenaline junkies, Daredevils push the limits of physical prowess and fearlessness, performing death-defying feats that others would find unthinkable. Their lives are a series of calculated risks and spectacular trials.";
   say "\nStarting Skill Points: 6";
   say "\nPrimary Attribute: Agility";
   say "\nSkill Set: Athletics, Vehicle Combat, Pilot/Drive, Survival, Technical, Ranged Combat";
   say "\nChoice of Free Perk: Natural Athlete, Feline Agility, Danger Sense, Fast Healer, Fearless, Lucky";
   say "\nUnique Feat: Stunt Master: Daredevils gain a +3 bonus to all rolls related to performing stunts.";
   say "\nStarting Gear: Motorcycle helmet, parachute, action camera, grappling hook, crash pads, emergency first aid kit.";
}

sub roll_08 {
   say "\nDream Magician";
   say "==============";
   say "Navigators of the dreamscape, Dream Magicians traverse the surreal realms of sleep and visions. They mould the ethereal substance of dreams with practised ease, their powers unhindered by the mundane laws of physics.";
   say "\nStarting Skill Points: 4";
   say "\nPrimary Attribute: Intelligence";
   say "\nSkill Set: Occult, Performance, Stealth, Linguistic Proficiency, Survival, Knowledge";
   say "\nChoice of Free Perk: Heightened Sense, Danger Sense, Photographic Memory, Iron Will, Lucky, Sexually Alluring";
   say "\nUnique Feat: Oneiromancy: Dream Magicians can slip into a dream state at will, manipulating the dreamworld to gain insights or influence the waking world.";
   say "\nStarting Gear: Dream journal, protective talisman, incense, drugs, occult library";
}

sub roll_09 {
   say "\nExplorer";
   say "========";
   say "Explorers venture into the unknown, charting unexplored territories and braving the wild elements. From dense jungles to Arctic wastelands, they embody the spirit of adventure and discovery.";
   say "\nStarting Skill Points: 6";
   say "\nPrimary Attribute: Intelligence";
   say "\nSkill Set: Survival, Investigation, Athletics, Technical, Pilot, Linguistic Proficiency";
   say "\nChoice of Free Perk: Natural Athlete, Danger Sense, Fast Healer, Fearless, Immunity, Wealthy";
   say "\nUnique Feat: Pathfinder: With a knack for navigation and survival, Explorers gain a +2 bonus to all Survival rolls, mastering the challenges of the most forbidding environments.";
   say "\nStarting Gear: All-terrain boots, traveling clothes, navigation compass, survival tent, solar charger, topographical maps, long-range radio";
}

sub roll_10 {
   say "\nFemme Fatale";
   say "============";
   say "Masters of manipulation and seduction, Femme Fatales weave a dangerous web of allure and deceit. Their beauty and charm are weapons sharper than knives.";
   say "\nStarting Skill Points: 5";
   say "\nPrimary Attribute: Charisma";
   say "\nSkill Set: Influence, Stealth, Performance, Investigation, Linguistic Proficiency, Urban Savvy";
   say "\nChoice of Free Perk: Ambidextrous, Natural Athlete, Fast Healer, Enhanced Pain Tolerance, Sexually Alluring";
   say "\nUnique Feat: Siren's Call: Femme Fatales expertly use their seductive prowess to manipulate outcomes, receiving a +2 bonus on rolls related to Influence (persuasion, dissuasion, or seduction), ensuring they always have the upper hand.";
   say "\nStarting Gear: Concealed weapon, disguise wardrobe, seductive perfume, escape tools, sex toys";
}

sub roll_11 {
   say "\nGambler";
   say "=======";
   say "Living by luck and skill, Gamblers thrive in the high-stakes world of chance and probability.";
   say "\nStarting Skill Points: 5";
   say "\nPrimary Attribute: Wits";
   say "\nSkill Set: Influence, Investigation, Stealth, Technical, Urban Savvy, Linguistic Proficiency";
   say "\nChoice of Free Perk: Heightened Sense, Danger Sense, Photographic Memory, Guileful, Lucky, Wealthy";
   say "\nUnique Feat: Master of the Game: Gamblers possess an uncanny ability to turn the odds in their favor, gaining a +2 bonus on all gambling and bluff-related rolls.";
   say "\nStarting Gear: Trick cards, loaded dice, gambling ledger, concealed holster, flashy clothing";
}

sub roll_12 {
   say "\nHacker";
   say "======";
   say "Hackers are digital wizards, manipulating code and cracking systems with their unparalleled technical skills. They exploit the vulnerabilities of the digital world for personal gain, activism, or just curiosity.";
   say "\nStarting Skill Points: 5";
   say "\nPrimary Attribute: Intelligence";
   say "\nSkill Set: Technical, Investigation, Stealth, Urban Savvy, Knowledge, Linguistic Proficiency";
   say "\nChoice of Free Perk: Photographic Memory, Untraceable, Tech Savant, Grease Monkey, Network of Contacts, Lucky";
   say "\nUnique Feat: Digital Phantom: Hackers gain a +2 bonus to all rolls related to hacking and bypassing digital security systems, making them exceptionally proficient in infiltrating even the most secure networks.";
   say "\nStarting Gear: Custom-built laptop, encrypted USB drives, digital scrambler, codebooks";
}

sub roll_13 {
   say "\nHired Killer";
   say "============";
   say "Hired Killers ply their lethal trade for those who pay, motivated by wealth, power, or darker desires.";
   say "\nStarting Skill Points: 6";
   say "\nPrimary Attribute: Agility";
   say "\nSkill Set: Stealth, Ranged Combat, Melee Combat, Investigation, Survival, Technical";
   say "\nChoice of Free Perk: Ambidextrous, Danger Sense, Gunslinger, Shadow, Lightning Reflexes, Night Vision";
   say "\nUnique Feat: Silent Dispatch: Masters at making their deadly work untraceable, Hired Killers gain a +1 bonus to all attacks with ranged weapons and a +2 bonus when attempting to conceal their weaponry.";
   say "\nStarting Gear: Silenced pistol, sniper rifle, disguise kit, escape gadgets, forged IDs, poison kit";
}

sub roll_14 {
   say "\nHustler";
   say "=======";
   say "Street-smart and savvy, Hustlers know how to get what they want, whether through charm, deceit, or plain cunning.";
   say "\nStarting Skill Points: 6";
   say "\nPrimary Attribute: Wits";
   say "\nSkill Set: Influence, Urban Savvy, Stealth, Investigation, Technical, Performance";
   say "\nChoice of Free Perk: Allies, Network of Contacts, Danger Sense, Fame, Immunity, Iron Will";
   say "\nUnique Feat: Streetwise Savant: Hustlers navigate the urban jungle with unmatched skill, gaining a +2 bonus to all Urban Savvy rolls and an uncanny knack for acquiring scarce or illicit items.";
   say "\nStarting Gear: Fake IDs, con artist's toolkit, burner phone, sleight-of-hand gadgets, stash of counterfeit money, handgun";
}

sub roll_15 {
   say "\nMartial Artist";
   say "==============";
   say "Martial Artists dedicate their lives to mastering the art of combat. Through disciplined training in various fighting styles, they transform their bodies into perfect weapons.";
   say "\nStarting Skill Points: 6";
   say "\nPrimary Attribute: Strength";
   say "\nSkill Set: Hand-to-Hand Combat, Stealth, Athletics, Survival, Influence, Medicine";
   say "\nChoice of Free Perk: Ambidextrous, Natural Athlete, Feline Agility, Danger Sense, Enhanced Pain Tolerance, Lightning Reflexes";
   say "\nUnique Feat: Master of the Dojo: Martial Artists enhance their combat efficacy with a +2 bonus to all unarmed combat rolls, combining speed, strength, and technique to overpower foes.";
   say "\nStarting Gear: Martial arts clothes, bamboo staff, meditation mat, body conditioning oils, sparring gloves, sword/dagger";
}

sub roll_16 {
   say "\nMedic/Doctor";
   say "============";
   say "They are dedicated to healing and saving lives, whether on the battlefield or in a hospital.";
   say "\nStarting Skill Points: 6";
   say "\nPrimary Attribute: Intelligence";
   say "\nSkill Set: Medicine, Knowledge, Technical, Survival, Influence, Investigation";
   say "\nChoice of Free Perk: Fast Healer, Healing Hands, Immunity, Iron Will, Photographic Memory, Wealthy";
   say "\nUnique Feat: Lifesaver: Medics/Doctors gain a +2 bonus to all Medicine rolls, and they can perform emergency medical procedures with a +1 bonus, potentially saving lives under critical conditions.";
   say "\nStarting Gear: Medical kit, surgical tools, field manual, first aid supplies, protective gear, portable defibrillator";
}

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

sub roll_42 {
   say "\nCriminal Lawyer";
   say "===============";
   say "Defending or prosecuting individuals in high-stakes cases, their keen understanding of law and their persuasive abilities make them formidable opponents in courtrooms and negotiations alike.";
   say "\nStarting Skill Points: 5";
   say "\nPrimary Attribute: Charisma";
   say "\nSkill Set: Influence, Knowledge, Investigation, Urban Savvy, Performance, Linguistic Proficiency";
   say "\nChoice of Free Perk: Eloquent, Iron Will, Network of Contacts, Wealthy, Photographic Memory, Lucky";
   say "\nUnique Feat: Legal Mastermind: Criminal Lawyers receive a +2 bonus to all Law rolls, allowing them to expertly navigate legal challenges and uncover loopholes.";
   say "\nStarting Gear: Legal briefs, law books, recorder, business cards, court-approved firearm, luxury watch, suits.";
}

sub roll_43 {
   say "\nDemon Hunter";
   say "============";
   say "Demon Hunters have devoted their lives to tracking down and destroying evil supernatural entities such as demons, vampires, werewolves, and dark mages.";
   say "\nStarting Skill Points: 6";
   say "\nPrimary Attribute: Intelligence";
   say "\nSkill Set: Occult, Ranged Combat, Melee Combat, Survival, Investigation, Knowledge";
   say "\nChoice of Free Perk: Allies, Network of Contacts, Danger Sense, Fast Healer, Immunity, Lightning Reflexes";
   say "\nUnique Feat: Occult Lore: Gain a +2 bonus to relevant rolls about the supernatural.";
   say "\nStarting Gear: Consecrated weaponry (e.g., blessed sword or silver bullets), holy water, exorcism kit, ancient texts on demonology, protective amulet, survival gear.";
}


