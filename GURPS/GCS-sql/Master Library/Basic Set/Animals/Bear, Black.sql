insert into GCS (FolderId, Filename, Stuffs) values (
16,
'Bear, Black',
'{
	"type": "character",
	"version": 2,
	"id": "d16acca5-7dd5-4222-899d-b690a4b14fee",
	"settings": {
		"default_length_units": "ft_in",
		"default_weight_units": "lb",
		"user_description_display": "tooltip",
		"modifiers_display": "inline",
		"notes_display": "inline",
		"skill_level_adj_display": "tooltip",
		"use_multiplicative_modifiers": false,
		"use_modifying_dice_plus_adds": false,
		"damage_progression": "basic_set",
		"use_simple_metric_conversions": true,
		"show_college_in_sheet_spells": false,
		"show_difficulty": false,
		"show_advantage_modifier_adj": false,
		"show_equipment_modifier_adj": false,
		"show_spell_adj": true,
		"use_title_in_footer": false,
		"page": {
			"paper_size": "na-letter",
			"top_margin": "0.25 in",
			"left_margin": "0.25 in",
			"bottom_margin": "0.25 in",
			"right_margin": "0.25 in",
			"orientation": "portrait"
		},
		"block_layout": [
			"reactions conditional_modifiers",
			"melee",
			"ranged",
			"advantages skills",
			"spells",
			"equipment",
			"other_equipment",
			"notes"
		],
		"attributes": [
			{
				"id": "st",
				"type": "integer",
				"name": "ST",
				"full_name": "Strength",
				"attribute_base": "10",
				"cost_per_point": 10,
				"cost_adj_percent_per_sm": 10
			},
			{
				"id": "dx",
				"type": "integer",
				"name": "DX",
				"full_name": "Dexterity",
				"attribute_base": "10",
				"cost_per_point": 20,
				"cost_adj_percent_per_sm": 0
			},
			{
				"id": "iq",
				"type": "integer",
				"name": "IQ",
				"full_name": "Intelligence",
				"attribute_base": "10",
				"cost_per_point": 20,
				"cost_adj_percent_per_sm": 0
			},
			{
				"id": "ht",
				"type": "integer",
				"name": "HT",
				"full_name": "Health",
				"attribute_base": "10",
				"cost_per_point": 10,
				"cost_adj_percent_per_sm": 0
			},
			{
				"id": "will",
				"type": "integer",
				"name": "Will",
				"full_name": "",
				"attribute_base": "$iq",
				"cost_per_point": 5,
				"cost_adj_percent_per_sm": 0
			},
			{
				"id": "fright_check",
				"type": "integer",
				"name": "Fright Check",
				"full_name": "",
				"attribute_base": "$will",
				"cost_per_point": 2,
				"cost_adj_percent_per_sm": 0
			},
			{
				"id": "per",
				"type": "integer",
				"name": "Per",
				"full_name": "Perception",
				"attribute_base": "$iq",
				"cost_per_point": 5,
				"cost_adj_percent_per_sm": 0
			},
			{
				"id": "vision",
				"type": "integer",
				"name": "Vision",
				"full_name": "",
				"attribute_base": "$per",
				"cost_per_point": 2,
				"cost_adj_percent_per_sm": 0
			},
			{
				"id": "hearing",
				"type": "integer",
				"name": "Hearing",
				"full_name": "",
				"attribute_base": "$per",
				"cost_per_point": 2,
				"cost_adj_percent_per_sm": 0
			},
			{
				"id": "taste_smell",
				"type": "integer",
				"name": "Taste & Smell",
				"full_name": "",
				"attribute_base": "$per",
				"cost_per_point": 2,
				"cost_adj_percent_per_sm": 0
			},
			{
				"id": "touch",
				"type": "integer",
				"name": "Touch",
				"full_name": "",
				"attribute_base": "$per",
				"cost_per_point": 2,
				"cost_adj_percent_per_sm": 0
			},
			{
				"id": "basic_speed",
				"type": "decimal",
				"name": "Basic Speed",
				"full_name": "",
				"attribute_base": "($dx+$ht)/4",
				"cost_per_point": 20,
				"cost_adj_percent_per_sm": 0
			},
			{
				"id": "basic_move",
				"type": "integer",
				"name": "Basic Move",
				"full_name": "",
				"attribute_base": "floor($basic_speed)",
				"cost_per_point": 5,
				"cost_adj_percent_per_sm": 0
			},
			{
				"id": "fp",
				"type": "pool",
				"name": "FP",
				"full_name": "Fatigue Points",
				"attribute_base": "$ht",
				"cost_per_point": 3,
				"cost_adj_percent_per_sm": 0,
				"thresholds": [
					{
						"state": "Unconscious",
						"explanation": "",
						"multiplier": -1,
						"divisor": 1,
						"addition": 0,
						"ops": [
							"halve_move",
							"halve_dodge",
							"halve_st"
						]
					},
					{
						"state": "Collapse",
						"explanation": "<html><body>\\n<b>Roll vs. Will<\\/b> to do anything besides talk or rest; failure causes unconsciousness<br>\\nEach FP you lose below 0 also causes 1 HP of injury<br>\\nMove, Dodge and ST are halved (B426)\\n<\\/body><\\/html>",
						"multiplier": 0,
						"divisor": 1,
						"addition": 0,
						"ops": [
							"halve_move",
							"halve_dodge",
							"halve_st"
						]
					},
					{
						"state": "Tired",
						"explanation": "Move, Dodge and ST are halved (B426)",
						"multiplier": 1,
						"divisor": 3,
						"addition": 0,
						"ops": [
							"halve_move",
							"halve_dodge",
							"halve_st"
						]
					},
					{
						"state": "Tiring",
						"explanation": "",
						"multiplier": 1,
						"divisor": 1,
						"addition": -1,
						"ops": [

						]
					},
					{
						"state": "Rested",
						"explanation": "",
						"multiplier": 1,
						"divisor": 1,
						"addition": 0,
						"ops": [

						]
					}
				]
			},
			{
				"id": "hp",
				"type": "pool",
				"name": "HP",
				"full_name": "Hit Points",
				"attribute_base": "$st",
				"cost_per_point": 2,
				"cost_adj_percent_per_sm": 10,
				"thresholds": [
					{
						"state": "Dead",
						"explanation": "",
						"multiplier": -5,
						"divisor": 1,
						"addition": 0,
						"ops": [
							"halve_move",
							"halve_dodge"
						]
					},
					{
						"state": "Dying #4",
						"explanation": "<html><body>\\n<b>Roll vs. HT<\\/b> to avoid death<br>\\n<b>Roll vs. HT-4<\\/b> every second to avoid falling unconscious<br>\\nMove and Dodge are halved (B419)\\n<\\/body><\\/html>",
						"multiplier": -4,
						"divisor": 1,
						"addition": 0,
						"ops": [
							"halve_move",
							"halve_dodge"
						]
					},
					{
						"state": "Dying #3",
						"explanation": "<html><body>\\n<b>Roll vs. HT<\\/b> to avoid death<br>\\n<b>Roll vs. HT-3<\\/b> every second to avoid falling unconscious<br>\\nMove and Dodge are halved (B419)\\n<\\/body><\\/html>",
						"multiplier": -3,
						"divisor": 1,
						"addition": 0,
						"ops": [
							"halve_move",
							"halve_dodge"
						]
					},
					{
						"state": "Dying #2",
						"explanation": "<html><body>\\n<b>Roll vs. HT<\\/b> to avoid death<br>\\n<b>Roll vs. HT-2<\\/b> every second to avoid falling unconscious<br>\\nMove and Dodge are halved (B419)\\n<\\/body><\\/html>",
						"multiplier": -2,
						"divisor": 1,
						"addition": 0,
						"ops": [
							"halve_move",
							"halve_dodge"
						]
					},
					{
						"state": "Dying #1",
						"explanation": "<html><body>\\n<b>Roll vs. HT<\\/b> to avoid death<br>\\n<b>Roll vs. HT-1<\\/b> every second to avoid falling unconscious<br>\\nMove and Dodge are halved (B419)\\n<\\/body><\\/html>",
						"multiplier": -1,
						"divisor": 1,
						"addition": 0,
						"ops": [
							"halve_move",
							"halve_dodge"
						]
					},
					{
						"state": "Collapse",
						"explanation": "<html><body>\\n<b>Roll vs. HT<\\/b> every second to avoid falling unconscious<br>\\nMove and Dodge are halved (B419)\\n<\\/body><\\/html>",
						"multiplier": 0,
						"divisor": 1,
						"addition": 0,
						"ops": [
							"halve_move",
							"halve_dodge"
						]
					},
					{
						"state": "Reeling",
						"explanation": "Move and Dodge are halved (B419)",
						"multiplier": 1,
						"divisor": 3,
						"addition": 0,
						"ops": [
							"halve_move",
							"halve_dodge"
						]
					},
					{
						"state": "Wounded",
						"explanation": "",
						"multiplier": 1,
						"divisor": 1,
						"addition": -1,
						"ops": [

						]
					},
					{
						"state": "Healthy",
						"explanation": "",
						"multiplier": 1,
						"divisor": 1,
						"addition": 0,
						"ops": [

						]
					}
				]
			}
		],
		"hit_locations": {
			"id": "quadruped",
			"name": "Quadruped",
			"roll": "3d",
			"locations": [
				{
					"id": "eye",
					"choice_name": "Eyes",
					"table_name": "Eyes",
					"slots": 0,
					"hit_penalty": -9,
					"dr_bonus": 0,
					"description": "An attack that misses by 1 hits the torso instead. Only impaling (imp), piercing (pi-, pi, pi+, pi++), and tight-beam burning (burn) attacks can target the eye – and only from the front or sides. Injury over HP÷10 blinds the eye. Otherwise, treat as skull, but without the extra DR!",
					"calc": {
						"roll_range": "-",
						"dr": {
							"all": 0
						}
					}
				},
				{
					"id": "skull",
					"choice_name": "Skull",
					"table_name": "Skull",
					"slots": 2,
					"hit_penalty": -7,
					"dr_bonus": 2,
					"description": "An attack that misses by 1 hits the torso instead. Wounding modifier is x4. Knockdown rolls are at -10. Critical hits use the Critical Head Blow Table (B556). Exception: These special effects do not apply to toxic (tox) damage.",
					"calc": {
						"roll_range": "3-4",
						"dr": {
							"all": 4
						}
					}
				},
				{
					"id": "face",
					"choice_name": "Face",
					"table_name": "Face",
					"slots": 1,
					"hit_penalty": -5,
					"dr_bonus": 0,
					"description": "An attack that misses by 1 hits the torso instead. Jaw, cheeks, nose, ears, etc. If the target has an open-faced helmet, ignore its DR. Knockdown rolls are at -5. Critical hits use the Critical Head Blow Table (B556). Corrosion (cor) damage gets a x1½ wounding modifier, and if it inflicts a major wound, it also blinds one eye (both eyes on damage over full HP). Random attacks from behind hit the skull instead.",
					"calc": {
						"roll_range": "5",
						"dr": {
							"all": 2
						}
					}
				},
				{
					"id": "neck",
					"choice_name": "Neck",
					"table_name": "Neck",
					"slots": 1,
					"hit_penalty": -5,
					"dr_bonus": 0,
					"description": "An attack that misses by 1 hits the torso instead. Neck and throat. Increase the wounding multiplier of crushing (cr) and corrosion (cor) attacks to x1½, and that of cutting (cut) damage to x2. At the GM’s option, anyone killed by a cutting (cut) blow to the neck is decapitated!",
					"calc": {
						"roll_range": "6",
						"dr": {
							"all": 2
						}
					}
				},
				{
					"id": "leg",
					"choice_name": "Leg",
					"table_name": "Foreleg",
					"slots": 2,
					"hit_penalty": -2,
					"dr_bonus": 0,
					"description": "Reduce the wounding multiplier of large piercing (pi+), huge piercing (pi++), and impaling (imp) damage to x1. Any major wound (loss of over ½ HP from one blow) cripples the limb. Damage beyond that threshold is lost.",
					"calc": {
						"roll_range": "7-8",
						"dr": {
							"all": 2
						}
					}
				},
				{
					"id": "torso",
					"choice_name": "Torso",
					"table_name": "Torso",
					"slots": 3,
					"hit_penalty": 0,
					"dr_bonus": 0,
					"description": "",
					"calc": {
						"roll_range": "9-11",
						"dr": {
							"all": 2
						}
					}
				},
				{
					"id": "groin",
					"choice_name": "Groin",
					"table_name": "Groin",
					"slots": 1,
					"hit_penalty": -3,
					"dr_bonus": 0,
					"description": "An attack that misses by 1 hits the torso instead. Human males and the males of similar species suffer double shock from crushing (cr) damage, and get -5 to knockdown rolls. Otherwise, treat as a torso hit.",
					"calc": {
						"roll_range": "12",
						"dr": {
							"all": 2
						}
					}
				},
				{
					"id": "leg",
					"choice_name": "Leg",
					"table_name": "Hindleg",
					"slots": 2,
					"hit_penalty": -2,
					"dr_bonus": 0,
					"description": "Reduce the wounding multiplier of large piercing (pi+), huge piercing (pi++), and impaling (imp) damage to x1. Any major wound (loss of over ½ HP from one blow) cripples the limb. Damage beyond that threshold is lost.",
					"calc": {
						"roll_range": "13-14",
						"dr": {
							"all": 2
						}
					}
				},
				{
					"id": "foot",
					"choice_name": "Foot",
					"table_name": "Foot",
					"slots": 2,
					"hit_penalty": -4,
					"dr_bonus": 0,
					"description": "Reduce the wounding multiplier of large piercing (pi+), huge piercing (pi++), and impaling (imp) damage to x1. Any major wound (loss of over ⅓ HP from one blow) cripples the extremity. Damage beyond that threshold is lost.",
					"calc": {
						"roll_range": "15-16",
						"dr": {
							"all": 2
						}
					}
				},
				{
					"id": "tail",
					"choice_name": "Tail",
					"table_name": "Tail",
					"slots": 2,
					"hit_penalty": -3,
					"dr_bonus": 0,
					"description": "If a tail counts as an Extra Arm or a Striker, or is a fish tail, treat it as a limb (arm, leg) for crippling purposes; otherwise, treat it as an extremity (hand, foot). A crippled tail affects balance. For a ground creature, this gives -1 DX. For a swimmer or flyer, this gives -2 DX and halves Move. If the creature has no tail, or a very short one (like a rabbit), treat as torso.",
					"calc": {
						"roll_range": "17-18",
						"dr": {
							"all": 2
						}
					}
				},
				{
					"id": "vitals",
					"choice_name": "Vitals",
					"table_name": "Vitals",
					"slots": 0,
					"hit_penalty": -3,
					"dr_bonus": 0,
					"description": "An attack that misses by 1 hits the torso instead. Heart, lungs, kidneys, etc. Increase the wounding modifier for an impaling (imp) or any piercing (pi-, pi, pi+, pi++) attack to x3. Increase the wounding modifier for a tight-beam burning (burn) attack to x2. Other attacks cannot target the vitals.",
					"calc": {
						"roll_range": "-",
						"dr": {
							"all": 2
						}
					}
				}
			]
		}
	},
	"created_date": "May 16, 2020, 12:00 AM",
	"modified_date": "Jun 20, 2020, 1:33 PM",
	"profile": {
		"name": "Black Bear",
		"weight": "300 lb"
	},
	"attributes": [
		{
			"attr_id": "st",
			"adj": 4,
			"calc": {
				"value": 14,
				"points": 24
			}
		},
		{
			"attr_id": "dx",
			"adj": 1,
			"calc": {
				"value": 11,
				"points": 12
			}
		},
		{
			"attr_id": "iq",
			"adj": -6,
			"calc": {
				"value": 4,
				"points": -120
			}
		},
		{
			"attr_id": "ht",
			"adj": 3,
			"calc": {
				"value": 13,
				"points": 30
			}
		},
		{
			"attr_id": "will",
			"adj": 8,
			"calc": {
				"value": 12,
				"points": 40
			}
		},
		{
			"attr_id": "fright_check",
			"adj": 0,
			"calc": {
				"value": 12,
				"points": 0
			}
		},
		{
			"attr_id": "per",
			"adj": 6,
			"calc": {
				"value": 10,
				"points": 30
			}
		},
		{
			"attr_id": "vision",
			"adj": 0,
			"calc": {
				"value": 10,
				"points": 0
			}
		},
		{
			"attr_id": "hearing",
			"adj": 0,
			"calc": {
				"value": 10,
				"points": 0
			}
		},
		{
			"attr_id": "taste_smell",
			"adj": 0,
			"calc": {
				"value": 10,
				"points": 0
			}
		},
		{
			"attr_id": "touch",
			"adj": 0,
			"calc": {
				"value": 10,
				"points": 0
			}
		},
		{
			"attr_id": "basic_speed",
			"adj": 0,
			"calc": {
				"value": 6,
				"points": 0
			}
		},
		{
			"attr_id": "basic_move",
			"adj": 1,
			"calc": {
				"value": 7,
				"points": 5
			}
		},
		{
			"attr_id": "fp",
			"adj": 0,
			"damage": 0,
			"calc": {
				"value": 13,
				"current": 13,
				"points": 0
			}
		},
		{
			"attr_id": "hp",
			"adj": 0,
			"damage": 0,
			"calc": {
				"value": 14,
				"current": 14,
				"points": 0
			}
		}
	],
	"total_points": -28,
	"advantages": [
		{
			"type": "advantage",
			"id": "bfdda893-bf58-4855-af9b-554e638c1254",
			"name": "Claws, Blunt",
			"physical": true,
			"base_points": 3,
			"weapons": [
				{
					"type": "melee_weapon",
					"damage": {
						"type": "cr",
						"st": "thr",
						"base": "-1",
						"modifier_per_die": 1
					},
					"usage": "Punch",
					"reach": "C",
					"parry": "0",
					"block": "No",
					"calc": {
						"level": 13,
						"parry": "9",
						"block": "No",
						"damage": "1d+1 cr"
					},
					"defaults": [
						{
							"type": "dx"
						},
						{
							"type": "skill",
							"name": "Brawling"
						},
						{
							"type": "skill",
							"name": "Boxing"
						},
						{
							"type": "skill",
							"name": "Karate"
						}
					]
				},
				{
					"type": "melee_weapon",
					"damage": {
						"type": "cr",
						"st": "thr",
						"modifier_per_die": 1
					},
					"usage": "Kick",
					"reach": "C,1",
					"parry": "No",
					"block": "No",
					"calc": {
						"level": 11,
						"parry": "No",
						"block": "No",
						"damage": "1d+2 cr"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Brawling",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Karate",
							"modifier": -2
						}
					]
				}
			],
			"reference": "B42",
			"calc": {
				"points": 3
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "535ad23c-a88e-484c-a25b-d93261899a62",
			"name": "Damage Resistance",
			"physical": true,
			"exotic": true,
			"levels": "2",
			"points_per_level": 5,
			"modifiers": [
				{
					"type": "modifier",
					"id": "c401a816-8d57-4e7a-bd92-2d29f0f91db0",
					"disabled": true,
					"name": "Force Field",
					"reference": "B47",
					"cost_type": "percentage",
					"cost": 20,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "5e5762e4-98fe-41a8-8485-6452f7569557",
					"disabled": true,
					"name": "Hardened",
					"reference": "B47",
					"cost_type": "percentage",
					"cost": 20,
					"affects": "total",
					"levels": 1
				},
				{
					"type": "modifier",
					"id": "c821e90e-a270-43ea-9a5f-faba74bc2df2",
					"disabled": true,
					"name": "Absorption",
					"reference": "B46",
					"cost_type": "percentage",
					"cost": 80,
					"affects": "total",
					"notes": "Enhances @Trait@"
				},
				{
					"type": "modifier",
					"id": "ed933790-da5d-489e-aab3-1b723d06c4ce",
					"disabled": true,
					"name": "Absorption",
					"reference": "B46",
					"cost_type": "percentage",
					"cost": 80,
					"affects": "total",
					"notes": "Healing only"
				},
				{
					"type": "modifier",
					"id": "78d72d2b-e59e-479d-901c-9b2b497b3fdd",
					"disabled": true,
					"name": "Absorption",
					"reference": "B46",
					"cost_type": "percentage",
					"cost": 100,
					"affects": "total",
					"notes": "Enhances any trait"
				},
				{
					"type": "modifier",
					"id": "74ca959a-c60d-4773-bf9c-420088c3307c",
					"disabled": true,
					"name": "Reflection",
					"reference": "B47",
					"cost_type": "percentage",
					"cost": 100,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "1b636721-1eb1-4c47-9c9f-865cb5c92b05",
					"disabled": true,
					"name": "Bane",
					"reference": "H14",
					"cost_type": "points",
					"cost": -1,
					"affects": "total",
					"notes": "@Rare@"
				},
				{
					"type": "modifier",
					"id": "3a9d1177-71ec-47e7-a4ac-8f0521f9b9bb",
					"disabled": true,
					"name": "Bane",
					"reference": "H14",
					"cost_type": "percentage",
					"cost": -5,
					"affects": "total",
					"notes": "@Occasional@"
				},
				{
					"type": "modifier",
					"id": "561d6e50-7f28-448e-853b-5472118b2c2b",
					"disabled": true,
					"name": "Bane",
					"reference": "H14",
					"cost_type": "percentage",
					"cost": -10,
					"affects": "total",
					"notes": "@Common@"
				},
				{
					"type": "modifier",
					"id": "822f42b4-056e-4b84-9562-c8181c0c46bd",
					"disabled": true,
					"name": "Bane",
					"reference": "H14",
					"cost_type": "percentage",
					"cost": -15,
					"affects": "total",
					"notes": "@Very Common@"
				},
				{
					"type": "modifier",
					"id": "983d0f59-3415-4a31-83db-c4f976f48a1d",
					"disabled": true,
					"name": "Directional",
					"reference": "B47",
					"cost_type": "percentage",
					"cost": -20,
					"affects": "total",
					"notes": "Front"
				},
				{
					"type": "modifier",
					"id": "2622fa5a-c62f-4eca-90d6-14c43cd6c816",
					"disabled": true,
					"name": "Flexible",
					"reference": "B47",
					"cost_type": "percentage",
					"cost": -20,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "6954af73-5ea6-4256-b522-b97f5261321b",
					"disabled": true,
					"name": "Limited",
					"reference": "B46",
					"cost_type": "percentage",
					"cost": -20,
					"affects": "total",
					"notes": "@Very Common Attack Form@"
				},
				{
					"type": "modifier",
					"id": "c6c2a710-0cab-4a8b-ad48-f520852cb595",
					"disabled": true,
					"name": "Semi-Ablative",
					"reference": "B47",
					"cost_type": "percentage",
					"cost": -20,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "844f95df-8f6c-4ce5-ae53-c03f855f8950",
					"disabled": true,
					"name": "Can\'t wear armor",
					"reference": "B47",
					"cost_type": "percentage",
					"cost": -40,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "90e8c7d4-b28d-42b0-adcc-8f54192605df",
					"disabled": true,
					"name": "Directional",
					"reference": "B47",
					"cost_type": "percentage",
					"cost": -40,
					"affects": "total",
					"notes": "@Direction: Back, Right, Left, Top or Underside@"
				},
				{
					"type": "modifier",
					"id": "712c4e43-319a-433a-93e7-21ab66066967",
					"disabled": true,
					"name": "Limited",
					"reference": "B46",
					"cost_type": "percentage",
					"cost": -40,
					"affects": "total",
					"notes": "@Common Attack Form@"
				},
				{
					"type": "modifier",
					"id": "8edf69d9-5da5-4e40-b32e-4ccca17d5273",
					"name": "Tough Skin",
					"cost_type": "percentage",
					"cost": -40,
					"affects": "total",
					"notes": "Effects that just require skin contact or a scratch ignore this DR"
				},
				{
					"type": "modifier",
					"id": "da4915a7-8bad-46f8-b03f-5f87f027973a",
					"disabled": true,
					"name": "Limited",
					"reference": "B46",
					"cost_type": "percentage",
					"cost": -60,
					"affects": "total",
					"notes": "@Occasional Attack Form@"
				},
				{
					"type": "modifier",
					"id": "0ec43c81-286e-46f2-9347-4a0494f19d9d",
					"disabled": true,
					"name": "Ablative",
					"reference": "B47",
					"cost_type": "percentage",
					"cost": -80,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "ceadf96c-8e87-4156-84b3-94e63b54a539",
					"disabled": true,
					"name": "Limited",
					"reference": "B46",
					"cost_type": "percentage",
					"cost": -80,
					"affects": "total",
					"notes": "@Rare Attack Form@"
				},
				{
					"type": "modifier",
					"id": "daf625f5-c8b9-4400-b0c8-a8877544197c",
					"disabled": true,
					"name": "Laminate",
					"reference": "RSWL18",
					"cost_type": "percentage",
					"cost": 10,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "84b9bc76-3374-4da5-a60b-547673316cc6",
					"disabled": true,
					"name": "Malediction-Proof",
					"reference": "PSI14",
					"cost_type": "percentage",
					"cost": 50,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "f8dca817-2ef8-4551-81d4-373c92c86458",
					"disabled": true,
					"name": "Maledictions Only",
					"reference": "PSI14",
					"cost_type": "percentage",
					"cost": 0,
					"affects": "total"
				}
			],
			"reference": "B47",
			"calc": {
				"points": 6
			},
			"features": [
				{
					"type": "dr_bonus",
					"amount": 1,
					"per_level": true,
					"location": "skull"
				},
				{
					"type": "dr_bonus",
					"amount": 1,
					"per_level": true,
					"location": "face"
				},
				{
					"type": "dr_bonus",
					"amount": 1,
					"per_level": true,
					"location": "neck"
				},
				{
					"type": "dr_bonus",
					"amount": 1,
					"per_level": true,
					"location": "torso"
				},
				{
					"type": "dr_bonus",
					"amount": 1,
					"per_level": true,
					"location": "vitals"
				},
				{
					"type": "dr_bonus",
					"amount": 1,
					"per_level": true,
					"location": "groin"
				},
				{
					"type": "dr_bonus",
					"amount": 1,
					"per_level": true,
					"location": "arm"
				},
				{
					"type": "dr_bonus",
					"amount": 1,
					"per_level": true,
					"location": "hand"
				},
				{
					"type": "dr_bonus",
					"amount": 1,
					"per_level": true,
					"location": "leg"
				},
				{
					"type": "dr_bonus",
					"amount": 1,
					"per_level": true,
					"location": "foot"
				},
				{
					"type": "dr_bonus",
					"amount": 1,
					"per_level": true,
					"location": "tail"
				},
				{
					"type": "dr_bonus",
					"amount": 1,
					"per_level": true,
					"location": "wing"
				},
				{
					"type": "dr_bonus",
					"amount": 1,
					"per_level": true,
					"location": "fin"
				},
				{
					"type": "dr_bonus",
					"amount": 1,
					"per_level": true,
					"location": "brain"
				}
			],
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage_container",
			"id": "0428411c-ad9f-46a6-aaa5-7f7b6ca9a35f",
			"name": "Meta-Trait: Wild Animal",
			"reference": "B263",
			"calc": {
				"points": -30
			},
			"open": true,
			"children": [
				{
					"type": "advantage",
					"id": "38bd2207-d39e-480e-b8ac-18259b9bdbac",
					"name": "Bestial",
					"mental": true,
					"exotic": true,
					"base_points": -10,
					"reference": "B124",
					"calc": {
						"points": -10
					},
					"categories": [
						"Disadvantage"
					]
				},
				{
					"type": "advantage",
					"id": "81ea0e0d-ada6-4e6e-9dbb-24b0b372edfe",
					"name": "Cannot Speak",
					"physical": true,
					"base_points": -15,
					"reference": "B125",
					"calc": {
						"points": -15
					},
					"prereqs": {
						"type": "prereq_list",
						"all": true,
						"prereqs": [
							{
								"type": "advantage_prereq",
								"has": false,
								"name": {
									"compare": "is",
									"qualifier": "stuttering"
								}
							}
						]
					},
					"categories": [
						"Disadvantage"
					]
				},
				{
					"type": "advantage",
					"id": "2b647e07-73c0-404e-a268-3fa96aaecb05",
					"name": "Hidebound",
					"mental": true,
					"base_points": -5,
					"reference": "B138",
					"calc": {
						"points": -5
					},
					"notes": "-2 penalty on any task that requires creativity or invention, including most rolls against Artist skill, all Engineer rolls for new inventions, and all skill rolls made to use the Gadgeteer advantage.",
					"categories": [
						"Disadvantage"
					]
				},
				{
					"type": "advantage",
					"id": "1d958fd0-9d4b-40a1-90cf-bd2eb4184f3b",
					"name": "Taboo Trait (Fixed IQ)",
					"physical": true,
					"reference": "B263",
					"calc": {
						"points": 0
					}
				}
			]
		},
		{
			"type": "advantage",
			"id": "935484dc-7e59-4fb3-a63a-c566a75d3bab",
			"name": "No Fine Manipulators",
			"physical": true,
			"base_points": -30,
			"reference": "B145",
			"calc": {
				"points": -30
			},
			"features": [
				{
					"type": "cost_reduction",
					"attribute": "st",
					"percentage": 40
				},
				{
					"type": "cost_reduction",
					"attribute": "dx",
					"percentage": 40
				}
			],
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "67c92d1f-27a7-4a86-8e2c-903daf6730af",
			"name": "Semi-Upright",
			"physical": true,
			"exotic": true,
			"base_points": -5,
			"reference": "B153",
			"calc": {
				"points": -5
			},
			"notes": "Moving while upright reduces Move by 40%",
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "21aa641a-f90d-4097-ad44-eab68d14d7c8",
			"name": "Teeth, Sharp",
			"physical": true,
			"exotic": true,
			"base_points": 1,
			"weapons": [
				{
					"type": "melee_weapon",
					"damage": {
						"type": "cut",
						"st": "thr",
						"base": "-1"
					},
					"usage": "Bite",
					"reach": "C",
					"parry": "No",
					"block": "No",
					"calc": {
						"level": 13,
						"parry": "No",
						"block": "No",
						"damage": "1d cut"
					},
					"defaults": [
						{
							"type": "skill",
							"name": "Brawling"
						},
						{
							"type": "dx"
						}
					]
				}
			],
			"reference": "B91",
			"calc": {
				"points": 1
			},
			"categories": [
				"Perk"
			]
		},
		{
			"type": "advantage",
			"id": "99dc924e-b66f-4b60-9712-ff0e47a1b86e",
			"name": "Temperature Tolerance",
			"physical": true,
			"levels": "2",
			"points_per_level": 1,
			"reference": "B93",
			"calc": {
				"points": 2
			},
			"categories": [
				"Advantage"
			]
		}
	],
	"skills": [
		{
			"type": "skill",
			"id": "56a6ccba-e022-4ab2-bb0f-91cff080862d",
			"name": "Brawling",
			"reference": "B182",
			"difficulty": "dx/e",
			"points": 4,
			"calc": {
				"level": 13,
				"rsl": "DX+2"
			},
			"features": [
				{
					"type": "weapon_bonus",
					"amount": 1,
					"per_level": true,
					"selection_type": "weapons_with_required_skill",
					"name": {
						"compare": "is",
						"qualifier": "Brawling"
					},
					"level": {
						"compare": "at_least",
						"qualifier": 2
					}
				}
			],
			"categories": [
				"Combat/Weapon",
				"Melee Combat"
			]
		}
	],
	"notes": [
		{
			"type": "note",
			"id": "2185f81f-7c99-473a-bae2-a2a1fd06e8b7",
			"text": "A small, omnivorous bear.\\n\\nWhen making reaction rolls for bears, remember that any mother bear with cubs will be aggressive: -3 to reactions!\\n\\nA bear walking or running on four legs is a two-hex creature. When it stands on its hind legs to fight, it is a one-hex creature.",
			"reference": "BX456"
		}
	],
	"calc": {
		"swing": "2d",
		"thrust": "1d",
		"basic_lift": "39 lb",
		"lifting_st_bonus": 0,
		"striking_st_bonus": 0,
		"throwing_st_bonus": 0,
		"move": [
			7,
			5,
			4,
			2,
			1
		],
		"dodge": [
			9,
			8,
			7,
			6,
			5
		],
		"dodge_bonus": 0,
		"block_bonus": 0,
		"parry_bonus": 0
	}
}');


