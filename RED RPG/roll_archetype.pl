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

my $d45 = int(rand 45) + 1;
# my $d45 = 44;
if ($d45 == 1) {
   roll_01();
} elsif ($d45 == 2) {
   roll_02();
} elsif ($d45 == 3) {
   roll_03();
} elsif ($d45 == 4) {
   roll_04();
} elsif ($d45 == 5) {
   roll_05();
} elsif ($d45 == 6) {
   roll_06();
} elsif ($d45 == 7) {
   roll_07();
} elsif ($d45 == 8) {
   roll_08();
} elsif ($d45 == 9) {
   roll_09();
} elsif ($d45 == 10) {
   roll_10();
} elsif ($d45 == 11) {
   roll_11();
} elsif ($d45 == 12) {
   roll_12();
} elsif ($d45 == 13) {
   roll_13();
} elsif ($d45 == 14) {
   roll_14();
} elsif ($d45 == 15) {
   roll_15();
} elsif ($d45 == 16) {
   roll_16();
} elsif ($d45 == 17) {
   roll_17();
} elsif ($d45 == 18) {
   roll_18();
} elsif ($d45 == 19) {
   roll_19();
} elsif ($d45 == 20) {
   roll_20();
} elsif ($d45 == 21) {
   roll_21();
} elsif ($d45 == 22) {
   roll_22();
} elsif ($d45 == 23) {
   roll_23();
} elsif ($d45 == 24) {
   roll_24();
} elsif ($d45 == 25) {
   roll_25();
} elsif ($d45 == 26) {
   roll_26();
} elsif ($d45 == 27) {
   roll_27();
} elsif ($d45 == 28) {
   roll_28();
} elsif ($d45 == 29) {
   roll_29();
} elsif ($d45 == 30) {
   roll_30();
} elsif ($d45 == 31) {
   roll_31();
} elsif ($d45 == 32) {
   roll_32();
} elsif ($d45 == 33) {
   roll_33();
} elsif ($d45 == 34) {
   roll_34();
} elsif ($d45 == 35) {
   roll_35();
} elsif ($d45 == 36) {
   roll_36();
} elsif ($d45 == 37) {
   roll_37();
} elsif ($d45 == 38) {
   roll_38();
} elsif ($d45 == 39) {
   roll_39();
} elsif ($d45 == 40) {
   roll_40();
} elsif ($d45 == 41) {
   roll_41();
} elsif ($d45 == 42) {
   roll_42();
} elsif ($d45 == 43) {
   roll_43();
} elsif ($d45 == 44) {
   roll_44();
} else {
   roll_45();
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

sub roll_17 {
   say "\nMercenary";
   say "=========";
   say "Mercenaries are the pragmatists of the battlefield, skilled in warfare but loyal only to the highest bidder. Their expertise is for sale, and their allegiance is as fluid as the ever-changing dynamics of conflict.";
   say "\nStarting Skill Points: 6";
   say "\nPrimary Attribute: Strength";
   say "\nSkill Set: Ranged Combat, Melee Combat, Survival, Technical, Vehicle Combat, Pilot";
   say "\nChoice of Free Perk: Heightened Sense, Commanding Aura, Danger Sense, Fast Healer, Gunslinger, Iron Will";
   say "\nUnique Feat: Mercenary Tactics: With a deep understanding of guerrilla warfare and combat strategy, Mercenaries gain a +1 bonus to Ranged Combat and Vehicle Combat rolls.";
   say "\nStarting Gear: Tactical vest, assault rifle, night vision goggles, combat knife, satellite phone, field rations";
}

sub roll_18 {
   say "\nMobster";
   say "=======";
   say "From the back alleys to the mansions of power, Mobsters wield influence and fear.";
   say "\nStarting Skill Points: 5";
   say "\nPrimary Attribute: Wits";
   say "\nSkill Set: Influence, Investigation, Stealth, Melee Combat, Urban Savvy, Hand-to-Hand Combat";
   say "\nChoice of Free Perk: Allies, Network of Contacts, Iron Will, Membership, Retainers, Wealthy";
   say "\nUnique Feat: Made Man: Mobsters have a network of obligations and favours that they can call upon, granting them a +3 bonus on related rolls 2d4 times per session, ensuring their command within the criminal hierarchy is unchallenged.";
   say "\nStarting Gear: Revolver, brass knuckles, business cards of ‘associates', hidden safe, luxury car, tailor-made suit";
}

sub roll_19 {
   say "\nNecromancer";
   say "===========";
   say "Necromancers commune with the spirits of the departed, wield the energies of the netherworld and perform ghastly rituals to bend the dead to their will.";
   say "\nStarting Skill Points: 5";
   say "\nPrimary Attribute: Intelligence";
   say "\nSkill Set: Occult, Knowledge, Medicine, Linguistic Proficiency, Investigation, Survival";
   say "\nChoice of Free Perk: Heightened Sense, Commanding Aura, Network of Contacts, Danger Sense, Immunity, Night Vision";
   say "\nUnique Feat: Talk to the Dead: Necromancers can converse with the dead without rituals, extracting truths and lies alike, with a spectre guiding their actions. They can call upon the spirit 1d4 times per session.";
   say "\nStarting Gear: Ritual dagger, ancient tomes, bone charms, dark cloak, preservation salts, handgun";
}

sub roll_20 {
   say "\nOccultist";
   say "=========";
   say "Occultists delve into the dark spheres of magic and mysticism. With books as their bastions, they navigate the arcane with an insatiable curiosity for the unknown.";
   say "\nStarting Skill Points: 6";
   say "\nPrimary Attribute: Wits";
   say "\nSkill Set: Occult, Investigation, Knowledge, Linguistic Proficiency, Technical, Performance";
   say "\nChoice of Free Perk: Allies, Membership, Polyglot, Retainers, Wealthy, Sexually Alluring";
   say "\nUnique Feat: Keeper of Secrets: Occultists wield their vast knowledge with precision, gaining a +2 bonus on Occult rolls, and their extensive network grants them an additional Perk, Network of Contacts.";
   say "\nStarting Gear: Occult library, ceremonial robes, divination tools, esoteric amulets, candle set";
}

sub roll_21 {
   say "\nPagan Conjurer";
   say "==============";
   say "Pagan Conjurers call upon the elemental spirits and the raw forces of nature. They perform their sacred rites in the wild, where the land's power is strongest.";
   say "\nStarting Skill Points: 5";
   say "\nPrimary Attribute: Intelligence";
   say "\nSkill Set: Occult, Survival, Medicine, Knowledge, Linguistic Proficiency, Animal Handling";
   say "\nChoice of Free Perk: Heightened Sense, Natural Athlete, Danger Sense, Immunity, Iron Will, Lucky";
   say "\nUnique Feat: Spirit of the Wild: Pagan Conjurers can invoke natural spirits to aid them, manifesting environmental phenomena to obscure, shelter, or entangle (three times per session).";
   say "\nStarting Gear: Ritualistic herbs, nature-themed robes, elemental talismans, ceremonial staff";
}

sub roll_22 {
   say "\nParanormal Investigator";
   say "=======================";
   say "They delve into the paranormal seeking to uncover and understand the unexplainable phenomena that haunt our world. Equipped with both scientific and occult knowledge, they are on the front lines of confronting the unknown.";
   say "\nStarting Skill Points: 6";
   say "\nPrimary Attribute: Intelligence";
   say "\nSkill Set: Investigation, Occult, Knowledge, Technical, Survival, Influence";
   say "\nChoice of Free Perk: Danger Sense, Fast Healer, Immunity, Photographic Memory, Network of Contacts, Lucky";
   say "\nUnique Feat: Attuned Senses: Paranormal Investigators gain a +2 bonus to Investigation and Occult rolls related to paranormal or supernatural phenomena.";
   say "\nStarting Gear: EMF detector, spirit box, protective amulets, occult tomes, digital recorder, flashlight";
}

sub roll_23 {
   say "\nPerformer";
   say "=========";
   say "Performers are the chameleons of the social world, adept at adopting personas and captivating audiences, whether they are actors, singers, musicians, or models.";
   say "\nStarting Skill Points: 5";
   say "\nPrimary Attribute: Charisma";
   say "\nSkill Set: Performance, Stealth, Influence, Art, Linguistic Proficiency, Investigation";
   say "\nChoice of Free Perk: Heightened Sense, Network of Contacts, Fame, Iron Will, Sexually Alluring, Wealthy";
   say "\nUnique Feat: Chameleon: Performers excel in adopting new identities and captivating their audience, gaining a +2 bonus to all Performance rolls.";
   say "\nStarting Gear: Costumes, make-up kit, script collection, prop box, microphone, musical instruments, model portfolio, little black book";
}

sub roll_24 {
   say "\nPilot";
   say "=====";
   say "Whether at the helm of a jet fighter or a commercial airliner, Pilots master the skies with unrivalled skill and precision. Their lives are lines drawn across the heavens, charting courses that others only dream of.";
   say "\nStarting Skill Points: 5";
   say "\nPrimary Attribute: Agility";
   say "\nSkill Set: Technical, Survival, Vehicle Combat, Stealth, Investigation, Pilot/Drive";
   say "\nChoice of Free Perk: Ambidextrous, Danger Sense, Daredevil, Feline Agility, Lightning Reflexes, Lucky";
   say "\nUnique Feat: Ace Pilot: Pilots navigate the most challenging conditions with ease, receiving a +2 bonus on all Pilot rolls, demonstrating their elite training and nerves of steel.";
   say "\nStarting Gear: Aviator sunglasses, leather flight jacket, aeronautical maps, pilot logbook, parachute, toolkit";
}

sub roll_25 {
   say "\nPolitician";
   say "==========";
   say "Whether champions of the people or power-hungry opportunists, they play the game of thrones with cunning and guile.";
   say "\nStarting Skill Points: 5";
   say "\nPrimary Attribute: Charisma";
   say "\nSkill Set: Influence, Performance, Knowledge, Urban Savvy, Linguistic Proficiency, Stealth";
   say "\nChoice of Free Perk: Fame, Guileful, Lucky, Polyglot, Retainers, Wealthy";
   say "\nUnique Feat: Political Maneuvering: Politicians are adept at playing the political game, receiving a +2 bonus on Influence rolls, effectively swaying public and political opinion.";
   say "\nStarting Gear: Tailored suits, laptop, campaign buttons, confidential dossiers, encrypted smartphone, luxury watch";
}

sub roll_26 {
   say "\nPriest";
   say "======";
   say "Spiritual leaders and moral guides providing solace to their congregations. Whether delivering impassioned sermons or performing sacred rites, they are pillars of their communities.";
   say "\nStarting Skill Points: 5";
   say "\nPrimary Attribute: Charisma";
   say "\nSkill Set: Influence, Performance, Knowledge, Occult, Medicine, Linguistic Proficiency";
   say "\nChoice of Free Perk: Allies, Photographic Memory, Fame, Enhanced Pain Tolerance, Lucky, Polyglot";
   say "\nUnique Feat: Divine Ecstasy: In moments of spiritual fervor, Priests can invoke divine ecstasy, granting them a +3 bonus to all rolls for 1d6+2 rounds, inspiring awe and fear in equal measure (it can be used three times per game session).";
   say "\nStarting Gear: Holy book, clerical robes, religious symbols, community outreach materials, sermon notes";
}

sub roll_27 {
   say "\nPrivate Eye";
   say "===========";
   say "Operating at the margin of the law, Private Eyes are the seekers of hidden truths in a world that thrives on secrecy. They tackle the cases too dirty or too dangerous for others.";
   say "\nStarting Skill Points: 6";
   say "\nPrimary Attribute: Wits";
   say "\nSkill Set: Investigation, Stealth, Urban Savvy, Influence, Technical, Hand-to-Hand Combat";
   say "\nChoice of Free Perk: Allies, Fast Healer, Gunslinger, Enhanced Pain Tolerance, Immunity, Lucky";
   say "\nUnique Feat: Investigator's Intuition: Private Eyes have a knack for sensing when things aren't quite right; they receive a +2 bonus to all Investigation rolls.";
   say "\nStarting Gear: Binoculars, concealed recorder, case files, handgun, mini camera, toolkit";
}

sub roll_28 {
   say "\nProfessor";
   say "=========";
   say "Professors are dedicated to education and research and possess a deep knowledge of their particular field, contributing to the world's understanding of complex subjects.";
   say "\nStarting Skill Points: 6";
   say "\nPrimary Attribute: Intelligence";
   say "\nSkill Set: Knowledge, Linguistic Proficiency, Investigation, Influence, Technical";
   say "\nChoice of Free Perk: Network of Contacts, Photographic Memory, Iron Will, Membership, Polyglot, Wealthy";
   say "\nUnique Feat: Scholarly Authority: Professors apply their extensive academic knowledge to gain a +2 bonus on all Knowledge rolls.";
   say "\nStarting Gear: Academic literature, lecture notes, research grants paperwork, laboratory equipment, laptop, expensive fountain pen";
}

sub roll_29 {
   say "\nPsychic";
   say "=======";
   say "Harnessing the latent powers of the mind, Psychics explore the deeper realms of consciousness to manipulate reality. Whether foreseeing the future or moving objects with a thought, their abilities are both mysterious and profound.";
   say "\nStarting Skill Points: 6";
   say "\nPrimary Attribute: Intelligence";
   say "\nSkill Set: Influence, Psychics/Psionics, Stealth, Investigation, Linguistic Proficiency, Survival";
   say "\nChoice of Free Perk: Allies, Danger Sense, Iron Will, Fame, Lucky, Sexually Alluring";
   say "\nUnique Feat: Mental Mastery: Psychics enhance their mental faculties to extraordinary levels, gaining a +2 bonus on Influence rolls, bending others' wills with ease.";
   say "\nStarting Gear: Crystal ball, tarot cards, aura-reading glasses, psychic shield amulet, spirit channelling board";
}

sub roll_30 {
   say "\nReporter";
   say "========";
   say "Chasing leads and deadlines, Reporters are the heralds of truth in an age of misinformation.";
   say "\nStarting Skill Points: 6";
   say "\nPrimary Attribute: Wits";
   say "\nSkill Set: Investigation, Influence, Pilot, Performance, Urban Savvy, Knowledge";
   say "\nChoice of Free Perk: Network of Contacts, Immunity, Lucky, Membership, Polyglot, Stunt Driver";
   say "\nUnique Feat: Scoop: With an unerring nose for news, Reporters gain a +2 bonus to all Investigation rolls, always managing to be at the right place at the right time.";
   say "\nStarting Gear: Press badge, voice recorder, camera, notepad and pens, contact list of informants, press jacket";
}

sub roll_31 {
   say "\nSerial Killer";
   say "=============";
   say "Hunting their next victim with cold delight they blend into the crowd, their true nature hidden behind a veneer of normalcy.";
   say "\nStarting Skill Points: 6";
   say "\nPrimary Attribute: Agility";
   say "\nSkill Set: Stealth, Investigation, Hand-to-Hand Combat, Performance, Survival, Medicine";
   say "\nChoice of Free Perk: Ambidextrous, Danger Sense, Photographic Memory, Enhanced Pain Tolerance, Shadow, Night Vision";
   say "\nUnique Feat: Predator's Instinct: With an uncanny ability to sense vulnerability, Serial Killers gain a tactical advantage, enhancing their stealth and surprise attacks with a +3 bonus.";
   say "\nStarting Gear: Custom knife set, clean-up kit, trophies from victims, fake documents, lockpick kit, dark clothing";
}

sub roll_32 {
   say "\nSex Magician";
   say "============";
   say "Wielders of the arcane power of eros, Sex Magicians use the potent energies of desire and pleasure to fuel their magical rites.";
   say "\nStarting Skill Points: 4";
   say "\nPrimary Attribute: Intelligence";
   say "\nSkill Set: Performance, Influence, Occult, Stealth, Linguistic Proficiency, Knowledge";
   say "\nChoice of Free Perk: Natural Athlete, Feline Agility, Fame, Iron Will, Sexually Alluring";
   say "\nUnique Feat: Enchanting Aura: With an allure almost magical, Sex Magicians gain a +2 bonus on all rolls related to Influence (seduction and charm), their charisma as potent as a spell.";
   say "\nStarting Gear: Consecrated candles, silk robes, book of erotic spells, expensive clothing, luxurious bed sheets";
}

sub roll_33 {
   say "\nShaman";
   say "======";
   say "Bridging the physical and spirit worlds, Shamans enter trance states to interact with spirits to heal, divine, and guide.";
   say "\nStarting Skill Points: 4";
   say "\nPrimary Attribute: Intelligence";
   say "\nSkill Set: Occult, Survival, Medicine, Linguistic Proficiency, Animal Handling, Knowledge";
   say "\nChoice of Free Perk: Heightened Sense, Danger Sense, Photographic Memory, Polyglot, Lucky, Sexually Alluring";
   say "\nUnique Feat: Spirit Guardian: Shamans can call upon their spirit guides to protect and guide them, granting a mystical insight that provides a +2 bonus in critical moments of spiritual or physical conflict (they can call upon the spirits three times per session).";
   say "\nStarting Gear: Shamanic drum, ritual feathers, spirit masks, herbal medicine pouch, ancestral totems, ritual scrolls";
}

sub roll_34 {
   say "\nSmuggler";
   say "========";
   say "Whether it's running contraband across borders or negotiating shady deals, smugglers thrive where risk meets reward.";
   say "\nStarting Skill Points: 5";
   say "\nPrimary Attribute: Wits";
   say "\nSkill Set: Stealth, Urban Savvy, Investigation, Vehicle Combat, Technical, Influence";
   say "\nChoice of Free Perk: Allies, Network of Contacts, Danger Sense, Fame, Immunity, Iron Will";
   say "\nUnique Feat: Contraband Specialist: Smugglers excel in the acquisition and distribution of forbidden goods, gaining a +2 bonus to all Urban Savvy rolls and ensuring access to one illegal item per game session.";
   say "\nStarting Gear: Hidden compartments bag, forged documents, stealthy attire, contraband list, fast getaway vehicle, bribe cash";
}

sub roll_35 {
   say "\nSoldier";
   say "=======";
   say "Soldiers are battle-hardened warriors trained to handle weapons and tactics with expert proficiency.";
   say "\nStarting Skill Points: 6";
   say "\nPrimary Attribute: Strength";
   say "\nSkill Set: Ranged Combat, Melee Combat, Survival, Technical, Vehicle Combat, Hand-to-Hand Combat";
   say "\nChoice of Free Perk: Allies, Natural Athlete, Danger Sense, Enhanced Pain Tolerance, Lucky, Night Vision";
   say "\nUnique Feat: Tactical Expert: Soldiers execute combat maneuvers with lethal precision, gaining a third action in each combat round.";
   say "\nStarting Gear: Combat boots, camouflage uniform, service rifle, tactical radio, combat helmet, MREs";
}

sub roll_36 {
   say "\nSpy";
   say "===";
   say "Spies are the unseen movers; masters of disguise and deception, they gather secrets that sway wars and shift the balance of power from the shadows.";
   say "\nStarting Skill Points: 6";
   say "\nPrimary Attribute: Wits";
   say "\nSkill Set: Stealth, Influence, Linguistic Proficiency, Investigation, Ranged Combat, Technical";
   say "\nChoice of Free Perk: Allies, Network of Contacts, Danger Sense, Polyglot, Shadow, Wealthy";
   say "\nUnique Feat: Master of Espionage: Skilled in the arts of subterfuge, Spies gain a +1 bonus to Stealth and Influence rolls, excelling in undercover operations and intelligence gathering.";
   say "\nStarting Gear: Forged passports, discreet camera, poison pen, encrypted data storage device, disguise collection, handgun";
}

sub roll_37 {
   say "\nTerrorist";
   say "=========";
   say "Driven by ideology or desperation, Terrorists are agents of chaos, challenging the status quo through fear and violence.";
   say "\nStarting Skill Points: 5";
   say "\nPrimary Attribute: Wits";
   say "\nSkill Set: Technical, Survival, Stealth, Urban Savvy, Ranged Combat, Investigation";
   say "\nChoice of Free Perk: Network of Contacts, Danger Sense, Fame, Enhanced Pain Tolerance, Iron Will, Membership";
   say "\nUnique Feat: Demolitions Expert: Terrorists excel in the use of explosives, gaining a +3 bonus on all rolls related to planting or defusing bombs, and they suffer 1/2 damage from explosions.";
   say "\nStarting Gear: Explosive devices, disguise kit, propaganda materials, safe house key, encrypted communication devices, survival gear";
}

sub roll_38 {
   say "\nThief";
   say "=====";
   say "Thieves are masters of stealth and subterfuge, excelling in the art of taking what isn't theirs without being noticed. They operate in the shadows, navigating the criminal underworld with ease and precision.";
   say "\nStarting Skill Points: 5";
   say "\nPrimary Attribute: Agility";
   say "\nSkill Set: Stealth, Investigation, Urban Savvy, Technical, Performance, Hand-to-Hand Combat";
   say "\nChoice of Free Perk: Ambidextrous, Danger Sense, Guileful, Lucky, Night Vision, Scavenger";
   say "\nUnique Feat: Silent Intrusion: Thieves gain a +2 bonus to all Stealth rolls, and they can bypass locks and security systems with a +1 bonus.";
   say "\nStarting Gear: Lockpicks, grappling hook, dark clothing, thief's tools, fake IDs, hidden blades";
}

sub roll_39 {
   say "\nTraditional Conjurer";
   say "====================";
   say "They practice rites that are unchanged since their conception in the old world. Their magic draws from various mystical traditions.";
   say "\nStarting Skill Points: 4";
   say "\nPrimary Attribute: Intelligence";
   say "\nSkill Set: Occult, Linguistic Proficiency, Knowledge, Investigation, Performance, Art";
   say "\nChoice of Free Perk: Allies, Membership, Polyglot, Retainers, Wealthy, Sexually Alluring";
   say "\nUnique Feat: Arcane Heritage: Traditional Conjurers have a profound connection to their magical lineage, granting them a +3 bonus on all Occult rolls.";
   say "\nStarting Gear: Grimoire, ritual candles, alchemical set, warding charms, ceremonial dagger";
}

sub roll_40 {
   say "\nUrbanomancer";
   say "============";
   say "Masters of the metropolitan mystique, Urbanomancers draw their power from the city's heartbeat. From the labyrinthine underground to the dizzying skyscrapers, they manipulate the urban energies, turning the cityscape into both weapon and shield.";
   say "\nStarting Skill Points: 4";
   say "\nPrimary Attribute: Intelligence";
   say "\nSkill Set: Urban Savvy, Stealth, Technical, Knowledge, Influence, Investigation";
   say "\nChoice of Free Perk: Untraceable, Grease Monkey, Shadow, Scavenger, Stunt Driver, Tech Savant";
   say "\nUnique Feat: Concrete Communion: Urbanomancers can channel the chaotic energy of the city, gaining a +2 bonus to all Urban Savvy rolls within city limits.";
   say "\nStarting Gear: Graffiti spray cans, city maps, digital recorder, urban camouflage attire, subway pass, rooftop access keys";
}

sub roll_41 {
   say "\nWar Veteran";
   say "===========";
   say "War Veterans carry the scars of battle, both seen and unseen. They've survived conflicts that broke others, hardened by experiences that forge the strongest steel in the fire of warfare.";
   say "\nStarting Skill Points: 6";
   say "\nPrimary Attribute: Strength";
   say "\nSkill Set: Ranged Combat, Melee Combat, Survival, Technical, Vehicle Combat, Athletics";
   say "\nChoice of Free Perk: Allies, Danger Sense, Gunslinger, Enhanced Pain Tolerance, Lucky, Night Vision";
   say "\nUnique Feat: Combat Savvy: War Veterans use their extensive combat experience to gain a third action in each combat round.";
   say "\nStarting Gear: Service medals, old uniform, personal firearm, military gear, war journal, survival gear";
}

# ******************************************************************************************
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

sub roll_44 {
   say "\nScientist";
   say "=========";
   say "The intellectual pioneers of the modern age, dedicated to unravelling the mysteries of the universe.";
   say "\nStarting Skill Points: 6";
   say "\nPrimary Attribute: Intelligence";
   say "\nSkill Set: Knowledge, Technical, Investigation, Medicine, Occult, Linguistic Proficiency";
   say "\nChoice of Free Perk: Photographic Memory, Tech Savant, Healing Hands, Fast Healer, Wealthy, Mystic Insight";
   say "\nUnique Feat: Scientific Method: Scientists apply a methodical approach to their work, gaining a +2 bonus to all Knowledge and Investigation rolls when conducting research or experiments, ensuring accuracy and precision in their findings.";
   say "\nStarting Gear: Lab coat, scientific journal, portable lab kit, digital microscope, advanced calculator";
}

sub roll_45 {
   say "\nUrban Explorer";
   say "==============";
   say "Urban Explorers delve into the forgotten corners of cities, uncovering secrets and hidden places.";
   say "\nStarting Skill Points: 5";
   say "\nPrimary Attribute: Agility";
   say "\nSkill Set: Urban Savvy, Stealth, Athletics, Investigation, Survival, Technical";
   say "\nChoice of Free Perk: Urban Explorer, Scavenger, Heightened Sense, Lucky, Danger Sense, Fearless";
   say "\nUnique Feat: City Knowledge: Urban Explorers receive a +2 bonus to all Urban Savvy rolls, allowing them to efficiently navigate and uncover secrets within the cityscape.";
   say "\nStarting Gear: Flashlight, multi-tool, climbing gear, city maps, urban camouflage attire, backpack";
}










