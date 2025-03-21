insert into GCS (FolderId, Filename, Stuffs) values (
15,
'Equipment',
'{
	"type": "equipment_list",
	"version": 2,
	"id": "af0a8002-3e47-47e2-b735-2df689bb5fd0",
	"rows": [
		{
			"type": "equipment",
			"id": "a5863dd4-b9f3-41a0-bd99-fae58e552c67",
			"quantity": 1,
			"description": "Antibiotic",
			"tech_level": "6",
			"value": "20",
			"weight": "0 lb",
			"reference": "B289",
			"calc": {
				"extended_value": "20",
				"extended_weight": "0 lb"
			},
			"notes": "Prevents or cures (in 1d days) infections.",
			"categories": [
				"Medical Gear"
			]
		},
		{
			"type": "equipment",
			"id": "4f2a9783-adb2-4c52-abdd-fa5d112b8a9b",
			"quantity": 1,
			"description": "Antitoxin Kit",
			"tech_level": "6",
			"value": "25",
			"weight": "0.5 lb",
			"reference": "B289",
			"calc": {
				"extended_value": "25",
				"extended_weight": "0.5 lb"
			},
			"notes": "Antidote for specific poison. 10 uses",
			"categories": [
				"Medical Gear"
			]
		},
		{
			"type": "equipment",
			"id": "fb9ec557-a0aa-4734-b80f-4e52557e0024",
			"quantity": 1,
			"description": "Arrow",
			"tech_level": "0",
			"value": "2",
			"weight": "0.1 lb",
			"reference": "B276",
			"calc": {
				"extended_value": "2",
				"extended_weight": "0.1 lb"
			},
			"categories": [
				"AmmoType:Arrow",
				"Ammunition",
				"Missile Weapon"
			]
		},
		{
			"type": "equipment",
			"id": "f529b8a4-e042-4817-9775-942a4e36ed04",
			"quantity": 1,
			"description": "Arrow, Bodkin",
			"tech_level": "3",
			"value": "2",
			"weight": "0.1 lb",
			"reference": "B277",
			"calc": {
				"extended_value": "2",
				"extended_weight": "0.1 lb"
			},
			"notes": "Changes damage to piercing with armor divisor of (2).",
			"categories": [
				"AmmoType:Arrow",
				"Ammunition",
				"Missile Weapon"
			]
		},
		{
			"type": "equipment",
			"id": "515ff8e3-1599-4470-a469-9b8fca4ef0b8",
			"quantity": 1,
			"description": "Assault Boots",
			"tech_level": "9",
			"value": "150",
			"weight": "3 lb",
			"reference": "B284",
			"calc": {
				"extended_value": "150",
				"extended_weight": "3 lb"
			},
			"features": [
				{
					"type": "dr_bonus",
					"amount": 6,
					"location": "foot"
				},
				{
					"type": "weapon_bonus",
					"amount": 1,
					"selection_type": "weapons_with_name",
					"specialization": {
						"compare": "is",
						"qualifier": "Kick"
					}
				}
			],
			"categories": [
				"Footwear"
			]
		},
		{
			"type": "equipment",
			"id": "b055f6c2-6d49-437a-b4ce-d669eeccf59d",
			"quantity": 1,
			"description": "Assault Boots",
			"tech_level": "10",
			"value": "150",
			"weight": "3 lb",
			"reference": "B284",
			"calc": {
				"extended_value": "150",
				"extended_weight": "3 lb"
			},
			"features": [
				{
					"type": "dr_bonus",
					"amount": 9,
					"location": "foot"
				},
				{
					"type": "weapon_bonus",
					"amount": 1,
					"selection_type": "weapons_with_name",
					"specialization": {
						"compare": "is",
						"qualifier": "Kick"
					}
				}
			],
			"categories": [
				"Footwear"
			]
		},
		{
			"type": "equipment",
			"id": "5f56ab5a-6a00-4fbf-a209-f1eb14e5948f",
			"quantity": 1,
			"description": "Assault Boots",
			"tech_level": "11",
			"value": "150",
			"weight": "3 lb",
			"reference": "B284",
			"calc": {
				"extended_value": "150",
				"extended_weight": "3 lb"
			},
			"features": [
				{
					"type": "dr_bonus",
					"amount": 12,
					"location": "foot"
				},
				{
					"type": "weapon_bonus",
					"amount": 1,
					"selection_type": "weapons_with_name",
					"specialization": {
						"compare": "is",
						"qualifier": "Kick"
					}
				}
			],
			"categories": [
				"Footwear"
			]
		},
		{
			"type": "equipment",
			"id": "555babbf-ed84-4d5e-bba7-9987d096724d",
			"quantity": 1,
			"description": "Assault Carbine, 5.56mm",
			"tech_level": "8",
			"legality_class": "2",
			"value": "900",
			"weight": "7.3 lb",
			"reference": "B279",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "pi",
						"base": "4d+2"
					},
					"strength": "9†",
					"accuracy": "4",
					"range": "400/3000",
					"rate_of_fire": "15",
					"shots": "30+1(3)",
					"bulk": "-3",
					"recoil": "2",
					"calc": {
						"level": 0,
						"range": "400/3000",
						"damage": "4d+2 pi"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Pistol",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Rifle"
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Shotgun",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Light Machine Gun",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Submachine Gun",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Musket",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Grenade Launcher",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Gyroc",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Light Anti-Armor Weapon",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Gun!"
						}
					]
				}
			],
			"calc": {
				"extended_value": "900",
				"extended_weight": "7.3 lb"
			},
			"categories": [
				"Missile Weapon"
			]
		},
		{
			"type": "equipment",
			"id": "189212f5-9c37-4aa8-af44-b5a99c47848e",
			"quantity": 1,
			"description": "Assault Rifle, 5.56mm",
			"tech_level": "7",
			"legality_class": "2",
			"value": "800",
			"weight": "9 lb",
			"reference": "B279",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "pi",
						"base": "5d"
					},
					"strength": "9†",
					"accuracy": "5",
					"range": "500/3500",
					"rate_of_fire": "12",
					"shots": "30+1(3)",
					"bulk": "-4",
					"recoil": "2",
					"calc": {
						"level": 0,
						"range": "500/3500",
						"damage": "5d pi"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Pistol",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Rifle"
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Shotgun",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Light Machine Gun",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Submachine Gun",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Musket",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Grenade Launcher",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Gyroc",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Light Anti-Armor Weapon",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Gun!"
						}
					]
				}
			],
			"calc": {
				"extended_value": "800",
				"extended_weight": "9 lb"
			},
			"categories": [
				"Missile Weapon"
			]
		},
		{
			"type": "equipment",
			"id": "87fe11c6-0fbc-4ef4-a45f-6bb2568c9d73",
			"quantity": 1,
			"description": "Assault Rifle, 7.62mmS",
			"tech_level": "7",
			"legality_class": "2",
			"value": "300",
			"weight": "10.5 lb",
			"reference": "B279",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "pi",
						"base": "5d+1"
					},
					"strength": "10†",
					"accuracy": "4",
					"range": "400/3000",
					"rate_of_fire": "10",
					"shots": "30+1(3)",
					"bulk": "-4",
					"recoil": "2",
					"calc": {
						"level": 0,
						"range": "400/3000",
						"damage": "5d+1 pi"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Pistol",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Rifle"
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Shotgun",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Light Machine Gun",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Submachine Gun",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Musket",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Grenade Launcher",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Gyroc",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Light Anti-Armor Weapon",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Gun!"
						}
					]
				}
			],
			"calc": {
				"extended_value": "300",
				"extended_weight": "10.5 lb"
			},
			"categories": [
				"Missile Weapon"
			]
		},
		{
			"type": "equipment",
			"id": "2bdd2b4a-6270-455e-b271-879255fb136a",
			"quantity": 1,
			"description": "ATGM, 115mm",
			"tech_level": "7",
			"legality_class": "1",
			"value": "20000",
			"weight": "37 lb",
			"reference": "B281",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "cr ex",
						"base": "6dx10",
						"armor_divisor": 10
					},
					"strength": "11B†",
					"accuracy": "3",
					"range": "200/2000",
					"rate_of_fire": "1",
					"shots": "1(20)",
					"bulk": "-10",
					"recoil": "1",
					"calc": {
						"level": 0,
						"range": "200/2000",
						"damage": "6dx10(10) cr ex"
					},
					"defaults": [
						{
							"type": "iq",
							"modifier": -5
						},
						{
							"type": "skill",
							"name": "Artillery",
							"specialization": "Guided Missile"
						}
					]
				}
			],
			"calc": {
				"extended_value": "20000",
				"extended_weight": "37 lb"
			},
			"categories": [
				"Missile Weapon"
			]
		},
		{
			"type": "equipment",
			"id": "1015bc99-1a40-4e47-adda-c95bdfd6d726",
			"quantity": 1,
			"description": "Atlatl w/Dart",
			"tech_level": "0",
			"value": "20",
			"weight": "1 lb",
			"reference": "B276",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "imp",
						"st": "sw",
						"base": "-1"
					},
					"strength": "5",
					"accuracy": "1",
					"range": "x3/x4",
					"rate_of_fire": "1",
					"shots": "1(1)",
					"bulk": "-3",
					"calc": {
						"level": 0,
						"range": "x3/x4",
						"damage": "sw-1 imp"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -5
						},
						{
							"type": "skill",
							"name": "Spear Thrower"
						},
						{
							"type": "skill",
							"name": "Thrown Weapon (Spear)",
							"modifier": -4
						}
					]
				}
			],
			"calc": {
				"extended_value": "20",
				"extended_weight": "1 lb"
			},
			"categories": [
				"Missile Weapon",
				"UsesAmmoType:Dart"
			]
		},
		{
			"type": "equipment",
			"id": "0ee099aa-8a2b-4851-b8ab-a849bde81605",
			"quantity": 1,
			"description": "Atlatl w/Javelin",
			"tech_level": "0",
			"value": "30",
			"weight": "2 lb",
			"reference": "B276",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "imp",
						"st": "sw",
						"base": "1"
					},
					"strength": "6",
					"accuracy": "3",
					"range": "x2/x3",
					"rate_of_fire": "1",
					"shots": "1(1)",
					"bulk": "-4",
					"calc": {
						"level": 0,
						"range": "x2/x3",
						"damage": "sw+1 imp"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -5
						},
						{
							"type": "skill",
							"name": "Spear Thrower"
						},
						{
							"type": "skill",
							"name": "Thrown Weapon (Spear)",
							"modifier": -4
						}
					]
				}
			],
			"calc": {
				"extended_value": "30",
				"extended_weight": "2 lb"
			},
			"categories": [
				"Missile Weapon",
				"UsesAmmoType:Javelin"
			]
		},
		{
			"type": "equipment",
			"id": "08f20b55-dcb0-4844-829e-43bc0d447918",
			"quantity": 1,
			"description": "Auto Pistol, .40",
			"tech_level": "8",
			"legality_class": "3",
			"value": "640",
			"weight": "2.1 lb",
			"reference": "B278",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "pi+",
						"base": "2d"
					},
					"strength": "9",
					"accuracy": "2",
					"range": "150/1900",
					"rate_of_fire": "3",
					"shots": "15+1(3)",
					"bulk": "-2",
					"recoil": "2",
					"calc": {
						"level": 0,
						"range": "150/1900",
						"damage": "2d pi+"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Pistol"
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Rifle",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Shotgun",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Light Machine Gun",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Submachine Gun",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Musket",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Grenade Launcher",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Gyroc",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Light Anti-Armor Weapon",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Gun!"
						}
					]
				}
			],
			"calc": {
				"extended_value": "640",
				"extended_weight": "2.1 lb"
			},
			"categories": [
				"Missile Weapon"
			]
		},
		{
			"type": "equipment",
			"id": "f7da760f-6d01-4dfd-9123-b3a8ece23e2c",
			"quantity": 1,
			"description": "Auto Pistol, .44M",
			"tech_level": "8",
			"legality_class": "3",
			"value": "750",
			"weight": "4.5 lb",
			"reference": "B278",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "pi+",
						"base": "3d"
					},
					"strength": "12",
					"accuracy": "2",
					"range": "230/2500",
					"rate_of_fire": "3",
					"shots": "9+1(3)",
					"bulk": "-3",
					"recoil": "4",
					"calc": {
						"level": 0,
						"range": "230/2500",
						"damage": "3d pi+"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Pistol"
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Rifle",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Shotgun",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Light Machine Gun",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Submachine Gun",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Musket",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Grenade Launcher",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Gyroc",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Light Anti-Armor Weapon",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Gun!"
						}
					]
				}
			],
			"calc": {
				"extended_value": "750",
				"extended_weight": "4.5 lb"
			},
			"categories": [
				"Missile Weapon"
			]
		},
		{
			"type": "equipment",
			"id": "36302b35-bd58-4007-b6b3-2591e0945ec1",
			"quantity": 1,
			"description": "Auto Pistol, .45",
			"tech_level": "6",
			"legality_class": "3",
			"value": "300",
			"weight": "3 lb",
			"reference": "B278",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "pi+",
						"base": "2d"
					},
					"strength": "10",
					"accuracy": "2",
					"range": "175/1700",
					"rate_of_fire": "3",
					"shots": "7+1(3)",
					"bulk": "-2",
					"recoil": "3",
					"calc": {
						"level": 0,
						"range": "175/1700",
						"damage": "2d pi+"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Pistol"
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Rifle",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Shotgun",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Light Machine Gun",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Submachine Gun",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Musket",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Grenade Launcher",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Gyroc",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Light Anti-Armor Weapon",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Gun!"
						}
					]
				}
			],
			"calc": {
				"extended_value": "300",
				"extended_weight": "3 lb"
			},
			"categories": [
				"Missile Weapon"
			]
		},
		{
			"type": "equipment",
			"id": "3fed5cb1-c5e4-40e4-9210-a109bf67f989",
			"quantity": 1,
			"description": "Auto Pistol, 9mm",
			"tech_level": "6",
			"legality_class": "3",
			"value": "350",
			"weight": "2.4 lb",
			"reference": "B278",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "pi",
						"base": "2d+2"
					},
					"strength": "9",
					"accuracy": "2",
					"range": "150/1850",
					"rate_of_fire": "3",
					"shots": "8+1(3)",
					"bulk": "-2",
					"recoil": "2",
					"calc": {
						"level": 0,
						"range": "150/1850",
						"damage": "2d+2 pi"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Pistol"
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Rifle",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Shotgun",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Light Machine Gun",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Submachine Gun",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Musket",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Grenade Launcher",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Gyroc",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Light Anti-Armor Weapon",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Gun!"
						}
					]
				}
			],
			"calc": {
				"extended_value": "350",
				"extended_weight": "2.4 lb"
			},
			"categories": [
				"Missile Weapon"
			]
		},
		{
			"type": "equipment",
			"id": "0ffdd4a2-316f-4f4c-aa7c-b2059e8364b4",
			"quantity": 1,
			"description": "Auto Pistol, 9mm",
			"tech_level": "7",
			"legality_class": "3",
			"value": "600",
			"weight": "2.6 lb",
			"reference": "B278",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "pi",
						"base": "2d+2"
					},
					"strength": "9",
					"accuracy": "2",
					"range": "150/1850",
					"rate_of_fire": "3",
					"shots": "15+1(3)",
					"bulk": "-2",
					"recoil": "2",
					"calc": {
						"level": 0,
						"range": "150/1850",
						"damage": "2d+2 pi"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Pistol"
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Rifle",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Shotgun",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Light Machine Gun",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Submachine Gun",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Musket",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Grenade Launcher",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Gyroc",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Light Anti-Armor Weapon",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Gun!"
						}
					]
				}
			],
			"calc": {
				"extended_value": "600",
				"extended_weight": "2.6 lb"
			},
			"categories": [
				"Missile Weapon"
			]
		},
		{
			"type": "equipment",
			"id": "bf45be2f-50f7-419f-9e33-a75897e5bce6",
			"quantity": 1,
			"description": "Auto Pistol, 9mm",
			"tech_level": "8",
			"legality_class": "3",
			"value": "800",
			"weight": "2 lb",
			"reference": "B278",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "pi",
						"base": "2d+2"
					},
					"strength": "9",
					"accuracy": "2",
					"range": "150/1900",
					"rate_of_fire": "3",
					"shots": "18+1(3)",
					"bulk": "-2",
					"recoil": "2",
					"calc": {
						"level": 0,
						"range": "150/1900",
						"damage": "2d+2 pi"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Pistol"
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Rifle",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Shotgun",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Light Machine Gun",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Submachine Gun",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Musket",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Grenade Launcher",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Gyroc",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Light Anti-Armor Weapon",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Gun!"
						}
					]
				}
			],
			"calc": {
				"extended_value": "800",
				"extended_weight": "2 lb"
			},
			"categories": [
				"Missile Weapon"
			]
		},
		{
			"type": "equipment",
			"id": "8d0c3adc-9047-4faa-b965-c45884931262",
			"quantity": 1,
			"description": "Auto Rifle, 7.62mm",
			"tech_level": "6",
			"legality_class": "2",
			"value": "6500",
			"weight": "22 lb",
			"reference": "B281",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "pi",
						"base": "7d"
					},
					"strength": "12B†",
					"accuracy": "5",
					"range": "1000/4200",
					"rate_of_fire": "9!",
					"shots": "20(3)",
					"bulk": "-6",
					"recoil": "3",
					"calc": {
						"level": 0,
						"range": "1000/4200",
						"damage": "7d pi"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Pistol",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Rifle",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Shotgun",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Light Machine Gun"
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Submachine Gun",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Musket",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Grenade Launcher",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Gyroc",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Light Anti-Armor Weapon",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Gun!"
						}
					]
				}
			],
			"calc": {
				"extended_value": "6500",
				"extended_weight": "22 lb"
			},
			"categories": [
				"Missile Weapon"
			]
		},
		{
			"type": "equipment",
			"id": "2706016b-c7f7-4dda-ba86-0e9c65a26bcd",
			"quantity": 1,
			"description": "Auto Shotgun, 12G",
			"tech_level": "7",
			"legality_class": "3",
			"value": "950",
			"weight": "8.4 lb",
			"reference": "B279",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "pi",
						"base": "1d+1"
					},
					"strength": "10†",
					"accuracy": "3",
					"range": "50/125",
					"rate_of_fire": "3x9",
					"shots": "6+1(3i)",
					"bulk": "-5",
					"recoil": "1",
					"calc": {
						"level": 0,
						"range": "50/125",
						"damage": "1d+1 pi"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Pistol",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Rifle",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Shotgun"
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Light Machine Gun",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Submachine Gun",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Musket",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Grenade Launcher",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Gyroc",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Light Anti-Armor Weapon",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Gun!"
						}
					]
				}
			],
			"calc": {
				"extended_value": "950",
				"extended_weight": "8.4 lb"
			},
			"categories": [
				"Missile Weapon"
			]
		},
		{
			"type": "equipment",
			"id": "c4e8db90-a0e3-43fe-bb0b-77e1e7d8a95e",
			"quantity": 1,
			"description": "Axe",
			"tech_level": "0",
			"value": "50",
			"weight": "4 lb",
			"reference": "B271",
			"weapons": [
				{
					"type": "melee_weapon",
					"damage": {
						"type": "cut",
						"st": "sw",
						"base": "2"
					},
					"strength": "11",
					"usage": "Swung",
					"reach": "1",
					"parry": "0U",
					"block": "No",
					"calc": {
						"level": 0,
						"parry": "0U",
						"block": "No",
						"damage": "sw+2 cut"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -5
						},
						{
							"type": "skill",
							"name": "Axe/Mace"
						},
						{
							"type": "skill",
							"name": "Flail",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Two-Handed Axe/Mace",
							"modifier": -3
						}
					]
				}
			],
			"calc": {
				"extended_value": "50",
				"extended_weight": "4 lb"
			},
			"categories": [
				"Melee Weapon"
			]
		},
		{
			"type": "equipment_container",
			"id": "c01e6021-2f16-4ccb-9fd4-051812237ef6",
			"description": "Backpack, Frame",
			"tech_level": "1",
			"value": "100",
			"weight": "10 lb",
			"reference": "B288",
			"calc": {
				"extended_value": "100",
				"extended_weight": "10 lb"
			},
			"prereqs": {
				"type": "prereq_list",
				"all": true,
				"prereqs": [
					{
						"type": "contained_weight_prereq",
						"has": true,
						"qualifier": {
							"compare": "at_most",
							"qualifier": "100 lb"
						}
					}
				]
			},
			"categories": [
				"Camping and Survival Gear"
			],
			"open": true
		},
		{
			"type": "equipment_container",
			"id": "165e324f-8655-4627-bdbf-a463a7aa9851",
			"description": "Backpack, Small",
			"tech_level": "1",
			"value": "60",
			"weight": "3 lb",
			"reference": "B288",
			"calc": {
				"extended_value": "60",
				"extended_weight": "3 lb"
			},
			"prereqs": {
				"type": "prereq_list",
				"all": true,
				"prereqs": [
					{
						"type": "contained_weight_prereq",
						"has": true,
						"qualifier": {
							"compare": "at_most",
							"qualifier": "40 lb"
						}
					}
				]
			},
			"categories": [
				"Camping and Survival Gear"
			],
			"open": true
		},
		{
			"type": "equipment",
			"id": "a6413dda-06a6-458c-8d0c-0c0130f77c1d",
			"quantity": 1,
			"description": "Balance and Weights",
			"tech_level": "1",
			"value": "35",
			"weight": "3 lb",
			"reference": "B289",
			"calc": {
				"extended_value": "35",
				"extended_weight": "3 lb"
			},
			"notes": "For weighing goods",
			"categories": [
				"Tools"
			]
		},
		{
			"type": "equipment",
			"id": "4b10d3b5-0841-4814-9056-97733e3bc6b2",
			"quantity": 1,
			"description": "Ballistic Gloves",
			"tech_level": "9",
			"value": "150",
			"weight": "0 lb",
			"reference": "B284",
			"calc": {
				"extended_value": "150",
				"extended_weight": "0 lb"
			},
			"features": [
				{
					"type": "dr_bonus",
					"amount": 8,
					"location": "hand"
				}
			],
			"categories": [
				"Gloves"
			]
		},
		{
			"type": "equipment",
			"id": "37d74093-7d43-4c3a-9a35-44e682bead2d",
			"quantity": 1,
			"description": "Ballistic Gloves",
			"tech_level": "10",
			"value": "150",
			"weight": "0 lb",
			"reference": "B284",
			"calc": {
				"extended_value": "150",
				"extended_weight": "0 lb"
			},
			"features": [
				{
					"type": "dr_bonus",
					"amount": 12,
					"location": "hand"
				}
			],
			"categories": [
				"Gloves"
			]
		},
		{
			"type": "equipment",
			"id": "ad8e70ed-c8e5-41cf-b738-36ad754ff685",
			"quantity": 1,
			"description": "Ballistic Gloves",
			"tech_level": "11",
			"value": "150",
			"weight": "0 lb",
			"reference": "B284",
			"calc": {
				"extended_value": "150",
				"extended_weight": "0 lb"
			},
			"features": [
				{
					"type": "dr_bonus",
					"amount": 16,
					"location": "hand"
				}
			],
			"categories": [
				"Gloves"
			]
		},
		{
			"type": "equipment",
			"id": "2d4b5cbe-84d7-42df-8656-6f018c381f16",
			"quantity": 1,
			"description": "Ballistic Helmet",
			"tech_level": "8",
			"legality_class": "3",
			"value": "250",
			"weight": "3 lb",
			"reference": "B285",
			"calc": {
				"extended_value": "250",
				"extended_weight": "3 lb"
			},
			"features": [
				{
					"type": "dr_bonus",
					"amount": 12,
					"location": "skull"
				}
			],
			"categories": [
				"Headgear"
			]
		},
		{
			"type": "equipment",
			"id": "c11d6944-4438-4b4e-9901-9bd980df56c7",
			"quantity": 1,
			"description": "Ballistic Helmet",
			"tech_level": "9",
			"legality_class": "3",
			"value": "250",
			"weight": "3 lb",
			"reference": "B285",
			"calc": {
				"extended_value": "250",
				"extended_weight": "3 lb"
			},
			"features": [
				{
					"type": "dr_bonus",
					"amount": 18,
					"location": "skull"
				}
			],
			"categories": [
				"Headgear"
			]
		},
		{
			"type": "equipment",
			"id": "dbc2f079-b2fe-4e59-ac14-fa8604c03200",
			"quantity": 1,
			"description": "Ballistic Helmet",
			"tech_level": "10",
			"legality_class": "3",
			"value": "250",
			"weight": "3 lb",
			"reference": "B285",
			"calc": {
				"extended_value": "250",
				"extended_weight": "3 lb"
			},
			"features": [
				{
					"type": "dr_bonus",
					"amount": 24,
					"location": "skull"
				}
			],
			"categories": [
				"Headgear"
			]
		},
		{
			"type": "equipment",
			"id": "8919c591-0f24-4287-96e0-878d841b7563",
			"quantity": 1,
			"description": "Ballistic Helmet",
			"tech_level": "11",
			"legality_class": "3",
			"value": "250",
			"weight": "3 lb",
			"reference": "B285",
			"calc": {
				"extended_value": "250",
				"extended_weight": "3 lb"
			},
			"features": [
				{
					"type": "dr_bonus",
					"amount": 36,
					"location": "skull"
				}
			],
			"categories": [
				"Headgear"
			]
		},
		{
			"type": "equipment",
			"id": "76ef4e5a-43d2-4b4f-a747-cc9fb477b614",
			"quantity": 1,
			"description": "Ballistic Helmet Visor",
			"tech_level": "8",
			"legality_class": "3",
			"value": "100",
			"weight": "3 lb",
			"reference": "B285",
			"calc": {
				"extended_value": "100",
				"extended_weight": "3 lb"
			},
			"features": [
				{
					"type": "dr_bonus",
					"amount": 10,
					"location": "eye"
				},
				{
					"type": "dr_bonus",
					"amount": 10,
					"location": "face"
				}
			],
			"categories": [
				"Headgear"
			]
		},
		{
			"type": "equipment",
			"id": "3d3d9b91-a9e9-4027-86c1-6e6af4a03f48",
			"quantity": 1,
			"description": "Ballistic Helmet Visor",
			"tech_level": "9",
			"legality_class": "3",
			"value": "100",
			"weight": "3 lb",
			"reference": "B285",
			"calc": {
				"extended_value": "100",
				"extended_weight": "3 lb"
			},
			"features": [
				{
					"type": "dr_bonus",
					"amount": 15,
					"location": "eye"
				},
				{
					"type": "dr_bonus",
					"amount": 15,
					"location": "face"
				}
			],
			"categories": [
				"Headgear"
			]
		},
		{
			"type": "equipment",
			"id": "0ffb8fed-3d9f-4c46-bf8c-69327b8b4cd8",
			"quantity": 1,
			"description": "Ballistic Helmet Visor",
			"tech_level": "10",
			"legality_class": "3",
			"value": "100",
			"weight": "3 lb",
			"reference": "B285",
			"calc": {
				"extended_value": "100",
				"extended_weight": "3 lb"
			},
			"features": [
				{
					"type": "dr_bonus",
					"amount": 20,
					"location": "eye"
				},
				{
					"type": "dr_bonus",
					"amount": 20,
					"location": "face"
				}
			],
			"categories": [
				"Headgear"
			]
		},
		{
			"type": "equipment",
			"id": "f6797f71-db60-496b-bf32-09b41025aed8",
			"quantity": 1,
			"description": "Ballistic Helmet Visor",
			"tech_level": "11",
			"legality_class": "3",
			"value": "100",
			"weight": "3 lb",
			"reference": "B285",
			"calc": {
				"extended_value": "100",
				"extended_weight": "3 lb"
			},
			"features": [
				{
					"type": "dr_bonus",
					"amount": 30,
					"location": "eye"
				},
				{
					"type": "dr_bonus",
					"amount": 30,
					"location": "face"
				}
			],
			"categories": [
				"Headgear"
			]
		},
		{
			"type": "equipment",
			"id": "14feeb4b-c545-4fe1-9ffc-e025199c86ea",
			"quantity": 1,
			"description": "Ballistic Suit",
			"tech_level": "9",
			"legality_class": "3",
			"value": "1000",
			"weight": "6 lb",
			"reference": "B284",
			"calc": {
				"extended_value": "1000",
				"extended_weight": "6 lb"
			},
			"features": [
				{
					"type": "dr_bonus",
					"amount": 12,
					"location": "torso"
				},
				{
					"type": "dr_bonus",
					"amount": 12,
					"location": "vitals"
				},
				{
					"type": "dr_bonus",
					"amount": 12,
					"location": "arm"
				},
				{
					"type": "dr_bonus",
					"amount": 12,
					"location": "leg"
				}
			],
			"categories": [
				"Body Armor"
			]
		},
		{
			"type": "equipment",
			"id": "f6b7bf26-a0dd-4518-bcdb-211c0bf08266",
			"quantity": 1,
			"description": "Ballistic Suit",
			"tech_level": "10",
			"legality_class": "3",
			"value": "1000",
			"weight": "6 lb",
			"reference": "B284",
			"calc": {
				"extended_value": "1000",
				"extended_weight": "6 lb"
			},
			"features": [
				{
					"type": "dr_bonus",
					"amount": 18,
					"location": "torso"
				},
				{
					"type": "dr_bonus",
					"amount": 18,
					"location": "vitals"
				},
				{
					"type": "dr_bonus",
					"amount": 18,
					"location": "arm"
				},
				{
					"type": "dr_bonus",
					"amount": 18,
					"location": "leg"
				}
			],
			"categories": [
				"Body Armor"
			]
		},
		{
			"type": "equipment",
			"id": "32e45799-c37e-416f-afe0-1b7f67810b49",
			"quantity": 1,
			"description": "Ballistic Suit",
			"tech_level": "11",
			"legality_class": "3",
			"value": "1000",
			"weight": "6 lb",
			"reference": "B284",
			"calc": {
				"extended_value": "1000",
				"extended_weight": "6 lb"
			},
			"features": [
				{
					"type": "dr_bonus",
					"amount": 24,
					"location": "torso"
				},
				{
					"type": "dr_bonus",
					"amount": 24,
					"location": "vitals"
				},
				{
					"type": "dr_bonus",
					"amount": 24,
					"location": "arm"
				},
				{
					"type": "dr_bonus",
					"amount": 24,
					"location": "leg"
				}
			],
			"categories": [
				"Body Armor"
			]
		},
		{
			"type": "equipment",
			"id": "a57ce59c-1c0a-47df-baab-37e1fba5ea94",
			"quantity": 1,
			"description": "Ballistic Vest",
			"tech_level": "8",
			"legality_class": "3",
			"value": "400",
			"weight": "2 lb",
			"reference": "B284",
			"calc": {
				"extended_value": "400",
				"extended_weight": "2 lb"
			},
			"features": [
				{
					"type": "dr_bonus",
					"amount": 8,
					"location": "torso"
				},
				{
					"type": "dr_bonus",
					"amount": 8,
					"location": "vitals"
				}
			],
			"categories": [
				"Body Armor"
			]
		},
		{
			"type": "equipment",
			"id": "424afbee-cabc-463e-8b4a-17cbb8d70c63",
			"quantity": 1,
			"description": "Ballistic Vest",
			"tech_level": "9",
			"legality_class": "3",
			"value": "400",
			"weight": "2 lb",
			"reference": "B284",
			"calc": {
				"extended_value": "400",
				"extended_weight": "2 lb"
			},
			"features": [
				{
					"type": "dr_bonus",
					"amount": 12,
					"location": "torso"
				},
				{
					"type": "dr_bonus",
					"amount": 12,
					"location": "vitals"
				}
			],
			"categories": [
				"Body Armor"
			]
		},
		{
			"type": "equipment",
			"id": "d7d4e6b9-32f5-4887-beb6-b696b8a7d6fe",
			"quantity": 1,
			"description": "Ballistic Vest",
			"tech_level": "10",
			"legality_class": "3",
			"value": "400",
			"weight": "2 lb",
			"reference": "B284",
			"calc": {
				"extended_value": "400",
				"extended_weight": "2 lb"
			},
			"features": [
				{
					"type": "dr_bonus",
					"amount": 16,
					"location": "torso"
				},
				{
					"type": "dr_bonus",
					"amount": 16,
					"location": "vitals"
				}
			],
			"categories": [
				"Body Armor"
			]
		},
		{
			"type": "equipment",
			"id": "80f03aaa-a4cf-468e-812a-4ccf5e68918d",
			"quantity": 1,
			"description": "Ballistic Vest",
			"tech_level": "11",
			"legality_class": "3",
			"value": "400",
			"weight": "2 lb",
			"reference": "B284",
			"calc": {
				"extended_value": "400",
				"extended_weight": "2 lb"
			},
			"features": [
				{
					"type": "dr_bonus",
					"amount": 24,
					"location": "torso"
				},
				{
					"type": "dr_bonus",
					"amount": 24,
					"location": "vitals"
				}
			],
			"categories": [
				"Body Armor"
			]
		},
		{
			"type": "equipment",
			"id": "020d3677-5a57-4325-a7ed-fff1cc11991e",
			"quantity": 1,
			"description": "Bandages",
			"tech_level": "0",
			"value": "10",
			"weight": "2 lb",
			"reference": "B289",
			"calc": {
				"extended_value": "10",
				"extended_weight": "2 lb"
			},
			"notes": "Bandages for a  half-dozen wounds. Might be clean cloth, adhesive dressings, or spray-on \\"Plastiskin\\", depending on TL. Basic equipment for First Aid skill.",
			"categories": [
				"Medical Gear"
			]
		},
		{
			"type": "equipment",
			"id": "df000012-46e5-4661-856f-8ab679616f89",
			"quantity": 1,
			"description": "Barrel Helm",
			"tech_level": "3",
			"legality_class": "3",
			"value": "240",
			"weight": "10 lb",
			"reference": "B284",
			"calc": {
				"extended_value": "240",
				"extended_weight": "10 lb"
			},
			"features": [
				{
					"type": "dr_bonus",
					"amount": 6,
					"location": "skull"
				},
				{
					"type": "dr_bonus",
					"amount": 6,
					"location": "face"
				}
			],
			"notes": "No peripheral vision",
			"categories": [
				"Headgear"
			]
		},
		{
			"type": "equipment",
			"id": "0abe66dc-3273-4193-962e-98b1bfc03fcb",
			"quantity": 1,
			"description": "Bastard Sword",
			"tech_level": "3",
			"value": "650",
			"weight": "5 lb",
			"reference": "B271,B274",
			"weapons": [
				{
					"type": "melee_weapon",
					"damage": {
						"type": "cut",
						"st": "sw",
						"base": "1"
					},
					"strength": "11",
					"usage": "Swung",
					"usage_notes": "1-Handed",
					"reach": "1,2",
					"parry": "0U",
					"block": "No",
					"calc": {
						"level": 0,
						"parry": "0U",
						"block": "No",
						"damage": "sw+1 cut"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -5
						},
						{
							"type": "skill",
							"name": "Force Sword",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Broadsword"
						},
						{
							"type": "skill",
							"name": "Rapier",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Saber",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Shortsword",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Two-Handed Sword",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Sword!"
						}
					]
				},
				{
					"type": "melee_weapon",
					"damage": {
						"type": "cr",
						"st": "thr",
						"base": "1"
					},
					"strength": "11",
					"usage": "Thrust",
					"usage_notes": "1-Handed",
					"reach": "2",
					"parry": "0U",
					"block": "No",
					"calc": {
						"level": 0,
						"parry": "0U",
						"block": "No",
						"damage": "thr+1 cr"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -5
						},
						{
							"type": "skill",
							"name": "Force Sword",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Broadsword"
						},
						{
							"type": "skill",
							"name": "Rapier",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Saber",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Shortsword",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Two-Handed Sword",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Sword!"
						}
					]
				},
				{
					"type": "melee_weapon",
					"damage": {
						"type": "cut",
						"st": "sw",
						"base": "2"
					},
					"strength": "10†",
					"usage": "Swung",
					"usage_notes": "2-Handed",
					"reach": "1,2",
					"parry": "0",
					"block": "No",
					"calc": {
						"level": 0,
						"parry": "0",
						"block": "No",
						"damage": "sw+2 cut"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -5
						},
						{
							"type": "skill",
							"name": "Force Sword",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Broadsword",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Two-Handed Sword"
						},
						{
							"type": "skill",
							"name": "Sword!"
						}
					]
				},
				{
					"type": "melee_weapon",
					"damage": {
						"type": "cr",
						"st": "thr",
						"base": "2"
					},
					"strength": "10†",
					"usage": "Thrust",
					"usage_notes": "2-Handed",
					"reach": "2",
					"parry": "0",
					"block": "No",
					"calc": {
						"level": 0,
						"parry": "0",
						"block": "No",
						"damage": "thr+2 cr"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -5
						},
						{
							"type": "skill",
							"name": "Force Sword",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Broadsword",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Two-Handed Sword"
						},
						{
							"type": "skill",
							"name": "Sword!"
						}
					]
				}
			],
			"calc": {
				"extended_value": "650",
				"extended_weight": "5 lb"
			},
			"categories": [
				"Melee Weapon"
			]
		},
		{
			"type": "equipment",
			"id": "40bffd5c-4db2-43c8-a944-2a14bdd80897",
			"quantity": 1,
			"description": "Baton",
			"tech_level": "0",
			"value": "20",
			"weight": "1 lb",
			"reference": "B273",
			"weapons": [
				{
					"type": "melee_weapon",
					"damage": {
						"type": "cr",
						"st": "sw"
					},
					"strength": "6",
					"usage": "Swung",
					"reach": "1",
					"parry": "0",
					"block": "No",
					"calc": {
						"level": 0,
						"parry": "0",
						"block": "No",
						"damage": "sw cr"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -5
						},
						{
							"type": "skill",
							"name": "Shortsword"
						},
						{
							"type": "skill",
							"name": "Broadsword",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Force Sword",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Jitte/Sai",
							"modifier": -3
						},
						{
							"type": "skill",
							"name": "Knife",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Saber",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Smallsword",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Tonfa",
							"modifier": -3
						},
						{
							"type": "skill",
							"name": "Sword!"
						}
					]
				},
				{
					"type": "melee_weapon",
					"damage": {
						"type": "cr",
						"st": "thr"
					},
					"strength": "6",
					"usage": "Thrust",
					"reach": "1",
					"parry": "0",
					"block": "No",
					"calc": {
						"level": 0,
						"parry": "0",
						"block": "No",
						"damage": "thr cr"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -5
						},
						{
							"type": "skill",
							"name": "Shortsword"
						},
						{
							"type": "skill",
							"name": "Broadsword",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Force Sword",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Jitte/Sai",
							"modifier": -3
						},
						{
							"type": "skill",
							"name": "Knife",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Saber",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Smallsword",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Tonfa",
							"modifier": -3
						},
						{
							"type": "skill",
							"name": "Sword!"
						}
					]
				}
			],
			"calc": {
				"extended_value": "20",
				"extended_weight": "1 lb"
			},
			"categories": [
				"Melee Weapon"
			]
		},
		{
			"type": "equipment",
			"id": "59d1d513-7304-4ded-853e-ef5ad3004f84",
			"quantity": 1,
			"description": "Batteries",
			"tech_level": "6",
			"value": "1",
			"weight": "0 lb",
			"reference": "B288",
			"calc": {
				"extended_value": "1",
				"extended_weight": "0 lb"
			},
			"categories": [
				"Communications and Information Gear"
			]
		},
		{
			"type": "equipment",
			"id": "b7395147-aca9-40f4-9149-6a5a4d51bbad",
			"quantity": 1,
			"description": "Battle Rifle, 7.62mm",
			"tech_level": "7",
			"legality_class": "2",
			"value": "900",
			"weight": "11 lb",
			"reference": "B279",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "pi",
						"base": "7d"
					},
					"strength": "11†",
					"accuracy": "5",
					"range": "1000/4200",
					"rate_of_fire": "11",
					"shots": "20+1(3)",
					"bulk": "-5",
					"recoil": "3",
					"calc": {
						"level": 0,
						"range": "1000/4200",
						"damage": "7d pi"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Pistol",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Rifle"
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Shotgun",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Light Machine Gun",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Submachine Gun",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Musket",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Grenade Launcher",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Gyroc",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Light Anti-Armor Weapon",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Gun!"
						}
					]
				}
			],
			"calc": {
				"extended_value": "900",
				"extended_weight": "11 lb"
			},
			"categories": [
				"Missile Weapon"
			]
		},
		{
			"type": "equipment",
			"id": "29077684-19ba-4cd4-be90-a62e62daa4a0",
			"quantity": 1,
			"description": "Battle Suit",
			"tech_level": "9",
			"legality_class": "1",
			"value": "80000",
			"weight": "150 lb",
			"reference": "B285",
			"calc": {
				"extended_value": "80000",
				"extended_weight": "150 lb"
			},
			"prereqs": {
				"type": "prereq_list",
				"all": true,
				"prereqs": [
					{
						"type": "skill_prereq",
						"has": true,
						"name": {
							"compare": "is",
							"qualifier": "battlesuit"
						}
					}
				]
			},
			"features": [
				{
					"type": "dr_bonus",
					"amount": 50,
					"location": "neck"
				},
				{
					"type": "dr_bonus",
					"amount": 70,
					"location": "torso"
				},
				{
					"type": "dr_bonus",
					"amount": 70,
					"location": "vitals"
				},
				{
					"type": "dr_bonus",
					"amount": 50,
					"location": "groin"
				},
				{
					"type": "dr_bonus",
					"amount": 50,
					"location": "arm"
				},
				{
					"type": "dr_bonus",
					"amount": 50,
					"location": "hand"
				},
				{
					"type": "dr_bonus",
					"amount": 50,
					"location": "leg"
				},
				{
					"type": "dr_bonus",
					"amount": 50,
					"location": "foot"
				},
				{
					"type": "attribute_bonus",
					"amount": 10,
					"attribute": "st",
					"limitation": "striking_only"
				},
				{
					"type": "attribute_bonus",
					"amount": 10,
					"attribute": "st",
					"limitation": "lifting_only"
				}
			],
			"categories": [
				"Environment Suits"
			]
		},
		{
			"type": "equipment",
			"id": "e05dd28e-55fc-426b-aa29-32e4544a26a1",
			"quantity": 1,
			"description": "Battle Suit",
			"tech_level": "10",
			"legality_class": "1",
			"value": "80000",
			"weight": "150 lb",
			"reference": "B285",
			"calc": {
				"extended_value": "80000",
				"extended_weight": "150 lb"
			},
			"prereqs": {
				"type": "prereq_list",
				"all": true,
				"prereqs": [
					{
						"type": "skill_prereq",
						"has": true,
						"name": {
							"compare": "is",
							"qualifier": "battlesuit"
						}
					}
				]
			},
			"features": [
				{
					"type": "dr_bonus",
					"amount": 75,
					"location": "neck"
				},
				{
					"type": "dr_bonus",
					"amount": 105,
					"location": "torso"
				},
				{
					"type": "dr_bonus",
					"amount": 105,
					"location": "vitals"
				},
				{
					"type": "dr_bonus",
					"amount": 75,
					"location": "groin"
				},
				{
					"type": "dr_bonus",
					"amount": 75,
					"location": "arm"
				},
				{
					"type": "dr_bonus",
					"amount": 75,
					"location": "hand"
				},
				{
					"type": "dr_bonus",
					"amount": 75,
					"location": "leg"
				},
				{
					"type": "dr_bonus",
					"amount": 75,
					"location": "foot"
				},
				{
					"type": "attribute_bonus",
					"amount": 15,
					"attribute": "st",
					"limitation": "striking_only"
				},
				{
					"type": "attribute_bonus",
					"amount": 15,
					"attribute": "st",
					"limitation": "lifting_only"
				}
			],
			"categories": [
				"Environment Suits"
			]
		},
		{
			"type": "equipment",
			"id": "da448295-e28a-4550-862e-5f4d8ea5365d",
			"quantity": 1,
			"description": "Battle Suit",
			"tech_level": "11",
			"legality_class": "1",
			"value": "80000",
			"weight": "150 lb",
			"reference": "B285",
			"calc": {
				"extended_value": "80000",
				"extended_weight": "150 lb"
			},
			"prereqs": {
				"type": "prereq_list",
				"all": true,
				"prereqs": [
					{
						"type": "skill_prereq",
						"has": true,
						"name": {
							"compare": "is",
							"qualifier": "battlesuit"
						}
					}
				]
			},
			"features": [
				{
					"type": "dr_bonus",
					"amount": 100,
					"location": "neck"
				},
				{
					"type": "dr_bonus",
					"amount": 140,
					"location": "torso"
				},
				{
					"type": "dr_bonus",
					"amount": 140,
					"location": "vitals"
				},
				{
					"type": "dr_bonus",
					"amount": 100,
					"location": "groin"
				},
				{
					"type": "dr_bonus",
					"amount": 100,
					"location": "arm"
				},
				{
					"type": "dr_bonus",
					"amount": 100,
					"location": "hand"
				},
				{
					"type": "dr_bonus",
					"amount": 100,
					"location": "leg"
				},
				{
					"type": "dr_bonus",
					"amount": 100,
					"location": "foot"
				},
				{
					"type": "attribute_bonus",
					"amount": 20,
					"attribute": "st",
					"limitation": "striking_only"
				},
				{
					"type": "attribute_bonus",
					"amount": 20,
					"attribute": "st",
					"limitation": "lifting_only"
				}
			],
			"categories": [
				"Environment Suits"
			]
		},
		{
			"type": "equipment",
			"id": "23be14c3-128e-47ea-b713-282b3472c589",
			"quantity": 1,
			"description": "Battle Suit Helmet",
			"tech_level": "9",
			"legality_class": "1",
			"value": "10000",
			"weight": "15 lb",
			"reference": "B285",
			"calc": {
				"extended_value": "10000",
				"extended_weight": "15 lb"
			},
			"features": [
				{
					"type": "dr_bonus",
					"amount": 50,
					"location": "eye"
				},
				{
					"type": "dr_bonus",
					"amount": 70,
					"location": "skull"
				},
				{
					"type": "dr_bonus",
					"amount": 50,
					"location": "face"
				}
			],
			"categories": [
				"Environment Suits"
			]
		},
		{
			"type": "equipment",
			"id": "12e58f88-d3e4-433b-8a3c-ed4019d60441",
			"quantity": 1,
			"description": "Battle Suit Helmet",
			"tech_level": "10",
			"legality_class": "1",
			"value": "10000",
			"weight": "15 lb",
			"reference": "B285",
			"calc": {
				"extended_value": "10000",
				"extended_weight": "15 lb"
			},
			"features": [
				{
					"type": "dr_bonus",
					"amount": 75,
					"location": "eye"
				},
				{
					"type": "dr_bonus",
					"amount": 105,
					"location": "skull"
				},
				{
					"type": "dr_bonus",
					"amount": 75,
					"location": "face"
				}
			],
			"categories": [
				"Environment Suits"
			]
		},
		{
			"type": "equipment",
			"id": "7b5b174d-bda3-4047-aeba-65cf47e55466",
			"quantity": 1,
			"description": "Battle Suit Helmet",
			"tech_level": "11",
			"legality_class": "1",
			"value": "10000",
			"weight": "15 lb",
			"reference": "B285",
			"calc": {
				"extended_value": "10000",
				"extended_weight": "15 lb"
			},
			"features": [
				{
					"type": "dr_bonus",
					"amount": 100,
					"location": "eye"
				},
				{
					"type": "dr_bonus",
					"amount": 140,
					"location": "skull"
				},
				{
					"type": "dr_bonus",
					"amount": 100,
					"location": "face"
				}
			],
			"categories": [
				"Environment Suits"
			]
		},
		{
			"type": "equipment",
			"id": "ca9fcd9c-bd9a-482a-8afe-0efce8714e9a",
			"quantity": 1,
			"description": "Bazooka, 60mm",
			"tech_level": "7",
			"legality_class": "1",
			"value": "1000",
			"weight": "16.7 lb",
			"reference": "B281",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "cr ex",
						"base": "6dx2",
						"armor_divisor": 10
					},
					"strength": "10†",
					"accuracy": "3",
					"range": "100/650",
					"rate_of_fire": "1",
					"shots": "1(4)",
					"bulk": "-6",
					"recoil": "1",
					"calc": {
						"level": 0,
						"range": "100/650",
						"damage": "6dx2(10) cr ex"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Pistol",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Rifle",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Shotgun",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Light Machine Gun",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Submachine Gun",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Musket",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Grenade Launcher",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Gyroc",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Light Anti-Armor Weapon"
						},
						{
							"type": "skill",
							"name": "Gun!"
						}
					]
				}
			],
			"calc": {
				"extended_value": "1000",
				"extended_weight": "16.7 lb"
			},
			"categories": [
				"Missile Weapon"
			]
		},
		{
			"type": "equipment",
			"id": "7e8d988d-c2ee-4dbe-8d2c-5dd9203725d2",
			"quantity": 1,
			"description": "Binoculars",
			"tech_level": "6",
			"value": "400",
			"weight": "2 lb",
			"reference": "B289",
			"calc": {
				"extended_value": "400",
				"extended_weight": "2 lb"
			},
			"notes": "Gives (TL-4) levels of Telescopic Vision.",
			"categories": [
				"Optics and Sensors"
			]
		},
		{
			"type": "equipment",
			"id": "99f92842-19ea-4eba-a546-5411dd0798a0",
			"quantity": 1,
			"description": "Bit and Bridle",
			"tech_level": "1",
			"value": "35",
			"weight": "3 lb",
			"reference": "B289",
			"calc": {
				"extended_value": "35",
				"extended_weight": "3 lb"
			},
			"notes": "+2 to control horse, or +3 if using both hands",
			"categories": [
				"Equestrian Gear"
			]
		},
		{
			"type": "equipment",
			"id": "955bca1a-d88e-42b5-9220-66f07fcca3dc",
			"quantity": 1,
			"description": "Blackjack",
			"tech_level": "1",
			"value": "20",
			"weight": "1 lb",
			"reference": "B271",
			"weapons": [
				{
					"type": "melee_weapon",
					"damage": {
						"type": "cr",
						"st": "thr"
					},
					"strength": "7",
					"usage": "Swung",
					"reach": "C",
					"parry": "0",
					"block": "No",
					"calc": {
						"level": 0,
						"parry": "0",
						"block": "No",
						"damage": "thr cr"
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
			"calc": {
				"extended_value": "20",
				"extended_weight": "1 lb"
			},
			"categories": [
				"Melee Weapon"
			]
		},
		{
			"type": "equipment",
			"id": "62874b4b-f21d-4cb0-9f2e-0b0b2559a460",
			"quantity": 1,
			"description": "Blanket",
			"tech_level": "1",
			"value": "20",
			"weight": "4 lb",
			"reference": "B288",
			"calc": {
				"extended_value": "20",
				"extended_weight": "4 lb"
			},
			"categories": [
				"Camping and Survival Gear"
			]
		},
		{
			"type": "equipment",
			"id": "5af15b72-a644-4bab-9ef0-892fc64968ad",
			"quantity": 1,
			"description": "Blaster Pistol",
			"tech_level": "11",
			"legality_class": "3",
			"value": "2200",
			"weight": "1.6 lb",
			"reference": "B280",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "burn",
						"base": "3d",
						"armor_divisor": 5
					},
					"strength": "4",
					"accuracy": "5",
					"range": "300/900",
					"rate_of_fire": "3",
					"shots": "200(3)",
					"bulk": "-2",
					"recoil": "1",
					"calc": {
						"level": 0,
						"range": "300/900",
						"damage": "3d(5) burn"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Pistol",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Beam Weapons",
							"specialization": "Pistol"
						},
						{
							"type": "skill",
							"name": "Beam Weapons",
							"specialization": "Rifle",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Beam Weapons",
							"specialization": "Projector",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Gun!"
						}
					]
				}
			],
			"calc": {
				"extended_value": "2200",
				"extended_weight": "1.6 lb"
			},
			"categories": [
				"Missile Weapon"
			]
		},
		{
			"type": "equipment",
			"id": "609a4fb3-5abd-496e-a0a8-411825633650",
			"quantity": 1,
			"description": "Blaster Rifle",
			"tech_level": "11",
			"legality_class": "2",
			"value": "18000",
			"weight": "10 lb",
			"reference": "B280",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "burn",
						"base": "6d",
						"armor_divisor": 5
					},
					"strength": "7†",
					"accuracy": "10+2",
					"range": "700/2100",
					"rate_of_fire": "3",
					"shots": "50(3)",
					"bulk": "-4",
					"recoil": "1",
					"calc": {
						"level": 0,
						"range": "700/2100",
						"damage": "6d(5) burn"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Rifle",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Beam Weapons",
							"specialization": "Pistol",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Beam Weapons",
							"specialization": "Rifle"
						},
						{
							"type": "skill",
							"name": "Beam Weapons",
							"specialization": "Projector",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Gun!"
						}
					]
				}
			],
			"calc": {
				"extended_value": "18000",
				"extended_weight": "10 lb"
			},
			"categories": [
				"Missile Weapon"
			]
		},
		{
			"type": "equipment",
			"id": "4590c697-47f7-4741-a9d5-7124e9a82c41",
			"quantity": 1,
			"description": "Blowpipe",
			"tech_level": "0",
			"value": "30",
			"weight": "1 lb",
			"reference": "B275",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "pi-",
						"base": "1d-3"
					},
					"strength": "2",
					"accuracy": "1",
					"range": "x4",
					"rate_of_fire": "1",
					"shots": "1(2)",
					"bulk": "-6",
					"calc": {
						"level": 0,
						"range": "x4",
						"damage": "1d-3 pi-"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -6
						},
						{
							"type": "skill",
							"name": "Blowpipe"
						}
					]
				}
			],
			"calc": {
				"extended_value": "30",
				"extended_weight": "1 lb"
			},
			"categories": [
				"Missile Weapon",
				"UsesAmmoType:Dart"
			]
		},
		{
			"type": "equipment",
			"id": "573e959e-c90e-4471-a05f-6ee23ac2e5aa",
			"quantity": 1,
			"description": "Blowpipe Darts",
			"tech_level": "0",
			"value": "0.1",
			"weight": "0.05 lb",
			"reference": "B276",
			"calc": {
				"extended_value": "0.1",
				"extended_weight": "0.05 lb"
			},
			"categories": [
				"AmmoType:Dart",
				"Ammunition",
				"Missile Weapon"
			]
		},
		{
			"type": "equipment",
			"id": "cd18d44d-174b-4bd7-aa8d-567e70e9aeba",
			"quantity": 1,
			"description": "Blunderbuss, 8G",
			"tech_level": "4",
			"value": "150",
			"weight": "12 lb",
			"reference": "B279",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "pi-",
						"base": "1d"
					},
					"strength": "11†",
					"accuracy": "1",
					"range": "15/100",
					"rate_of_fire": "1x9",
					"shots": "1(15)",
					"bulk": "-5",
					"recoil": "1",
					"calc": {
						"level": 0,
						"range": "15/100",
						"damage": "1d pi-"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Pistol",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Rifle",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Shotgun"
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Light Machine Gun",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Submachine Gun",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Musket",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Grenade Launcher",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Gyroc",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Light Anti-Armor Weapon",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Gun!"
						}
					]
				}
			],
			"calc": {
				"extended_value": "150",
				"extended_weight": "12 lb"
			},
			"categories": [
				"Missile Weapon"
			]
		},
		{
			"type": "equipment",
			"id": "bebd80a1-6473-407b-9551-911b635246a1",
			"quantity": 1,
			"description": "Bolas",
			"tech_level": "0",
			"value": "20",
			"weight": "2 lb",
			"reference": "B275",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "cr (see B411)",
						"st": "thr",
						"base": "-1"
					},
					"strength": "7",
					"accuracy": "0",
					"range": "x3",
					"rate_of_fire": "1",
					"shots": "T(1)",
					"bulk": "-2",
					"calc": {
						"level": 0,
						"range": "x3",
						"damage": "thr-1 cr (see B411)"
					},
					"defaults": [
						{
							"type": "skill",
							"name": "Bolas"
						}
					]
				}
			],
			"calc": {
				"extended_value": "20",
				"extended_weight": "2 lb"
			},
			"categories": [
				"Missile Weapon"
			]
		},
		{
			"type": "equipment",
			"id": "4de4f54c-debc-4f6a-971d-5427b61559c1",
			"quantity": 1,
			"description": "Bolt-Action Rifle, 7.62mm",
			"tech_level": "6",
			"legality_class": "3",
			"value": "350",
			"weight": "8.9 lb",
			"reference": "B279",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "pi",
						"base": "7d"
					},
					"strength": "10†",
					"accuracy": "5",
					"range": "1000/4200",
					"rate_of_fire": "1",
					"shots": "5+1(3)",
					"bulk": "-5",
					"recoil": "4",
					"calc": {
						"level": 0,
						"range": "1000/4200",
						"damage": "7d pi"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Pistol",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Rifle"
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Shotgun",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Light Machine Gun",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Submachine Gun",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Musket",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Grenade Launcher",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Gyroc",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Light Anti-Armor Weapon",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Gun!"
						}
					]
				}
			],
			"calc": {
				"extended_value": "350",
				"extended_weight": "8.9 lb"
			},
			"categories": [
				"Missile Weapon"
			]
		},
		{
			"type": "equipment",
			"id": "86b81173-96f3-4e47-874b-0a771a8670f6",
			"quantity": 1,
			"description": "Boots",
			"tech_level": "2",
			"value": "80",
			"weight": "3 lb",
			"reference": "B284",
			"calc": {
				"extended_value": "80",
				"extended_weight": "3 lb"
			},
			"features": [
				{
					"type": "dr_bonus",
					"amount": 2,
					"location": "foot"
				},
				{
					"type": "weapon_bonus",
					"amount": 1,
					"selection_type": "weapons_with_name",
					"specialization": {
						"compare": "is",
						"qualifier": "Kick"
					}
				}
			],
			"notes": "Flexible; Concealable",
			"categories": [
				"Footwear"
			]
		},
		{
			"type": "equipment_container",
			"id": "80ae0866-0c0d-403b-8a72-4680e8b941e6",
			"description": "Bottle, Ceramic",
			"tech_level": "1",
			"value": "3",
			"weight": "1 lb",
			"reference": "B288",
			"calc": {
				"extended_value": "3",
				"extended_weight": "1 lb"
			},
			"prereqs": {
				"type": "prereq_list",
				"all": true,
				"prereqs": [
					{
						"type": "contained_weight_prereq",
						"has": true,
						"qualifier": {
							"compare": "at_most",
							"qualifier": "2 lb"
						}
					}
				]
			},
			"categories": [
				"Camping and Survival Gear"
			],
			"open": true
		},
		{
			"type": "equipment",
			"id": "988fc189-913c-4cf4-a445-842e92c037da",
			"quantity": 1,
			"description": "Brass Knuckles",
			"tech_level": "1",
			"value": "10",
			"weight": "0.25 lb",
			"reference": "B271",
			"weapons": [
				{
					"type": "melee_weapon",
					"damage": {
						"type": "cr",
						"st": "thr"
					},
					"usage": "Punch",
					"reach": "C",
					"parry": "0",
					"block": "No",
					"calc": {
						"level": 0,
						"parry": "0",
						"block": "No",
						"damage": "thr cr"
					},
					"defaults": [
						{
							"type": "dx"
						},
						{
							"type": "skill",
							"name": "Boxing"
						},
						{
							"type": "skill",
							"name": "Brawling"
						},
						{
							"type": "skill",
							"name": "Karate"
						}
					]
				}
			],
			"calc": {
				"extended_value": "10",
				"extended_weight": "0.25 lb"
			},
			"categories": [
				"Melee Weapon"
			]
		},
		{
			"type": "equipment",
			"id": "cc47559e-89c8-4e43-9488-0ac26722501f",
			"quantity": 1,
			"description": "Broadsword",
			"tech_level": "2",
			"value": "500",
			"weight": "3 lb",
			"reference": "B271",
			"weapons": [
				{
					"type": "melee_weapon",
					"damage": {
						"type": "cut",
						"st": "sw",
						"base": "1"
					},
					"strength": "10",
					"usage": "Swung",
					"reach": "1",
					"parry": "0",
					"block": "No",
					"calc": {
						"level": 0,
						"parry": "0",
						"block": "No",
						"damage": "sw+1 cut"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -5
						},
						{
							"type": "skill",
							"name": "Force Sword",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Broadsword"
						},
						{
							"type": "skill",
							"name": "Rapier",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Saber",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Shortsword",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Two-Handed Sword",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Sword!"
						}
					]
				},
				{
					"type": "melee_weapon",
					"damage": {
						"type": "cr",
						"st": "thr",
						"base": "1"
					},
					"strength": "10",
					"usage": "Thrust",
					"reach": "1",
					"parry": "0",
					"block": "No",
					"calc": {
						"level": 0,
						"parry": "0",
						"block": "No",
						"damage": "thr+1 cr"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -5
						},
						{
							"type": "skill",
							"name": "Force Sword",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Broadsword"
						},
						{
							"type": "skill",
							"name": "Rapier",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Saber",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Shortsword",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Two-Handed Sword",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Sword!"
						}
					]
				}
			],
			"calc": {
				"extended_value": "500",
				"extended_weight": "3 lb"
			},
			"categories": [
				"Melee Weapon"
			]
		},
		{
			"type": "equipment",
			"id": "777b93fa-3a6b-4627-b361-59f08d516853",
			"quantity": 1,
			"description": "Bronze Armbands",
			"tech_level": "1",
			"value": "180",
			"weight": "9 lb",
			"reference": "B283",
			"calc": {
				"extended_value": "180",
				"extended_weight": "9 lb"
			},
			"features": [
				{
					"type": "dr_bonus",
					"amount": 3,
					"location": "arm"
				}
			],
			"categories": [
				"Limb Armor"
			]
		},
		{
			"type": "equipment",
			"id": "bc3100f2-8095-4217-bc98-ccea9a074a4d",
			"quantity": 1,
			"description": "Bronze Breastplate",
			"tech_level": "1",
			"legality_class": "3",
			"value": "400",
			"weight": "20 lb",
			"reference": "B283",
			"calc": {
				"extended_value": "400",
				"extended_weight": "20 lb"
			},
			"features": [
				{
					"type": "dr_bonus",
					"amount": 4,
					"location": "torso",
					"specialization": "frontal"
				},
				{
					"type": "dr_bonus",
					"amount": 4,
					"location": "vitals",
					"specialization": "frontal"
				}
			],
			"categories": [
				"Body Armor"
			]
		},
		{
			"type": "equipment",
			"id": "3ebeab7d-e322-47ab-8593-d3bf4676a1c9",
			"quantity": 1,
			"description": "Bronze Corselet",
			"tech_level": "1",
			"legality_class": "3",
			"value": "1300",
			"weight": "40 lb",
			"reference": "B283",
			"calc": {
				"extended_value": "1300",
				"extended_weight": "40 lb"
			},
			"features": [
				{
					"type": "dr_bonus",
					"amount": 5,
					"location": "torso"
				},
				{
					"type": "dr_bonus",
					"amount": 5,
					"location": "vitals"
				},
				{
					"type": "dr_bonus",
					"amount": 5,
					"location": "groin"
				}
			],
			"categories": [
				"Body Armor"
			]
		},
		{
			"type": "equipment",
			"id": "13765f30-8402-4d99-b47c-658add885865",
			"quantity": 1,
			"description": "Bronze Greaves",
			"tech_level": "1",
			"value": "270",
			"weight": "17 lb",
			"reference": "B283",
			"calc": {
				"extended_value": "270",
				"extended_weight": "17 lb"
			},
			"features": [
				{
					"type": "dr_bonus",
					"amount": 3,
					"location": "leg"
				}
			],
			"categories": [
				"Limb Armor"
			]
		},
		{
			"type": "equipment",
			"id": "ca569b7e-d291-45b5-9501-c9c148cceb9c",
			"quantity": 1,
			"description": "Bronze Helmet",
			"tech_level": "1",
			"value": "160",
			"weight": "7.5 lb",
			"reference": "B284",
			"calc": {
				"extended_value": "160",
				"extended_weight": "7.5 lb"
			},
			"features": [
				{
					"type": "dr_bonus",
					"amount": 3,
					"location": "face"
				},
				{
					"type": "dr_bonus",
					"amount": 3,
					"location": "skull"
				}
			],
			"categories": [
				"Headgear"
			]
		},
		{
			"type": "equipment",
			"id": "ffdc8e5f-8b65-4ec6-b98d-c639845499e1",
			"quantity": 1,
			"description": "Bronze Pot-Helm",
			"tech_level": "1",
			"value": "60",
			"weight": "5 lb",
			"reference": "B284",
			"calc": {
				"extended_value": "60",
				"extended_weight": "5 lb"
			},
			"features": [
				{
					"type": "dr_bonus",
					"amount": 3,
					"location": "skull"
				}
			],
			"categories": [
				"Headgear"
			]
		},
		{
			"type": "equipment",
			"id": "a35df2a4-febc-4268-8e46-d05dd4402c0b",
			"quantity": 1,
			"description": "Buff Coat (Leather)",
			"tech_level": "4",
			"value": "210",
			"weight": "16 lb",
			"reference": "B283",
			"calc": {
				"extended_value": "210",
				"extended_weight": "16 lb"
			},
			"features": [
				{
					"type": "dr_bonus",
					"amount": 2,
					"location": "torso"
				},
				{
					"type": "dr_bonus",
					"amount": 2,
					"location": "vitals"
				},
				{
					"type": "dr_bonus",
					"amount": 2,
					"location": "arm"
				},
				{
					"type": "dr_bonus",
					"amount": 2,
					"location": "leg"
				}
			],
			"notes": "Flexible",
			"categories": [
				"Body Armor"
			]
		},
		{
			"type": "equipment",
			"id": "c5d52e9d-2583-4ee2-8049-ea1ba4458991",
			"quantity": 1,
			"description": "Bug Stomper",
			"tech_level": "7",
			"value": "1200",
			"weight": "2 lb",
			"reference": "B289",
			"calc": {
				"extended_value": "1200",
				"extended_weight": "2 lb"
			},
			"notes": "Jams bugs in 10-yard radius. 8 hrs.",
			"categories": [
				"Law-Enforcement",
				"Spy Gear",
				"Thief"
			]
		},
		{
			"type": "equipment",
			"id": "105dfc01-9db6-4d28-973b-a2a05c240f2d",
			"quantity": 1,
			"description": "Bug, Audio",
			"tech_level": "7",
			"value": "200",
			"weight": "0 lb",
			"reference": "B289",
			"calc": {
				"extended_value": "200",
				"extended_weight": "0 lb"
			},
			"notes": "-7 to spot, 1/4-mile range, transmits for 1 week.",
			"categories": [
				"Law-Enforcement",
				"Spy Gear",
				"Thief"
			]
		},
		{
			"type": "equipment",
			"id": "cb4344f5-432d-4909-8f2f-924b6dcbb1f3",
			"quantity": 1,
			"description": "Cable, Steel, 1.5\\", 10 yards",
			"tech_level": "5",
			"value": "100",
			"weight": "17 lb",
			"reference": "B288",
			"calc": {
				"extended_value": "100",
				"extended_weight": "17 lb"
			},
			"notes": "Supports 3,700 lbs.",
			"categories": [
				"Camping and Survival Gear"
			]
		},
		{
			"type": "equipment",
			"id": "b9e72611-ec4c-45d5-8bb5-9ff6b5f0537d",
			"quantity": 1,
			"description": "Cable, Steel, 1.5\\", 20 yards",
			"tech_level": "5",
			"value": "200",
			"weight": "34 lb",
			"reference": "B288",
			"calc": {
				"extended_value": "200",
				"extended_weight": "34 lb"
			},
			"notes": "Supports 3,700 lbs.",
			"categories": [
				"Camping and Survival Gear"
			]
		},
		{
			"type": "equipment",
			"id": "8ed11c61-6082-4773-826e-514032067e58",
			"quantity": 1,
			"description": "Camcorder",
			"tech_level": "8",
			"value": "1000",
			"weight": "1 lb",
			"reference": "B289",
			"calc": {
				"extended_value": "1000",
				"extended_weight": "1 lb"
			},
			"notes": "Has 10x zoom. Gives Night Vision 5. 7 hrs.",
			"categories": [
				"Optics and Sensors"
			]
		},
		{
			"type": "equipment",
			"id": "44f3586e-efc7-4626-95e2-762df31a2651",
			"quantity": 1,
			"description": "Camera, 35mm",
			"tech_level": "6",
			"value": "50",
			"weight": "3 lb",
			"reference": "B289",
			"calc": {
				"extended_value": "50",
				"extended_weight": "3 lb"
			},
			"notes": "Basic equipment for Photography skill. Extra film is 32 shots ($10, neg.).",
			"categories": [
				"Optics and Sensors"
			]
		},
		{
			"type": "equipment",
			"id": "e46873b2-4028-4635-b7b0-be80d9ca8731",
			"quantity": 1,
			"description": "Camera-Film",
			"tech_level": "6",
			"value": "10",
			"weight": "0 lb",
			"reference": "B289",
			"calc": {
				"extended_value": "10",
				"extended_weight": "0 lb"
			},
			"notes": "Extra film with 32 shots",
			"categories": [
				"Optics and Sensors"
			]
		},
		{
			"type": "equipment",
			"id": "d8283e7a-9ae2-4213-a67c-3f1dca0cf7c5",
			"quantity": 1,
			"description": "Camp Stove, Small",
			"tech_level": "6",
			"value": "50",
			"weight": "2 lb",
			"reference": "B288",
			"calc": {
				"extended_value": "50",
				"extended_weight": "2 lb"
			},
			"notes": "Uses 1/4 gallon of kerosene per 4 hrs",
			"categories": [
				"Camping and Survival Gear"
			]
		},
		{
			"type": "equipment",
			"id": "406ef70b-94a4-4c10-a34f-34deb9d60d94",
			"quantity": 1,
			"description": "Candle, Tallow",
			"tech_level": "1",
			"value": "5",
			"weight": "1 lb",
			"reference": "B288",
			"calc": {
				"extended_value": "5",
				"extended_weight": "1 lb"
			},
			"notes": "Lasts 12 hours",
			"categories": [
				"Camping and Survival Gear"
			]
		},
		{
			"type": "equipment_container",
			"id": "32c0c5aa-1c43-4e59-88be-dae9c1f8b56e",
			"description": "Canteen",
			"tech_level": "5",
			"value": "10",
			"weight": "1 lb",
			"reference": "B288",
			"calc": {
				"extended_value": "10",
				"extended_weight": "1 lb"
			},
			"prereqs": {
				"type": "prereq_list",
				"all": true,
				"prereqs": [
					{
						"type": "contained_weight_prereq",
						"has": true,
						"qualifier": {
							"compare": "at_most",
							"qualifier": "2 lb"
						}
					}
				]
			},
			"categories": [
				"Camping and Survival Gear"
			],
			"open": true
		},
		{
			"type": "equipment",
			"id": "419c868a-9679-4602-8fc9-2003f774e902",
			"quantity": 1,
			"description": "Cartridge Rifle, .45",
			"tech_level": "5",
			"legality_class": "3",
			"value": "200",
			"weight": "6 lb",
			"reference": "B279",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "pi+",
						"base": "5d"
					},
					"strength": "10†",
					"accuracy": "3",
					"range": "600/2000",
					"rate_of_fire": "1",
					"shots": "1(4)",
					"bulk": "-6",
					"recoil": "3",
					"calc": {
						"level": 0,
						"range": "600/2000",
						"damage": "5d pi+"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Pistol",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Rifle"
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Shotgun",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Light Machine Gun",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Submachine Gun",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Musket",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Grenade Launcher",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Gyroc",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Light Anti-Armor Weapon",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Gun!"
						}
					]
				}
			],
			"calc": {
				"extended_value": "200",
				"extended_weight": "6 lb"
			},
			"categories": [
				"Missile Weapon"
			]
		},
		{
			"type": "equipment",
			"id": "81d9d931-7396-44b6-8cbe-e5b27df232d7",
			"quantity": 1,
			"description": "Cattle Prod",
			"tech_level": "7",
			"value": "50",
			"weight": "2 lb",
			"reference": "B273",
			"weapons": [
				{
					"type": "melee_weapon",
					"damage": {
						"type": "burn",
						"base": "1d-3"
					},
					"strength": "3",
					"usage": "Thrust",
					"reach": "1",
					"parry": "0",
					"block": "No",
					"calc": {
						"level": 0,
						"parry": "0",
						"block": "No",
						"damage": "1d-3 burn"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -5
						},
						{
							"type": "skill",
							"name": "Shortsword"
						},
						{
							"type": "skill",
							"name": "Broadsword",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Force Sword",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Jitte/Sai",
							"modifier": -3
						},
						{
							"type": "skill",
							"name": "Knife",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Saber",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Smallsword",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Tonfa",
							"modifier": -3
						},
						{
							"type": "skill",
							"name": "Sword!"
						}
					]
				}
			],
			"calc": {
				"extended_value": "50",
				"extended_weight": "2 lb"
			},
			"categories": [
				"Melee Weapon"
			]
		},
		{
			"type": "equipment",
			"id": "955259c4-6ee1-4aa5-9791-3837eb85f21f",
			"quantity": 1,
			"description": "Cavalry Saber",
			"tech_level": "4",
			"value": "500",
			"weight": "3 lb",
			"reference": "B271",
			"weapons": [
				{
					"type": "melee_weapon",
					"damage": {
						"type": "cut",
						"st": "sw",
						"base": "1"
					},
					"strength": "10",
					"usage": "Swung",
					"reach": "1",
					"parry": "0",
					"block": "No",
					"calc": {
						"level": 0,
						"parry": "0",
						"block": "No",
						"damage": "sw+1 cut"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -5
						},
						{
							"type": "skill",
							"name": "Force Sword",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Broadsword"
						},
						{
							"type": "skill",
							"name": "Rapier",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Saber",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Shortsword",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Two-Handed Sword",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Sword!"
						}
					]
				},
				{
					"type": "melee_weapon",
					"damage": {
						"type": "imp",
						"st": "thr",
						"base": "1"
					},
					"strength": "10",
					"usage": "Thrust",
					"reach": "1",
					"parry": "0",
					"block": "No",
					"calc": {
						"level": 0,
						"parry": "0",
						"block": "No",
						"damage": "thr+1 imp"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -5
						},
						{
							"type": "skill",
							"name": "Force Sword",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Broadsword"
						},
						{
							"type": "skill",
							"name": "Rapier",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Saber",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Shortsword",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Two-Handed Sword",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Sword!"
						}
					]
				}
			],
			"calc": {
				"extended_value": "500",
				"extended_weight": "3 lb"
			},
			"categories": [
				"Melee Weapon"
			]
		},
		{
			"type": "equipment",
			"id": "6e3e3918-fd59-4afc-8117-f05b1632d758",
			"quantity": 1,
			"description": "Cell Phone",
			"tech_level": "8",
			"value": "250",
			"weight": "0.25 lb",
			"reference": "B288",
			"calc": {
				"extended_value": "250",
				"extended_weight": "0.25 lb"
			},
			"notes": "Only works in some areas; $20/month fee., 10 hrs.",
			"categories": [
				"Communications and Information Gear"
			]
		},
		{
			"type": "equipment",
			"id": "bfde8842-192a-4b06-a9e4-f6501e582a6a",
			"quantity": 1,
			"description": "Chainsaw",
			"tech_level": "6",
			"value": "150",
			"weight": "13 lb",
			"reference": "B274",
			"weapons": [
				{
					"type": "melee_weapon",
					"damage": {
						"type": "cut",
						"st": "sw",
						"base": "1d"
					},
					"strength": "10‡",
					"reach": "1",
					"parry": "No",
					"block": "No",
					"calc": {
						"level": 0,
						"parry": "No",
						"block": "No",
						"damage": "sw+1d cut"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -5
						},
						{
							"type": "skill",
							"name": "Two-Handed Axe/Mace"
						},
						{
							"type": "skill",
							"name": "Axe/Mace",
							"modifier": -3
						},
						{
							"type": "skill",
							"name": "Polearm",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Two-Handed Flail",
							"modifier": -4
						}
					]
				}
			],
			"calc": {
				"extended_value": "150",
				"extended_weight": "13 lb"
			},
			"categories": [
				"Melee Weapon"
			]
		},
		{
			"type": "equipment",
			"id": "c53fbbc3-dda4-4f7f-9498-5f271ef64bdd",
			"quantity": 1,
			"description": "Cigarette Lighter",
			"tech_level": "6",
			"value": "10",
			"weight": "0.01 lb",
			"reference": "B288",
			"calc": {
				"extended_value": "10",
				"extended_weight": "0.01 lb"
			},
			"categories": [
				"Camping and Survival Gear"
			]
		},
		{
			"type": "equipment",
			"id": "b1a8fcdf-4b9e-44c3-9d9f-dec0d038b8c7",
			"quantity": 1,
			"description": "Climbing Gear",
			"tech_level": "2",
			"value": "20",
			"weight": "4 lb",
			"reference": "B288",
			"calc": {
				"extended_value": "20",
				"extended_weight": "4 lb"
			},
			"notes": "Hammer, spikes, carabiners",
			"categories": [
				"Camping and Survival Gear"
			]
		},
		{
			"type": "equipment",
			"id": "241ee283-061d-4218-ade7-3ba9a3bac1f0",
			"quantity": 1,
			"description": "Cloth Armor",
			"tech_level": "1",
			"value": "30",
			"weight": "6 lb",
			"reference": "B283",
			"calc": {
				"extended_value": "30",
				"extended_weight": "6 lb"
			},
			"features": [
				{
					"type": "dr_bonus",
					"amount": 1,
					"location": "groin"
				},
				{
					"type": "dr_bonus",
					"amount": 1,
					"location": "torso"
				},
				{
					"type": "dr_bonus",
					"amount": 1,
					"location": "vitals"
				}
			],
			"notes": "Flexible, concealable",
			"categories": [
				"Body Armor"
			]
		},
		{
			"type": "equipment",
			"id": "25b60745-b829-4a2c-9f70-98998e28edff",
			"quantity": 1,
			"description": "Cloth Cap",
			"tech_level": "1",
			"value": "5",
			"weight": "0 lb",
			"reference": "B284",
			"calc": {
				"extended_value": "5",
				"extended_weight": "0 lb"
			},
			"features": [
				{
					"type": "dr_bonus",
					"amount": 1,
					"location": "skull"
				}
			],
			"notes": "Flexible, concealable",
			"categories": [
				"Headgear"
			]
		},
		{
			"type": "equipment",
			"id": "715ef050-b7fd-452e-b195-3b82375aca72",
			"quantity": 1,
			"description": "Cloth Gloves",
			"tech_level": "1",
			"value": "15",
			"weight": "0 lb",
			"reference": "B284",
			"calc": {
				"extended_value": "15",
				"extended_weight": "0 lb"
			},
			"features": [
				{
					"type": "dr_bonus",
					"amount": 1,
					"location": "hand"
				}
			],
			"notes": "Flexible, concealable",
			"categories": [
				"Gloves"
			]
		},
		{
			"type": "equipment",
			"id": "de695ca4-2b50-4ff0-ad9f-1f416d569113",
			"quantity": 1,
			"description": "Cloth Sleeves",
			"tech_level": "1",
			"value": "20",
			"weight": "2 lb",
			"reference": "B283",
			"calc": {
				"extended_value": "20",
				"extended_weight": "2 lb"
			},
			"features": [
				{
					"type": "dr_bonus",
					"amount": 1,
					"location": "arm"
				}
			],
			"notes": "Flexible, concealable",
			"categories": [
				"Limb Armor"
			]
		},
		{
			"type": "equipment",
			"id": "5d414e16-3d8e-44d4-af30-fc3bcb90c2d5",
			"quantity": 1,
			"description": "Combat Hardsuit",
			"tech_level": "9",
			"legality_class": "2",
			"value": "10000",
			"weight": "30 lb",
			"reference": "B285",
			"calc": {
				"extended_value": "10000",
				"extended_weight": "30 lb"
			},
			"prereqs": {
				"type": "prereq_list",
				"all": true,
				"prereqs": [
					{
						"type": "skill_prereq",
						"has": true,
						"name": {
							"compare": "is",
							"qualifier": "nbc suit"
						}
					}
				]
			},
			"features": [
				{
					"type": "dr_bonus",
					"amount": 30,
					"location": "neck"
				},
				{
					"type": "dr_bonus",
					"amount": 50,
					"location": "torso"
				},
				{
					"type": "dr_bonus",
					"amount": 50,
					"location": "vitals"
				},
				{
					"type": "dr_bonus",
					"amount": 30,
					"location": "groin"
				},
				{
					"type": "dr_bonus",
					"amount": 30,
					"location": "arm"
				},
				{
					"type": "dr_bonus",
					"amount": 30,
					"location": "hand"
				},
				{
					"type": "dr_bonus",
					"amount": 30,
					"location": "leg"
				},
				{
					"type": "dr_bonus",
					"amount": 30,
					"location": "foot"
				}
			],
			"categories": [
				"Environment Suits"
			]
		},
		{
			"type": "equipment",
			"id": "d5c02fed-70d6-4193-a695-94daa53d0e2d",
			"quantity": 1,
			"description": "Combat Hardsuit",
			"tech_level": "10",
			"legality_class": "2",
			"value": "10000",
			"weight": "30 lb",
			"reference": "B285",
			"calc": {
				"extended_value": "10000",
				"extended_weight": "30 lb"
			},
			"prereqs": {
				"type": "prereq_list",
				"all": true,
				"prereqs": [
					{
						"type": "skill_prereq",
						"has": true,
						"name": {
							"compare": "is",
							"qualifier": "nbc suit"
						}
					}
				]
			},
			"features": [
				{
					"type": "dr_bonus",
					"amount": 45,
					"location": "neck"
				},
				{
					"type": "dr_bonus",
					"amount": 75,
					"location": "torso"
				},
				{
					"type": "dr_bonus",
					"amount": 75,
					"location": "vitals"
				},
				{
					"type": "dr_bonus",
					"amount": 45,
					"location": "groin"
				},
				{
					"type": "dr_bonus",
					"amount": 45,
					"location": "arm"
				},
				{
					"type": "dr_bonus",
					"amount": 45,
					"location": "hand"
				},
				{
					"type": "dr_bonus",
					"amount": 45,
					"location": "leg"
				},
				{
					"type": "dr_bonus",
					"amount": 45,
					"location": "foot"
				}
			],
			"categories": [
				"Environment Suits"
			]
		},
		{
			"type": "equipment",
			"id": "f5e47c39-00bf-4404-a9cf-ed2605047b53",
			"quantity": 1,
			"description": "Combat Hardsuit",
			"tech_level": "11",
			"legality_class": "2",
			"value": "10000",
			"weight": "30 lb",
			"reference": "B285",
			"calc": {
				"extended_value": "10000",
				"extended_weight": "30 lb"
			},
			"prereqs": {
				"type": "prereq_list",
				"all": true,
				"prereqs": [
					{
						"type": "skill_prereq",
						"has": true,
						"name": {
							"compare": "is",
							"qualifier": "nbc suit"
						}
					}
				]
			},
			"features": [
				{
					"type": "dr_bonus",
					"amount": 60,
					"location": "neck"
				},
				{
					"type": "dr_bonus",
					"amount": 100,
					"location": "torso"
				},
				{
					"type": "dr_bonus",
					"amount": 100,
					"location": "vitals"
				},
				{
					"type": "dr_bonus",
					"amount": 60,
					"location": "groin"
				},
				{
					"type": "dr_bonus",
					"amount": 60,
					"location": "arm"
				},
				{
					"type": "dr_bonus",
					"amount": 60,
					"location": "hand"
				},
				{
					"type": "dr_bonus",
					"amount": 60,
					"location": "leg"
				},
				{
					"type": "dr_bonus",
					"amount": 60,
					"location": "foot"
				}
			],
			"categories": [
				"Environment Suits"
			]
		},
		{
			"type": "equipment",
			"id": "9e533a4b-504d-46d1-99dc-f7c4512d962d",
			"quantity": 1,
			"description": "Combat Hardsuit Helmet",
			"tech_level": "9",
			"legality_class": "2",
			"value": "2000",
			"weight": "4 lb",
			"reference": "B285",
			"calc": {
				"extended_value": "2000",
				"extended_weight": "4 lb"
			},
			"features": [
				{
					"type": "dr_bonus",
					"amount": 12,
					"location": "eye"
				},
				{
					"type": "dr_bonus",
					"amount": 18,
					"location": "skull"
				},
				{
					"type": "dr_bonus",
					"amount": 12,
					"location": "face"
				}
			],
			"categories": [
				"Environment Suits"
			]
		},
		{
			"type": "equipment",
			"id": "a5a4d8a8-ea0b-45a7-be61-3a3e8818f0fd",
			"quantity": 1,
			"description": "Combat Hardsuit Helmet",
			"tech_level": "10",
			"legality_class": "2",
			"value": "2000",
			"weight": "4 lb",
			"reference": "B285",
			"calc": {
				"extended_value": "2000",
				"extended_weight": "4 lb"
			},
			"features": [
				{
					"type": "dr_bonus",
					"amount": 18,
					"location": "eye"
				},
				{
					"type": "dr_bonus",
					"amount": 27,
					"location": "skull"
				},
				{
					"type": "dr_bonus",
					"amount": 18,
					"location": "face"
				}
			],
			"categories": [
				"Environment Suits"
			]
		},
		{
			"type": "equipment",
			"id": "a047b821-a6dd-408f-b4ae-ae0b7e092309",
			"quantity": 1,
			"description": "Combat Hardsuit Helmet",
			"tech_level": "11",
			"legality_class": "2",
			"value": "2000",
			"weight": "4 lb",
			"reference": "B285",
			"calc": {
				"extended_value": "2000",
				"extended_weight": "4 lb"
			},
			"features": [
				{
					"type": "dr_bonus",
					"amount": 24,
					"location": "eye"
				},
				{
					"type": "dr_bonus",
					"amount": 36,
					"location": "skull"
				},
				{
					"type": "dr_bonus",
					"amount": 24,
					"location": "face"
				}
			],
			"categories": [
				"Environment Suits"
			]
		},
		{
			"type": "equipment",
			"id": "612bda88-a600-4fba-8d9c-3860bc01df6f",
			"quantity": 1,
			"description": "Compass",
			"tech_level": "6",
			"value": "50",
			"weight": "0.144 lb",
			"reference": "B288",
			"calc": {
				"extended_value": "50",
				"extended_weight": "0.144 lb"
			},
			"features": [
				{
					"type": "skill_bonus",
					"amount": 1,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "starts_with",
						"qualifier": "navigation"
					}
				}
			],
			"categories": [
				"Camping and Survival Gear"
			]
		},
		{
			"type": "equipment",
			"id": "d4738e51-1029-4fab-9b07-871f3bcdbb94",
			"quantity": 1,
			"description": "Composite Bow (ST10)",
			"tech_level": "1",
			"value": "900",
			"weight": "4 lb",
			"reference": "B275",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "imp",
						"base": "1d+1"
					},
					"strength": "10†",
					"accuracy": "3",
					"range": "200/250",
					"rate_of_fire": "1",
					"shots": "1(2)",
					"bulk": "-7",
					"calc": {
						"level": 0,
						"range": "200/250",
						"damage": "1d+1 imp"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -5
						},
						{
							"type": "skill",
							"name": "Bow"
						}
					]
				}
			],
			"calc": {
				"extended_value": "900",
				"extended_weight": "4 lb"
			},
			"categories": [
				"Missile Weapon"
			]
		},
		{
			"type": "equipment",
			"id": "87a57f20-7973-4565-85c6-b5292278f136",
			"quantity": 1,
			"description": "Composite Bow (ST11)",
			"tech_level": "1",
			"value": "990",
			"weight": "4 lb",
			"reference": "B275",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "imp",
						"base": "1d+2"
					},
					"strength": "11†",
					"accuracy": "3",
					"range": "220/275",
					"rate_of_fire": "1",
					"shots": "1(2)",
					"bulk": "-7",
					"calc": {
						"level": 0,
						"range": "220/275",
						"damage": "1d+2 imp"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -5
						},
						{
							"type": "skill",
							"name": "Bow"
						}
					]
				}
			],
			"calc": {
				"extended_value": "990",
				"extended_weight": "4 lb"
			},
			"categories": [
				"Missile Weapon"
			]
		},
		{
			"type": "equipment",
			"id": "52982e62-fd1b-4ba6-9ddc-7c33b59afb6c",
			"quantity": 1,
			"description": "Composite Bow (ST12)",
			"tech_level": "1",
			"value": "1080",
			"weight": "4 lb",
			"reference": "B275",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "imp",
						"base": "1d+2"
					},
					"strength": "12†",
					"accuracy": "3",
					"range": "240/300",
					"rate_of_fire": "1",
					"shots": "1(2)",
					"bulk": "-7",
					"calc": {
						"level": 0,
						"range": "240/300",
						"damage": "1d+2 imp"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -5
						},
						{
							"type": "skill",
							"name": "Bow"
						}
					]
				}
			],
			"calc": {
				"extended_value": "1080",
				"extended_weight": "4 lb"
			},
			"categories": [
				"Missile Weapon"
			]
		},
		{
			"type": "equipment",
			"id": "6d3bb148-a3d8-4f24-8f89-b952af873642",
			"quantity": 1,
			"description": "Composite Bow (ST13)",
			"tech_level": "1",
			"value": "1170",
			"weight": "4 lb",
			"reference": "B275",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "imp",
						"base": "1d+3"
					},
					"strength": "13†",
					"accuracy": "3",
					"range": "260/325",
					"rate_of_fire": "1",
					"shots": "1(2)",
					"bulk": "-7",
					"calc": {
						"level": 0,
						"range": "260/325",
						"damage": "1d+3 imp"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -5
						},
						{
							"type": "skill",
							"name": "Bow"
						}
					]
				}
			],
			"calc": {
				"extended_value": "1170",
				"extended_weight": "4 lb"
			},
			"categories": [
				"Missile Weapon"
			]
		},
		{
			"type": "equipment",
			"id": "c5650846-9e0b-45b4-af1c-c3c36c2e929d",
			"quantity": 1,
			"description": "Composite Bow (ST14)",
			"tech_level": "1",
			"value": "1260",
			"weight": "4 lb",
			"reference": "B275",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "imp",
						"base": "1d+3"
					},
					"strength": "14†",
					"accuracy": "3",
					"range": "280/350",
					"rate_of_fire": "1",
					"shots": "1(2)",
					"bulk": "-7",
					"calc": {
						"level": 0,
						"range": "280/350",
						"damage": "1d+3 imp"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -5
						},
						{
							"type": "skill",
							"name": "Bow"
						}
					]
				}
			],
			"calc": {
				"extended_value": "1260",
				"extended_weight": "4 lb"
			},
			"categories": [
				"Missile Weapon"
			]
		},
		{
			"type": "equipment",
			"id": "1ca4e2d4-0c44-4b71-a482-90ba38155d94",
			"quantity": 1,
			"description": "Composite Bow (ST15)",
			"tech_level": "1",
			"value": "1350",
			"weight": "4 lb",
			"reference": "B275",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "imp",
						"base": "1d+4"
					},
					"strength": "15†",
					"accuracy": "3",
					"range": "300/375",
					"rate_of_fire": "1",
					"shots": "1(2)",
					"bulk": "-7",
					"calc": {
						"level": 0,
						"range": "300/375",
						"damage": "1d+4 imp"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -5
						},
						{
							"type": "skill",
							"name": "Bow"
						}
					]
				}
			],
			"calc": {
				"extended_value": "1350",
				"extended_weight": "4 lb"
			},
			"categories": [
				"Missile Weapon"
			]
		},
		{
			"type": "equipment",
			"id": "25e4cdc0-8065-4d1f-911d-9a6186272a0e",
			"quantity": 1,
			"description": "Composite Bow (ST16)",
			"tech_level": "1",
			"value": "1440",
			"weight": "4 lb",
			"reference": "B275",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "imp",
						"base": "1d+4"
					},
					"strength": "16†",
					"accuracy": "3",
					"range": "320/400",
					"rate_of_fire": "1",
					"shots": "1(2)",
					"bulk": "-7",
					"calc": {
						"level": 0,
						"range": "320/400",
						"damage": "1d+4 imp"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -5
						},
						{
							"type": "skill",
							"name": "Bow"
						}
					]
				}
			],
			"calc": {
				"extended_value": "1440",
				"extended_weight": "4 lb"
			},
			"categories": [
				"Missile Weapon"
			]
		},
		{
			"type": "equipment",
			"id": "bc535b20-87b8-4726-995d-3be1f5e54954",
			"quantity": 1,
			"description": "Composite Bow (ST17)",
			"tech_level": "1",
			"value": "1530",
			"weight": "4 lb",
			"reference": "B275",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "imp",
						"base": "1d+5"
					},
					"strength": "17†",
					"accuracy": "3",
					"range": "340/425",
					"rate_of_fire": "1",
					"shots": "1(2)",
					"bulk": "-7",
					"calc": {
						"level": 0,
						"range": "340/425",
						"damage": "1d+5 imp"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -5
						},
						{
							"type": "skill",
							"name": "Bow"
						}
					]
				}
			],
			"calc": {
				"extended_value": "1530",
				"extended_weight": "4 lb"
			},
			"categories": [
				"Missile Weapon"
			]
		},
		{
			"type": "equipment",
			"id": "c11be75c-2e03-4ed8-a714-f52bdc840140",
			"quantity": 1,
			"description": "Composite Bow (ST18)",
			"tech_level": "1",
			"value": "1620",
			"weight": "4 lb",
			"reference": "B275",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "imp",
						"base": "1d+5"
					},
					"strength": "18†",
					"accuracy": "3",
					"range": "360/450",
					"rate_of_fire": "1",
					"shots": "1(2)",
					"bulk": "-7",
					"calc": {
						"level": 0,
						"range": "360/450",
						"damage": "1d+5 imp"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -5
						},
						{
							"type": "skill",
							"name": "Bow"
						}
					]
				}
			],
			"calc": {
				"extended_value": "1620",
				"extended_weight": "4 lb"
			},
			"categories": [
				"Missile Weapon"
			]
		},
		{
			"type": "equipment",
			"id": "34e564a2-4c29-4260-b9b1-7c85847e1052",
			"quantity": 1,
			"description": "Composite Bow (ST19)",
			"tech_level": "1",
			"value": "1710",
			"weight": "4 lb",
			"reference": "B275",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "imp",
						"base": "2d+2"
					},
					"strength": "19†",
					"accuracy": "3",
					"range": "380/475",
					"rate_of_fire": "1",
					"shots": "1(2)",
					"bulk": "-7",
					"calc": {
						"level": 0,
						"range": "380/475",
						"damage": "2d+2 imp"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -5
						},
						{
							"type": "skill",
							"name": "Bow"
						}
					]
				}
			],
			"calc": {
				"extended_value": "1710",
				"extended_weight": "4 lb"
			},
			"categories": [
				"Missile Weapon"
			]
		},
		{
			"type": "equipment",
			"id": "399398f0-4ca3-441f-a9ee-42a40dd4ff03",
			"quantity": 1,
			"description": "Composite Bow (ST20)",
			"tech_level": "1",
			"value": "1800",
			"weight": "4 lb",
			"reference": "B275",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "imp",
						"base": "2d+2"
					},
					"strength": "20†",
					"accuracy": "3",
					"range": "400/500",
					"rate_of_fire": "1",
					"shots": "1(2)",
					"bulk": "-7",
					"calc": {
						"level": 0,
						"range": "400/500",
						"damage": "2d+2 imp"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -5
						},
						{
							"type": "skill",
							"name": "Bow"
						}
					]
				}
			],
			"calc": {
				"extended_value": "1800",
				"extended_weight": "4 lb"
			},
			"categories": [
				"Missile Weapon"
			]
		},
		{
			"type": "equipment",
			"id": "9c2bf1a6-6a76-4596-842a-ca9c5aa018dc",
			"quantity": 1,
			"description": "Computer, Laptop",
			"tech_level": "8",
			"value": "1500",
			"weight": "3 lb",
			"reference": "B288",
			"calc": {
				"extended_value": "1500",
				"extended_weight": "3 lb"
			},
			"notes": "Modem plugs into phone. 2 hrs.",
			"categories": [
				"Communications and Information Gear"
			]
		},
		{
			"type": "equipment",
			"id": "fb6e6827-8484-4b59-bcf2-9b116dc383ef",
			"quantity": 1,
			"description": "Computer, Wearable",
			"tech_level": "8",
			"value": "1000",
			"weight": "2 lb",
			"reference": "B288",
			"calc": {
				"extended_value": "1000",
				"extended_weight": "2 lb"
			},
			"notes": "Display glasses and wireless modem. 8 hrs.",
			"categories": [
				"Communications and Information Gear"
			]
		},
		{
			"type": "equipment",
			"id": "aefdb53f-f716-4cfb-bcf8-147c379603c3",
			"quantity": 1,
			"description": "Copper Farthing",
			"tech_level": "1",
			"value": "1",
			"weight": "0.008 lb",
			"reference": "B264",
			"calc": {
				"extended_value": "1",
				"extended_weight": "0.008 lb"
			},
			"categories": [
				"Money: GURPS Standard Medieval Coins"
			]
		},
		{
			"type": "equipment",
			"id": "1e069176-5594-463c-8996-ed57f1fe238c",
			"quantity": 1,
			"description": "Cord, 3/16\\", 10 yards",
			"tech_level": "0",
			"value": "1",
			"weight": "0.5 lb",
			"reference": "B288",
			"calc": {
				"extended_value": "1",
				"extended_weight": "0.5 lb"
			},
			"notes": "Supports 90 lbs.",
			"categories": [
				"Camping and Survival Gear"
			]
		},
		{
			"type": "equipment",
			"id": "d8f7c4bf-dafd-4b6e-a9cc-735bbdf0a448",
			"quantity": 1,
			"description": "Cord, 3/16\\", 20 yards",
			"tech_level": "0",
			"value": "2",
			"weight": "1 lb",
			"reference": "B288",
			"calc": {
				"extended_value": "2",
				"extended_weight": "1 lb"
			},
			"notes": "Supports 90 lbs.",
			"categories": [
				"Camping and Survival Gear"
			]
		},
		{
			"type": "equipment",
			"id": "2b20d8cd-b8c5-46ab-a318-b7002d00c8b3",
			"quantity": 1,
			"description": "Crash Kit/TL0-5",
			"tech_level": "0-5",
			"value": "200",
			"weight": "10 lb",
			"reference": "B289",
			"calc": {
				"extended_value": "200",
				"extended_weight": "10 lb"
			},
			"features": [
				{
					"type": "skill_bonus",
					"amount": 2,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "First Aid"
					}
				}
			],
			"notes": "A complete kit for treating serous injuries. Includes sterile bandages, sutures, and drugs appropriate for the TL. Counts as improvised gear (-5) for Surgery",
			"categories": [
				"Medical Gear"
			]
		},
		{
			"type": "equipment",
			"id": "13f733b6-42d5-4224-ac98-3d9df9f1ebc0",
			"quantity": 1,
			"description": "Crash Kit/TL6+",
			"tech_level": "6+",
			"value": "200",
			"weight": "10 lb",
			"reference": "B289",
			"calc": {
				"extended_value": "200",
				"extended_weight": "10 lb"
			},
			"features": [
				{
					"type": "skill_bonus",
					"amount": 2,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "First Aid"
					}
				}
			],
			"notes": "A complete kit for treating serous injuries. Includes sterile bandages, sutures, and drugs appropriate for the TL. Includes IV drip, needle, and plasma. Counts as improvised gear (-5) for Surgery",
			"categories": [
				"Medical Gear"
			]
		},
		{
			"type": "equipment",
			"id": "f3f45d4e-cc11-4556-938d-7587142b5088",
			"quantity": 1,
			"description": "Crossbow (ST7)",
			"tech_level": "2",
			"value": "150",
			"weight": "6 lb",
			"reference": "B276",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "imp",
						"base": "1d+1"
					},
					"strength": "7†",
					"accuracy": "4",
					"range": "140/175",
					"rate_of_fire": "1",
					"shots": "1(4)",
					"bulk": "-6",
					"calc": {
						"level": 0,
						"range": "140/175",
						"damage": "1d+1 imp"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Crossbow"
						}
					]
				}
			],
			"calc": {
				"extended_value": "150",
				"extended_weight": "6 lb"
			},
			"categories": [
				"Missile Weapon",
				"UsesAmmoType:Bolt"
			]
		},
		{
			"type": "equipment",
			"id": "8c1c9ac5-b630-4bcf-a1c5-2a7b50051ed6",
			"quantity": 1,
			"description": "Crossbow (ST8)",
			"tech_level": "2",
			"value": "165",
			"weight": "6 lb",
			"reference": "B276",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "imp",
						"base": "1d+1"
					},
					"strength": "8†",
					"accuracy": "4",
					"range": "160/200",
					"rate_of_fire": "1",
					"shots": "1(4)",
					"bulk": "-6",
					"calc": {
						"level": 0,
						"range": "160/200",
						"damage": "1d+1 imp"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Crossbow"
						}
					]
				}
			],
			"calc": {
				"extended_value": "165",
				"extended_weight": "6 lb"
			},
			"categories": [
				"Missile Weapon",
				"UsesAmmoType:Bolt"
			]
		},
		{
			"type": "equipment",
			"id": "8c5717ff-06b4-44be-ad08-38e2a66f74ed",
			"quantity": 1,
			"description": "Crossbow (ST9)",
			"tech_level": "2",
			"value": "180",
			"weight": "6 lb",
			"reference": "B276",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "imp",
						"base": "1d+2"
					},
					"strength": "9†",
					"accuracy": "4",
					"range": "180/225",
					"rate_of_fire": "1",
					"shots": "1(4)",
					"bulk": "-6",
					"calc": {
						"level": 0,
						"range": "180/225",
						"damage": "1d+2 imp"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Crossbow"
						}
					]
				}
			],
			"calc": {
				"extended_value": "180",
				"extended_weight": "6 lb"
			},
			"categories": [
				"Missile Weapon",
				"UsesAmmoType:Bolt"
			]
		},
		{
			"type": "equipment",
			"id": "d30c64ee-03e0-4468-a98c-39d55f347694",
			"quantity": 1,
			"description": "Crossbow (ST10)",
			"tech_level": "2",
			"value": "195",
			"weight": "6 lb",
			"reference": "B276",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "imp",
						"base": "1d+2"
					},
					"strength": "10†",
					"accuracy": "4",
					"range": "200/250",
					"rate_of_fire": "1",
					"shots": "1(4)",
					"bulk": "-6",
					"calc": {
						"level": 0,
						"range": "200/250",
						"damage": "1d+2 imp"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Crossbow"
						}
					]
				}
			],
			"calc": {
				"extended_value": "195",
				"extended_weight": "6 lb"
			},
			"categories": [
				"Missile Weapon",
				"UsesAmmoType:Bolt"
			]
		},
		{
			"type": "equipment",
			"id": "ad576f0e-73d0-4fc2-98f0-cbadcfa59c0b",
			"quantity": 1,
			"description": "Crossbow (ST11)",
			"tech_level": "2",
			"value": "210",
			"weight": "6 lb",
			"reference": "B276",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "imp",
						"base": "1d+3"
					},
					"strength": "11†",
					"accuracy": "4",
					"range": "220/275",
					"rate_of_fire": "1",
					"shots": "1(4)",
					"bulk": "-6",
					"calc": {
						"level": 0,
						"range": "220/275",
						"damage": "1d+3 imp"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Crossbow"
						}
					]
				}
			],
			"calc": {
				"extended_value": "210",
				"extended_weight": "6 lb"
			},
			"categories": [
				"Missile Weapon",
				"UsesAmmoType:Bolt"
			]
		},
		{
			"type": "equipment",
			"id": "1c9f6290-f20a-4fa7-9101-f312f07f57a2",
			"quantity": 1,
			"description": "Crossbow (ST12)",
			"tech_level": "2",
			"value": "225",
			"weight": "6 lb",
			"reference": "B276",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "imp",
						"base": "1d+3"
					},
					"strength": "12†",
					"accuracy": "4",
					"range": "240/300",
					"rate_of_fire": "1",
					"shots": "1(4)",
					"bulk": "-6",
					"calc": {
						"level": 0,
						"range": "240/300",
						"damage": "1d+3 imp"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Crossbow"
						}
					]
				}
			],
			"calc": {
				"extended_value": "225",
				"extended_weight": "6 lb"
			},
			"categories": [
				"Missile Weapon",
				"UsesAmmoType:Bolt"
			]
		},
		{
			"type": "equipment",
			"id": "a96c540f-be88-4e76-b504-e04138c48aee",
			"quantity": 1,
			"description": "Crossbow (ST13)",
			"tech_level": "2",
			"value": "240",
			"weight": "6 lb",
			"reference": "B276",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "imp",
						"base": "2d"
					},
					"strength": "13†",
					"accuracy": "4",
					"range": "260/325",
					"rate_of_fire": "1",
					"shots": "1(4)",
					"bulk": "-6",
					"calc": {
						"level": 0,
						"range": "260/325",
						"damage": "2d imp"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Crossbow"
						}
					]
				}
			],
			"calc": {
				"extended_value": "240",
				"extended_weight": "6 lb"
			},
			"categories": [
				"Missile Weapon",
				"UsesAmmoType:Bolt"
			]
		},
		{
			"type": "equipment",
			"id": "cd61311a-edaf-4183-99b3-03656ab24559",
			"quantity": 1,
			"description": "Crossbow (ST14)",
			"tech_level": "2",
			"value": "255",
			"weight": "6 lb",
			"reference": "B276",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "imp",
						"base": "2d"
					},
					"strength": "14†",
					"accuracy": "4",
					"range": "280/350",
					"rate_of_fire": "1",
					"shots": "1(4)",
					"bulk": "-6",
					"calc": {
						"level": 0,
						"range": "280/350",
						"damage": "2d imp"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Crossbow"
						}
					]
				}
			],
			"calc": {
				"extended_value": "255",
				"extended_weight": "6 lb"
			},
			"categories": [
				"Missile Weapon",
				"UsesAmmoType:Bolt"
			]
		},
		{
			"type": "equipment",
			"id": "f9b53ef3-ef45-41f0-a7bb-0a9272567e7d",
			"quantity": 1,
			"description": "Crossbow (ST15)",
			"tech_level": "2",
			"value": "270",
			"weight": "6 lb",
			"reference": "B276",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "imp",
						"base": "2d+1"
					},
					"strength": "15†",
					"accuracy": "4",
					"range": "300/375",
					"rate_of_fire": "1",
					"shots": "1(4)",
					"bulk": "-6",
					"calc": {
						"level": 0,
						"range": "300/375",
						"damage": "2d+1 imp"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Crossbow"
						}
					]
				}
			],
			"calc": {
				"extended_value": "270",
				"extended_weight": "6 lb"
			},
			"categories": [
				"Missile Weapon",
				"UsesAmmoType:Bolt"
			]
		},
		{
			"type": "equipment",
			"id": "b238c4f1-b0e5-4d43-862a-76841c26f022",
			"quantity": 1,
			"description": "Crossbow (ST16)",
			"tech_level": "2",
			"value": "285",
			"weight": "6 lb",
			"reference": "B276",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "imp",
						"base": "2d+1"
					},
					"strength": "16†",
					"accuracy": "4",
					"range": "320/400",
					"rate_of_fire": "1",
					"shots": "1(4)",
					"bulk": "-6",
					"calc": {
						"level": 0,
						"range": "320/400",
						"damage": "2d+1 imp"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Crossbow"
						}
					]
				}
			],
			"calc": {
				"extended_value": "285",
				"extended_weight": "6 lb"
			},
			"categories": [
				"Missile Weapon",
				"UsesAmmoType:Bolt"
			]
		},
		{
			"type": "equipment",
			"id": "cdf58b1c-b9ac-422a-a8aa-c988147d48dc",
			"quantity": 1,
			"description": "Crossbow (ST17)",
			"tech_level": "2",
			"value": "300",
			"weight": "6 lb",
			"reference": "B276",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "imp",
						"base": "2d+2"
					},
					"strength": "17†",
					"accuracy": "4",
					"range": "340/425",
					"rate_of_fire": "1",
					"shots": "1(4)",
					"bulk": "-6",
					"calc": {
						"level": 0,
						"range": "340/425",
						"damage": "2d+2 imp"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Crossbow"
						}
					]
				}
			],
			"calc": {
				"extended_value": "300",
				"extended_weight": "6 lb"
			},
			"categories": [
				"Missile Weapon",
				"UsesAmmoType:Bolt"
			]
		},
		{
			"type": "equipment",
			"id": "39f2d38f-5f7e-4867-ba5a-0e9ec5a9e5c3",
			"quantity": 1,
			"description": "Crossbow (ST18)",
			"tech_level": "2",
			"value": "315",
			"weight": "6 lb",
			"reference": "B276",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "imp",
						"base": "2d+2"
					},
					"strength": "18†",
					"accuracy": "4",
					"range": "360/450",
					"rate_of_fire": "1",
					"shots": "1(4)",
					"bulk": "-6",
					"calc": {
						"level": 0,
						"range": "360/450",
						"damage": "2d+2 imp"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Crossbow"
						}
					]
				}
			],
			"calc": {
				"extended_value": "315",
				"extended_weight": "6 lb"
			},
			"categories": [
				"Missile Weapon",
				"UsesAmmoType:Bolt"
			]
		},
		{
			"type": "equipment",
			"id": "c75e41f5-7fe6-43b0-9e09-2715f29a5a01",
			"quantity": 1,
			"description": "Crossbow (ST19)",
			"tech_level": "2",
			"value": "330",
			"weight": "6 lb",
			"reference": "B276",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "imp",
						"base": "2d+3"
					},
					"strength": "19†",
					"accuracy": "4",
					"range": "380/475",
					"rate_of_fire": "1",
					"shots": "1(4)",
					"bulk": "-6",
					"calc": {
						"level": 0,
						"range": "380/475",
						"damage": "2d+3 imp"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Crossbow"
						}
					]
				}
			],
			"calc": {
				"extended_value": "330",
				"extended_weight": "6 lb"
			},
			"categories": [
				"Missile Weapon",
				"UsesAmmoType:Bolt"
			]
		},
		{
			"type": "equipment",
			"id": "b4143e02-27e0-419a-a020-21263ac692e7",
			"quantity": 1,
			"description": "Crossbow (ST20)",
			"tech_level": "2",
			"value": "345",
			"weight": "6 lb",
			"reference": "B276",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "imp",
						"base": "2d+3"
					},
					"strength": "20†",
					"accuracy": "4",
					"range": "400/500",
					"rate_of_fire": "1",
					"shots": "1(4)",
					"bulk": "-6",
					"calc": {
						"level": 0,
						"range": "400/500",
						"damage": "2d+3 imp"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Crossbow"
						}
					]
				}
			],
			"calc": {
				"extended_value": "345",
				"extended_weight": "6 lb"
			},
			"categories": [
				"Missile Weapon",
				"UsesAmmoType:Bolt"
			]
		},
		{
			"type": "equipment",
			"id": "f11340e0-77c6-47e2-b736-6e1e71e7956b",
			"quantity": 1,
			"description": "Crossbow Bolt",
			"tech_level": "2",
			"value": "2",
			"weight": "0.06 lb",
			"reference": "B276",
			"calc": {
				"extended_value": "2",
				"extended_weight": "0.06 lb"
			},
			"categories": [
				"AmmoType:Bolt",
				"Ammunition",
				"Missile Weapon"
			]
		},
		{
			"type": "equipment",
			"id": "b669205c-4834-4b3f-b440-55ef154fe98c",
			"quantity": 1,
			"description": "Crowbar, 3\'",
			"tech_level": "2",
			"value": "20",
			"weight": "3 lb",
			"reference": "B289",
			"weapons": [
				{
					"type": "melee_weapon",
					"damage": {
						"type": "cr",
						"st": "sw",
						"base": "2"
					},
					"strength": "10",
					"usage": "Swung",
					"reach": "1",
					"parry": "0U",
					"block": "No",
					"calc": {
						"level": 0,
						"parry": "0U",
						"block": "No",
						"damage": "sw+2 cr"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -6
						},
						{
							"type": "skill",
							"name": "Axe/Mace",
							"modifier": -1
						},
						{
							"type": "skill",
							"name": "Flail",
							"modifier": -5
						},
						{
							"type": "skill",
							"name": "Two-Handed Axe/Mace",
							"modifier": -4
						}
					]
				},
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "cr",
						"st": "sw",
						"base": "2"
					},
					"strength": "10",
					"usage": "Thrown",
					"accuracy": "1",
					"range": "x1/x1.5",
					"rate_of_fire": "1",
					"shots": "T(1)",
					"bulk": "-3",
					"calc": {
						"level": 0,
						"range": "x1/x1.5",
						"damage": "sw+2 cr"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -5
						},
						{
							"type": "skill",
							"name": "Thrown Weapon",
							"specialization": "Axe/Mace",
							"modifier": -1
						}
					]
				}
			],
			"calc": {
				"extended_value": "20",
				"extended_weight": "3 lb"
			},
			"categories": [
				"Melee Weapon",
				"Missile Weapon",
				"Tools"
			]
		},
		{
			"type": "equipment",
			"id": "bbae415e-7ceb-4760-8a70-d904d7989a31",
			"quantity": 1,
			"description": "Cutlass",
			"tech_level": "4",
			"value": "300",
			"weight": "2 lb",
			"reference": "B273",
			"weapons": [
				{
					"type": "melee_weapon",
					"damage": {
						"type": "cut",
						"st": "sw"
					},
					"strength": "8",
					"usage": "Swung",
					"reach": "1",
					"parry": "0",
					"block": "No",
					"calc": {
						"level": 0,
						"parry": "0",
						"block": "No",
						"damage": "sw cut"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -5
						},
						{
							"type": "skill",
							"name": "Shortsword"
						},
						{
							"type": "skill",
							"name": "Broadsword",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Force Sword",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Jitte/Sai",
							"modifier": -3
						},
						{
							"type": "skill",
							"name": "Knife",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Saber",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Smallsword",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Tonfa",
							"modifier": -3
						},
						{
							"type": "skill",
							"name": "Sword!"
						}
					]
				},
				{
					"type": "melee_weapon",
					"damage": {
						"type": "imp",
						"st": "thr"
					},
					"strength": "8",
					"usage": "Thrust",
					"reach": "1",
					"parry": "0",
					"block": "No",
					"calc": {
						"level": 0,
						"parry": "0",
						"block": "No",
						"damage": "thr imp"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -5
						},
						{
							"type": "skill",
							"name": "Shortsword"
						},
						{
							"type": "skill",
							"name": "Broadsword",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Force Sword",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Jitte/Sai",
							"modifier": -3
						},
						{
							"type": "skill",
							"name": "Knife",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Saber",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Smallsword",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Tonfa",
							"modifier": -3
						},
						{
							"type": "skill",
							"name": "Sword!"
						}
					]
				}
			],
			"calc": {
				"extended_value": "300",
				"extended_weight": "2 lb"
			},
			"categories": [
				"Melee Weapon"
			]
		},
		{
			"type": "equipment",
			"id": "e68b8c36-8cd4-4036-bf5b-925d72124f0f",
			"quantity": 1,
			"description": "Cutting Torch",
			"tech_level": "6",
			"value": "500",
			"weight": "30 lb",
			"reference": "B289",
			"calc": {
				"extended_value": "500",
				"extended_weight": "30 lb"
			},
			"notes": "1d+3(2) burn per second. Each gas bottle gives 30 seconds of cutting. Extra gas bottles are $50, 15 lbs. per bottle.",
			"categories": [
				"Tools"
			]
		},
		{
			"type": "equipment",
			"id": "3fab2a5b-a6f0-4065-b83d-b122b025a9a5",
			"quantity": 1,
			"description": "Cutting Torch Gas Bottle",
			"tech_level": "6",
			"value": "50",
			"weight": "15 lb",
			"reference": "B289",
			"calc": {
				"extended_value": "50",
				"extended_weight": "15 lb"
			},
			"notes": "Extra Gas Bottle",
			"categories": [
				"Tools"
			]
		},
		{
			"type": "equipment",
			"id": "7492f0b1-3c8f-41b0-8200-43e05c0b52d6",
			"quantity": 1,
			"description": "Dagger",
			"tech_level": "1",
			"value": "20",
			"weight": "0.25 lb",
			"reference": "B272",
			"weapons": [
				{
					"type": "melee_weapon",
					"damage": {
						"type": "imp",
						"st": "thr",
						"base": "-1"
					},
					"strength": "5",
					"usage": "Thrust",
					"reach": "C",
					"parry": "-1",
					"block": "No",
					"calc": {
						"level": 0,
						"parry": "-1",
						"block": "No",
						"damage": "thr-1 imp"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Knife"
						},
						{
							"type": "skill",
							"name": "Force Sword",
							"modifier": -3
						},
						{
							"type": "skill",
							"name": "Main-Gauche",
							"modifier": -3
						},
						{
							"type": "skill",
							"name": "Shortsword",
							"modifier": -3
						},
						{
							"type": "skill",
							"name": "Sword!"
						}
					]
				},
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "imp",
						"st": "thr",
						"base": "-1"
					},
					"strength": "5",
					"usage": "Thrown",
					"accuracy": "+0",
					"range": "x0.5/x1",
					"rate_of_fire": "1",
					"shots": "T(1)",
					"bulk": "-1",
					"calc": {
						"level": 0,
						"range": "x0.5/x1",
						"damage": "thr-1 imp"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Thrown Weapon",
							"specialization": "Knife"
						}
					]
				}
			],
			"calc": {
				"extended_value": "20",
				"extended_weight": "0.25 lb"
			},
			"categories": [
				"Melee Weapon",
				"Missile Weapon"
			]
		},
		{
			"type": "equipment",
			"id": "b2e910e2-9a41-4785-af43-1234b7eb0756",
			"quantity": 1,
			"description": "Dart Rifle, 11mm",
			"tech_level": "8",
			"value": "1200",
			"weight": "6.6 lb",
			"reference": "B279",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "pi-",
						"base": "1d",
						"armor_divisor": 0.2
					},
					"strength": "9†",
					"accuracy": "5+1",
					"range": "45/145",
					"rate_of_fire": "1",
					"shots": "1(3)",
					"bulk": "-5",
					"recoil": "2",
					"calc": {
						"level": 0,
						"range": "45/145",
						"damage": "1d(0.2) pi-"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Pistol",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Rifle"
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Shotgun",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Light Machine Gun",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Submachine Gun",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Musket",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Grenade Launcher",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Gyroc",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Light Anti-Armor Weapon",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Gun!"
						}
					]
				}
			],
			"calc": {
				"extended_value": "1200",
				"extended_weight": "6.6 lb"
			},
			"categories": [
				"Missile Weapon"
			]
		},
		{
			"type": "equipment",
			"id": "ac0bf83b-5d10-459c-89fc-80e184c3f71e",
			"quantity": 1,
			"description": "Derringer, .41",
			"tech_level": "5",
			"legality_class": "3",
			"value": "100",
			"weight": "0.5 lb",
			"reference": "B278",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "pi+",
						"base": "1d"
					},
					"strength": "9",
					"accuracy": "1",
					"range": "80/650",
					"rate_of_fire": "1",
					"shots": "2(3i)",
					"bulk": "-1",
					"recoil": "2",
					"calc": {
						"level": 0,
						"range": "80/650",
						"damage": "1d pi+"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Pistol"
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Rifle",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Shotgun",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Light Machine Gun",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Submachine Gun",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Musket",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Grenade Launcher",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Gyroc",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Light Anti-Armor Weapon",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Gun!"
						}
					]
				}
			],
			"calc": {
				"extended_value": "100",
				"extended_weight": "0.5 lb"
			},
			"categories": [
				"Missile Weapon"
			]
		},
		{
			"type": "equipment",
			"id": "15393964-54e8-452f-9ec4-41f54a40a5fc",
			"quantity": 1,
			"description": "Disguise Kit",
			"tech_level": "5",
			"value": "200",
			"weight": "10 lb",
			"reference": "B289",
			"calc": {
				"extended_value": "200",
				"extended_weight": "10 lb"
			},
			"features": [
				{
					"type": "skill_bonus",
					"amount": 1,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "Disguise"
					}
				}
			],
			"categories": [
				"Law-Enforcement",
				"Spy Gear",
				"Thief"
			]
		},
		{
			"type": "equipment",
			"id": "e40e35cb-17bb-46e7-bd03-e1d72e6898c2",
			"quantity": 1,
			"description": "Double Shotgun, 10G",
			"tech_level": "5",
			"value": "450",
			"weight": "10 lb",
			"reference": "B279",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "pi",
						"base": "1d+2"
					},
					"strength": "11†",
					"accuracy": "3",
					"range": "50/125",
					"rate_of_fire": "2x9",
					"shots": "2(3i)",
					"bulk": "-5",
					"recoil": "1",
					"calc": {
						"level": 0,
						"range": "50/125",
						"damage": "1d+2 pi"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Pistol",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Rifle",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Shotgun"
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Light Machine Gun",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Submachine Gun",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Musket",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Grenade Launcher",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Gyroc",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Light Anti-Armor Weapon",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Gun!"
						}
					]
				}
			],
			"calc": {
				"extended_value": "450",
				"extended_weight": "10 lb"
			},
			"categories": [
				"Missile Weapon"
			]
		},
		{
			"type": "equipment",
			"id": "5b14cd88-ed0a-4988-bcc5-fc1c64f9b624",
			"quantity": 1,
			"description": "Double Mail Hauberk",
			"tech_level": "3",
			"legality_class": "3",
			"value": "520",
			"weight": "44 lb",
			"reference": "B283",
			"calc": {
				"extended_value": "520",
				"extended_weight": "44 lb"
			},
			"features": [
				{
					"type": "dr_bonus",
					"amount": 5,
					"location": "torso"
				},
				{
					"type": "dr_bonus",
					"amount": 5,
					"location": "vitals"
				},
				{
					"type": "dr_bonus",
					"amount": 5,
					"location": "groin"
				},
				{
					"type": "dr_bonus",
					"amount": -2,
					"location": "torso",
					"specialization": "crushing"
				},
				{
					"type": "dr_bonus",
					"amount": -2,
					"location": "vitals",
					"specialization": "crushing"
				},
				{
					"type": "dr_bonus",
					"amount": -2,
					"location": "groin",
					"specialization": "crushing"
				}
			],
			"notes": "Flexible",
			"categories": [
				"Body Armor"
			]
		},
		{
			"type": "equipment",
			"id": "4abf81c4-170d-4395-aa51-ff96e7f3280a",
			"quantity": 1,
			"description": "Drum",
			"tech_level": "0",
			"value": "40",
			"weight": "2 lb",
			"reference": "B288",
			"calc": {
				"extended_value": "40",
				"extended_weight": "2 lb"
			},
			"notes": "Audible for several miles",
			"categories": [
				"Communications and Information Gear"
			]
		},
		{
			"type": "equipment",
			"id": "43318b08-8e71-4785-93c5-741a72dfbd1d",
			"quantity": 1,
			"description": "Ear Muffs",
			"tech_level": "6",
			"value": "200",
			"weight": "1 lb",
			"reference": "B289",
			"calc": {
				"extended_value": "200",
				"extended_weight": "1 lb"
			},
			"notes": "Block loud noises (e.g. gunshots). Give Protected Hearing.",
			"categories": [
				"Weapon and Combat Accessories"
			]
		},
		{
			"type": "equipment",
			"id": "a89f962a-aad8-4b64-8225-e3ed7667f2a2",
			"quantity": 1,
			"description": "Electrolaser Carbine",
			"tech_level": "9",
			"legality_class": "3",
			"value": "3900",
			"weight": "3.7 lb",
			"reference": "B280",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "burn",
						"base": "1d-3"
					},
					"strength": "4†",
					"accuracy": "8+1",
					"range": "160/470",
					"rate_of_fire": "3",
					"shots": "360(3)",
					"bulk": "-4",
					"recoil": "1",
					"calc": {
						"level": 0,
						"range": "160/470",
						"damage": "1d-3 burn"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Rifle",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Beam Weapons",
							"specialization": "Pistol",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Beam Weapons",
							"specialization": "Rifle"
						},
						{
							"type": "skill",
							"name": "Beam Weapons",
							"specialization": "Projector",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Gun!"
						}
					]
				}
			],
			"calc": {
				"extended_value": "3900",
				"extended_weight": "3.7 lb"
			},
			"categories": [
				"Missile Weapon"
			]
		},
		{
			"type": "equipment",
			"id": "50dd34ba-72e6-45ba-9bdf-12f0bcb86c3e",
			"quantity": 1,
			"description": "Electrolaser Pistol",
			"tech_level": "9",
			"value": "1800",
			"weight": "2.2 lb",
			"reference": "B280",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "burn",
						"base": "1d-3"
					},
					"strength": "4",
					"accuracy": "4",
					"range": "40/80",
					"rate_of_fire": "3",
					"shots": "180(3)",
					"bulk": "-2",
					"recoil": "1",
					"calc": {
						"level": 0,
						"range": "40/80",
						"damage": "1d-3 burn"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Pistol",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Beam Weapons",
							"specialization": "Pistol"
						},
						{
							"type": "skill",
							"name": "Beam Weapons",
							"specialization": "Rifle",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Beam Weapons",
							"specialization": "Projector",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Gun!"
						}
					]
				}
			],
			"calc": {
				"extended_value": "1800",
				"extended_weight": "2.2 lb"
			},
			"categories": [
				"Missile Weapon"
			]
		},
		{
			"type": "equipment",
			"id": "da39446b-ee1e-4928-a5b3-52e30ef95d01",
			"quantity": 1,
			"description": "Electronic \\"Lockpicks\\"",
			"tech_level": "7",
			"value": "1500",
			"weight": "3 lb",
			"reference": "B289",
			"calc": {
				"extended_value": "1500",
				"extended_weight": "3 lb"
			},
			"notes": "+2 to pick electronic locks",
			"categories": [
				"Law-Enforcement",
				"Spy Gear",
				"Thief"
			]
		},
		{
			"type": "equipment",
			"id": "5c78d68d-90ba-4a26-b01c-d866ebd78068",
			"quantity": 1,
			"description": "Face Mask",
			"tech_level": "3",
			"legality_class": "3",
			"value": "100",
			"weight": "2 lb",
			"reference": "B284",
			"calc": {
				"extended_value": "100",
				"extended_weight": "2 lb"
			},
			"features": [
				{
					"type": "dr_bonus",
					"amount": 4,
					"location": "face"
				}
			],
			"categories": [
				"Headgear"
			]
		},
		{
			"type": "equipment",
			"id": "1915d027-7c99-4b5e-aa00-41a90f80b344",
			"quantity": 1,
			"description": "First Aid Kit",
			"tech_level": "0",
			"value": "50",
			"weight": "2 lb",
			"reference": "B289",
			"calc": {
				"extended_value": "50",
				"extended_weight": "2 lb"
			},
			"features": [
				{
					"type": "skill_bonus",
					"amount": 1,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "First Aid"
					}
				}
			],
			"notes": "A complete kit for treating wounds, with bandages, ointments, etc.",
			"categories": [
				"Medical Gear"
			]
		},
		{
			"type": "equipment",
			"id": "1feae9c8-fcbb-4ddb-a03a-f78ace72e1a8",
			"quantity": 1,
			"description": "Fishhooks & Line",
			"tech_level": "0",
			"value": "50",
			"weight": "0.01 lb",
			"reference": "B288",
			"calc": {
				"extended_value": "50",
				"extended_weight": "0.01 lb"
			},
			"categories": [
				"Camping and Survival Gear"
			]
		},
		{
			"type": "equipment",
			"id": "a4710f49-acd5-4014-975c-8b2a778fda6c",
			"quantity": 1,
			"description": "Flail",
			"tech_level": "2",
			"value": "100",
			"weight": "8 lb",
			"reference": "B274",
			"weapons": [
				{
					"type": "melee_weapon",
					"damage": {
						"type": "cr",
						"st": "sw",
						"base": "4"
					},
					"strength": "13†",
					"usage": "Swung",
					"reach": "1,2*",
					"parry": "0U",
					"block": "No",
					"calc": {
						"level": 0,
						"parry": "0U",
						"block": "No",
						"damage": "sw+4 cr"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -6
						},
						{
							"type": "skill",
							"name": "Two-Handed Flail"
						},
						{
							"type": "skill",
							"name": "Flail",
							"modifier": -3
						},
						{
							"type": "skill",
							"name": "Kusari",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Two-Handed Axe/Mace",
							"modifier": -4
						}
					]
				}
			],
			"calc": {
				"extended_value": "100",
				"extended_weight": "8 lb"
			},
			"categories": [
				"Melee Weapon"
			]
		},
		{
			"type": "equipment",
			"id": "f039f6fa-853d-4d54-9fb0-61190c6b5025",
			"quantity": 1,
			"description": "Flak Jacket",
			"tech_level": "6",
			"legality_class": "3",
			"value": "500",
			"weight": "20 lb",
			"reference": "B284",
			"calc": {
				"extended_value": "500",
				"extended_weight": "20 lb"
			},
			"features": [
				{
					"type": "dr_bonus",
					"amount": 7,
					"location": "torso"
				},
				{
					"type": "dr_bonus",
					"amount": 7,
					"location": "vitals"
				}
			],
			"categories": [
				"Body Armor"
			]
		},
		{
			"type": "equipment",
			"id": "b230c032-a3d9-440d-9dc3-472af77746fe",
			"quantity": 1,
			"description": "Flamethrower",
			"tech_level": "6",
			"legality_class": "1",
			"value": "1800",
			"weight": "70 lb",
			"reference": "B281",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "burn",
						"base": "3d"
					},
					"strength": "10†",
					"accuracy": "-",
					"range": "50",
					"rate_of_fire": "Jet",
					"shots": "10",
					"bulk": "-8",
					"recoil": "-",
					"calc": {
						"level": 0,
						"range": "50",
						"damage": "3d burn"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Liquid Projector",
							"specialization": "Flamethrower"
						},
						{
							"type": "skill",
							"name": "Liquid Projector",
							"specialization": "Sprayer",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Liquid Projector",
							"specialization": "Squirt Gun",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Liquid Projector",
							"specialization": "Water Cannon",
							"modifier": -4
						}
					]
				}
			],
			"calc": {
				"extended_value": "1800",
				"extended_weight": "70 lb"
			},
			"categories": [
				"Missile Weapon"
			]
		},
		{
			"type": "equipment",
			"id": "466aa12b-a191-43ae-8cc0-440d33f3ef9b",
			"quantity": 1,
			"description": "Flashlight, Heavy",
			"tech_level": "6",
			"value": "20",
			"weight": "1 lb",
			"reference": "B288",
			"calc": {
				"extended_value": "20",
				"extended_weight": "1 lb"
			},
			"notes": "30\' beam, lasts 5 hours",
			"categories": [
				"Camping and Survival Gear"
			]
		},
		{
			"type": "equipment",
			"id": "4056b325-497f-4e70-ad65-b3988ff3a93b",
			"quantity": 1,
			"description": "Flashlight, Mini",
			"tech_level": "7",
			"value": "10",
			"weight": "0.25 lb",
			"reference": "B288",
			"calc": {
				"extended_value": "10",
				"extended_weight": "0.25 lb"
			},
			"notes": "15\' beam, lasts 1 hour",
			"categories": [
				"Camping and Survival Gear"
			]
		},
		{
			"type": "equipment",
			"id": "72680450-9d82-41bc-8b82-e61b9ced5d09",
			"quantity": 1,
			"description": "Flintlock Musket, .75",
			"tech_level": "4",
			"value": "200",
			"weight": "13 lb",
			"reference": "B279",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "pi++",
						"base": "4d"
					},
					"strength": "10†",
					"accuracy": "2",
					"range": "100/1500",
					"rate_of_fire": "1",
					"shots": "1(15)",
					"bulk": "-6",
					"recoil": "4",
					"calc": {
						"level": 0,
						"range": "100/1500",
						"damage": "4d pi++"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Pistol",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Rifle",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Shotgun",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Light Machine Gun",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Submachine Gun",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Musket"
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Grenade Launcher",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Gyroc",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Light Anti-Armor Weapon",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Gun!"
						}
					]
				}
			],
			"calc": {
				"extended_value": "200",
				"extended_weight": "13 lb"
			},
			"categories": [
				"Missile Weapon"
			]
		},
		{
			"type": "equipment",
			"id": "803dedee-fd24-4f6c-aee4-424694742a94",
			"quantity": 1,
			"description": "Flintlock Pistol, .51",
			"tech_level": "4",
			"legality_class": "3",
			"value": "200",
			"weight": "3 lb",
			"reference": "B278",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "pi+",
						"base": "2d-1"
					},
					"strength": "10",
					"accuracy": "1",
					"range": "75/450",
					"rate_of_fire": "1",
					"shots": "1(20)",
					"bulk": "-3",
					"recoil": "2",
					"calc": {
						"level": 0,
						"range": "75/450",
						"damage": "2d-1 pi+"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Pistol"
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Rifle",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Shotgun",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Light Machine Gun",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Submachine Gun",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Musket",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Grenade Launcher",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Gyroc",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Light Anti-Armor Weapon",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Gun!"
						}
					]
				}
			],
			"calc": {
				"extended_value": "200",
				"extended_weight": "3 lb"
			},
			"categories": [
				"Missile Weapon"
			]
		},
		{
			"type": "equipment",
			"id": "57a8a938-2f48-4049-9699-25d06145645f",
			"quantity": 1,
			"description": "Force Shield",
			"tech_level": "^",
			"legality_class": "3",
			"value": "1500",
			"weight": "0.5 lb",
			"reference": "B287",
			"weapons": [
				{
					"type": "melee_weapon",
					"damage": {
						"type": "cr",
						"st": "thr"
					},
					"strength": "0",
					"usage": "Shield Bash",
					"reach": "1",
					"parry": "No",
					"block": "+0",
					"calc": {
						"level": 0,
						"parry": "No",
						"block": "+0",
						"damage": "thr cr"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Shield",
							"specialization": "Buckler",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Shield",
							"specialization": "Force Shield"
						},
						{
							"type": "skill",
							"name": "Shield",
							"specialization": "Shield",
							"modifier": -2
						}
					]
				}
			],
			"calc": {
				"extended_value": "1500",
				"extended_weight": "0.5 lb"
			},
			"features": [
				{
					"type": "attribute_bonus",
					"amount": 3,
					"attribute": "dodge"
				},
				{
					"type": "attribute_bonus",
					"amount": 3,
					"attribute": "parry"
				},
				{
					"type": "attribute_bonus",
					"amount": 3,
					"attribute": "block"
				}
			],
			"categories": [
				"Shield"
			]
		},
		{
			"type": "equipment",
			"id": "457262c8-152b-48d3-8b95-836c761e8785",
			"quantity": 1,
			"description": "Force Sword",
			"tech_level": "^",
			"legality_class": "2",
			"value": "10000",
			"weight": "2 lb",
			"reference": "B272",
			"weapons": [
				{
					"type": "melee_weapon",
					"damage": {
						"type": "burn",
						"base": "8d",
						"armor_divisor": 5
					},
					"strength": "3",
					"usage": "Swung",
					"reach": "1,2",
					"parry": "0",
					"block": "No",
					"calc": {
						"level": 0,
						"parry": "0",
						"block": "No",
						"damage": "8d(5) burn"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -5
						},
						{
							"type": "skill",
							"name": "Broadsword",
							"modifier": -3
						},
						{
							"type": "skill",
							"name": "Force Sword"
						},
						{
							"type": "skill",
							"name": "Saber",
							"modifier": -3
						},
						{
							"type": "skill",
							"name": "Shortsword",
							"modifier": -3
						},
						{
							"type": "skill",
							"name": "Smallsword",
							"modifier": -3
						},
						{
							"type": "skill",
							"name": "Two-Handed Sword",
							"modifier": -3
						},
						{
							"type": "skill",
							"name": "Sword!"
						}
					]
				}
			],
			"calc": {
				"extended_value": "10000",
				"extended_weight": "2 lb"
			},
			"categories": [
				"Melee Weapon"
			]
		},
		{
			"type": "equipment",
			"id": "c809e330-1020-4416-8aed-947cfcec1864",
			"quantity": 1,
			"description": "Frag Helmet",
			"tech_level": "7",
			"value": "125",
			"weight": "3 lb",
			"reference": "B285",
			"calc": {
				"extended_value": "125",
				"extended_weight": "3 lb"
			},
			"features": [
				{
					"type": "dr_bonus",
					"amount": 5,
					"location": "skull"
				}
			],
			"categories": [
				"Headgear"
			]
		},
		{
			"type": "equipment",
			"id": "26dc3937-6953-43db-b01c-8fecd44befd4",
			"quantity": 1,
			"description": "Frag Helmet Visor",
			"tech_level": "7",
			"value": "25",
			"weight": "1.5 lb",
			"reference": "B285",
			"calc": {
				"extended_value": "25",
				"extended_weight": "1.5 lb"
			},
			"features": [
				{
					"type": "dr_bonus",
					"amount": 1,
					"location": "face"
				},
				{
					"type": "dr_bonus",
					"amount": 1,
					"location": "eye"
				}
			],
			"categories": [
				"Headgear"
			]
		},
		{
			"type": "equipment",
			"id": "366a05b5-8749-4f93-a558-577c059c60cb",
			"quantity": 1,
			"description": "Frag Vest",
			"tech_level": "7",
			"legality_class": "3",
			"value": "350",
			"weight": "9 lb",
			"reference": "B284",
			"calc": {
				"extended_value": "350",
				"extended_weight": "9 lb"
			},
			"features": [
				{
					"type": "dr_bonus",
					"amount": 5,
					"location": "torso"
				},
				{
					"type": "dr_bonus",
					"amount": 5,
					"location": "vitals"
				},
				{
					"type": "dr_bonus",
					"amount": 5,
					"location": "groin"
				}
			],
			"categories": [
				"Body Armor"
			]
		},
		{
			"type": "equipment",
			"id": "72193d3b-4179-4102-aaf1-2e8f67d646c0",
			"quantity": 1,
			"description": "Frag Vest Plate Inserts",
			"tech_level": "7",
			"legality_class": "3",
			"value": "300",
			"weight": "15 lb",
			"reference": "B284",
			"calc": {
				"extended_value": "300",
				"extended_weight": "15 lb"
			},
			"features": [
				{
					"type": "dr_bonus",
					"amount": 20,
					"location": "torso"
				},
				{
					"type": "dr_bonus",
					"amount": 20,
					"location": "vitals"
				}
			],
			"categories": [
				"Body Armor"
			]
		},
		{
			"type": "equipment",
			"id": "f17e1785-1155-432e-acce-0c756c64d9c6",
			"quantity": 1,
			"description": "Fur Loincloth",
			"tech_level": "0",
			"value": "10",
			"weight": "0 lb",
			"reference": "B283",
			"calc": {
				"extended_value": "10",
				"extended_weight": "0 lb"
			},
			"features": [
				{
					"type": "dr_bonus",
					"amount": 1,
					"location": "groin"
				}
			],
			"notes": "Flexible, concealable",
			"categories": [
				"Body Armor"
			]
		},
		{
			"type": "equipment",
			"id": "e98907d1-57cd-4199-b5c0-6082f612207d",
			"quantity": 1,
			"description": "Fur Tunic",
			"tech_level": "0",
			"value": "25",
			"weight": "2 lb",
			"reference": "B283",
			"calc": {
				"extended_value": "25",
				"extended_weight": "2 lb"
			},
			"features": [
				{
					"type": "dr_bonus",
					"amount": 1,
					"location": "torso"
				},
				{
					"type": "dr_bonus",
					"amount": 1,
					"location": "vitals"
				}
			],
			"notes": "Flexible, concealable",
			"categories": [
				"Body Armor"
			]
		},
		{
			"type": "equipment",
			"id": "397815ec-a745-4e64-9893-67f161d21c58",
			"quantity": 1,
			"description": "Garrote",
			"tech_level": "0",
			"value": "2",
			"weight": "0.01 lb",
			"reference": "B272",
			"weapons": [
				{
					"type": "melee_weapon",
					"damage": {
						"type": "see B405"
					},
					"reach": "C",
					"parry": "No",
					"block": "No",
					"calc": {
						"level": 0,
						"parry": "No",
						"block": "No",
						"damage": "see B405"
					},
					"defaults": [
						{
							"type": "skill",
							"name": "Garrote"
						},
						{
							"type": "dx",
							"modifier": -4
						}
					]
				}
			],
			"calc": {
				"extended_value": "2",
				"extended_weight": "0.01 lb"
			},
			"categories": [
				"Melee Weapon"
			]
		},
		{
			"type": "equipment",
			"id": "890a526d-696b-43c8-9d37-79aae8578b62",
			"quantity": 1,
			"description": "Gas Mask",
			"tech_level": "6",
			"value": "100",
			"weight": "4 lb",
			"reference": "B285",
			"calc": {
				"extended_value": "100",
				"extended_weight": "4 lb"
			},
			"features": [
				{
					"type": "dr_bonus",
					"amount": 2,
					"location": "face"
				},
				{
					"type": "dr_bonus",
					"amount": 2,
					"location": "eye"
				}
			],
			"categories": [
				"Headgear"
			]
		},
		{
			"type": "equipment",
			"id": "403acf05-17ac-4621-a515-beec456a6494",
			"quantity": 1,
			"description": "Gasoline, 1 Gallon",
			"tech_level": "6",
			"value": "2",
			"weight": "6 lb",
			"reference": "B288",
			"calc": {
				"extended_value": "2",
				"extended_weight": "6 lb"
			},
			"categories": [
				"Camping and Survival Gear"
			]
		},
		{
			"type": "equipment",
			"id": "974a75e0-d127-489a-a506-4d0eb7c93609",
			"quantity": 1,
			"description": "Gauntlets",
			"tech_level": "2",
			"value": "100",
			"weight": "2 lb",
			"reference": "B284",
			"calc": {
				"extended_value": "100",
				"extended_weight": "2 lb"
			},
			"features": [
				{
					"type": "dr_bonus",
					"amount": 4,
					"location": "hand"
				}
			],
			"categories": [
				"Gloves"
			]
		},
		{
			"type": "equipment",
			"id": "1ab1d0b8-2006-45c3-adbf-aff292fb0c0b",
			"quantity": 1,
			"description": "Gauss PDW, 4mm",
			"tech_level": "10",
			"legality_class": "2",
			"value": "3600",
			"weight": "4.6 lb",
			"reference": "B278",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "pi-",
						"base": "4d",
						"armor_divisor": 3
					},
					"strength": "9†",
					"accuracy": "6+1",
					"range": "700/2900",
					"rate_of_fire": "16",
					"shots": "80(3)",
					"bulk": "-3",
					"recoil": "2",
					"calc": {
						"level": 0,
						"range": "700/2900",
						"damage": "4d(3) pi-"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Pistol",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Rifle",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Shotgun",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Light Machine Gun",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Submachine Gun"
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Musket",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Grenade Launcher",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Gyroc",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Light Anti-Armor Weapon",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Gun!"
						}
					]
				}
			],
			"calc": {
				"extended_value": "3600",
				"extended_weight": "4.6 lb"
			},
			"categories": [
				"Missile Weapon"
			]
		},
		{
			"type": "equipment",
			"id": "b82c5e28-c9ff-46fd-81f5-122f60048baf",
			"quantity": 1,
			"description": "Gauss Rifle, 4mm",
			"tech_level": "10",
			"legality_class": "2",
			"value": "7100",
			"weight": "8.5 lb",
			"reference": "B279",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "pi-",
						"base": "6d+2",
						"armor_divisor": 3
					},
					"strength": "10†",
					"accuracy": "7+2",
					"range": "1200/4800",
					"rate_of_fire": "12",
					"shots": "60(3)",
					"bulk": "-4",
					"recoil": "2",
					"calc": {
						"level": 0,
						"range": "1200/4800",
						"damage": "6d+2(3) pi-"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Pistol",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Rifle"
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Shotgun",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Light Machine Gun",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Submachine Gun",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Musket",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Grenade Launcher",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Gyroc",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Light Anti-Armor Weapon",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Gun!"
						}
					]
				}
			],
			"calc": {
				"extended_value": "7100",
				"extended_weight": "8.5 lb"
			},
			"categories": [
				"Missile Weapon"
			]
		},
		{
			"type": "equipment",
			"id": "daf7a0f6-7380-41ef-8220-b9a9746dbb63",
			"quantity": 1,
			"description": "Glaive",
			"tech_level": "1",
			"value": "100",
			"weight": "8 lb",
			"reference": "B272",
			"weapons": [
				{
					"type": "melee_weapon",
					"damage": {
						"type": "cut",
						"st": "sw",
						"base": "3"
					},
					"strength": "11‡",
					"usage": "Swung",
					"reach": "2,3*",
					"parry": "0U",
					"block": "No",
					"calc": {
						"level": 0,
						"parry": "0U",
						"block": "No",
						"damage": "sw+3 cut"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -5
						},
						{
							"type": "skill",
							"name": "Polearm"
						},
						{
							"type": "skill",
							"name": "Spear",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Staff",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Two-Handed Axe/Mace",
							"modifier": -4
						}
					]
				},
				{
					"type": "melee_weapon",
					"damage": {
						"type": "imp",
						"st": "thr",
						"base": "3"
					},
					"strength": "11†",
					"usage": "Thrust",
					"reach": "1-3*",
					"parry": "0U",
					"block": "No",
					"calc": {
						"level": 0,
						"parry": "0U",
						"block": "No",
						"damage": "thr+3 imp"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -5
						},
						{
							"type": "skill",
							"name": "Polearm"
						},
						{
							"type": "skill",
							"name": "Spear",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Staff",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Two-Handed Axe/Mace",
							"modifier": -4
						}
					]
				}
			],
			"calc": {
				"extended_value": "100",
				"extended_weight": "8 lb"
			},
			"categories": [
				"Melee Weapon"
			]
		},
		{
			"type": "equipment",
			"id": "e1abfe2e-46cd-474c-b9c1-576137b472a5",
			"quantity": 1,
			"description": "Gold Coin",
			"tech_level": "1",
			"value": "80",
			"weight": "0.004 lb",
			"reference": "B264",
			"calc": {
				"extended_value": "80",
				"extended_weight": "0.004 lb"
			},
			"categories": [
				"Money: GURPS Standard Medieval Coins"
			]
		},
		{
			"type": "equipment",
			"id": "83b15a74-a3d2-4b68-bf2d-994a1fe94738",
			"quantity": 1,
			"description": "GPS Receiver",
			"tech_level": "8",
			"value": "200",
			"weight": "3 lb",
			"reference": "B288",
			"calc": {
				"extended_value": "200",
				"extended_weight": "3 lb"
			},
			"notes": "Satellite-updated, lasts 24 hours; Grants Absolute Direction (Requires Signal)",
			"categories": [
				"Camping and Survival Gear"
			]
		},
		{
			"type": "equipment",
			"id": "1701969e-275b-4f13-a7b5-cf5c44aadda9",
			"quantity": 1,
			"description": "Grapnel",
			"tech_level": "5",
			"value": "20",
			"weight": "2 lb",
			"reference": "B288",
			"calc": {
				"extended_value": "20",
				"extended_weight": "2 lb"
			},
			"notes": "Supports 300 lbs; throw to STx2 yards",
			"categories": [
				"Camping and Survival Gear"
			]
		},
		{
			"type": "equipment",
			"id": "945b83ab-9dfb-4e64-bb9a-8bb8fcd1b8da",
			"quantity": 1,
			"description": "Great Axe",
			"tech_level": "1",
			"value": "100",
			"weight": "8 lb",
			"reference": "B274",
			"weapons": [
				{
					"type": "melee_weapon",
					"damage": {
						"type": "cut",
						"st": "sw",
						"base": "3"
					},
					"strength": "12‡",
					"usage": "Swung",
					"reach": "1,2*",
					"parry": "0U",
					"block": "No",
					"calc": {
						"level": 0,
						"parry": "0U",
						"block": "No",
						"damage": "sw+3 cut"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -5
						},
						{
							"type": "skill",
							"name": "Two-Handed Axe/Mace"
						},
						{
							"type": "skill",
							"name": "Axe/Mace",
							"modifier": -3
						},
						{
							"type": "skill",
							"name": "Polearm",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Two-Handed Flail",
							"modifier": -4
						}
					]
				}
			],
			"calc": {
				"extended_value": "100",
				"extended_weight": "8 lb"
			},
			"categories": [
				"Melee Weapon"
			]
		},
		{
			"type": "equipment",
			"id": "99a808a1-d157-4052-9647-03ef5dc55ead",
			"quantity": 1,
			"description": "Greathelm",
			"tech_level": "3",
			"legality_class": "3",
			"value": "340",
			"weight": "10 lb",
			"reference": "B284",
			"calc": {
				"extended_value": "340",
				"extended_weight": "10 lb"
			},
			"features": [
				{
					"type": "dr_bonus",
					"amount": 7,
					"location": "neck"
				},
				{
					"type": "dr_bonus",
					"amount": 7,
					"location": "face"
				},
				{
					"type": "dr_bonus",
					"amount": 7,
					"location": "skull"
				}
			],
			"notes": "No peripheral vision",
			"categories": [
				"Headgear"
			]
		},
		{
			"type": "equipment",
			"id": "6f8e7dc2-81c9-4a7a-ac67-8bd168c241da",
			"quantity": 1,
			"description": "Greatsword",
			"tech_level": "3",
			"value": "800",
			"weight": "7 lb",
			"reference": "B274",
			"weapons": [
				{
					"type": "melee_weapon",
					"damage": {
						"type": "cut",
						"st": "sw",
						"base": "3"
					},
					"strength": "12†",
					"usage": "Swung",
					"reach": "1,2",
					"parry": "0",
					"block": "No",
					"calc": {
						"level": 0,
						"parry": "0",
						"block": "No",
						"damage": "sw+3 cut"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -5
						},
						{
							"type": "skill",
							"name": "Two-Handed Sword"
						},
						{
							"type": "skill",
							"name": "Broadsword",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Force Sword",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Sword!"
						}
					]
				},
				{
					"type": "melee_weapon",
					"damage": {
						"type": "cr",
						"st": "thr",
						"base": "2"
					},
					"strength": "12†",
					"usage": "Thrust",
					"reach": "2",
					"parry": "0",
					"block": "No",
					"calc": {
						"level": 0,
						"parry": "0",
						"block": "No",
						"damage": "thr+2 cr"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -5
						},
						{
							"type": "skill",
							"name": "Two-Handed Sword"
						},
						{
							"type": "skill",
							"name": "Broadsword",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Force Sword",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Sword!"
						}
					]
				}
			],
			"calc": {
				"extended_value": "800",
				"extended_weight": "7 lb"
			},
			"categories": [
				"Melee Weapon"
			]
		},
		{
			"type": "equipment",
			"id": "8ef3ab82-c779-45a3-b207-64e54c301479",
			"quantity": 1,
			"description": "Group Basics",
			"tech_level": "0",
			"value": "50",
			"weight": "20 lb",
			"reference": "B288",
			"calc": {
				"extended_value": "50",
				"extended_weight": "20 lb"
			},
			"notes": "Basic equipment for Cooking and Survival skill for a group. Cook pot, rope, hatchet etc., for 3-8 campers.",
			"categories": [
				"Camping and Survival Gear"
			]
		},
		{
			"type": "equipment",
			"id": "718c0fec-bf5d-41ed-9861-7bac70639bfb",
			"quantity": 1,
			"description": "Gyroc Pistol, 15mm",
			"tech_level": "9",
			"legality_class": "3",
			"value": "200",
			"weight": "1 lb",
			"reference": "B278",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "pi++",
						"base": "6d"
					},
					"strength": "9",
					"accuracy": "1",
					"range": "1900",
					"rate_of_fire": "3",
					"shots": "4(3i)",
					"bulk": "-2",
					"recoil": "1",
					"calc": {
						"level": 0,
						"range": "1900",
						"damage": "6d pi++"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Pistol",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Rifle",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Shotgun",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Light Machine Gun",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Submachine Gun",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Musket",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Grenade Launcher",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Gyroc"
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Light Anti-Armor Weapon",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Gun!"
						}
					]
				}
			],
			"calc": {
				"extended_value": "200",
				"extended_weight": "1 lb"
			},
			"categories": [
				"Missile Weapon"
			]
		},
		{
			"type": "equipment",
			"id": "4b13bd9f-5517-46a0-8a14-c4fd3466d023",
			"quantity": 1,
			"description": "Halberd",
			"tech_level": "3",
			"value": "150",
			"weight": "12 lb",
			"reference": "B272",
			"weapons": [
				{
					"type": "melee_weapon",
					"damage": {
						"type": "cut",
						"st": "sw",
						"base": "5"
					},
					"strength": "13‡",
					"usage": "Swung",
					"reach": "2,3*",
					"parry": "0U",
					"block": "No",
					"calc": {
						"level": 0,
						"parry": "0U",
						"block": "No",
						"damage": "sw+5 cut"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -5
						},
						{
							"type": "skill",
							"name": "Polearm"
						},
						{
							"type": "skill",
							"name": "Spear",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Staff",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Two-Handed Axe/Mace",
							"modifier": -4
						}
					]
				},
				{
					"type": "melee_weapon",
					"damage": {
						"type": "imp (may stick)",
						"st": "sw",
						"base": "4"
					},
					"strength": "13‡",
					"usage": "Swung Hook",
					"reach": "2,3*",
					"parry": "0U",
					"block": "No",
					"calc": {
						"level": 0,
						"parry": "0U",
						"block": "No",
						"damage": "sw+4 imp (may stick)"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -5
						},
						{
							"type": "skill",
							"name": "Polearm"
						},
						{
							"type": "skill",
							"name": "Spear",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Staff",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Two-Handed Axe/Mace",
							"modifier": -4
						}
					]
				},
				{
					"type": "melee_weapon",
					"damage": {
						"type": "imp",
						"st": "thr",
						"base": "3"
					},
					"strength": "12†",
					"usage": "Thrust",
					"reach": "1-3*",
					"parry": "0U",
					"block": "No",
					"calc": {
						"level": 0,
						"parry": "0U",
						"block": "No",
						"damage": "thr+3 imp"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -5
						},
						{
							"type": "skill",
							"name": "Polearm"
						},
						{
							"type": "skill",
							"name": "Spear",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Staff",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Two-Handed Axe/Mace",
							"modifier": -4
						}
					]
				}
			],
			"calc": {
				"extended_value": "150",
				"extended_weight": "12 lb"
			},
			"categories": [
				"Melee Weapon"
			]
		},
		{
			"type": "equipment",
			"id": "e375d668-bb15-4609-a4d6-74597f882168",
			"quantity": 1,
			"description": "Hand Grenade, Black Powder",
			"tech_level": "5",
			"legality_class": "2",
			"value": "5",
			"weight": "1 lb",
			"reference": "B277",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "cr ex",
						"base": "3d",
						"fragmentation": "1d",
						"fragmentation_type": "cut"
					},
					"accuracy": "0",
					"range": "x3.5",
					"rate_of_fire": "1",
					"shots": "1",
					"bulk": "0",
					"recoil": "0",
					"calc": {
						"level": 0,
						"range": "x3.5",
						"damage": "3d cr ex [1d cut]"
					},
					"defaults": [
						{
							"type": "skill",
							"name": "Throwing"
						}
					]
				}
			],
			"calc": {
				"extended_value": "5",
				"extended_weight": "1 lb"
			},
			"notes": "Fuse 3-5",
			"categories": [
				"Missile Weapon"
			]
		},
		{
			"type": "equipment",
			"id": "3e4c76a9-ed21-4880-a1c8-4abdd35550a5",
			"quantity": 1,
			"description": "Hand Grenade, Chemical",
			"tech_level": "7",
			"legality_class": "3",
			"value": "10",
			"weight": "1 lb",
			"reference": "B277",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "spec. (2 y)"
					},
					"accuracy": "0",
					"range": "x3.5",
					"rate_of_fire": "1",
					"shots": "1",
					"bulk": "0",
					"recoil": "0",
					"calc": {
						"level": 0,
						"range": "x3.5",
						"damage": "spec. (2 y)"
					},
					"defaults": [
						{
							"type": "skill",
							"name": "Throwing"
						}
					]
				}
			],
			"calc": {
				"extended_value": "10",
				"extended_weight": "1 lb"
			},
			"notes": "Fuse 2",
			"categories": [
				"Missile Weapon"
			]
		},
		{
			"type": "equipment",
			"id": "69199f35-eefe-4304-a11f-fe02fea86b34",
			"quantity": 1,
			"description": "Hand Grenade, Concussion",
			"tech_level": "6",
			"legality_class": "2",
			"value": "15",
			"weight": "1 lb",
			"reference": "B277",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "cr ex",
						"base": "6d"
					},
					"accuracy": "0",
					"range": "x3.5",
					"rate_of_fire": "1",
					"shots": "1",
					"bulk": "0",
					"recoil": "0",
					"calc": {
						"level": 0,
						"range": "x3.5",
						"damage": "6d cr ex"
					},
					"defaults": [
						{
							"type": "skill",
							"name": "Throwing"
						}
					]
				}
			],
			"calc": {
				"extended_value": "15",
				"extended_weight": "1 lb"
			},
			"notes": "Fuse 4",
			"categories": [
				"Missile Weapon"
			]
		},
		{
			"type": "equipment",
			"id": "9ca04dea-8be3-48e7-889b-eee2e67e7b76",
			"quantity": 1,
			"description": "Hand Grenade, Concussion",
			"tech_level": "7",
			"legality_class": "2",
			"value": "40",
			"weight": "1 lb",
			"reference": "B277",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "cr",
						"base": "5dx2"
					},
					"accuracy": "0",
					"range": "x3.5",
					"rate_of_fire": "1",
					"shots": "1",
					"bulk": "0",
					"recoil": "0",
					"calc": {
						"level": 0,
						"range": "x3.5",
						"damage": "5dx2 cr"
					},
					"defaults": [
						{
							"type": "skill",
							"name": "Throwing"
						}
					]
				}
			],
			"calc": {
				"extended_value": "40",
				"extended_weight": "1 lb"
			},
			"notes": "Fuse 4",
			"categories": [
				"Missile Weapon"
			]
		},
		{
			"type": "equipment",
			"id": "03cc05c3-6fe8-4f71-a414-7e1839dcb882",
			"quantity": 1,
			"description": "Hand Grenade, Fragmentation",
			"tech_level": "6",
			"legality_class": "2",
			"value": "10",
			"weight": "1 lb",
			"reference": "B277",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "cr ex",
						"base": "4d",
						"fragmentation": "2d",
						"fragmentation_type": "cut"
					},
					"accuracy": "0",
					"range": "x3.5",
					"rate_of_fire": "1",
					"shots": "1",
					"bulk": "0",
					"recoil": "0",
					"calc": {
						"level": 0,
						"range": "x3.5",
						"damage": "4d cr ex [2d cut]"
					},
					"defaults": [
						{
							"type": "skill",
							"name": "Throwing"
						}
					]
				}
			],
			"calc": {
				"extended_value": "10",
				"extended_weight": "1 lb"
			},
			"notes": "Fuse 4",
			"categories": [
				"Missile Weapon"
			]
		},
		{
			"type": "equipment",
			"id": "4f3df2a3-0d47-4ca2-b310-34152c1a9386",
			"quantity": 1,
			"description": "Hand Grenade, Fragmentation",
			"tech_level": "7",
			"legality_class": "2",
			"value": "40",
			"weight": "1 lb",
			"reference": "B277",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "cr ex",
						"base": "8d",
						"fragmentation": "3d",
						"fragmentation_type": "cut"
					},
					"accuracy": "0",
					"range": "x3.5",
					"rate_of_fire": "1",
					"shots": "1",
					"bulk": "0",
					"recoil": "0",
					"calc": {
						"level": 0,
						"range": "x3.5",
						"damage": "8d cr ex [3d cut]"
					},
					"defaults": [
						{
							"type": "skill",
							"name": "Throwing"
						}
					]
				}
			],
			"calc": {
				"extended_value": "40",
				"extended_weight": "1 lb"
			},
			"notes": "Fuse 4",
			"categories": [
				"Missile Weapon"
			]
		},
		{
			"type": "equipment",
			"id": "b7313471-48a6-4659-98db-3e7a15043150",
			"quantity": 1,
			"description": "Hand Grenade, Plasma",
			"tech_level": "^",
			"legality_class": "1",
			"value": "100",
			"weight": "1 lb",
			"reference": "B277",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "burn ex",
						"base": "6dx4"
					},
					"accuracy": "0",
					"range": "x3.5",
					"rate_of_fire": "1",
					"shots": "1",
					"bulk": "0",
					"recoil": "0",
					"calc": {
						"level": 0,
						"range": "x3.5",
						"damage": "6dx4 burn ex"
					},
					"defaults": [
						{
							"type": "skill",
							"name": "Throwing"
						}
					]
				}
			],
			"calc": {
				"extended_value": "100",
				"extended_weight": "1 lb"
			},
			"notes": "Fuse 2",
			"categories": [
				"Missile Weapon"
			]
		},
		{
			"type": "equipment",
			"id": "005304c8-5f8d-4976-ba52-db456785f77f",
			"quantity": 1,
			"description": "Hand Grenade, Stun",
			"tech_level": "8",
			"legality_class": "2",
			"value": "40",
			"weight": "1 lb",
			"reference": "B277",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": ""
					},
					"accuracy": "0",
					"range": "x3.5",
					"rate_of_fire": "1",
					"shots": "1",
					"bulk": "0",
					"recoil": "0",
					"calc": {
						"level": 0,
						"range": "x3.5",
						"damage": ""
					},
					"defaults": [
						{
							"type": "skill",
							"name": "Throwing"
						}
					]
				}
			],
			"calc": {
				"extended_value": "40",
				"extended_weight": "1 lb"
			},
			"notes": "Fuse 2",
			"categories": [
				"Missile Weapon"
			]
		},
		{
			"type": "equipment",
			"id": "3255ab33-bff0-43af-9728-5ca1daf48896",
			"quantity": 1,
			"description": "Handcuffs",
			"tech_level": "5",
			"value": "40",
			"weight": "0.5 lb",
			"reference": "B289",
			"calc": {
				"extended_value": "40",
				"extended_weight": "0.5 lb"
			},
			"features": [
				{
					"type": "skill_bonus",
					"amount": -5,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "Escape"
					}
				}
			],
			"categories": [
				"Law-Enforcement",
				"Spy Gear",
				"Thief"
			]
		},
		{
			"type": "equipment",
			"id": "5ead9f4e-3b96-46c6-8ee0-3a468a8f04c8",
			"quantity": 1,
			"description": "Handgonne, .90",
			"tech_level": "3",
			"legality_class": "3",
			"value": "300",
			"weight": "15 lb",
			"reference": "B279",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "pi++",
						"base": "2d"
					},
					"strength": "10†",
					"accuracy": "0",
					"range": "100/600",
					"rate_of_fire": "1",
					"shots": "1(60)",
					"bulk": "-6",
					"recoil": "4",
					"calc": {
						"level": 0,
						"range": "100/600",
						"damage": "2d pi++"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Pistol",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Rifle",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Shotgun",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Light Machine Gun",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Submachine Gun",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Musket"
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Grenade Launcher",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Gyroc",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Light Anti-Armor Weapon",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Gun!"
						}
					]
				}
			],
			"calc": {
				"extended_value": "300",
				"extended_weight": "15 lb"
			},
			"categories": [
				"Missile Weapon"
			]
		},
		{
			"type": "equipment",
			"id": "ed89f78f-7c95-49b9-8482-36036c081382",
			"quantity": 1,
			"description": "Harpoon",
			"tech_level": "2",
			"value": "60",
			"weight": "6 lb",
			"reference": "B276",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "imp",
						"st": "thr",
						"base": "5"
					},
					"strength": "11",
					"accuracy": "2",
					"range": "x1/x1.5",
					"rate_of_fire": "1",
					"shots": "T(1)",
					"bulk": "-6",
					"calc": {
						"level": 0,
						"range": "x1/x1.5",
						"damage": "thr+5 imp"
					},
					"defaults": [
						{
							"type": "skill",
							"name": "Thrown Weapon (Harpoon)"
						},
						{
							"type": "dx",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Thrown Weapon (Spear)",
							"modifier": -2
						}
					]
				}
			],
			"calc": {
				"extended_value": "60",
				"extended_weight": "6 lb"
			},
			"categories": [
				"Missile Weapon"
			]
		},
		{
			"type": "equipment",
			"id": "4457ec84-19db-4141-8a8f-20133a3d46be",
			"quantity": 1,
			"description": "Hatchet",
			"tech_level": "0",
			"value": "40",
			"weight": "2 lb",
			"reference": "B271",
			"weapons": [
				{
					"type": "melee_weapon",
					"damage": {
						"type": "cut",
						"st": "sw"
					},
					"strength": "8",
					"usage": "Swung",
					"reach": "1",
					"parry": "0",
					"block": "No",
					"calc": {
						"level": 0,
						"parry": "0",
						"block": "No",
						"damage": "sw cut"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -5
						},
						{
							"type": "skill",
							"name": "Axe/Mace"
						},
						{
							"type": "skill",
							"name": "Flail",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Two-Handed Axe/Mace",
							"modifier": -3
						}
					]
				},
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "cut",
						"st": "sw"
					},
					"strength": "8",
					"usage": "Thrown",
					"accuracy": "1",
					"range": "x1.5/x2.5",
					"rate_of_fire": "1",
					"shots": "T(1)",
					"bulk": "-2",
					"calc": {
						"level": 0,
						"range": "x1.5/x2.5",
						"damage": "sw cut"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Thrown Weapon",
							"specialization": "Axe/Mace"
						}
					]
				}
			],
			"calc": {
				"extended_value": "40",
				"extended_weight": "2 lb"
			},
			"categories": [
				"Melee Weapon",
				"Missile Weapon"
			]
		},
		{
			"type": "equipment",
			"id": "c3611c98-4352-4b79-a111-3fc961eafa2f",
			"quantity": 1,
			"description": "Heavy Blaster",
			"tech_level": "11",
			"legality_class": "1",
			"value": "23000",
			"weight": "20 lb",
			"reference": "B280",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "burn",
						"base": "8d",
						"armor_divisor": 5
					},
					"strength": "10†",
					"accuracy": "10+4",
					"range": "900/2700",
					"rate_of_fire": "3",
					"shots": "90(5)",
					"bulk": "-6",
					"recoil": "1",
					"calc": {
						"level": 0,
						"range": "900/2700",
						"damage": "8d(5) burn"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Rifle",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Beam Weapons",
							"specialization": "Pistol",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Beam Weapons",
							"specialization": "Rifle"
						},
						{
							"type": "skill",
							"name": "Beam Weapons",
							"specialization": "Projector",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Gun!"
						}
					]
				}
			],
			"calc": {
				"extended_value": "23000",
				"extended_weight": "20 lb"
			},
			"categories": [
				"Missile Weapon"
			]
		},
		{
			"type": "equipment",
			"id": "50e8e714-f995-42f4-956d-b5d8392bb7cb",
			"quantity": 1,
			"description": "Heavy Cloak",
			"tech_level": "1",
			"value": "50",
			"weight": "5 lb",
			"reference": "B287",
			"weapons": [
				{
					"type": "melee_weapon",
					"damage": {
						"type": "-"
					},
					"strength": "-",
					"reach": "-",
					"parry": "No",
					"block": "+0",
					"calc": {
						"level": 0,
						"parry": "No",
						"block": "+0",
						"damage": "-"
					},
					"defaults": [
						{
							"type": "block",
							"name": "Cloak"
						}
					]
				},
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "Special"
					},
					"strength": "8",
					"usage": "Thrown",
					"accuracy": "+1",
					"range": "2",
					"rate_of_fire": "1",
					"shots": "T(1)",
					"bulk": "-6",
					"calc": {
						"level": 0,
						"range": "2",
						"damage": "Special"
					},
					"defaults": [
						{
							"type": "skill",
							"name": "Cloak"
						},
						{
							"type": "skill",
							"name": "Net",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Shield",
							"modifier": -4
						},
						{
							"type": "dx",
							"modifier": -5
						}
					]
				}
			],
			"calc": {
				"extended_value": "50",
				"extended_weight": "5 lb"
			},
			"features": [
				{
					"type": "attribute_bonus",
					"amount": 2,
					"attribute": "dodge"
				},
				{
					"type": "attribute_bonus",
					"amount": 2,
					"attribute": "parry"
				},
				{
					"type": "attribute_bonus",
					"amount": 2,
					"attribute": "block"
				}
			],
			"categories": [
				"Clothing"
			]
		},
		{
			"type": "equipment",
			"id": "66febf16-cf94-4a0e-bd0c-4c6a544b41c6",
			"quantity": 1,
			"description": "Heavy Gauntlets",
			"tech_level": "3",
			"legality_class": "3",
			"value": "250",
			"weight": "2.5 lb",
			"reference": "B284",
			"calc": {
				"extended_value": "250",
				"extended_weight": "2.5 lb"
			},
			"features": [
				{
					"type": "dr_bonus",
					"amount": 5,
					"location": "hand"
				}
			],
			"categories": [
				"Gloves"
			]
		},
		{
			"type": "equipment",
			"id": "9db42bcf-abb3-4f0c-8d87-34afee1f4337",
			"quantity": 1,
			"description": "Heavy Leather Leggings",
			"tech_level": "1",
			"value": "60",
			"weight": "4 lb",
			"reference": "B283",
			"calc": {
				"extended_value": "60",
				"extended_weight": "4 lb"
			},
			"features": [
				{
					"type": "dr_bonus",
					"amount": 2,
					"location": "leg"
				}
			],
			"categories": [
				"Limb Armor"
			]
		},
		{
			"type": "equipment",
			"id": "6267ead4-b298-497c-90b1-cd670c620ec9",
			"quantity": 1,
			"description": "Heavy Leather Sleeves",
			"tech_level": "1",
			"value": "50",
			"weight": "2 lb",
			"reference": "B283",
			"calc": {
				"extended_value": "50",
				"extended_weight": "2 lb"
			},
			"features": [
				{
					"type": "dr_bonus",
					"amount": 2,
					"location": "arm"
				}
			],
			"categories": [
				"Limb Armor"
			]
		},
		{
			"type": "equipment",
			"id": "684bc457-8d50-4c54-8b55-11bf11b25141",
			"quantity": 1,
			"description": "Heavy Plate Arms",
			"tech_level": "3",
			"legality_class": "3",
			"value": "1500",
			"weight": "20 lb",
			"reference": "B283",
			"calc": {
				"extended_value": "1500",
				"extended_weight": "20 lb"
			},
			"features": [
				{
					"type": "dr_bonus",
					"amount": 7,
					"location": "arm"
				}
			],
			"categories": [
				"Limb Armor"
			]
		},
		{
			"type": "equipment",
			"id": "90a0ca9a-ef32-499e-a1a4-c344de4db8eb",
			"quantity": 1,
			"description": "Heavy Plate Legs",
			"tech_level": "3",
			"legality_class": "3",
			"value": "1600",
			"weight": "25 lb",
			"reference": "B283",
			"calc": {
				"extended_value": "1600",
				"extended_weight": "25 lb"
			},
			"features": [
				{
					"type": "dr_bonus",
					"amount": 7,
					"location": "leg"
				}
			],
			"categories": [
				"Limb Armor"
			]
		},
		{
			"type": "equipment",
			"id": "113d8e6d-e03c-4391-bf4e-3e009423fcb0",
			"quantity": 1,
			"description": "Heavy Steel Corselet",
			"tech_level": "3",
			"legality_class": "3",
			"value": "2300",
			"weight": "45 lb",
			"reference": "B283",
			"calc": {
				"extended_value": "2300",
				"extended_weight": "45 lb"
			},
			"features": [
				{
					"type": "dr_bonus",
					"amount": 7,
					"location": "torso"
				},
				{
					"type": "dr_bonus",
					"amount": 7,
					"location": "vitals"
				},
				{
					"type": "dr_bonus",
					"amount": 7,
					"location": "groin"
				}
			],
			"categories": [
				"Body Armor"
			]
		},
		{
			"type": "equipment_container",
			"id": "07b1b097-414f-49da-92a2-4c62ddb3edb3",
			"description": "Hip Quiver",
			"tech_level": "0",
			"value": "15",
			"weight": "1 lb",
			"reference": "B289",
			"calc": {
				"extended_value": "15",
				"extended_weight": "1 lb"
			},
			"notes": "Holds 20 arrows or bolts",
			"categories": [
				"Weapon and Combat Accessories"
			],
			"open": true
		},
		{
			"type": "equipment",
			"id": "3c5af91b-05ff-4771-abe0-35a343618b6d",
			"quantity": 1,
			"description": "HMG, .50",
			"tech_level": "6",
			"legality_class": "1",
			"value": "14000",
			"weight": "116 lb",
			"reference": "B281",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "pi+",
						"base": "13d+1"
					},
					"strength": "20M†",
					"accuracy": "6",
					"range": "1800/7400",
					"rate_of_fire": "8!",
					"shots": "100(5)",
					"bulk": "-8",
					"recoil": "2",
					"calc": {
						"level": 0,
						"range": "1800/7400",
						"damage": "13d+1 pi+"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Gunner",
							"specialization": "Catapult",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Gunner",
							"specialization": "Beams",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Gunner",
							"specialization": "Cannon",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Gunner",
							"specialization": "Machine Gun"
						},
						{
							"type": "skill",
							"name": "Gunner",
							"specialization": "Rockets",
							"modifier": -4
						}
					]
				}
			],
			"calc": {
				"extended_value": "14000",
				"extended_weight": "116 lb"
			},
			"categories": [
				"Missile Weapon"
			]
		},
		{
			"type": "equipment",
			"id": "3bb7afd8-d0cf-433d-bdcb-f6fddd052970",
			"quantity": 1,
			"description": "Holdout Pistol, .380",
			"tech_level": "7",
			"legality_class": "3",
			"value": "300",
			"weight": "1.3 lb",
			"reference": "B278",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "pi",
						"base": "2d"
					},
					"strength": "8",
					"accuracy": "1",
					"range": "125/1500",
					"rate_of_fire": "3",
					"shots": "5+1(3)",
					"bulk": "-1",
					"recoil": "3",
					"calc": {
						"level": 0,
						"range": "125/1500",
						"damage": "2d pi"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Pistol"
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Rifle",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Shotgun",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Light Machine Gun",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Submachine Gun",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Musket",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Grenade Launcher",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Gyroc",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Light Anti-Armor Weapon",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Gun!"
						}
					]
				}
			],
			"calc": {
				"extended_value": "300",
				"extended_weight": "1.3 lb"
			},
			"categories": [
				"Missile Weapon"
			]
		},
		{
			"type": "equipment_container",
			"id": "1a0697ae-6be3-4a77-a114-5904d0005ea6",
			"description": "Holster, Belt",
			"tech_level": "5",
			"value": "25",
			"weight": "0.5 lb",
			"reference": "B289",
			"calc": {
				"extended_value": "25",
				"extended_weight": "0.5 lb"
			},
			"notes": "Fits most pistols",
			"categories": [
				"Weapon and Combat Accessories"
			],
			"open": true
		},
		{
			"type": "equipment_container",
			"id": "4cd595ae-1191-4ca0-88bf-bd8a3ea9c750",
			"description": "Holster, Shoulder",
			"tech_level": "5",
			"value": "50",
			"weight": "1 lb",
			"reference": "B289",
			"calc": {
				"extended_value": "50",
				"extended_weight": "1 lb"
			},
			"notes": "Allows use of Holdout, but gives -1 to Fast-Draw.",
			"categories": [
				"Weapon and Combat Accessories"
			],
			"open": true
		},
		{
			"type": "equipment",
			"id": "f5c96d68-c257-423c-8b81-d1b5d710271a",
			"quantity": 1,
			"description": "Homing Beacon",
			"tech_level": "7",
			"value": "40",
			"weight": "0 lb",
			"reference": "B289",
			"calc": {
				"extended_value": "40",
				"extended_weight": "0 lb"
			},
			"notes": "Scanner tracks at 1-mile range. 12 hrs.",
			"categories": [
				"Law-Enforcement",
				"Spy Gear",
				"Thief"
			]
		},
		{
			"type": "equipment",
			"id": "8adf841d-4c63-4769-9564-9fbb083b100d",
			"quantity": 1,
			"description": "Horseshoes, Set",
			"tech_level": "3",
			"value": "50",
			"weight": "4 lb",
			"reference": "B289",
			"calc": {
				"extended_value": "50",
				"extended_weight": "4 lb"
			},
			"notes": "Shod horses get +2 HT on any rolls for stamina on long rides",
			"categories": [
				"Equestrian Gear"
			]
		},
		{
			"type": "equipment",
			"id": "59b8a1ae-14f3-4bb2-a001-88b08133cb6b",
			"quantity": 1,
			"description": "ICW Integral, 25mm",
			"tech_level": "9",
			"value": "0",
			"weight": "0 lb",
			"reference": "B281",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "cr ex",
						"base": "7d",
						"fragmentation": "3d",
						"fragmentation_type": "cut"
					},
					"strength": "10",
					"usage": "Fragmentation",
					"accuracy": "4+2",
					"range": "2200",
					"rate_of_fire": "1",
					"shots": "3(3)",
					"bulk": "-",
					"recoil": "3",
					"calc": {
						"level": 0,
						"range": "2200",
						"damage": "7d cr ex [3d cut]"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Pistol",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Rifle",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Shotgun",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Light Machine Gun",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Submachine Gun",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Musket",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Grenade Launcher"
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Gyroc",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Light Anti-Armor Weapon",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Gun!"
						}
					]
				},
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "cr ex",
						"base": "4d"
					},
					"strength": "10",
					"usage": "Concussion",
					"accuracy": "4+2",
					"range": "2200",
					"rate_of_fire": "1",
					"shots": "3(3)",
					"bulk": "-",
					"recoil": "3",
					"calc": {
						"level": 0,
						"range": "2200",
						"damage": "4d cr ex"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Pistol",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Rifle",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Shotgun",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Light Machine Gun",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Submachine Gun",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Musket",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Grenade Launcher"
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Gyroc",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Light Anti-Armor Weapon",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Gun!"
						}
					]
				},
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "HT-5 aff (10 yd)"
					},
					"strength": "10",
					"usage": "Stun",
					"accuracy": "4+2",
					"range": "2200",
					"rate_of_fire": "1",
					"shots": "3(3)",
					"bulk": "-",
					"recoil": "3",
					"calc": {
						"level": 0,
						"range": "2200",
						"damage": "HT-5 aff (10 yd)"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Pistol",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Rifle",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Shotgun",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Light Machine Gun",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Submachine Gun",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Musket",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Grenade Launcher"
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Gyroc",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Light Anti-Armor Weapon",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Gun!"
						}
					]
				}
			],
			"calc": {
				"extended_value": "0",
				"extended_weight": "0 lb"
			},
			"categories": [
				"Missile Weapon"
			]
		},
		{
			"type": "equipment",
			"id": "23ad0ec1-8978-4a20-9452-c9101eb63126",
			"quantity": 1,
			"description": "ICW, 6.8mm",
			"tech_level": "9",
			"legality_class": "1",
			"value": "7000",
			"weight": "12 lb",
			"reference": "B279",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "pi",
						"base": "6d"
					},
					"strength": "10†",
					"accuracy": "4+2",
					"range": "700/4000",
					"rate_of_fire": "15",
					"shots": "25+1(3)",
					"bulk": "-5",
					"recoil": "2",
					"calc": {
						"level": 0,
						"range": "700/4000",
						"damage": "6d pi"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Pistol",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Rifle"
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Shotgun",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Light Machine Gun",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Submachine Gun",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Musket",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Grenade Launcher",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Gyroc",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Light Anti-Armor Weapon",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Gun!"
						}
					]
				}
			],
			"calc": {
				"extended_value": "7000",
				"extended_weight": "12 lb"
			},
			"categories": [
				"Missile Weapon"
			]
		},
		{
			"type": "equipment",
			"id": "fea91f4f-a428-4766-9cb1-b747c1fb8e91",
			"quantity": 1,
			"description": "Integral, 25mm",
			"tech_level": "9",
			"value": "0",
			"weight": "0 lb",
			"reference": "B281",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "cr ex",
						"base": "7d",
						"fragmentation": "3d",
						"fragmentation_type": "cut"
					},
					"strength": "10",
					"accuracy": "4+2",
					"range": "2200",
					"rate_of_fire": "1",
					"shots": "3(3)",
					"bulk": "-",
					"recoil": "3",
					"calc": {
						"level": 0,
						"range": "2200",
						"damage": "7d cr ex [3d cut]"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Pistol",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Rifle",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Shotgun",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Light Machine Gun",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Submachine Gun",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Musket",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Grenade Launcher"
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Gyroc",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Light Anti-Armor Weapon",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Gun!"
						}
					]
				}
			],
			"calc": {
				"extended_value": "0",
				"extended_weight": "0 lb"
			},
			"categories": [
				"Missile Weapon"
			]
		},
		{
			"type": "equipment",
			"id": "2a781e12-6166-41be-bf75-e676e1481117",
			"quantity": 1,
			"description": "Iron Spike/Piton",
			"tech_level": "2",
			"value": "1",
			"weight": "0.5 lb",
			"reference": "B288",
			"calc": {
				"extended_value": "1",
				"extended_weight": "0.5 lb"
			},
			"categories": [
				"Camping and Survival Gear"
			]
		},
		{
			"type": "equipment",
			"id": "61eb403c-be94-46e7-a9dc-904a8b5b2f28",
			"quantity": 1,
			"description": "Javelin",
			"tech_level": "1",
			"value": "30",
			"weight": "2 lb",
			"reference": "B273",
			"weapons": [
				{
					"type": "melee_weapon",
					"damage": {
						"type": "imp",
						"st": "thr",
						"base": "1"
					},
					"strength": "6",
					"usage": "Thrust",
					"reach": "1",
					"parry": "0",
					"block": "No",
					"calc": {
						"level": 0,
						"parry": "0",
						"block": "No",
						"damage": "thr+1 imp"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -5
						},
						{
							"type": "skill",
							"name": "Spear"
						},
						{
							"type": "skill",
							"name": "Polearm",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Staff",
							"modifier": -2
						}
					]
				},
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "imp",
						"st": "thr",
						"base": "1"
					},
					"strength": "6",
					"usage": "Thrown",
					"accuracy": "+3",
					"range": "x1.5/x2.5",
					"rate_of_fire": "1",
					"shots": "T(1)",
					"bulk": "-4",
					"calc": {
						"level": 0,
						"range": "x1.5/x2.5",
						"damage": "thr+1 imp"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Thrown Weapon",
							"specialization": "Spear"
						},
						{
							"type": "skill",
							"name": "Spear Thrower",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Thrown Weapon",
							"specialization": "Harpoon",
							"modifier": -2
						}
					]
				}
			],
			"calc": {
				"extended_value": "30",
				"extended_weight": "2 lb"
			},
			"categories": [
				"AmmoType:Javelin",
				"Melee Weapon",
				"Missile Weapon"
			]
		},
		{
			"type": "equipment",
			"id": "bf30e156-eea6-44d7-b2d4-336e610abc0a",
			"quantity": 1,
			"description": "Katana",
			"tech_level": "3",
			"value": "650",
			"weight": "5 lb",
			"reference": "B271",
			"weapons": [
				{
					"type": "melee_weapon",
					"damage": {
						"type": "cut",
						"st": "sw",
						"base": "1"
					},
					"strength": "11",
					"usage": "Swung",
					"usage_notes": "1-handed",
					"reach": "1,2",
					"parry": "0",
					"block": "No",
					"calc": {
						"level": 0,
						"parry": "0",
						"block": "No",
						"damage": "sw+1 cut"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -5
						},
						{
							"type": "skill",
							"name": "Force Sword",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Broadsword"
						},
						{
							"type": "skill",
							"name": "Rapier",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Saber",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Shortsword",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Two-Handed Sword",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Sword!"
						}
					]
				},
				{
					"type": "melee_weapon",
					"damage": {
						"type": "imp",
						"st": "thr",
						"base": "1"
					},
					"strength": "11",
					"usage": "Thrust",
					"usage_notes": "1-handed",
					"reach": "1",
					"parry": "0",
					"block": "No",
					"calc": {
						"level": 0,
						"parry": "0",
						"block": "No",
						"damage": "thr+1 imp"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -5
						},
						{
							"type": "skill",
							"name": "Force Sword",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Broadsword"
						},
						{
							"type": "skill",
							"name": "Rapier",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Saber",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Shortsword",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Two-Handed Sword",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Sword!"
						}
					]
				},
				{
					"type": "melee_weapon",
					"damage": {
						"type": "cut",
						"st": "sw",
						"base": "2"
					},
					"strength": "10†",
					"usage": "Swung",
					"usage_notes": "2-handed",
					"reach": "1,2",
					"parry": "0",
					"block": "No",
					"calc": {
						"level": 0,
						"parry": "0",
						"block": "No",
						"damage": "sw+2 cut"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -5
						},
						{
							"type": "skill",
							"name": "Two-Handed Sword"
						},
						{
							"type": "skill",
							"name": "Broadsword",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Force Sword",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Sword!"
						}
					]
				},
				{
					"type": "melee_weapon",
					"damage": {
						"type": "imp",
						"st": "thr",
						"base": "1"
					},
					"strength": "10†",
					"usage": "Thrust",
					"usage_notes": "2-handed",
					"reach": "1",
					"parry": "0",
					"block": "No",
					"calc": {
						"level": 0,
						"parry": "0",
						"block": "No",
						"damage": "thr+1 imp"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -5
						},
						{
							"type": "skill",
							"name": "Two-Handed Sword"
						},
						{
							"type": "skill",
							"name": "Broadsword",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Force Sword",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Sword!"
						}
					]
				}
			],
			"calc": {
				"extended_value": "650",
				"extended_weight": "5 lb"
			},
			"categories": [
				"Melee Weapon"
			]
		},
		{
			"type": "equipment",
			"id": "d7487b63-258b-4021-8619-6de51fc18e6a",
			"quantity": 1,
			"description": "Kerosene, 1 Gallon",
			"tech_level": "6",
			"value": "2",
			"weight": "6 lb",
			"reference": "B288",
			"calc": {
				"extended_value": "2",
				"extended_weight": "6 lb"
			},
			"categories": [
				"Camping and Survival Gear"
			]
		},
		{
			"type": "equipment",
			"id": "9632779b-3134-48e8-b5e8-e9b680445854",
			"quantity": 1,
			"description": "Knitting Needles, Pair",
			"tech_level": "3",
			"value": "5",
			"weight": "0 lb",
			"reference": "B289",
			"calc": {
				"extended_value": "5",
				"extended_weight": "0 lb"
			},
			"categories": [
				"Tools"
			]
		},
		{
			"type": "equipment",
			"id": "86e87c95-914a-48d6-b8b7-996e20062c44",
			"quantity": 1,
			"description": "Kusari",
			"tech_level": "3",
			"value": "70",
			"weight": "5 lb",
			"reference": "B272",
			"weapons": [
				{
					"type": "melee_weapon",
					"damage": {
						"type": "cr",
						"st": "sw",
						"base": "2"
					},
					"strength": "11",
					"usage": "Swung",
					"reach": "1-4*",
					"parry": "-2U",
					"block": "No",
					"calc": {
						"level": 0,
						"parry": "-2U",
						"block": "No",
						"damage": "sw+2 cr"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -6
						},
						{
							"type": "skill",
							"name": "Kusari"
						},
						{
							"type": "skill",
							"name": "Monowire Whip",
							"modifier": -3
						},
						{
							"type": "skill",
							"name": "Two-Handed Flail",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Whip",
							"modifier": -3
						}
					]
				}
			],
			"calc": {
				"extended_value": "70",
				"extended_weight": "5 lb"
			},
			"categories": [
				"Melee Weapon"
			]
		},
		{
			"type": "equipment",
			"id": "21b11a47-5ad1-40b9-a192-91d29fa076a0",
			"quantity": 1,
			"description": "Lance",
			"tech_level": "2",
			"value": "60",
			"weight": "6 lb",
			"reference": "B272",
			"weapons": [
				{
					"type": "melee_weapon",
					"damage": {
						"type": "imp",
						"st": "thr",
						"base": "3"
					},
					"strength": "12",
					"usage": "Thrust",
					"reach": "4",
					"parry": "No",
					"block": "No",
					"calc": {
						"level": 0,
						"parry": "No",
						"block": "No",
						"damage": "thr+3 imp"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -5
						},
						{
							"type": "skill",
							"name": "Spear",
							"modifier": -3
						},
						{
							"type": "skill",
							"name": "Lance"
						}
					]
				}
			],
			"calc": {
				"extended_value": "60",
				"extended_weight": "6 lb"
			},
			"categories": [
				"Melee Weapon"
			]
		},
		{
			"type": "equipment",
			"id": "055d90d4-f642-41cd-9e52-5d60402b723e",
			"quantity": 1,
			"description": "Lantern",
			"tech_level": "2",
			"value": "20",
			"weight": "2 lb",
			"reference": "B288",
			"calc": {
				"extended_value": "20",
				"extended_weight": "2 lb"
			},
			"notes": "Uses 1 pint of oil per 24 hours",
			"categories": [
				"Camping and Survival Gear"
			]
		},
		{
			"type": "equipment_container",
			"id": "0c0d9c88-a69c-4159-a3b9-4bb99de0ba59",
			"description": "Lanyard, Leather",
			"tech_level": "0",
			"value": "1",
			"weight": "0 lb",
			"reference": "B289",
			"calc": {
				"extended_value": "1",
				"extended_weight": "0 lb"
			},
			"notes": "Lets you retrieve a dropped weapon on a DX roll. Each attempt requires a Ready maneuver. Can be cut: -6 to hit, DR 2, HP 2.",
			"categories": [
				"Weapon and Combat Accessories"
			],
			"open": true
		},
		{
			"type": "equipment_container",
			"id": "95520baa-147d-4630-aa8a-272216e2760f",
			"description": "Lanyard, Woven Steel",
			"tech_level": "6",
			"value": "15",
			"weight": "0 lb",
			"reference": "B289",
			"calc": {
				"extended_value": "15",
				"extended_weight": "0 lb"
			},
			"notes": "Lets you retrieve a dropped weapon on a DX roll. Each attempt requires a Ready maneuver. Can be cut: -6 to hit, DR 6, HP 4.",
			"categories": [
				"Weapon and Combat Accessories"
			],
			"open": true
		},
		{
			"type": "equipment",
			"id": "193b1213-5db9-4a69-a876-c7e16027188f",
			"quantity": 1,
			"description": "Large Knife",
			"tech_level": "0",
			"value": "40",
			"weight": "1 lb",
			"reference": "B272",
			"weapons": [
				{
					"type": "melee_weapon",
					"damage": {
						"type": "cut",
						"st": "sw",
						"base": "-2"
					},
					"strength": "6",
					"usage": "Swung",
					"reach": "C,1",
					"parry": "-1",
					"block": "No",
					"calc": {
						"level": 0,
						"parry": "-1",
						"block": "No",
						"damage": "sw-2 cut"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Knife"
						},
						{
							"type": "skill",
							"name": "Force Sword",
							"modifier": -3
						},
						{
							"type": "skill",
							"name": "Main-Gauche",
							"modifier": -3
						},
						{
							"type": "skill",
							"name": "Shortsword",
							"modifier": -3
						},
						{
							"type": "skill",
							"name": "Sword!"
						}
					]
				},
				{
					"type": "melee_weapon",
					"damage": {
						"type": "imp",
						"st": "thr"
					},
					"strength": "6",
					"usage": "Thrust",
					"reach": "C",
					"parry": "-1",
					"block": "No",
					"calc": {
						"level": 0,
						"parry": "-1",
						"block": "No",
						"damage": "thr imp"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Knife"
						},
						{
							"type": "skill",
							"name": "Force Sword",
							"modifier": -3
						},
						{
							"type": "skill",
							"name": "Main-Gauche",
							"modifier": -3
						},
						{
							"type": "skill",
							"name": "Shortsword",
							"modifier": -3
						},
						{
							"type": "skill",
							"name": "Sword!"
						}
					]
				},
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "imp",
						"st": "thr"
					},
					"strength": "6",
					"usage": "Thrown",
					"accuracy": "+0",
					"range": "x0.8/x1.5",
					"rate_of_fire": "1",
					"shots": "T(1)",
					"bulk": "-2",
					"calc": {
						"level": 0,
						"range": "x0.8/x1.5",
						"damage": "thr imp"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Thrown Weapon",
							"specialization": "Knife"
						}
					]
				}
			],
			"calc": {
				"extended_value": "40",
				"extended_weight": "1 lb"
			},
			"categories": [
				"Melee Weapon",
				"Missile Weapon"
			]
		},
		{
			"type": "equipment",
			"id": "dcd6a7b3-c390-48eb-a853-fdd4f97126df",
			"quantity": 1,
			"description": "Large Net",
			"tech_level": "0",
			"value": "40",
			"weight": "20 lb",
			"reference": "B276",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "see B411"
					},
					"strength": "11",
					"accuracy": "1",
					"range": "spec",
					"rate_of_fire": "1",
					"shots": "T(1)",
					"bulk": "-6",
					"calc": {
						"level": 0,
						"range": "spec",
						"damage": "see B411"
					},
					"defaults": [
						{
							"type": "skill",
							"name": "Net"
						},
						{
							"type": "skill",
							"name": "Cloak",
							"modifier": -5
						}
					]
				}
			],
			"calc": {
				"extended_value": "40",
				"extended_weight": "20 lb"
			},
			"categories": [
				"Missile Weapon"
			]
		},
		{
			"type": "equipment",
			"id": "e668e0a6-1ac3-45ec-96ce-ba7e49f51d84",
			"quantity": 1,
			"description": "Large Shield",
			"tech_level": "1",
			"value": "90",
			"weight": "25 lb",
			"reference": "B287",
			"weapons": [
				{
					"type": "melee_weapon",
					"damage": {
						"type": "cr",
						"st": "thr"
					},
					"strength": "0",
					"usage": "Shield Bash",
					"reach": "1",
					"parry": "No",
					"block": "+0",
					"calc": {
						"level": 0,
						"parry": "No",
						"block": "+0",
						"damage": "thr cr"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Shield",
							"specialization": "Buckler",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Shield",
							"specialization": "Force Shield",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Shield",
							"specialization": "Shield"
						}
					]
				}
			],
			"calc": {
				"extended_value": "90",
				"extended_weight": "25 lb"
			},
			"features": [
				{
					"type": "attribute_bonus",
					"amount": 3,
					"attribute": "dodge"
				},
				{
					"type": "attribute_bonus",
					"amount": 3,
					"attribute": "parry"
				},
				{
					"type": "attribute_bonus",
					"amount": 3,
					"attribute": "block"
				}
			],
			"categories": [
				"Shield"
			]
		},
		{
			"type": "equipment",
			"id": "9e94c02a-71bb-454b-b6f6-4f1876f509d9",
			"quantity": 1,
			"description": "Large Shield with Spike",
			"tech_level": "1",
			"value": "110",
			"weight": "30 lb",
			"reference": "B287",
			"weapons": [
				{
					"type": "melee_weapon",
					"damage": {
						"type": "cr",
						"st": "thr",
						"base": "1"
					},
					"strength": "0",
					"usage": "Shield Bash",
					"reach": "1",
					"parry": "No",
					"block": "+0",
					"calc": {
						"level": 0,
						"parry": "No",
						"block": "+0",
						"damage": "thr+1 cr"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Shield",
							"specialization": "Buckler",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Shield",
							"specialization": "Force Shield",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Shield",
							"specialization": "Shield"
						}
					]
				}
			],
			"calc": {
				"extended_value": "110",
				"extended_weight": "30 lb"
			},
			"features": [
				{
					"type": "attribute_bonus",
					"amount": 3,
					"attribute": "dodge"
				},
				{
					"type": "attribute_bonus",
					"amount": 3,
					"attribute": "parry"
				},
				{
					"type": "attribute_bonus",
					"amount": 3,
					"attribute": "block"
				}
			],
			"categories": [
				"Shield"
			]
		},
		{
			"type": "equipment",
			"id": "1bba6454-ce3a-4e08-9af6-7546c199a7a2",
			"quantity": 1,
			"description": "Lariat",
			"tech_level": "1",
			"value": "40",
			"weight": "3 lb",
			"reference": "B276",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "see B411"
					},
					"strength": "7†",
					"accuracy": "0",
					"range": "spec",
					"rate_of_fire": "1",
					"shots": "T(spec)",
					"bulk": "-2",
					"calc": {
						"level": 0,
						"range": "spec",
						"damage": "see B411"
					},
					"defaults": [
						{
							"type": "skill",
							"name": "Lasso"
						}
					]
				}
			],
			"calc": {
				"extended_value": "40",
				"extended_weight": "3 lb"
			},
			"categories": [
				"Missile Weapon"
			]
		},
		{
			"type": "equipment",
			"id": "14a17acf-4a2f-443a-920f-fff7236893f0",
			"quantity": 1,
			"description": "Laser Microphone",
			"tech_level": "8",
			"value": "500",
			"weight": "2 lb",
			"reference": "B289",
			"calc": {
				"extended_value": "500",
				"extended_weight": "2 lb"
			},
			"notes": "Eavesdrop through glass. 300-yd. range.",
			"categories": [
				"Law-Enforcement",
				"Spy Gear",
				"Thief"
			]
		},
		{
			"type": "equipment",
			"id": "41b3444c-9a26-46c5-ba78-5612c6cbca8c",
			"quantity": 1,
			"description": "Laser Pistol",
			"tech_level": "10",
			"legality_class": "3",
			"value": "2800",
			"weight": "3.3 lb",
			"reference": "B280",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "burn",
						"base": "3d",
						"armor_divisor": 2
					},
					"strength": "6",
					"accuracy": "6",
					"range": "250/750",
					"rate_of_fire": "10",
					"shots": "400(3)",
					"bulk": "-2",
					"recoil": "1",
					"calc": {
						"level": 0,
						"range": "250/750",
						"damage": "3d(2) burn"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Pistol",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Beam Weapons",
							"specialization": "Pistol"
						},
						{
							"type": "skill",
							"name": "Beam Weapons",
							"specialization": "Rifle",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Beam Weapons",
							"specialization": "Projector",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Gun!"
						}
					]
				}
			],
			"calc": {
				"extended_value": "2800",
				"extended_weight": "3.3 lb"
			},
			"categories": [
				"Missile Weapon"
			]
		},
		{
			"type": "equipment",
			"id": "7fec071c-716e-4831-92bf-90cdd4238765",
			"quantity": 1,
			"description": "Laser Rifle",
			"tech_level": "10",
			"legality_class": "2",
			"value": "10000",
			"weight": "10 lb",
			"reference": "B280",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "burn",
						"base": "5d",
						"armor_divisor": 2
					},
					"strength": "7†",
					"accuracy": "12+2",
					"range": "700/2100",
					"rate_of_fire": "10",
					"shots": "150(3)",
					"bulk": "-4",
					"recoil": "1",
					"calc": {
						"level": 0,
						"range": "700/2100",
						"damage": "5d(2) burn"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Rifle",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Beam Weapons",
							"specialization": "Pistol",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Beam Weapons",
							"specialization": "Rifle"
						},
						{
							"type": "skill",
							"name": "Beam Weapons",
							"specialization": "Projector",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Gun!"
						}
					]
				}
			],
			"calc": {
				"extended_value": "10000",
				"extended_weight": "10 lb"
			},
			"categories": [
				"Missile Weapon"
			]
		},
		{
			"type": "equipment",
			"id": "8bee3f09-78f3-47d4-bef5-a84a23fa0074",
			"quantity": 1,
			"description": "Laser Sight",
			"tech_level": "8",
			"value": "100",
			"weight": "0 lb",
			"reference": "B289",
			"calc": {
				"extended_value": "100",
				"extended_weight": "0 lb"
			},
			"notes": "+1 to skill; see Laser Sights (B412). 6 hrs.",
			"categories": [
				"Weapon and Combat Accessories"
			]
		},
		{
			"type": "equipment",
			"id": "42d9e464-801a-429b-8a8c-d2d6467baad0",
			"quantity": 1,
			"description": "Laser Sniper Rifle",
			"tech_level": "9",
			"legality_class": "1",
			"value": "20000",
			"weight": "20 lb",
			"reference": "B280",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "burn",
						"base": "5d",
						"armor_divisor": 2
					},
					"strength": "10†",
					"accuracy": "12+2",
					"range": "1100/3300",
					"rate_of_fire": "3",
					"shots": "75(3)",
					"bulk": "-8",
					"recoil": "1",
					"calc": {
						"level": 0,
						"range": "1100/3300",
						"damage": "5d(2) burn"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Rifle",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Beam Weapons",
							"specialization": "Pistol",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Beam Weapons",
							"specialization": "Rifle"
						},
						{
							"type": "skill",
							"name": "Beam Weapons",
							"specialization": "Projector",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Gun!"
						}
					]
				}
			],
			"calc": {
				"extended_value": "20000",
				"extended_weight": "20 lb"
			},
			"categories": [
				"Missile Weapon"
			]
		},
		{
			"type": "equipment",
			"id": "731ecabc-94b5-4dad-9b17-e7dac2655624",
			"quantity": 1,
			"description": "LAW, 84mm",
			"tech_level": "8",
			"legality_class": "1",
			"value": "750",
			"weight": "14.7 lb",
			"reference": "B281",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "cr ex",
						"base": "6dx6",
						"armor_divisor": 10
					},
					"strength": "10†",
					"accuracy": "3",
					"range": "330/2300",
					"rate_of_fire": "1",
					"shots": "1(-)",
					"bulk": "-5",
					"recoil": "1",
					"calc": {
						"level": 0,
						"range": "330/2300",
						"damage": "6dx6(10) cr ex"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Pistol",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Rifle",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Shotgun",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Light Machine Gun",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Submachine Gun",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Musket",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Grenade Launcher",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Gyroc",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Light Anti-Armor Weapon"
						},
						{
							"type": "skill",
							"name": "Gun!"
						}
					]
				}
			],
			"calc": {
				"extended_value": "750",
				"extended_weight": "14.7 lb"
			},
			"categories": [
				"Missile Weapon"
			]
		},
		{
			"type": "equipment",
			"id": "8da53d73-c624-4f33-b9e8-30c3ed64d63e",
			"quantity": 1,
			"description": "Lead Pellet (Prodd)",
			"tech_level": "2",
			"value": "0.1",
			"weight": "0.06 lb",
			"reference": "B276",
			"calc": {
				"extended_value": "0.1",
				"extended_weight": "0.06 lb"
			},
			"categories": [
				"AmmoType:Prodd",
				"Ammunition",
				"Missile Weapon"
			]
		},
		{
			"type": "equipment",
			"id": "efcbbdf2-431b-4388-a2d7-2e003eb341a6",
			"quantity": 1,
			"description": "Lead Pellet (Sling)",
			"tech_level": "2",
			"value": "0.1",
			"weight": "0.05 lb",
			"reference": "B276",
			"calc": {
				"extended_value": "0.1",
				"extended_weight": "0.05 lb"
			},
			"notes": "Gives +1 damage, double range",
			"categories": [
				"AmmoType:Sling",
				"Ammunition",
				"Missile Weapon"
			]
		},
		{
			"type": "equipment",
			"id": "adb76193-a473-4869-bf41-8b59186700bb",
			"quantity": 1,
			"description": "Leather Armor",
			"tech_level": "1",
			"value": "100",
			"weight": "10 lb",
			"reference": "B283",
			"calc": {
				"extended_value": "100",
				"extended_weight": "10 lb"
			},
			"features": [
				{
					"type": "dr_bonus",
					"amount": 2,
					"location": "torso"
				},
				{
					"type": "dr_bonus",
					"amount": 2,
					"location": "vitals"
				},
				{
					"type": "dr_bonus",
					"amount": 2,
					"location": "groin"
				}
			],
			"categories": [
				"Body Armor"
			]
		},
		{
			"type": "equipment",
			"id": "d63ed2a8-bb6f-48fc-85d9-a153f9d4f209",
			"quantity": 1,
			"description": "Leather Cap",
			"tech_level": "1",
			"value": "32",
			"weight": "0 lb",
			"reference": "B284",
			"calc": {
				"extended_value": "32",
				"extended_weight": "0 lb"
			},
			"features": [
				{
					"type": "dr_bonus",
					"amount": 1,
					"location": "skull"
				}
			],
			"notes": "Flexible",
			"categories": [
				"Headgear"
			]
		},
		{
			"type": "equipment",
			"id": "61adda9f-0e5d-4b9f-850c-10af2bd8de70",
			"quantity": 1,
			"description": "Leather Gloves",
			"tech_level": "1",
			"value": "30",
			"weight": "0 lb",
			"reference": "B284",
			"calc": {
				"extended_value": "30",
				"extended_weight": "0 lb"
			},
			"features": [
				{
					"type": "dr_bonus",
					"amount": 2,
					"location": "hand"
				}
			],
			"notes": "Flexible",
			"categories": [
				"Gloves"
			]
		},
		{
			"type": "equipment",
			"id": "c59c7612-9b24-48ea-930c-1dc1a1561f37",
			"quantity": 1,
			"description": "Leather Helm",
			"tech_level": "1",
			"value": "20",
			"weight": "0.5 lb",
			"reference": "B284",
			"calc": {
				"extended_value": "20",
				"extended_weight": "0.5 lb"
			},
			"features": [
				{
					"type": "dr_bonus",
					"amount": 2,
					"location": "skull"
				},
				{
					"type": "dr_bonus",
					"amount": 2,
					"location": "face"
				}
			],
			"categories": [
				"Headgear"
			]
		},
		{
			"type": "equipment",
			"id": "d9004e6a-a9d3-4157-9593-514a7490f757",
			"quantity": 1,
			"description": "Leather Jacket",
			"tech_level": "1",
			"value": "50",
			"weight": "4 lb",
			"reference": "B283",
			"calc": {
				"extended_value": "50",
				"extended_weight": "4 lb"
			},
			"features": [
				{
					"type": "dr_bonus",
					"amount": 1,
					"location": "torso"
				},
				{
					"type": "dr_bonus",
					"amount": 1,
					"location": "vitals"
				},
				{
					"type": "dr_bonus",
					"amount": 1,
					"location": "arm"
				}
			],
			"notes": "Flexible, concealable",
			"categories": [
				"Body Armor"
			]
		},
		{
			"type": "equipment",
			"id": "45f62c17-563d-44fd-89b6-ebf101a622bc",
			"quantity": 1,
			"description": "Leather Leggings",
			"tech_level": "1",
			"value": "40",
			"weight": "2 lb",
			"reference": "B283",
			"calc": {
				"extended_value": "40",
				"extended_weight": "2 lb"
			},
			"features": [
				{
					"type": "dr_bonus",
					"amount": 1,
					"location": "leg"
				}
			],
			"notes": "Flexible, concealable",
			"categories": [
				"Limb Armor"
			]
		},
		{
			"type": "equipment",
			"id": "a761b2e6-2181-478b-a212-6bb41f7d5fa6",
			"quantity": 1,
			"description": "Leather Pants",
			"tech_level": "1",
			"value": "40",
			"weight": "3 lb",
			"reference": "B283",
			"calc": {
				"extended_value": "40",
				"extended_weight": "3 lb"
			},
			"features": [
				{
					"type": "dr_bonus",
					"amount": 1,
					"location": "groin"
				},
				{
					"type": "dr_bonus",
					"amount": 1,
					"location": "leg"
				}
			],
			"notes": "Flexible, concealable",
			"categories": [
				"Limb Armor"
			]
		},
		{
			"type": "equipment",
			"id": "82e9c394-d65e-42d1-85ea-7fcca4a81184",
			"quantity": 1,
			"description": "Legionary Helmet",
			"tech_level": "2",
			"legality_class": "3",
			"value": "150",
			"weight": "6 lb",
			"reference": "B284",
			"calc": {
				"extended_value": "150",
				"extended_weight": "6 lb"
			},
			"features": [
				{
					"type": "dr_bonus",
					"amount": 4,
					"location": "skull"
				},
				{
					"type": "dr_bonus",
					"amount": 4,
					"location": "face"
				}
			],
			"categories": [
				"Headgear"
			]
		},
		{
			"type": "equipment",
			"id": "4dc07041-259a-4990-9ec1-138f46fd257e",
			"quantity": 1,
			"description": "Lever-Action Carbine, .30",
			"tech_level": "5",
			"legality_class": "3",
			"value": "300",
			"weight": "7 lb",
			"reference": "B279",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "pi",
						"base": "5d"
					},
					"strength": "10†",
					"accuracy": "4",
					"range": "450/3000",
					"rate_of_fire": "1",
					"shots": "6+1(3i)",
					"bulk": "-4",
					"recoil": "2",
					"calc": {
						"level": 0,
						"range": "450/3000",
						"damage": "5d pi"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Pistol",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Rifle"
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Shotgun",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Light Machine Gun",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Submachine Gun",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Musket",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Grenade Launcher",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Gyroc",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Light Anti-Armor Weapon",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Gun!"
						}
					]
				}
			],
			"calc": {
				"extended_value": "300",
				"extended_weight": "7 lb"
			},
			"categories": [
				"Missile Weapon"
			]
		},
		{
			"type": "equipment",
			"id": "1faaa7ba-267d-4ded-a03f-ff851c52942f",
			"quantity": 1,
			"description": "Life Jacket",
			"tech_level": "6",
			"value": "100",
			"weight": "6 lb",
			"reference": "B288",
			"calc": {
				"extended_value": "100",
				"extended_weight": "6 lb"
			},
			"notes": "Floats up to 350 lbs.",
			"categories": [
				"Camping and Survival Gear"
			]
		},
		{
			"type": "equipment",
			"id": "b4a0a0dd-cad1-4b46-ad4d-50c0c87e35c4",
			"quantity": 1,
			"description": "Light Buckler",
			"tech_level": "1",
			"value": "25",
			"weight": "2 lb",
			"reference": "B287",
			"weapons": [
				{
					"type": "melee_weapon",
					"damage": {
						"type": "cr",
						"st": "thr"
					},
					"strength": "0",
					"reach": "1",
					"parry": "No",
					"block": "+0",
					"calc": {
						"level": 0,
						"parry": "No",
						"block": "+0",
						"damage": "thr cr"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Shield",
							"specialization": "Shield",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Shield",
							"specialization": "Force Shield",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Shield",
							"specialization": "Buckler"
						}
					]
				}
			],
			"calc": {
				"extended_value": "25",
				"extended_weight": "2 lb"
			},
			"features": [
				{
					"type": "attribute_bonus",
					"amount": 1,
					"attribute": "dodge"
				},
				{
					"type": "attribute_bonus",
					"amount": 1,
					"attribute": "parry"
				},
				{
					"type": "attribute_bonus",
					"amount": 1,
					"attribute": "block"
				}
			],
			"categories": [
				"Shield"
			]
		},
		{
			"type": "equipment",
			"id": "25023e6a-7512-456b-8f37-5167956f80b9",
			"quantity": 1,
			"description": "Light Buckler with Spike",
			"tech_level": "1",
			"value": "45",
			"weight": "7 lb",
			"reference": "B287",
			"weapons": [
				{
					"type": "melee_weapon",
					"damage": {
						"type": "cr",
						"st": "thr",
						"base": "1"
					},
					"strength": "0",
					"reach": "1",
					"parry": "No",
					"block": "+0",
					"calc": {
						"level": 0,
						"parry": "No",
						"block": "+0",
						"damage": "thr+1 cr"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Shield",
							"specialization": "Shield",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Shield",
							"specialization": "Force Shield",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Shield",
							"specialization": "Buckler"
						}
					]
				}
			],
			"calc": {
				"extended_value": "45",
				"extended_weight": "7 lb"
			},
			"features": [
				{
					"type": "attribute_bonus",
					"amount": 1,
					"attribute": "dodge"
				},
				{
					"type": "attribute_bonus",
					"amount": 1,
					"attribute": "parry"
				},
				{
					"type": "attribute_bonus",
					"amount": 1,
					"attribute": "block"
				}
			],
			"categories": [
				"Shield"
			]
		},
		{
			"type": "equipment",
			"id": "9897dd28-709a-41ed-be47-244b9d6b663a",
			"quantity": 1,
			"description": "Light Cloak",
			"tech_level": "1",
			"value": "20",
			"weight": "2 lb",
			"reference": "B287",
			"weapons": [
				{
					"type": "melee_weapon",
					"damage": {
						"type": "-"
					},
					"strength": "-",
					"reach": "-",
					"parry": "No",
					"block": "+0",
					"calc": {
						"level": 0,
						"parry": "No",
						"block": "+0",
						"damage": "-"
					},
					"defaults": [
						{
							"type": "block",
							"name": "Cloak"
						}
					]
				},
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "Special"
					},
					"strength": "5",
					"usage": "Thrown",
					"accuracy": "+1",
					"range": "2",
					"rate_of_fire": "1",
					"shots": "T(1)",
					"bulk": "-4",
					"calc": {
						"level": 0,
						"range": "2",
						"damage": "Special"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -5
						},
						{
							"type": "skill",
							"name": "Cloak"
						},
						{
							"type": "skill",
							"name": "Net",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Shield",
							"modifier": -4
						}
					]
				}
			],
			"calc": {
				"extended_value": "20",
				"extended_weight": "2 lb"
			},
			"features": [
				{
					"type": "attribute_bonus",
					"amount": 1,
					"attribute": "dodge"
				},
				{
					"type": "attribute_bonus",
					"amount": 1,
					"attribute": "parry"
				},
				{
					"type": "attribute_bonus",
					"amount": 1,
					"attribute": "block"
				}
			],
			"categories": [
				"Clothing"
			]
		},
		{
			"type": "equipment",
			"id": "4fe16008-c0e5-453b-b6de-ab2d47678dd0",
			"quantity": 1,
			"description": "Light Club",
			"tech_level": "0",
			"value": "5",
			"weight": "3 lb",
			"reference": "B271",
			"weapons": [
				{
					"type": "melee_weapon",
					"damage": {
						"type": "cr",
						"st": "sw",
						"base": "1"
					},
					"strength": "10",
					"usage": "Swung",
					"reach": "1",
					"parry": "0",
					"block": "No",
					"calc": {
						"level": 0,
						"parry": "0",
						"block": "No",
						"damage": "sw+1 cr"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -5
						},
						{
							"type": "skill",
							"name": "Force Sword",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Broadsword"
						},
						{
							"type": "skill",
							"name": "Rapier",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Saber",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Shortsword",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Two-Handed Sword",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Sword!"
						}
					]
				},
				{
					"type": "melee_weapon",
					"damage": {
						"type": "cr",
						"st": "thr",
						"base": "1"
					},
					"strength": "10",
					"usage": "Thrust",
					"reach": "1",
					"parry": "0",
					"block": "No",
					"calc": {
						"level": 0,
						"parry": "0",
						"block": "No",
						"damage": "thr+1 cr"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -5
						},
						{
							"type": "skill",
							"name": "Force Sword",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Broadsword"
						},
						{
							"type": "skill",
							"name": "Rapier",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Saber",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Shortsword",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Two-Handed Sword",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Sword!"
						}
					]
				}
			],
			"calc": {
				"extended_value": "5",
				"extended_weight": "3 lb"
			},
			"categories": [
				"Melee Weapon"
			]
		},
		{
			"type": "equipment",
			"id": "84b24820-ffec-4e27-9d24-9bf1841cd712",
			"quantity": 1,
			"description": "Light Scale Armor",
			"tech_level": "2",
			"value": "150",
			"weight": "15 lb",
			"reference": "B283",
			"calc": {
				"extended_value": "150",
				"extended_weight": "15 lb"
			},
			"features": [
				{
					"type": "dr_bonus",
					"amount": 3,
					"location": "torso"
				},
				{
					"type": "dr_bonus",
					"amount": 3,
					"location": "vitals"
				}
			],
			"categories": [
				"Body Armor"
			]
		},
		{
			"type": "equipment",
			"id": "14db8275-310b-447c-9902-91bd888797a7",
			"quantity": 1,
			"description": "Light Shield",
			"tech_level": "1",
			"value": "25",
			"weight": "2 lb",
			"reference": "B287",
			"weapons": [
				{
					"type": "melee_weapon",
					"damage": {
						"type": "cr",
						"st": "thr"
					},
					"strength": "0",
					"usage": "Shield Bash",
					"reach": "1",
					"parry": "No",
					"block": "+0",
					"calc": {
						"level": 0,
						"parry": "No",
						"block": "+0",
						"damage": "thr cr"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Shield",
							"specialization": "Buckler",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Shield",
							"specialization": "Force Shield",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Shield",
							"specialization": "Shield"
						}
					]
				}
			],
			"calc": {
				"extended_value": "25",
				"extended_weight": "2 lb"
			},
			"features": [
				{
					"type": "attribute_bonus",
					"amount": 1,
					"attribute": "dodge"
				},
				{
					"type": "attribute_bonus",
					"amount": 1,
					"attribute": "parry"
				},
				{
					"type": "attribute_bonus",
					"amount": 1,
					"attribute": "block"
				}
			],
			"categories": [
				"Shield"
			]
		},
		{
			"type": "equipment",
			"id": "6e40f71f-bbb8-4668-ab74-3c51fcc2b57a",
			"quantity": 1,
			"description": "Light Shield with Spike",
			"tech_level": "1",
			"value": "45",
			"weight": "7 lb",
			"reference": "B287",
			"weapons": [
				{
					"type": "melee_weapon",
					"damage": {
						"type": "cr",
						"st": "thr",
						"base": "1"
					},
					"strength": "0",
					"usage": "Shield Bash",
					"reach": "1",
					"parry": "No",
					"block": "+0",
					"calc": {
						"level": 0,
						"parry": "No",
						"block": "+0",
						"damage": "thr+1 cr"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Shield",
							"specialization": "Buckler",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Shield",
							"specialization": "Force Shield",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Shield",
							"specialization": "Shield"
						}
					]
				}
			],
			"calc": {
				"extended_value": "45",
				"extended_weight": "7 lb"
			},
			"features": [
				{
					"type": "attribute_bonus",
					"amount": 2,
					"attribute": "dodge"
				},
				{
					"type": "attribute_bonus",
					"amount": 2,
					"attribute": "parry"
				},
				{
					"type": "attribute_bonus",
					"amount": 2,
					"attribute": "block"
				}
			],
			"categories": [
				"Shield"
			]
		},
		{
			"type": "equipment",
			"id": "f6e1f935-cd69-4f10-a5e0-b0b586c0944b",
			"quantity": 1,
			"description": "LMG, 7.62mm",
			"tech_level": "6",
			"legality_class": "1",
			"value": "6600",
			"weight": "30 lb",
			"reference": "B281",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "pi",
						"base": "7d"
					},
					"strength": "13B†",
					"accuracy": "5",
					"range": "1000/4200",
					"rate_of_fire": "15!",
					"shots": "100(5)",
					"bulk": "-6",
					"recoil": "2",
					"calc": {
						"level": 0,
						"range": "1000/4200",
						"damage": "7d pi"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Pistol",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Rifle",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Shotgun",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Light Machine Gun"
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Submachine Gun",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Musket",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Grenade Launcher",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Gyroc",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Light Anti-Armor Weapon",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Gun!"
						}
					]
				}
			],
			"calc": {
				"extended_value": "6600",
				"extended_weight": "30 lb"
			},
			"categories": [
				"Missile Weapon"
			]
		},
		{
			"type": "equipment",
			"id": "22132718-3cfb-47ef-8d51-885630ad3595",
			"quantity": 1,
			"description": "Lockpicks",
			"tech_level": "3",
			"value": "50",
			"weight": "0 lb",
			"reference": "B289",
			"calc": {
				"extended_value": "50",
				"extended_weight": "0 lb"
			},
			"notes": "Basic equipment for Lockpicking skill",
			"categories": [
				"Law-Enforcement",
				"Spy Gear",
				"Thief"
			]
		},
		{
			"type": "equipment",
			"id": "85326fe5-7a04-4dab-9850-5a5b616de040",
			"quantity": 1,
			"description": "Long Spear",
			"tech_level": "2",
			"value": "60",
			"weight": "5 lb",
			"reference": "B273",
			"weapons": [
				{
					"type": "melee_weapon",
					"damage": {
						"type": "imp",
						"st": "thr",
						"base": "2"
					},
					"strength": "10",
					"usage": "Thrust",
					"reach": "2,3*",
					"parry": "0U",
					"block": "No",
					"calc": {
						"level": 0,
						"parry": "0U",
						"block": "No",
						"damage": "thr+2 imp"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -5
						},
						{
							"type": "skill",
							"name": "Spear"
						},
						{
							"type": "skill",
							"name": "Polearm",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Staff",
							"modifier": -2
						}
					]
				},
				{
					"type": "melee_weapon",
					"damage": {
						"type": "imp",
						"st": "thr",
						"base": "3"
					},
					"strength": "10†",
					"usage": "Thrust",
					"reach": "2,3*",
					"parry": "0",
					"block": "No",
					"calc": {
						"level": 0,
						"parry": "0",
						"block": "No",
						"damage": "thr+3 imp"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -5
						},
						{
							"type": "skill",
							"name": "Spear"
						},
						{
							"type": "skill",
							"name": "Polearm",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Staff",
							"modifier": -2
						}
					]
				}
			],
			"calc": {
				"extended_value": "60",
				"extended_weight": "5 lb"
			},
			"categories": [
				"Melee Weapon"
			]
		},
		{
			"type": "equipment",
			"id": "ed6a89d0-5636-4c2a-9319-db5ab3a37f2a",
			"quantity": 1,
			"description": "Longbow (ST11)",
			"tech_level": "0",
			"value": "200",
			"weight": "3 lb",
			"reference": "B275",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "imp",
						"base": "1d+1"
					},
					"strength": "11†",
					"accuracy": "3",
					"range": "165/220",
					"rate_of_fire": "1",
					"shots": "1(2)",
					"bulk": "-8",
					"calc": {
						"level": 0,
						"range": "165/220",
						"damage": "1d+1 imp"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -5
						},
						{
							"type": "skill",
							"name": "Bow"
						}
					]
				}
			],
			"calc": {
				"extended_value": "200",
				"extended_weight": "3 lb"
			},
			"categories": [
				"Missile Weapon",
				"UsesAmmoType:Arrow"
			]
		},
		{
			"type": "equipment",
			"id": "952d953f-8c41-4372-aba0-a8d6e7eecfe6",
			"quantity": 1,
			"description": "Longbow (ST12)",
			"tech_level": "0",
			"value": "220",
			"weight": "3 lb",
			"reference": "B275",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "imp",
						"base": "1d+1"
					},
					"strength": "12†",
					"accuracy": "3",
					"range": "180/240",
					"rate_of_fire": "1",
					"shots": "1(2)",
					"bulk": "-8",
					"calc": {
						"level": 0,
						"range": "180/240",
						"damage": "1d+1 imp"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -5
						},
						{
							"type": "skill",
							"name": "Bow"
						}
					]
				}
			],
			"calc": {
				"extended_value": "220",
				"extended_weight": "3 lb"
			},
			"categories": [
				"Missile Weapon",
				"UsesAmmoType:Arrow"
			]
		},
		{
			"type": "equipment",
			"id": "f1185dc5-1867-47b0-951a-ccab158b2262",
			"quantity": 1,
			"description": "Longbow (ST13)",
			"tech_level": "0",
			"value": "240",
			"weight": "3 lb",
			"reference": "B275",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "imp",
						"base": "1d+2"
					},
					"strength": "13†",
					"accuracy": "3",
					"range": "195/260",
					"rate_of_fire": "1",
					"shots": "1(2)",
					"bulk": "-8",
					"calc": {
						"level": 0,
						"range": "195/260",
						"damage": "1d+2 imp"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -5
						},
						{
							"type": "skill",
							"name": "Bow"
						}
					]
				}
			],
			"calc": {
				"extended_value": "240",
				"extended_weight": "3 lb"
			},
			"categories": [
				"Missile Weapon",
				"UsesAmmoType:Arrow"
			]
		},
		{
			"type": "equipment",
			"id": "474422d5-f081-4ee3-b09d-f2689dcca8a8",
			"quantity": 1,
			"description": "Longbow (ST14)",
			"tech_level": "0",
			"value": "260",
			"weight": "3 lb",
			"reference": "B275",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "imp",
						"base": "1d+2"
					},
					"strength": "14†",
					"accuracy": "3",
					"range": "210/280",
					"rate_of_fire": "1",
					"shots": "1(2)",
					"bulk": "-8",
					"calc": {
						"level": 0,
						"range": "210/280",
						"damage": "1d+2 imp"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -5
						},
						{
							"type": "skill",
							"name": "Bow"
						}
					]
				}
			],
			"calc": {
				"extended_value": "260",
				"extended_weight": "3 lb"
			},
			"categories": [
				"Missile Weapon",
				"UsesAmmoType:Arrow"
			]
		},
		{
			"type": "equipment",
			"id": "ae5cd24d-7898-4871-a0af-5646dbfa6f72",
			"quantity": 1,
			"description": "Longbow (ST15)",
			"tech_level": "0",
			"value": "280",
			"weight": "3 lb",
			"reference": "B275",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "imp",
						"base": "1d+3"
					},
					"strength": "15†",
					"accuracy": "3",
					"range": "225/300",
					"rate_of_fire": "1",
					"shots": "1(2)",
					"bulk": "-8",
					"calc": {
						"level": 0,
						"range": "225/300",
						"damage": "1d+3 imp"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -5
						},
						{
							"type": "skill",
							"name": "Bow"
						}
					]
				}
			],
			"calc": {
				"extended_value": "280",
				"extended_weight": "3 lb"
			},
			"categories": [
				"Missile Weapon",
				"UsesAmmoType:Arrow"
			]
		},
		{
			"type": "equipment",
			"id": "64041edc-8b7e-46d6-9e0b-08fbb36f21e7",
			"quantity": 1,
			"description": "Longbow (ST16)",
			"tech_level": "0",
			"value": "300",
			"weight": "3 lb",
			"reference": "B275",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "imp",
						"base": "1d+3"
					},
					"strength": "16†",
					"accuracy": "3",
					"range": "240/320",
					"rate_of_fire": "1",
					"shots": "1(2)",
					"bulk": "-8",
					"calc": {
						"level": 0,
						"range": "240/320",
						"damage": "1d+3 imp"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -5
						},
						{
							"type": "skill",
							"name": "Bow"
						}
					]
				}
			],
			"calc": {
				"extended_value": "300",
				"extended_weight": "3 lb"
			},
			"categories": [
				"Missile Weapon",
				"UsesAmmoType:Arrow"
			]
		},
		{
			"type": "equipment",
			"id": "4d10026a-0ee0-4292-b50f-e9f3139532af",
			"quantity": 1,
			"description": "Longbow (ST17)",
			"tech_level": "0",
			"value": "320",
			"weight": "3 lb",
			"reference": "B275",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "imp",
						"base": "1d+4"
					},
					"strength": "17†",
					"accuracy": "3",
					"range": "255/340",
					"rate_of_fire": "1",
					"shots": "1(2)",
					"bulk": "-8",
					"calc": {
						"level": 0,
						"range": "255/340",
						"damage": "1d+4 imp"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -5
						},
						{
							"type": "skill",
							"name": "Bow"
						}
					]
				}
			],
			"calc": {
				"extended_value": "320",
				"extended_weight": "3 lb"
			},
			"categories": [
				"Missile Weapon",
				"UsesAmmoType:Arrow"
			]
		},
		{
			"type": "equipment",
			"id": "de86bdfb-a96c-458b-9f70-33aec800cc57",
			"quantity": 1,
			"description": "Longbow (ST18)",
			"tech_level": "0",
			"value": "340",
			"weight": "3 lb",
			"reference": "B275",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "imp",
						"base": "1d+4"
					},
					"strength": "18†",
					"accuracy": "3",
					"range": "270/360",
					"rate_of_fire": "1",
					"shots": "1(2)",
					"bulk": "-8",
					"calc": {
						"level": 0,
						"range": "270/360",
						"damage": "1d+4 imp"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -5
						},
						{
							"type": "skill",
							"name": "Bow"
						}
					]
				}
			],
			"calc": {
				"extended_value": "340",
				"extended_weight": "3 lb"
			},
			"categories": [
				"Missile Weapon",
				"UsesAmmoType:Arrow"
			]
		},
		{
			"type": "equipment",
			"id": "70c2a847-3386-45ff-adc8-0f8fae62a4ad",
			"quantity": 1,
			"description": "Longbow (ST19)",
			"tech_level": "0",
			"value": "360",
			"weight": "3 lb",
			"reference": "B275",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "imp",
						"base": "2d+1"
					},
					"strength": "19†",
					"accuracy": "3",
					"range": "285/380",
					"rate_of_fire": "1",
					"shots": "1(2)",
					"bulk": "-8",
					"calc": {
						"level": 0,
						"range": "285/380",
						"damage": "2d+1 imp"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -5
						},
						{
							"type": "skill",
							"name": "Bow"
						}
					]
				}
			],
			"calc": {
				"extended_value": "360",
				"extended_weight": "3 lb"
			},
			"categories": [
				"Missile Weapon",
				"UsesAmmoType:Arrow"
			]
		},
		{
			"type": "equipment",
			"id": "59a288c6-55f7-48aa-836e-51a09d107ece",
			"quantity": 1,
			"description": "Longbow (ST20)",
			"tech_level": "0",
			"value": "380",
			"weight": "3 lb",
			"reference": "B275",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "imp",
						"base": "2d+1"
					},
					"strength": "20†",
					"accuracy": "3",
					"range": "300/400",
					"rate_of_fire": "1",
					"shots": "1(2)",
					"bulk": "-8",
					"calc": {
						"level": 0,
						"range": "300/400",
						"damage": "2d+1 imp"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -5
						},
						{
							"type": "skill",
							"name": "Bow"
						}
					]
				}
			],
			"calc": {
				"extended_value": "380",
				"extended_weight": "3 lb"
			},
			"categories": [
				"Missile Weapon",
				"UsesAmmoType:Arrow"
			]
		},
		{
			"type": "equipment",
			"id": "194c649c-bd70-479c-a222-02a540dfce47",
			"quantity": 1,
			"description": "Lorica Segmentata",
			"tech_level": "2",
			"legality_class": "3",
			"value": "680",
			"weight": "26 lb",
			"reference": "B283",
			"calc": {
				"extended_value": "680",
				"extended_weight": "26 lb"
			},
			"features": [
				{
					"type": "dr_bonus",
					"amount": 5,
					"location": "torso"
				},
				{
					"type": "dr_bonus",
					"amount": 5,
					"location": "vitals"
				}
			],
			"categories": [
				"Body Armor"
			]
		},
		{
			"type": "equipment",
			"id": "76b78338-e7df-45f4-91d5-1217fb50e277",
			"quantity": 1,
			"description": "Mace",
			"tech_level": "2",
			"value": "50",
			"weight": "5 lb",
			"reference": "B271",
			"weapons": [
				{
					"type": "melee_weapon",
					"damage": {
						"type": "cr",
						"st": "sw",
						"base": "3"
					},
					"strength": "12",
					"usage": "Swung",
					"reach": "1",
					"parry": "0U",
					"block": "No",
					"calc": {
						"level": 0,
						"parry": "0U",
						"block": "No",
						"damage": "sw+3 cr"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -5
						},
						{
							"type": "skill",
							"name": "Axe/Mace"
						},
						{
							"type": "skill",
							"name": "Flail",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Two-Handed Axe/Mace",
							"modifier": -3
						}
					]
				},
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "cr",
						"st": "sw",
						"base": "3"
					},
					"strength": "12",
					"accuracy": "1",
					"range": "x0.5/x1",
					"rate_of_fire": "1",
					"shots": "T(1)",
					"bulk": "-4",
					"calc": {
						"level": 0,
						"range": "x0.5/x1",
						"damage": "sw+3 cr"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Thrown Weapon",
							"specialization": "Axe/Mace"
						}
					]
				}
			],
			"calc": {
				"extended_value": "50",
				"extended_weight": "5 lb"
			},
			"categories": [
				"Melee Weapon",
				"Missile Weapon"
			]
		},
		{
			"type": "equipment",
			"id": "5309c05a-282a-49e5-a639-e41465ded993",
			"quantity": 1,
			"description": "Machine Pistol, 9mm",
			"tech_level": "7",
			"legality_class": "2",
			"value": "900",
			"weight": "5.5 lb",
			"reference": "B278",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "pi",
						"base": "2d+2"
					},
					"strength": "12",
					"accuracy": "2",
					"range": "160/1900",
					"rate_of_fire": "20",
					"shots": "25+1(3)",
					"bulk": "-3",
					"recoil": "3",
					"calc": {
						"level": 0,
						"range": "160/1900",
						"damage": "2d+2 pi"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Pistol",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Rifle",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Shotgun",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Light Machine Gun",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Submachine Gun"
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Musket",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Grenade Launcher",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Gyroc",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Light Anti-Armor Weapon",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Gun!"
						}
					]
				}
			],
			"calc": {
				"extended_value": "900",
				"extended_weight": "5.5 lb"
			},
			"categories": [
				"Missile Weapon"
			]
		},
		{
			"type": "equipment",
			"id": "385eeeb1-aea0-47e7-abb4-9afbcf910925",
			"quantity": 1,
			"description": "Mail Coif",
			"tech_level": "2",
			"legality_class": "3",
			"value": "55",
			"weight": "4 lb",
			"reference": "B284",
			"calc": {
				"extended_value": "55",
				"extended_weight": "4 lb"
			},
			"features": [
				{
					"type": "dr_bonus",
					"amount": 4,
					"location": "skull"
				},
				{
					"type": "dr_bonus",
					"amount": 4,
					"location": "neck"
				},
				{
					"type": "dr_bonus",
					"amount": -2,
					"location": "skull",
					"specialization": "crushing"
				},
				{
					"type": "dr_bonus",
					"amount": -2,
					"location": "neck",
					"specialization": "crushing"
				}
			],
			"notes": "Flexible",
			"categories": [
				"Headgear"
			]
		},
		{
			"type": "equipment",
			"id": "5a7af382-f3d8-432b-b028-4f0b317d11e6",
			"quantity": 1,
			"description": "Mail Hauberk",
			"tech_level": "2",
			"legality_class": "3",
			"value": "230",
			"weight": "25 lb",
			"reference": "B283",
			"calc": {
				"extended_value": "230",
				"extended_weight": "25 lb"
			},
			"features": [
				{
					"type": "dr_bonus",
					"amount": 4,
					"location": "torso"
				},
				{
					"type": "dr_bonus",
					"amount": 4,
					"location": "vitals"
				},
				{
					"type": "dr_bonus",
					"amount": 4,
					"location": "groin"
				},
				{
					"type": "dr_bonus",
					"amount": -2,
					"location": "torso",
					"specialization": "crushing"
				},
				{
					"type": "dr_bonus",
					"amount": -2,
					"location": "vitals",
					"specialization": "crushing"
				},
				{
					"type": "dr_bonus",
					"amount": -2,
					"location": "groin",
					"specialization": "crushing"
				}
			],
			"notes": "Flexible",
			"categories": [
				"Body Armor"
			]
		},
		{
			"type": "equipment",
			"id": "e2359914-a9ab-4ea7-be49-e75915c7ef01",
			"quantity": 1,
			"description": "Mail Leggings",
			"tech_level": "2",
			"legality_class": "3",
			"value": "110",
			"weight": "15 lb",
			"reference": "B283",
			"calc": {
				"extended_value": "110",
				"extended_weight": "15 lb"
			},
			"features": [
				{
					"type": "dr_bonus",
					"amount": 4,
					"location": "leg"
				},
				{
					"type": "dr_bonus",
					"amount": -2,
					"location": "leg",
					"specialization": "crushing"
				}
			],
			"notes": "Flexible",
			"categories": [
				"Limb Armor"
			]
		},
		{
			"type": "equipment",
			"id": "7fad5741-f26e-4b5e-a5ef-e1c08ebffb93",
			"quantity": 1,
			"description": "Mail Shirt",
			"tech_level": "2",
			"value": "150",
			"weight": "16 lb",
			"reference": "B283",
			"calc": {
				"extended_value": "150",
				"extended_weight": "16 lb"
			},
			"features": [
				{
					"type": "dr_bonus",
					"amount": 4,
					"location": "torso"
				},
				{
					"type": "dr_bonus",
					"amount": 4,
					"location": "vitals"
				},
				{
					"type": "dr_bonus",
					"amount": -2,
					"location": "torso",
					"specialization": "crushing"
				},
				{
					"type": "dr_bonus",
					"amount": -2,
					"location": "vitals",
					"specialization": "crushing"
				}
			],
			"notes": "Flexible, concealable",
			"categories": [
				"Body Armor"
			]
		},
		{
			"type": "equipment",
			"id": "745dbaad-b4df-4f05-b8ac-bf224b1877b2",
			"quantity": 1,
			"description": "Mail Sleeves",
			"tech_level": "2",
			"legality_class": "3",
			"value": "70",
			"weight": "9 lb",
			"reference": "B283",
			"calc": {
				"extended_value": "70",
				"extended_weight": "9 lb"
			},
			"features": [
				{
					"type": "dr_bonus",
					"amount": 4,
					"location": "arm"
				},
				{
					"type": "dr_bonus",
					"amount": -2,
					"location": "arm",
					"specialization": "crushing"
				}
			],
			"notes": "Flexible",
			"categories": [
				"Limb Armor"
			]
		},
		{
			"type": "equipment",
			"id": "4daffac3-5719-44a0-a0fd-2c756d5cbe86",
			"quantity": 1,
			"description": "Match, Single, Waterproof",
			"tech_level": "6",
			"value": "0.3",
			"weight": "0.001 lb",
			"reference": "B288",
			"calc": {
				"extended_value": "0.3",
				"extended_weight": "0.001 lb"
			},
			"categories": [
				"Camping and Survival Gear"
			]
		},
		{
			"type": "equipment",
			"id": "2d42970e-e7c0-4e35-b4ec-207c6e9cb232",
			"quantity": 1,
			"description": "Matches, Waterproof",
			"tech_level": "6",
			"value": "1.5",
			"weight": "0.051 lb",
			"reference": "B288",
			"calc": {
				"extended_value": "1.5",
				"extended_weight": "0.051 lb"
			},
			"notes": "Box of 50",
			"categories": [
				"Camping and Survival Gear"
			]
		},
		{
			"type": "equipment",
			"id": "43d7737f-d473-47f2-8930-93f653439adf",
			"quantity": 1,
			"description": "Matchlock Musket, .80",
			"tech_level": "4",
			"value": "150",
			"weight": "20 lb",
			"reference": "B279",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "pi++",
						"base": "4d"
					},
					"strength": "10R†",
					"accuracy": "2",
					"range": "100/600",
					"rate_of_fire": "1",
					"shots": "1(60)",
					"bulk": "-6",
					"recoil": "3",
					"calc": {
						"level": 0,
						"range": "100/600",
						"damage": "4d pi++"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Pistol",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Rifle",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Shotgun",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Light Machine Gun",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Submachine Gun",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Musket"
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Grenade Launcher",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Gyroc",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Light Anti-Armor Weapon",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Gun!"
						}
					]
				}
			],
			"calc": {
				"extended_value": "150",
				"extended_weight": "20 lb"
			},
			"categories": [
				"Missile Weapon"
			]
		},
		{
			"type": "equipment",
			"id": "23640e67-b554-49f1-a7e9-d6cbe9a8670b",
			"quantity": 1,
			"description": "Maul",
			"tech_level": "0",
			"value": "80",
			"weight": "12 lb",
			"reference": "B274",
			"weapons": [
				{
					"type": "melee_weapon",
					"damage": {
						"type": "cr",
						"st": "sw",
						"base": "4"
					},
					"strength": "13‡",
					"usage": "Swung",
					"reach": "1,2*",
					"parry": "0U",
					"block": "No",
					"calc": {
						"level": 0,
						"parry": "0U",
						"block": "No",
						"damage": "sw+4 cr"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -5
						},
						{
							"type": "skill",
							"name": "Two-Handed Axe/Mace"
						},
						{
							"type": "skill",
							"name": "Axe/Mace",
							"modifier": -3
						},
						{
							"type": "skill",
							"name": "Polearm",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Two-Handed Flail",
							"modifier": -4
						}
					]
				}
			],
			"calc": {
				"extended_value": "80",
				"extended_weight": "12 lb"
			},
			"categories": [
				"Melee Weapon"
			]
		},
		{
			"type": "equipment",
			"id": "91776d7d-5f92-4b4b-8615-ef3931a1ae08",
			"quantity": 1,
			"description": "Medium Buckler",
			"tech_level": "1",
			"value": "60",
			"weight": "15 lb",
			"reference": "B287",
			"weapons": [
				{
					"type": "melee_weapon",
					"damage": {
						"type": "cr",
						"st": "thr"
					},
					"strength": "0",
					"reach": "1",
					"parry": "No",
					"block": "+0",
					"calc": {
						"level": 0,
						"parry": "No",
						"block": "+0",
						"damage": "thr cr"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Shield",
							"specialization": "Shield",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Shield",
							"specialization": "Force Shield",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Shield",
							"specialization": "Buckler"
						}
					]
				}
			],
			"calc": {
				"extended_value": "60",
				"extended_weight": "15 lb"
			},
			"features": [
				{
					"type": "attribute_bonus",
					"amount": 2,
					"attribute": "dodge"
				},
				{
					"type": "attribute_bonus",
					"amount": 2,
					"attribute": "parry"
				},
				{
					"type": "attribute_bonus",
					"amount": 2,
					"attribute": "block"
				}
			],
			"categories": [
				"Shield"
			]
		},
		{
			"type": "equipment",
			"id": "f73b3114-c273-47da-b40d-165671484055",
			"quantity": 1,
			"description": "Medium Buckler with Spike",
			"tech_level": "1",
			"value": "80",
			"weight": "20 lb",
			"reference": "B287",
			"weapons": [
				{
					"type": "melee_weapon",
					"damage": {
						"type": "cr",
						"st": "thr",
						"base": "1"
					},
					"strength": "0",
					"reach": "1",
					"parry": "No",
					"block": "+0",
					"calc": {
						"level": 0,
						"parry": "No",
						"block": "+0",
						"damage": "thr+1 cr"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Shield",
							"specialization": "Shield",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Shield",
							"specialization": "Force Shield",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Shield",
							"specialization": "Buckler"
						}
					]
				}
			],
			"calc": {
				"extended_value": "80",
				"extended_weight": "20 lb"
			},
			"features": [
				{
					"type": "attribute_bonus",
					"amount": 2,
					"attribute": "dodge"
				},
				{
					"type": "attribute_bonus",
					"amount": 2,
					"attribute": "parry"
				},
				{
					"type": "attribute_bonus",
					"amount": 2,
					"attribute": "block"
				}
			],
			"categories": [
				"Shield"
			]
		},
		{
			"type": "equipment",
			"id": "38d7564b-46a6-4b89-9297-b237c432969a",
			"quantity": 1,
			"description": "Medium Shield",
			"tech_level": "1",
			"value": "60",
			"weight": "15 lb",
			"reference": "B287",
			"weapons": [
				{
					"type": "melee_weapon",
					"damage": {
						"type": "cr",
						"st": "thr"
					},
					"strength": "0",
					"usage": "Shield Bash",
					"reach": "1",
					"parry": "No",
					"block": "+0",
					"calc": {
						"level": 0,
						"parry": "No",
						"block": "+0",
						"damage": "thr cr"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Shield",
							"specialization": "Buckler"
						},
						{
							"type": "skill",
							"name": "Shield",
							"specialization": "Force Shield"
						},
						{
							"type": "skill",
							"name": "Shield",
							"specialization": "Shield"
						}
					]
				}
			],
			"calc": {
				"extended_value": "60",
				"extended_weight": "15 lb"
			},
			"features": [
				{
					"type": "attribute_bonus",
					"amount": 2,
					"attribute": "dodge"
				},
				{
					"type": "attribute_bonus",
					"amount": 2,
					"attribute": "parry"
				},
				{
					"type": "attribute_bonus",
					"amount": 2,
					"attribute": "block"
				}
			],
			"categories": [
				"Shield"
			]
		},
		{
			"type": "equipment",
			"id": "5b8e6ea4-3586-422a-8a17-2627c0d345a1",
			"quantity": 1,
			"description": "Medium Shield with Spike",
			"tech_level": "1",
			"value": "80",
			"weight": "20 lb",
			"reference": "B287",
			"weapons": [
				{
					"type": "melee_weapon",
					"damage": {
						"type": "cr",
						"st": "thr",
						"base": "1"
					},
					"strength": "0",
					"usage": "Shield Bash",
					"reach": "1",
					"parry": "No",
					"block": "+0",
					"calc": {
						"level": 0,
						"parry": "No",
						"block": "+0",
						"damage": "thr+1 cr"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Shield",
							"specialization": "Buckler",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Shield",
							"specialization": "Force Shield",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Shield",
							"specialization": "Shield"
						}
					]
				}
			],
			"calc": {
				"extended_value": "80",
				"extended_weight": "20 lb"
			},
			"features": [
				{
					"type": "attribute_bonus",
					"amount": 2,
					"attribute": "dodge"
				},
				{
					"type": "attribute_bonus",
					"amount": 2,
					"attribute": "parry"
				},
				{
					"type": "attribute_bonus",
					"amount": 2,
					"attribute": "block"
				}
			],
			"categories": [
				"Shield"
			]
		},
		{
			"type": "equipment",
			"id": "80a9fc6e-7ddb-4482-9d0c-7a5e8b3a9c2a",
			"quantity": 1,
			"description": "Melee Net",
			"tech_level": "2",
			"value": "20",
			"weight": "5 lb",
			"reference": "B276",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "see B411"
					},
					"strength": "8",
					"accuracy": "1",
					"range": "spec",
					"rate_of_fire": "1",
					"shots": "T(1)",
					"bulk": "-4",
					"calc": {
						"level": 0,
						"range": "spec",
						"damage": "see B411"
					},
					"defaults": [
						{
							"type": "skill",
							"name": "Net"
						},
						{
							"type": "skill",
							"name": "Cloak",
							"modifier": -5
						}
					]
				}
			],
			"calc": {
				"extended_value": "20",
				"extended_weight": "5 lb"
			},
			"categories": [
				"Missile Weapon"
			]
		},
		{
			"type": "equipment",
			"id": "2d81debe-6404-4e50-8ae6-265f54543c5c",
			"quantity": 1,
			"description": "Metal Detector Wand",
			"tech_level": "7",
			"value": "50",
			"weight": "3 lb",
			"reference": "B289",
			"calc": {
				"extended_value": "50",
				"extended_weight": "3 lb"
			},
			"notes": "+3 to find metal items. 8 hrs.",
			"categories": [
				"Optics and Sensors"
			]
		},
		{
			"type": "equipment",
			"id": "d3ce3024-4a58-4e27-8e17-f48d42305224",
			"quantity": 1,
			"description": "Mini-Camera, Digital",
			"tech_level": "8",
			"value": "500",
			"weight": "0 lb",
			"reference": "B289",
			"calc": {
				"extended_value": "500",
				"extended_weight": "0 lb"
			},
			"notes": "Stores pictures on optical disk.",
			"categories": [
				"Optics and Sensors"
			]
		},
		{
			"type": "equipment",
			"id": "f68fd32a-de9f-4fbc-bea4-e8837e72bc90",
			"quantity": 1,
			"description": "Mini-Recorder",
			"tech_level": "7",
			"value": "200",
			"weight": "0.5 lb",
			"reference": "B288",
			"calc": {
				"extended_value": "200",
				"extended_weight": "0.5 lb"
			},
			"notes": "Palm-sized, with 3-hour tape",
			"categories": [
				"Communications and Information Gear"
			]
		},
		{
			"type": "equipment",
			"id": "80bbcaec-694b-468f-b861-1b2d857296f7",
			"quantity": 1,
			"description": "Mini-Recorder, Digital",
			"tech_level": "8",
			"value": "0",
			"weight": "0 lb",
			"reference": "B288",
			"calc": {
				"extended_value": "0",
				"extended_weight": "0 lb"
			},
			"notes": "Palm-sized, 3 hrs. recording time",
			"categories": [
				"Communications and Information Gear"
			]
		},
		{
			"type": "equipment",
			"id": "206783bd-56c7-47bc-b6f8-d79a87671e37",
			"quantity": 1,
			"description": "Mini-Recorder-Tape",
			"tech_level": "7",
			"value": "5",
			"weight": "0 lb",
			"reference": "B288",
			"calc": {
				"extended_value": "5",
				"extended_weight": "0 lb"
			},
			"notes": "3-hour tape",
			"categories": [
				"Communications and Information Gear"
			]
		},
		{
			"type": "equipment",
			"id": "e397c046-6eee-41e2-b06f-5442c70efe4c",
			"quantity": 1,
			"description": "Molotov Cocktail",
			"tech_level": "6",
			"legality_class": "3",
			"value": "0",
			"weight": "1 lb",
			"reference": "B277",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "spec. (1 y)"
					},
					"accuracy": "0",
					"range": "x3.5",
					"rate_of_fire": "1",
					"shots": "1",
					"bulk": "0",
					"recoil": "0",
					"calc": {
						"level": 0,
						"range": "x3.5",
						"damage": "spec. (1 y)"
					},
					"defaults": [
						{
							"type": "skill",
							"name": "Throwing"
						}
					]
				}
			],
			"calc": {
				"extended_value": "0",
				"extended_weight": "1 lb"
			},
			"notes": "Fuse spec.",
			"categories": [
				"Missile Weapon"
			]
		},
		{
			"type": "equipment",
			"id": "2199917d-0b0c-4858-8203-37f38ac383ce",
			"quantity": 1,
			"description": "Monowire Whip",
			"tech_level": "^",
			"value": "900",
			"weight": "0.5 lb",
			"reference": "B272",
			"weapons": [
				{
					"type": "melee_weapon",
					"damage": {
						"type": "cut",
						"st": "sw",
						"base": "1d-2",
						"armor_divisor": 10
					},
					"strength": "5",
					"reach": "1-7*",
					"parry": "-2U",
					"block": "No",
					"calc": {
						"level": 0,
						"parry": "-2U",
						"block": "No",
						"damage": "sw+1d-2(10) cut"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -6
						},
						{
							"type": "skill",
							"name": "Monowire Whip"
						},
						{
							"type": "skill",
							"name": "Kusari",
							"modifier": -3
						},
						{
							"type": "skill",
							"name": "Whip",
							"modifier": -3
						}
					]
				}
			],
			"calc": {
				"extended_value": "900",
				"extended_weight": "0.5 lb"
			},
			"categories": [
				"Melee Weapon"
			]
		},
		{
			"type": "equipment",
			"id": "857a1256-ca2b-447b-b3f6-9adc960275e3",
			"quantity": 1,
			"description": "Morningstar",
			"tech_level": "3",
			"value": "80",
			"weight": "6 lb",
			"reference": "B272",
			"weapons": [
				{
					"type": "melee_weapon",
					"damage": {
						"type": "cr",
						"st": "sw",
						"base": "3"
					},
					"strength": "12",
					"usage": "Swung",
					"reach": "1",
					"parry": "0U",
					"block": "No",
					"calc": {
						"level": 0,
						"parry": "0U",
						"block": "No",
						"damage": "sw+3 cr"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -6
						},
						{
							"type": "skill",
							"name": "Flail"
						},
						{
							"type": "skill",
							"name": "Axe/Mace",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Two-Handed Flail",
							"modifier": -3
						}
					]
				}
			],
			"calc": {
				"extended_value": "80",
				"extended_weight": "6 lb"
			},
			"categories": [
				"Melee Weapon"
			]
		},
		{
			"type": "equipment",
			"id": "446500a8-c65f-4edd-a08d-a204530928ba",
			"quantity": 1,
			"description": "Naginata",
			"tech_level": "2",
			"value": "100",
			"weight": "6 lb",
			"reference": "B272",
			"weapons": [
				{
					"type": "melee_weapon",
					"damage": {
						"type": "cut",
						"st": "sw",
						"base": "2"
					},
					"strength": "9†",
					"usage": "Swung",
					"usage_notes": "The sharp end, Polearm",
					"reach": "1,2*",
					"parry": "0U",
					"block": "No",
					"calc": {
						"level": 0,
						"parry": "0U",
						"block": "No",
						"damage": "sw+2 cut"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -5
						},
						{
							"type": "skill",
							"name": "Polearm"
						},
						{
							"type": "skill",
							"name": "Spear",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Staff",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Two-Handed Axe/Mace",
							"modifier": -4
						}
					]
				},
				{
					"type": "melee_weapon",
					"damage": {
						"type": "imp",
						"st": "thr",
						"base": "3"
					},
					"strength": "9†",
					"usage": "Thrust",
					"usage_notes": "The sharp end, Polearm",
					"reach": "2",
					"parry": "0",
					"block": "No",
					"calc": {
						"level": 0,
						"parry": "0",
						"block": "No",
						"damage": "thr+3 imp"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -5
						},
						{
							"type": "skill",
							"name": "Polearm"
						},
						{
							"type": "skill",
							"name": "Spear",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Staff",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Two-Handed Axe/Mace",
							"modifier": -4
						}
					]
				},
				{
					"type": "melee_weapon",
					"damage": {
						"type": "cr",
						"st": "sw",
						"base": "2"
					},
					"strength": "9†",
					"usage": "Swung",
					"usage_notes": "The blunt end",
					"reach": "1,2",
					"parry": "0U",
					"block": "No",
					"calc": {
						"level": 0,
						"parry": "0U",
						"block": "No",
						"damage": "sw+2 cr"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -5
						},
						{
							"type": "skill",
							"name": "Staff"
						},
						{
							"type": "skill",
							"name": "Polearm",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Spear",
							"modifier": -2
						}
					]
				},
				{
					"type": "melee_weapon",
					"damage": {
						"type": "cr",
						"st": "thr",
						"base": "2"
					},
					"strength": "9†",
					"usage": "Thrust",
					"usage_notes": "The blunt end",
					"reach": "1,2",
					"parry": "0",
					"block": "No",
					"calc": {
						"level": 0,
						"parry": "0",
						"block": "No",
						"damage": "thr+2 cr"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -5
						},
						{
							"type": "skill",
							"name": "Staff"
						},
						{
							"type": "skill",
							"name": "Polearm",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Spear",
							"modifier": -2
						}
					]
				},
				{
					"type": "melee_weapon",
					"damage": {
						"type": "cut",
						"st": "sw",
						"base": "3"
					},
					"strength": "9†",
					"usage": "Swung",
					"usage_notes": "Two-handed sword",
					"reach": "2",
					"parry": "0U",
					"block": "No",
					"calc": {
						"level": 0,
						"parry": "0U",
						"block": "No",
						"damage": "sw+3 cut"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -5
						},
						{
							"type": "skill",
							"name": "Two-Handed Sword"
						},
						{
							"type": "skill",
							"name": "Broadsword",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Force Sword",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Sword!"
						}
					]
				},
				{
					"type": "melee_weapon",
					"damage": {
						"type": "imp",
						"st": "thr",
						"base": "3"
					},
					"strength": "9†",
					"usage": "Thrust",
					"usage_notes": "Two-handed sword",
					"reach": "2",
					"parry": "0",
					"block": "No",
					"calc": {
						"level": 0,
						"parry": "0",
						"block": "No",
						"damage": "thr+3 imp"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -5
						},
						{
							"type": "skill",
							"name": "Two-Handed Sword"
						},
						{
							"type": "skill",
							"name": "Broadsword",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Force Sword",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Sword!"
						}
					]
				}
			],
			"calc": {
				"extended_value": "100",
				"extended_weight": "6 lb"
			},
			"categories": [
				"Melee Weapon"
			]
		},
		{
			"type": "equipment",
			"id": "32fe758f-a69d-4244-94a0-3b75cd9bee3a",
			"quantity": 1,
			"description": "Nanobug",
			"tech_level": "8",
			"value": "100",
			"weight": "0 lb",
			"reference": "B289",
			"calc": {
				"extended_value": "100",
				"extended_weight": "0 lb"
			},
			"notes": "Pinhead-sized audio-visual bug (-10 to spot)",
			"categories": [
				"Law-Enforcement",
				"Spy Gear",
				"Thief"
			]
		},
		{
			"type": "equipment",
			"id": "b1a2ade4-5008-4d89-9574-a725ae7a8f0d",
			"quantity": 1,
			"description": "NBC Suit",
			"tech_level": "7",
			"value": "150",
			"weight": "3.5 lb",
			"reference": "B285",
			"calc": {
				"extended_value": "150",
				"extended_weight": "3.5 lb"
			},
			"prereqs": {
				"type": "prereq_list",
				"all": true,
				"prereqs": [
					{
						"type": "skill_prereq",
						"has": true,
						"name": {
							"compare": "is",
							"qualifier": "nbc suit"
						}
					}
				]
			},
			"features": [
				{
					"type": "dr_bonus",
					"amount": 1,
					"location": "skull"
				},
				{
					"type": "dr_bonus",
					"amount": 1,
					"location": "neck"
				},
				{
					"type": "dr_bonus",
					"amount": 1,
					"location": "torso"
				},
				{
					"type": "dr_bonus",
					"amount": 1,
					"location": "vitals"
				},
				{
					"type": "dr_bonus",
					"amount": 1,
					"location": "groin"
				},
				{
					"type": "dr_bonus",
					"amount": 1,
					"location": "arm"
				},
				{
					"type": "dr_bonus",
					"amount": 1,
					"location": "hand"
				},
				{
					"type": "dr_bonus",
					"amount": 1,
					"location": "leg"
				},
				{
					"type": "dr_bonus",
					"amount": 1,
					"location": "foot"
				}
			],
			"categories": [
				"Environment Suits"
			]
		},
		{
			"type": "equipment",
			"id": "7644647f-2a35-4775-8738-74ecb3c2168f",
			"quantity": 1,
			"description": "Night Vision Goggles",
			"tech_level": "8",
			"value": "600",
			"weight": "2 lb",
			"reference": "B289",
			"calc": {
				"extended_value": "600",
				"extended_weight": "2 lb"
			},
			"notes": "Give Night Vision 9. 8 hrs.",
			"categories": [
				"Optics and Sensors"
			]
		},
		{
			"type": "equipment",
			"id": "f058633d-9b52-4b73-994d-c3e06415e0be",
			"quantity": 1,
			"description": "Nunchaku",
			"tech_level": "3",
			"value": "20",
			"weight": "2 lb",
			"reference": "B272",
			"weapons": [
				{
					"type": "melee_weapon",
					"damage": {
						"type": "cr",
						"st": "sw",
						"base": "1"
					},
					"strength": "7",
					"usage": "Swung",
					"reach": "1",
					"parry": "0U",
					"block": "No",
					"calc": {
						"level": 0,
						"parry": "0U",
						"block": "No",
						"damage": "sw+1 cr"
					},
					"defaults": [
						{
							"type": "skill",
							"name": "Flail"
						},
						{
							"type": "skill",
							"name": "Axe/Mace",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Two-Handed Flail",
							"modifier": -3
						},
						{
							"type": "dx",
							"modifier": -6
						}
					]
				}
			],
			"calc": {
				"extended_value": "20",
				"extended_weight": "2 lb"
			},
			"categories": [
				"Melee Weapon"
			]
		},
		{
			"type": "equipment",
			"id": "2d780bd0-acf1-444b-bfff-6e45121889b1",
			"quantity": 1,
			"description": "Oil, Lantern, 1 Pint",
			"tech_level": "2",
			"value": "2",
			"weight": "1 lb",
			"reference": "B288",
			"calc": {
				"extended_value": "2",
				"extended_weight": "1 lb"
			},
			"categories": [
				"Camping and Survival Gear"
			]
		},
		{
			"type": "equipment",
			"id": "efb4c06f-b4ef-4403-9cc8-0a7c3d48fa15",
			"quantity": 1,
			"description": "Parachute",
			"tech_level": "6",
			"value": "1000",
			"weight": "30 lb",
			"reference": "B288",
			"calc": {
				"extended_value": "1000",
				"extended_weight": "30 lb"
			},
			"categories": [
				"Camping and Survival Gear"
			]
		},
		{
			"type": "equipment",
			"id": "c919e84b-fa78-4bed-b97c-6fcc9d5e2e7a",
			"quantity": 1,
			"description": "PDW, 4.6mm",
			"tech_level": "8",
			"legality_class": "2",
			"value": "800",
			"weight": "3.9 lb",
			"reference": "B278",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "pi-",
						"base": "4d+1"
					},
					"strength": "7†",
					"accuracy": "3",
					"range": "200/2000",
					"rate_of_fire": "15",
					"shots": "20+1(3)",
					"bulk": "-3",
					"recoil": "2",
					"calc": {
						"level": 0,
						"range": "200/2000",
						"damage": "4d+1 pi-"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Pistol",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Rifle",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Shotgun",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Light Machine Gun",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Submachine Gun"
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Musket",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Grenade Launcher",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Gyroc",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Light Anti-Armor Weapon",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Gun!"
						}
					]
				}
			],
			"calc": {
				"extended_value": "800",
				"extended_weight": "3.9 lb"
			},
			"categories": [
				"Missile Weapon"
			]
		},
		{
			"type": "equipment",
			"id": "b5bb2b27-5828-42d2-b117-0a88db0f1fbf",
			"quantity": 1,
			"description": "Personal Basics",
			"tech_level": "0",
			"value": "5",
			"weight": "1 lb",
			"reference": "B288",
			"calc": {
				"extended_value": "5",
				"extended_weight": "1 lb"
			},
			"notes": "Minimum gear for camping: -2 to any Survival roll without it. Includes utensils, tinderbox or flint and steel, towel, etc., as TL permits.",
			"categories": [
				"Camping and Survival Gear"
			]
		},
		{
			"type": "equipment",
			"id": "9c37c2a9-2488-459f-bfbf-f0945b3fdc2b",
			"quantity": 1,
			"description": "Pick",
			"tech_level": "3",
			"value": "70",
			"weight": "3 lb",
			"reference": "B271",
			"weapons": [
				{
					"type": "melee_weapon",
					"damage": {
						"type": "imp",
						"st": "sw",
						"base": "1"
					},
					"strength": "10",
					"usage": "Swung",
					"reach": "1",
					"parry": "0U",
					"block": "No",
					"calc": {
						"level": 0,
						"parry": "0U",
						"block": "No",
						"damage": "sw+1 imp"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -5
						},
						{
							"type": "skill",
							"name": "Axe/Mace"
						},
						{
							"type": "skill",
							"name": "Flail",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Two-Handed Axe/Mace",
							"modifier": -3
						}
					]
				}
			],
			"calc": {
				"extended_value": "70",
				"extended_weight": "3 lb"
			},
			"notes": "May get stuck",
			"categories": [
				"Melee Weapon"
			]
		},
		{
			"type": "equipment",
			"id": "fb4d9188-c4d9-4d82-9c1d-49dbc83e22a4",
			"quantity": 1,
			"description": "Pickaxe",
			"tech_level": "2",
			"value": "15",
			"weight": "8 lb",
			"reference": "B289",
			"calc": {
				"extended_value": "15",
				"extended_weight": "8 lb"
			},
			"notes": "Improves digging speed",
			"categories": [
				"Tools"
			]
		},
		{
			"type": "equipment",
			"id": "fc58ab4e-4b06-4fbc-bfb9-6efaf6decc52",
			"quantity": 1,
			"description": "Pistol Crossbow (ST7)",
			"tech_level": "3",
			"value": "150",
			"weight": "4 lb",
			"reference": "B276",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "imp",
						"base": "1d-1"
					},
					"strength": "7",
					"accuracy": "1",
					"range": "105/140",
					"rate_of_fire": "1",
					"shots": "1(4)",
					"bulk": "-4",
					"calc": {
						"level": 0,
						"range": "105/140",
						"damage": "1d-1 imp"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Crossbow"
						}
					]
				}
			],
			"calc": {
				"extended_value": "150",
				"extended_weight": "4 lb"
			},
			"categories": [
				"Missile Weapon",
				"UsesAmmoType:Bolt"
			]
		},
		{
			"type": "equipment",
			"id": "04e0b545-a451-4162-af60-9f600c7be2bd",
			"quantity": 1,
			"description": "Pistol Crossbow (ST8)",
			"tech_level": "3",
			"value": "165",
			"weight": "4 lb",
			"reference": "B276",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "imp",
						"base": "1d-1"
					},
					"strength": "8",
					"accuracy": "1",
					"range": "120/160",
					"rate_of_fire": "1",
					"shots": "1(4)",
					"bulk": "-4",
					"calc": {
						"level": 0,
						"range": "120/160",
						"damage": "1d-1 imp"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Crossbow"
						}
					]
				}
			],
			"calc": {
				"extended_value": "165",
				"extended_weight": "4 lb"
			},
			"categories": [
				"Missile Weapon",
				"UsesAmmoType:Bolt"
			]
		},
		{
			"type": "equipment",
			"id": "93d06c7e-9864-49f4-8c9d-3f69fff6fffa",
			"quantity": 1,
			"description": "Pistol Crossbow (ST9)",
			"tech_level": "3",
			"value": "180",
			"weight": "4 lb",
			"reference": "B276",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "imp",
						"base": "1d"
					},
					"strength": "9",
					"accuracy": "1",
					"range": "135/180",
					"rate_of_fire": "1",
					"shots": "1(4)",
					"bulk": "-4",
					"calc": {
						"level": 0,
						"range": "135/180",
						"damage": "1d imp"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Crossbow"
						}
					]
				}
			],
			"calc": {
				"extended_value": "180",
				"extended_weight": "4 lb"
			},
			"categories": [
				"Missile Weapon",
				"UsesAmmoType:Bolt"
			]
		},
		{
			"type": "equipment",
			"id": "9e942559-efcb-414f-9e6a-9f3f01d562e0",
			"quantity": 1,
			"description": "Pistol Crossbow (ST10)",
			"tech_level": "3",
			"value": "195",
			"weight": "4 lb",
			"reference": "B276",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "imp",
						"base": "1d"
					},
					"strength": "10",
					"accuracy": "1",
					"range": "150/200",
					"rate_of_fire": "1",
					"shots": "1(4)",
					"bulk": "-4",
					"calc": {
						"level": 0,
						"range": "150/200",
						"damage": "1d imp"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Crossbow"
						}
					]
				}
			],
			"calc": {
				"extended_value": "195",
				"extended_weight": "4 lb"
			},
			"categories": [
				"Missile Weapon",
				"UsesAmmoType:Bolt"
			]
		},
		{
			"type": "equipment",
			"id": "d90083f9-6c7c-4593-aec3-70c094444e5c",
			"quantity": 1,
			"description": "Pistol Crossbow (ST11)",
			"tech_level": "3",
			"value": "210",
			"weight": "4 lb",
			"reference": "B276",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "imp",
						"base": "1d+1"
					},
					"strength": "11",
					"accuracy": "1",
					"range": "165/220",
					"rate_of_fire": "1",
					"shots": "1(4)",
					"bulk": "-4",
					"calc": {
						"level": 0,
						"range": "165/220",
						"damage": "1d+1 imp"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Crossbow"
						}
					]
				}
			],
			"calc": {
				"extended_value": "210",
				"extended_weight": "4 lb"
			},
			"categories": [
				"Missile Weapon",
				"UsesAmmoType:Bolt"
			]
		},
		{
			"type": "equipment",
			"id": "5fdf9742-1066-4e7a-a9c4-f97054ade5e3",
			"quantity": 1,
			"description": "Pistol Crossbow (ST12)",
			"tech_level": "3",
			"value": "225",
			"weight": "4 lb",
			"reference": "B276",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "imp",
						"base": "1d+1"
					},
					"strength": "12",
					"accuracy": "1",
					"range": "180/240",
					"rate_of_fire": "1",
					"shots": "1(4)",
					"bulk": "-4",
					"calc": {
						"level": 0,
						"range": "180/240",
						"damage": "1d+1 imp"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Crossbow"
						}
					]
				}
			],
			"calc": {
				"extended_value": "225",
				"extended_weight": "4 lb"
			},
			"categories": [
				"Missile Weapon",
				"UsesAmmoType:Bolt"
			]
		},
		{
			"type": "equipment",
			"id": "f7a45b1f-a093-46da-9208-bf2221540ead",
			"quantity": 1,
			"description": "Pistol Crossbow (ST13)",
			"tech_level": "3",
			"value": "240",
			"weight": "4 lb",
			"reference": "B276",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "imp",
						"base": "1d+2"
					},
					"strength": "13",
					"accuracy": "1",
					"range": "195/260",
					"rate_of_fire": "1",
					"shots": "1(4)",
					"bulk": "-4",
					"calc": {
						"level": 0,
						"range": "195/260",
						"damage": "1d+2 imp"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Crossbow"
						}
					]
				}
			],
			"calc": {
				"extended_value": "240",
				"extended_weight": "4 lb"
			},
			"categories": [
				"Missile Weapon",
				"UsesAmmoType:Bolt"
			]
		},
		{
			"type": "equipment",
			"id": "b05e5bfd-8b9d-4832-add6-f21592397d43",
			"quantity": 1,
			"description": "Pistol Crossbow (ST14)",
			"tech_level": "3",
			"value": "255",
			"weight": "4 lb",
			"reference": "B276",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "imp",
						"base": "1d+2"
					},
					"strength": "14",
					"accuracy": "1",
					"range": "210/280",
					"rate_of_fire": "1",
					"shots": "1(4)",
					"bulk": "-4",
					"calc": {
						"level": 0,
						"range": "210/280",
						"damage": "1d+2 imp"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Crossbow"
						}
					]
				}
			],
			"calc": {
				"extended_value": "255",
				"extended_weight": "4 lb"
			},
			"categories": [
				"Missile Weapon",
				"UsesAmmoType:Bolt"
			]
		},
		{
			"type": "equipment",
			"id": "6a578f96-7a49-49fe-851f-d67a071af296",
			"quantity": 1,
			"description": "Pistol Crossbow (ST15)",
			"tech_level": "3",
			"value": "270",
			"weight": "4 lb",
			"reference": "B276",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "imp",
						"base": "1d+3"
					},
					"strength": "15",
					"accuracy": "1",
					"range": "225/300",
					"rate_of_fire": "1",
					"shots": "1(4)",
					"bulk": "-4",
					"calc": {
						"level": 0,
						"range": "225/300",
						"damage": "1d+3 imp"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Crossbow"
						}
					]
				}
			],
			"calc": {
				"extended_value": "270",
				"extended_weight": "4 lb"
			},
			"categories": [
				"Missile Weapon",
				"UsesAmmoType:Bolt"
			]
		},
		{
			"type": "equipment",
			"id": "63ebe6ec-9812-4901-aeda-b6c63548bef2",
			"quantity": 1,
			"description": "Pistol Crossbow (ST16)",
			"tech_level": "3",
			"value": "285",
			"weight": "4 lb",
			"reference": "B276",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "imp",
						"base": "1d+3"
					},
					"strength": "16",
					"accuracy": "1",
					"range": "240/320",
					"rate_of_fire": "1",
					"shots": "1(4)",
					"bulk": "-4",
					"calc": {
						"level": 0,
						"range": "240/320",
						"damage": "1d+3 imp"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Crossbow"
						}
					]
				}
			],
			"calc": {
				"extended_value": "285",
				"extended_weight": "4 lb"
			},
			"categories": [
				"Missile Weapon",
				"UsesAmmoType:Bolt"
			]
		},
		{
			"type": "equipment",
			"id": "2ea7a4cd-189c-40a8-86eb-ceffecca7fe7",
			"quantity": 1,
			"description": "Pistol Crossbow (ST17)",
			"tech_level": "3",
			"value": "300",
			"weight": "4 lb",
			"reference": "B276",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "imp",
						"base": "2d"
					},
					"strength": "17",
					"accuracy": "1",
					"range": "255/340",
					"rate_of_fire": "1",
					"shots": "1(4)",
					"bulk": "-4",
					"calc": {
						"level": 0,
						"range": "255/340",
						"damage": "2d imp"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Crossbow"
						}
					]
				}
			],
			"calc": {
				"extended_value": "300",
				"extended_weight": "4 lb"
			},
			"categories": [
				"Missile Weapon",
				"UsesAmmoType:Bolt"
			]
		},
		{
			"type": "equipment",
			"id": "bc2fd485-8d8c-4fc0-88c2-b4d21cd39d9f",
			"quantity": 1,
			"description": "Pistol Crossbow (ST18)",
			"tech_level": "3",
			"value": "315",
			"weight": "4 lb",
			"reference": "B276",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "imp",
						"base": "2d"
					},
					"strength": "18",
					"accuracy": "1",
					"range": "270/360",
					"rate_of_fire": "1",
					"shots": "1(4)",
					"bulk": "-4",
					"calc": {
						"level": 0,
						"range": "270/360",
						"damage": "2d imp"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Crossbow"
						}
					]
				}
			],
			"calc": {
				"extended_value": "315",
				"extended_weight": "4 lb"
			},
			"categories": [
				"Missile Weapon",
				"UsesAmmoType:Bolt"
			]
		},
		{
			"type": "equipment",
			"id": "502808e1-2c8f-46b8-8b78-3a785c08b8f5",
			"quantity": 1,
			"description": "Pistol Crossbow (ST19)",
			"tech_level": "3",
			"value": "330",
			"weight": "4 lb",
			"reference": "B276",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "imp",
						"base": "2d+1"
					},
					"strength": "19",
					"accuracy": "1",
					"range": "285/380",
					"rate_of_fire": "1",
					"shots": "1(4)",
					"bulk": "-4",
					"calc": {
						"level": 0,
						"range": "285/380",
						"damage": "2d+1 imp"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Crossbow"
						}
					]
				}
			],
			"calc": {
				"extended_value": "330",
				"extended_weight": "4 lb"
			},
			"categories": [
				"Missile Weapon",
				"UsesAmmoType:Bolt"
			]
		},
		{
			"type": "equipment",
			"id": "fdc71c5e-461d-44d5-ae7f-3f6619a3ec25",
			"quantity": 1,
			"description": "Pistol Crossbow (ST20)",
			"tech_level": "3",
			"value": "345",
			"weight": "4 lb",
			"reference": "B276",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "imp",
						"base": "2d+1"
					},
					"strength": "20",
					"accuracy": "1",
					"range": "300/400",
					"rate_of_fire": "1",
					"shots": "1(4)",
					"bulk": "-4",
					"calc": {
						"level": 0,
						"range": "300/400",
						"damage": "2d+1 imp"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Crossbow"
						}
					]
				}
			],
			"calc": {
				"extended_value": "345",
				"extended_weight": "4 lb"
			},
			"categories": [
				"Missile Weapon",
				"UsesAmmoType:Bolt"
			]
		},
		{
			"type": "equipment",
			"id": "2233ed4f-6b04-43df-b759-ad7465fbce89",
			"quantity": 1,
			"description": "Plate Arms",
			"tech_level": "3",
			"legality_class": "3",
			"value": "1000",
			"weight": "15 lb",
			"reference": "B283",
			"calc": {
				"extended_value": "1000",
				"extended_weight": "15 lb"
			},
			"features": [
				{
					"type": "dr_bonus",
					"amount": 6,
					"location": "arm"
				}
			],
			"categories": [
				"Limb Armor"
			]
		},
		{
			"type": "equipment",
			"id": "cf4a327d-0b0f-4d0f-aa05-b202073611d0",
			"quantity": 1,
			"description": "Plate Legs",
			"tech_level": "3",
			"legality_class": "3",
			"value": "1100",
			"weight": "20 lb",
			"reference": "B283",
			"calc": {
				"extended_value": "1100",
				"extended_weight": "20 lb"
			},
			"features": [
				{
					"type": "dr_bonus",
					"amount": 6,
					"location": "leg"
				}
			],
			"categories": [
				"Limb Armor"
			]
		},
		{
			"type": "equipment",
			"id": "c45aa7d6-6bec-4c8c-be04-03b67291381b",
			"quantity": 1,
			"description": "Plow, Iron",
			"tech_level": "2",
			"value": "220",
			"weight": "120 lb",
			"reference": "B289",
			"calc": {
				"extended_value": "220",
				"extended_weight": "120 lb"
			},
			"notes": "Works rough soils",
			"categories": [
				"Tools"
			]
		},
		{
			"type": "equipment",
			"id": "6a0814cf-565f-4c70-8e04-0620bb193693",
			"quantity": 1,
			"description": "Plow, Wooden",
			"tech_level": "1",
			"value": "55",
			"weight": "60 lb",
			"reference": "B289",
			"calc": {
				"extended_value": "55",
				"extended_weight": "60 lb"
			},
			"notes": "Pulled by oxen",
			"categories": [
				"Tools"
			]
		},
		{
			"type": "equipment",
			"id": "b6cdb4bc-8233-47c0-a372-4c302e743a2b",
			"quantity": 1,
			"description": "Pole, 6\'",
			"tech_level": "0",
			"value": "5",
			"weight": "3 lb",
			"reference": "B288",
			"calc": {
				"extended_value": "5",
				"extended_weight": "3 lb"
			},
			"categories": [
				"Camping and Survival Gear"
			]
		},
		{
			"type": "equipment",
			"id": "fdb0a736-7e10-4885-9773-b99730da5121",
			"quantity": 1,
			"description": "Pole, 10\'",
			"tech_level": "0",
			"value": "8",
			"weight": "5 lb",
			"reference": "B288",
			"calc": {
				"extended_value": "8",
				"extended_weight": "5 lb"
			},
			"categories": [
				"Camping and Survival Gear"
			]
		},
		{
			"type": "equipment",
			"id": "a80507f2-f16e-4299-98ee-3cdb1bb2a00c",
			"quantity": 1,
			"description": "Poleaxe",
			"tech_level": "3",
			"value": "120",
			"weight": "10 lb",
			"reference": "B272",
			"weapons": [
				{
					"type": "melee_weapon",
					"damage": {
						"type": "cut",
						"st": "sw",
						"base": "4"
					},
					"strength": "12‡",
					"usage": "Swung",
					"reach": "2,3*",
					"parry": "0U",
					"block": "No",
					"calc": {
						"level": 0,
						"parry": "0U",
						"block": "No",
						"damage": "sw+4 cut"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -5
						},
						{
							"type": "skill",
							"name": "Polearm"
						},
						{
							"type": "skill",
							"name": "Spear",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Staff",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Two-Handed Axe/Mace",
							"modifier": -4
						}
					]
				},
				{
					"type": "melee_weapon",
					"damage": {
						"type": "cr",
						"st": "sw",
						"base": "4"
					},
					"strength": "12‡",
					"usage": "Swung",
					"reach": "2,3*",
					"parry": "0U",
					"block": "No",
					"calc": {
						"level": 0,
						"parry": "0U",
						"block": "No",
						"damage": "sw+4 cr"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -5
						},
						{
							"type": "skill",
							"name": "Polearm"
						},
						{
							"type": "skill",
							"name": "Spear",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Staff",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Two-Handed Axe/Mace",
							"modifier": -4
						}
					]
				}
			],
			"calc": {
				"extended_value": "120",
				"extended_weight": "10 lb"
			},
			"categories": [
				"Melee Weapon"
			]
		},
		{
			"type": "equipment",
			"id": "b90d149c-028d-48bb-8034-458058f7d01c",
			"quantity": 1,
			"description": "Portable Tool Kit, Armoury",
			"tech_level": "1",
			"value": "600",
			"weight": "20 lb",
			"reference": "B289",
			"calc": {
				"extended_value": "600",
				"extended_weight": "20 lb"
			},
			"categories": [
				"Tools"
			]
		},
		{
			"type": "equipment",
			"id": "90eb9460-0e07-48e5-afd7-d7716c21945e",
			"quantity": 1,
			"description": "Portable Tool Kit, Carpentry",
			"tech_level": "1",
			"value": "300",
			"weight": "20 lb",
			"reference": "B289",
			"calc": {
				"extended_value": "300",
				"extended_weight": "20 lb"
			},
			"categories": [
				"Tools"
			]
		},
		{
			"type": "equipment",
			"id": "92df7f4e-c572-45ba-8afd-c84ce7ce2b0d",
			"quantity": 1,
			"description": "Portable Tool Kit, Electrician",
			"tech_level": "6",
			"value": "600",
			"weight": "20 lb",
			"reference": "B289",
			"calc": {
				"extended_value": "600",
				"extended_weight": "20 lb"
			},
			"categories": [
				"Tools"
			]
		},
		{
			"type": "equipment",
			"id": "919d4139-9a5e-422f-90e2-b067bab75f8a",
			"quantity": 1,
			"description": "Portable Tool Kit, Electronics Repair",
			"tech_level": "6",
			"value": "1200",
			"weight": "10 lb",
			"reference": "B289",
			"calc": {
				"extended_value": "1200",
				"extended_weight": "10 lb"
			},
			"categories": [
				"Tools"
			]
		},
		{
			"type": "equipment",
			"id": "e812c666-9627-4794-88d1-3944a4c13983",
			"quantity": 1,
			"description": "Portable Tool Kit, Explosives",
			"tech_level": "5",
			"value": "600",
			"weight": "20 lb",
			"reference": "B289",
			"calc": {
				"extended_value": "600",
				"extended_weight": "20 lb"
			},
			"categories": [
				"Tools"
			]
		},
		{
			"type": "equipment",
			"id": "3181b571-ac1e-42c2-8319-8f3e491dc76d",
			"quantity": 1,
			"description": "Portable Tool Kit, Machinist",
			"tech_level": "5",
			"value": "600",
			"weight": "20 lb",
			"reference": "B289",
			"calc": {
				"extended_value": "600",
				"extended_weight": "20 lb"
			},
			"categories": [
				"Tools"
			]
		},
		{
			"type": "equipment",
			"id": "cbe3492b-ca4c-4670-a271-918ac7090de1",
			"quantity": 1,
			"description": "Portable Tool Kit, Mechanic",
			"tech_level": "5",
			"value": "600",
			"weight": "20 lb",
			"reference": "B289",
			"calc": {
				"extended_value": "600",
				"extended_weight": "20 lb"
			},
			"categories": [
				"Tools"
			]
		},
		{
			"type": "equipment",
			"id": "c3af1c20-4356-4a4f-a260-6680def1283e",
			"quantity": 1,
			"description": "Pot-Helm",
			"tech_level": "3",
			"value": "100",
			"weight": "5 lb",
			"reference": "B284",
			"calc": {
				"extended_value": "100",
				"extended_weight": "5 lb"
			},
			"features": [
				{
					"type": "dr_bonus",
					"amount": 4,
					"location": "skull"
				}
			],
			"categories": [
				"Headgear"
			]
		},
		{
			"type": "equipment_container",
			"id": "ee5e53a9-fe3e-455a-bf95-2b0351eff420",
			"description": "Pouch, Small",
			"tech_level": "1",
			"value": "10",
			"weight": "0.5 lb",
			"reference": "B288",
			"calc": {
				"extended_value": "10",
				"extended_weight": "0.5 lb"
			},
			"prereqs": {
				"type": "prereq_list",
				"all": true,
				"prereqs": [
					{
						"type": "contained_weight_prereq",
						"has": true,
						"qualifier": {
							"compare": "at_most",
							"qualifier": "3 lb"
						}
					}
				]
			},
			"categories": [
				"Camping and Survival Gear"
			],
			"open": true
		},
		{
			"type": "equipment",
			"id": "77f917f0-610f-43e7-888d-122b842bec0f",
			"quantity": 1,
			"description": "Prodd (ST7)",
			"tech_level": "3",
			"value": "150",
			"weight": "6 lb",
			"reference": "B276",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "pi",
						"base": "1d+1"
					},
					"strength": "7†",
					"accuracy": "2",
					"range": "140/175",
					"rate_of_fire": "1",
					"shots": "1(4)",
					"bulk": "-6",
					"calc": {
						"level": 0,
						"range": "140/175",
						"damage": "1d+1 pi"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Crossbow"
						}
					]
				}
			],
			"calc": {
				"extended_value": "150",
				"extended_weight": "6 lb"
			},
			"categories": [
				"Missile Weapon",
				"UsesAmmoType:Prodd"
			]
		},
		{
			"type": "equipment",
			"id": "0447aae5-cb7e-4d85-8eb1-d2d530a89c1c",
			"quantity": 1,
			"description": "Prodd (ST8)",
			"tech_level": "3",
			"value": "165",
			"weight": "6 lb",
			"reference": "B276",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "pi",
						"base": "1d+1"
					},
					"strength": "8†",
					"accuracy": "2",
					"range": "160/200",
					"rate_of_fire": "1",
					"shots": "1(4)",
					"bulk": "-6",
					"calc": {
						"level": 0,
						"range": "160/200",
						"damage": "1d+1 pi"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Crossbow"
						}
					]
				}
			],
			"calc": {
				"extended_value": "165",
				"extended_weight": "6 lb"
			},
			"categories": [
				"Missile Weapon",
				"UsesAmmoType:Prodd"
			]
		},
		{
			"type": "equipment",
			"id": "328bb550-d6c6-4990-b37e-e252076de558",
			"quantity": 1,
			"description": "Prodd (ST9)",
			"tech_level": "3",
			"value": "180",
			"weight": "6 lb",
			"reference": "B276",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "pi",
						"base": "1d+2"
					},
					"strength": "9†",
					"accuracy": "2",
					"range": "180/225",
					"rate_of_fire": "1",
					"shots": "1(4)",
					"bulk": "-6",
					"calc": {
						"level": 0,
						"range": "180/225",
						"damage": "1d+2 pi"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Crossbow"
						}
					]
				}
			],
			"calc": {
				"extended_value": "180",
				"extended_weight": "6 lb"
			},
			"categories": [
				"Missile Weapon",
				"UsesAmmoType:Prodd"
			]
		},
		{
			"type": "equipment",
			"id": "d4cc9402-bbf2-4168-a1d5-dba34e27872f",
			"quantity": 1,
			"description": "Prodd (ST10)",
			"tech_level": "3",
			"value": "195",
			"weight": "6 lb",
			"reference": "B276",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "pi",
						"base": "1d+2"
					},
					"strength": "10†",
					"accuracy": "2",
					"range": "200/250",
					"rate_of_fire": "1",
					"shots": "1(4)",
					"bulk": "-6",
					"calc": {
						"level": 0,
						"range": "200/250",
						"damage": "1d+2 pi"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Crossbow"
						}
					]
				}
			],
			"calc": {
				"extended_value": "195",
				"extended_weight": "6 lb"
			},
			"categories": [
				"Missile Weapon",
				"UsesAmmoType:Prodd"
			]
		},
		{
			"type": "equipment",
			"id": "f963d4ff-7bee-4ba7-9cbc-2dde5fb354b0",
			"quantity": 1,
			"description": "Prodd (ST11)",
			"tech_level": "3",
			"value": "210",
			"weight": "6 lb",
			"reference": "B276",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "pi",
						"base": "1d+3"
					},
					"strength": "11†",
					"accuracy": "2",
					"range": "220/275",
					"rate_of_fire": "1",
					"shots": "1(4)",
					"bulk": "-6",
					"calc": {
						"level": 0,
						"range": "220/275",
						"damage": "1d+3 pi"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Crossbow"
						}
					]
				}
			],
			"calc": {
				"extended_value": "210",
				"extended_weight": "6 lb"
			},
			"categories": [
				"Missile Weapon",
				"UsesAmmoType:Prodd"
			]
		},
		{
			"type": "equipment",
			"id": "2dc18184-9afa-4932-835c-0cfa51d4132f",
			"quantity": 1,
			"description": "Prodd (ST12)",
			"tech_level": "3",
			"value": "225",
			"weight": "6 lb",
			"reference": "B276",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "pi",
						"base": "1d+3"
					},
					"strength": "12†",
					"accuracy": "2",
					"range": "240/300",
					"rate_of_fire": "1",
					"shots": "1(4)",
					"bulk": "-6",
					"calc": {
						"level": 0,
						"range": "240/300",
						"damage": "1d+3 pi"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Crossbow"
						}
					]
				}
			],
			"calc": {
				"extended_value": "225",
				"extended_weight": "6 lb"
			},
			"categories": [
				"Missile Weapon",
				"UsesAmmoType:Prodd"
			]
		},
		{
			"type": "equipment",
			"id": "8ef473d7-c561-4d49-bcd8-5c8dc4fa53bb",
			"quantity": 1,
			"description": "Prodd (ST13)",
			"tech_level": "3",
			"value": "240",
			"weight": "6 lb",
			"reference": "B276",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "pi",
						"base": "2d"
					},
					"strength": "13†",
					"accuracy": "2",
					"range": "260/325",
					"rate_of_fire": "1",
					"shots": "1(4)",
					"bulk": "-6",
					"calc": {
						"level": 0,
						"range": "260/325",
						"damage": "2d pi"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Crossbow"
						}
					]
				}
			],
			"calc": {
				"extended_value": "240",
				"extended_weight": "6 lb"
			},
			"categories": [
				"Missile Weapon",
				"UsesAmmoType:Prodd"
			]
		},
		{
			"type": "equipment",
			"id": "320cf5f2-4ed5-4887-80fd-8cf90b1ccc85",
			"quantity": 1,
			"description": "Prodd (ST14)",
			"tech_level": "3",
			"value": "255",
			"weight": "6 lb",
			"reference": "B276",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "pi",
						"base": "2d"
					},
					"strength": "14†",
					"accuracy": "2",
					"range": "280/350",
					"rate_of_fire": "1",
					"shots": "1(4)",
					"bulk": "-6",
					"calc": {
						"level": 0,
						"range": "280/350",
						"damage": "2d pi"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Crossbow"
						}
					]
				}
			],
			"calc": {
				"extended_value": "255",
				"extended_weight": "6 lb"
			},
			"categories": [
				"Missile Weapon",
				"UsesAmmoType:Prodd"
			]
		},
		{
			"type": "equipment",
			"id": "a14eea6e-2822-4117-89ed-9c814547405d",
			"quantity": 1,
			"description": "Prodd (ST15)",
			"tech_level": "3",
			"value": "270",
			"weight": "6 lb",
			"reference": "B276",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "pi",
						"base": "2d+1"
					},
					"strength": "15†",
					"accuracy": "2",
					"range": "300/375",
					"rate_of_fire": "1",
					"shots": "1(4)",
					"bulk": "-6",
					"calc": {
						"level": 0,
						"range": "300/375",
						"damage": "2d+1 pi"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Crossbow"
						}
					]
				}
			],
			"calc": {
				"extended_value": "270",
				"extended_weight": "6 lb"
			},
			"categories": [
				"Missile Weapon",
				"UsesAmmoType:Prodd"
			]
		},
		{
			"type": "equipment",
			"id": "25c3d008-a0a8-4aad-bd48-9471a689ee4e",
			"quantity": 1,
			"description": "Prodd (ST16)",
			"tech_level": "3",
			"value": "285",
			"weight": "6 lb",
			"reference": "B276",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "pi",
						"base": "2d+1"
					},
					"strength": "16†",
					"accuracy": "2",
					"range": "320/400",
					"rate_of_fire": "1",
					"shots": "1(4)",
					"bulk": "-6",
					"calc": {
						"level": 0,
						"range": "320/400",
						"damage": "2d+1 pi"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Crossbow"
						}
					]
				}
			],
			"calc": {
				"extended_value": "285",
				"extended_weight": "6 lb"
			},
			"categories": [
				"Missile Weapon",
				"UsesAmmoType:Prodd"
			]
		},
		{
			"type": "equipment",
			"id": "5174bb20-b50f-4710-9595-6cb59eb642dc",
			"quantity": 1,
			"description": "Prodd (ST17)",
			"tech_level": "3",
			"value": "300",
			"weight": "6 lb",
			"reference": "B276",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "pi",
						"base": "2d+2"
					},
					"strength": "17†",
					"accuracy": "2",
					"range": "340/425",
					"rate_of_fire": "1",
					"shots": "1(4)",
					"bulk": "-6",
					"calc": {
						"level": 0,
						"range": "340/425",
						"damage": "2d+2 pi"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Crossbow"
						}
					]
				}
			],
			"calc": {
				"extended_value": "300",
				"extended_weight": "6 lb"
			},
			"categories": [
				"Missile Weapon",
				"UsesAmmoType:Prodd"
			]
		},
		{
			"type": "equipment",
			"id": "e8061e05-ac61-44a5-a1ff-abb11cb69d2a",
			"quantity": 1,
			"description": "Prodd (ST18)",
			"tech_level": "3",
			"value": "315",
			"weight": "6 lb",
			"reference": "B276",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "pi",
						"base": "2d+2"
					},
					"strength": "18†",
					"accuracy": "2",
					"range": "360/450",
					"rate_of_fire": "1",
					"shots": "1(4)",
					"bulk": "-6",
					"calc": {
						"level": 0,
						"range": "360/450",
						"damage": "2d+2 pi"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Crossbow"
						}
					]
				}
			],
			"calc": {
				"extended_value": "315",
				"extended_weight": "6 lb"
			},
			"categories": [
				"Missile Weapon",
				"UsesAmmoType:Prodd"
			]
		},
		{
			"type": "equipment",
			"id": "c5f7d0e9-ed5f-4f38-b121-f370e40db5d6",
			"quantity": 1,
			"description": "Prodd (ST19)",
			"tech_level": "3",
			"value": "330",
			"weight": "6 lb",
			"reference": "B276",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "pi",
						"base": "2d+3"
					},
					"strength": "19†",
					"accuracy": "2",
					"range": "380/475",
					"rate_of_fire": "1",
					"shots": "1(4)",
					"bulk": "-6",
					"calc": {
						"level": 0,
						"range": "380/475",
						"damage": "2d+3 pi"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Crossbow"
						}
					]
				}
			],
			"calc": {
				"extended_value": "330",
				"extended_weight": "6 lb"
			},
			"categories": [
				"Missile Weapon",
				"UsesAmmoType:Prodd"
			]
		},
		{
			"type": "equipment",
			"id": "d7c57048-8188-426a-b174-19d18b9f6e17",
			"quantity": 1,
			"description": "Prodd (ST20)",
			"tech_level": "3",
			"value": "345",
			"weight": "6 lb",
			"reference": "B276",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "pi",
						"base": "2d+3"
					},
					"strength": "20†",
					"accuracy": "2",
					"range": "400/500",
					"rate_of_fire": "1",
					"shots": "1(4)",
					"bulk": "-6",
					"calc": {
						"level": 0,
						"range": "400/500",
						"damage": "2d+3 pi"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Crossbow"
						}
					]
				}
			],
			"calc": {
				"extended_value": "345",
				"extended_weight": "6 lb"
			},
			"categories": [
				"Missile Weapon",
				"UsesAmmoType:Prodd"
			]
		},
		{
			"type": "equipment",
			"id": "0032a515-6bca-4b80-804e-f8dc631ac972",
			"quantity": 1,
			"description": "Pump Shotgun, 12G",
			"tech_level": "6",
			"value": "240",
			"weight": "8 lb",
			"reference": "B279",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "pi",
						"base": "1d+1"
					},
					"strength": "10†",
					"accuracy": "3",
					"range": "50/125",
					"rate_of_fire": "2x9",
					"shots": "5(3i)",
					"bulk": "-5",
					"recoil": "1",
					"calc": {
						"level": 0,
						"range": "50/125",
						"damage": "1d+1 pi"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Pistol",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Rifle",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Shotgun"
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Light Machine Gun",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Submachine Gun",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Musket",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Grenade Launcher",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Gyroc",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Light Anti-Armor Weapon",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Gun!"
						}
					]
				}
			],
			"calc": {
				"extended_value": "240",
				"extended_weight": "8 lb"
			},
			"categories": [
				"Missile Weapon"
			]
		},
		{
			"type": "equipment_container",
			"id": "fa41df8d-ea35-4807-be22-5156748b3933",
			"description": "Purse, Small",
			"tech_level": "1",
			"value": "10",
			"weight": "0.2 lb",
			"reference": "B288",
			"calc": {
				"extended_value": "10",
				"extended_weight": "0.2 lb"
			},
			"prereqs": {
				"type": "prereq_list",
				"all": true,
				"prereqs": [
					{
						"type": "contained_weight_prereq",
						"has": true,
						"qualifier": {
							"compare": "at_most",
							"qualifier": "1 lb"
						}
					}
				]
			},
			"categories": [
				"Camping and Survival Gear"
			],
			"open": true
		},
		{
			"type": "equipment",
			"id": "9cb7d976-d975-4644-ac16-7dc5e72b862c",
			"quantity": 1,
			"description": "Quarterstaff",
			"tech_level": "0",
			"value": "10",
			"weight": "4 lb",
			"reference": "B273",
			"weapons": [
				{
					"type": "melee_weapon",
					"damage": {
						"type": "cr",
						"st": "sw",
						"base": "2"
					},
					"strength": "7†",
					"usage": "Swung",
					"usage_notes": "Staff",
					"reach": "1,2",
					"parry": "+2",
					"block": "No",
					"calc": {
						"level": 0,
						"parry": "+2",
						"block": "No",
						"damage": "sw+2 cr"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -5
						},
						{
							"type": "skill",
							"name": "Staff"
						},
						{
							"type": "skill",
							"name": "Polearm",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Spear",
							"modifier": -2
						}
					]
				},
				{
					"type": "melee_weapon",
					"damage": {
						"type": "cr",
						"st": "thr",
						"base": "2"
					},
					"strength": "7†",
					"usage": "Thrust",
					"usage_notes": "Staff",
					"reach": "1,2",
					"parry": "+2",
					"block": "No",
					"calc": {
						"level": 0,
						"parry": "+2",
						"block": "No",
						"damage": "thr+2 cr"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -5
						},
						{
							"type": "skill",
							"name": "Staff"
						},
						{
							"type": "skill",
							"name": "Polearm",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Spear",
							"modifier": -2
						}
					]
				},
				{
					"type": "melee_weapon",
					"damage": {
						"type": "cr",
						"st": "sw",
						"base": "2"
					},
					"strength": "9†",
					"usage": "Swung",
					"usage_notes": "Two-Handed Sword",
					"reach": "1,2",
					"parry": "0",
					"block": "No",
					"calc": {
						"level": 0,
						"parry": "0",
						"block": "No",
						"damage": "sw+2 cr"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -5
						},
						{
							"type": "skill",
							"name": "Two-Handed Sword"
						},
						{
							"type": "skill",
							"name": "Broadsword",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Force Sword",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Sword!"
						}
					]
				},
				{
					"type": "melee_weapon",
					"damage": {
						"type": "cr",
						"st": "thr",
						"base": "1"
					},
					"strength": "9†",
					"usage": "Thrust",
					"usage_notes": "Two-Handed Sword",
					"reach": "2",
					"parry": "0",
					"block": "No",
					"calc": {
						"level": 0,
						"parry": "0",
						"block": "No",
						"damage": "thr+1 cr"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -5
						},
						{
							"type": "skill",
							"name": "Two-Handed Sword"
						},
						{
							"type": "skill",
							"name": "Broadsword",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Force Sword",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Sword!"
						}
					]
				}
			],
			"calc": {
				"extended_value": "10",
				"extended_weight": "4 lb"
			},
			"categories": [
				"Melee Weapon"
			]
		},
		{
			"type": "equipment",
			"id": "0d6354e1-8ec6-4644-afd8-beb3249d2833",
			"quantity": 1,
			"description": "Radio, Backpack",
			"tech_level": "7",
			"value": "6000",
			"weight": "15 lb",
			"reference": "B288",
			"calc": {
				"extended_value": "6000",
				"extended_weight": "15 lb"
			},
			"notes": "VHF radio. 20-mile range. 12 hrs.",
			"categories": [
				"Communications and Information Gear"
			]
		},
		{
			"type": "equipment",
			"id": "847b48a9-8457-48f1-9bc5-108e5c483f37",
			"quantity": 1,
			"description": "Radio, Hand",
			"tech_level": "7",
			"value": "100",
			"weight": "1 lb",
			"reference": "B288",
			"calc": {
				"extended_value": "100",
				"extended_weight": "1 lb"
			},
			"notes": "Classic \\"walkie-talkie.\\" 2-mile range. 12 hrs.",
			"categories": [
				"Communications and Information Gear"
			]
		},
		{
			"type": "equipment",
			"id": "a627b99d-ec6e-4d9b-bbaf-ebcb0b62908f",
			"quantity": 1,
			"description": "Radio, Headset",
			"tech_level": "8",
			"value": "500",
			"weight": "0.5 lb",
			"reference": "B288",
			"calc": {
				"extended_value": "500",
				"extended_weight": "0.5 lb"
			},
			"notes": "With throat mike. 1-mile range. 12 hrs.",
			"categories": [
				"Communications and Information Gear"
			]
		},
		{
			"type": "equipment",
			"id": "dad42d86-9790-46d2-a1c1-59534b816e84",
			"quantity": 1,
			"description": "Radio, Headset, secure",
			"tech_level": "8",
			"value": "5000",
			"weight": "0.5 lb",
			"reference": "B288",
			"calc": {
				"extended_value": "5000",
				"extended_weight": "0.5 lb"
			},
			"notes": "With throat mike. 1-mile range. Secure, encrypted version. 12 hrs.",
			"categories": [
				"Communications and Information Gear"
			]
		},
		{
			"type": "equipment",
			"id": "e9dcc6bb-e08c-4b63-ac24-5e72d60ecc33",
			"quantity": 1,
			"description": "Rapier",
			"tech_level": "4",
			"value": "500",
			"weight": "2.75 lb",
			"reference": "B273",
			"weapons": [
				{
					"type": "melee_weapon",
					"damage": {
						"type": "imp",
						"st": "thr",
						"base": "1"
					},
					"strength": "9",
					"usage": "Thrust",
					"reach": "1,2",
					"parry": "0F",
					"block": "No",
					"calc": {
						"level": 0,
						"parry": "0F",
						"block": "No",
						"damage": "thr+1 imp"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -5
						},
						{
							"type": "skill",
							"name": "Rapier"
						},
						{
							"type": "skill",
							"name": "Broadsword",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Main-Gauche",
							"modifier": -3
						},
						{
							"type": "skill",
							"name": "Saber",
							"modifier": -3
						},
						{
							"type": "skill",
							"name": "Smallsword",
							"modifier": -3
						},
						{
							"type": "skill",
							"name": "Sword!"
						}
					]
				}
			],
			"calc": {
				"extended_value": "500",
				"extended_weight": "2.75 lb"
			},
			"categories": [
				"Melee Weapon"
			]
		},
		{
			"type": "equipment",
			"id": "161803c5-3f84-4d40-b4fc-cd9c3f142a53",
			"quantity": 1,
			"description": "Regular Bow (ST10)",
			"tech_level": "0",
			"value": "100",
			"weight": "2 lb",
			"reference": "B275",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "imp",
						"base": "1d-1"
					},
					"strength": "10†",
					"accuracy": "2",
					"range": "150/200",
					"rate_of_fire": "1",
					"shots": "1(2)",
					"bulk": "-7",
					"calc": {
						"level": 0,
						"range": "150/200",
						"damage": "1d-1 imp"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -5
						},
						{
							"type": "skill",
							"name": "Bow"
						}
					]
				}
			],
			"calc": {
				"extended_value": "100",
				"extended_weight": "2 lb"
			},
			"categories": [
				"Missile Weapon",
				"UsesAmmoType:Arrow"
			]
		},
		{
			"type": "equipment",
			"id": "85447f49-9d70-4fce-a138-e73b23280130",
			"quantity": 1,
			"description": "Regular Bow (ST11)",
			"tech_level": "0",
			"value": "110",
			"weight": "2 lb",
			"reference": "B275",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "imp",
						"base": "1d"
					},
					"strength": "11†",
					"accuracy": "2",
					"range": "165/220",
					"rate_of_fire": "1",
					"shots": "1(2)",
					"bulk": "-7",
					"calc": {
						"level": 0,
						"range": "165/220",
						"damage": "1d imp"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -5
						},
						{
							"type": "skill",
							"name": "Bow"
						}
					]
				}
			],
			"calc": {
				"extended_value": "110",
				"extended_weight": "2 lb"
			},
			"categories": [
				"Missile Weapon",
				"UsesAmmoType:Arrow"
			]
		},
		{
			"type": "equipment",
			"id": "b260186a-a7a8-4eb8-b2c5-69d30decf2de",
			"quantity": 1,
			"description": "Regular Bow (ST12)",
			"tech_level": "0",
			"value": "120",
			"weight": "2 lb",
			"reference": "B275",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "imp",
						"base": "1d"
					},
					"strength": "12†",
					"accuracy": "2",
					"range": "180/240",
					"rate_of_fire": "1",
					"shots": "1(2)",
					"bulk": "-7",
					"calc": {
						"level": 0,
						"range": "180/240",
						"damage": "1d imp"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -5
						},
						{
							"type": "skill",
							"name": "Bow"
						}
					]
				}
			],
			"calc": {
				"extended_value": "120",
				"extended_weight": "2 lb"
			},
			"categories": [
				"Missile Weapon",
				"UsesAmmoType:Arrow"
			]
		},
		{
			"type": "equipment",
			"id": "ea0c164a-de16-4e3c-b0bc-9570dae6d59a",
			"quantity": 1,
			"description": "Regular Bow (ST13)",
			"tech_level": "0",
			"value": "130",
			"weight": "2 lb",
			"reference": "B275",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "imp",
						"base": "1d+1"
					},
					"strength": "13†",
					"accuracy": "2",
					"range": "195/260",
					"rate_of_fire": "1",
					"shots": "1(2)",
					"bulk": "-7",
					"calc": {
						"level": 0,
						"range": "195/260",
						"damage": "1d+1 imp"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -5
						},
						{
							"type": "skill",
							"name": "Bow"
						}
					]
				}
			],
			"calc": {
				"extended_value": "130",
				"extended_weight": "2 lb"
			},
			"categories": [
				"Missile Weapon",
				"UsesAmmoType:Arrow"
			]
		},
		{
			"type": "equipment",
			"id": "75fb635e-de43-42a0-a7a4-16b9265ccdef",
			"quantity": 1,
			"description": "Regular Bow (ST14)",
			"tech_level": "0",
			"value": "140",
			"weight": "2 lb",
			"reference": "B275",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "imp",
						"base": "1d+1"
					},
					"strength": "14†",
					"accuracy": "2",
					"range": "210/280",
					"rate_of_fire": "1",
					"shots": "1(2)",
					"bulk": "-7",
					"calc": {
						"level": 0,
						"range": "210/280",
						"damage": "1d+1 imp"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -5
						},
						{
							"type": "skill",
							"name": "Bow"
						}
					]
				}
			],
			"calc": {
				"extended_value": "140",
				"extended_weight": "2 lb"
			},
			"categories": [
				"Missile Weapon",
				"UsesAmmoType:Arrow"
			]
		},
		{
			"type": "equipment",
			"id": "5461268d-5025-412b-a0c2-7c918ef5ea5a",
			"quantity": 1,
			"description": "Regular Bow (ST15)",
			"tech_level": "0",
			"value": "150",
			"weight": "2 lb",
			"reference": "B275",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "imp",
						"base": "1d+2"
					},
					"strength": "15†",
					"accuracy": "2",
					"range": "225/300",
					"rate_of_fire": "1",
					"shots": "1(2)",
					"bulk": "-7",
					"calc": {
						"level": 0,
						"range": "225/300",
						"damage": "1d+2 imp"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -5
						},
						{
							"type": "skill",
							"name": "Bow"
						}
					]
				}
			],
			"calc": {
				"extended_value": "150",
				"extended_weight": "2 lb"
			},
			"categories": [
				"Missile Weapon",
				"UsesAmmoType:Arrow"
			]
		},
		{
			"type": "equipment",
			"id": "4c010953-3e1f-447c-831e-0befc8bab2e6",
			"quantity": 1,
			"description": "Regular Bow (ST16)",
			"tech_level": "0",
			"value": "160",
			"weight": "2 lb",
			"reference": "B275",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "imp",
						"base": "1d+2"
					},
					"strength": "16†",
					"accuracy": "2",
					"range": "240/320",
					"rate_of_fire": "1",
					"shots": "1(2)",
					"bulk": "-7",
					"calc": {
						"level": 0,
						"range": "240/320",
						"damage": "1d+2 imp"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -5
						},
						{
							"type": "skill",
							"name": "Bow"
						}
					]
				}
			],
			"calc": {
				"extended_value": "160",
				"extended_weight": "2 lb"
			},
			"categories": [
				"Missile Weapon",
				"UsesAmmoType:Arrow"
			]
		},
		{
			"type": "equipment",
			"id": "a4acebec-b146-4a88-9fca-1fe6ee202f92",
			"quantity": 1,
			"description": "Regular Bow (ST17)",
			"tech_level": "0",
			"value": "170",
			"weight": "2 lb",
			"reference": "B275",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "imp",
						"base": "1d+3"
					},
					"strength": "17†",
					"accuracy": "2",
					"range": "255/340",
					"rate_of_fire": "1",
					"shots": "1(2)",
					"bulk": "-7",
					"calc": {
						"level": 0,
						"range": "255/340",
						"damage": "1d+3 imp"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -5
						},
						{
							"type": "skill",
							"name": "Bow"
						}
					]
				}
			],
			"calc": {
				"extended_value": "170",
				"extended_weight": "2 lb"
			},
			"categories": [
				"Missile Weapon",
				"UsesAmmoType:Arrow"
			]
		},
		{
			"type": "equipment",
			"id": "a590c956-1c5c-4a0a-9b14-f8de3ecbad63",
			"quantity": 1,
			"description": "Regular Bow (ST18)",
			"tech_level": "0",
			"value": "180",
			"weight": "2 lb",
			"reference": "B275",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "imp",
						"base": "1d+3"
					},
					"strength": "18†",
					"accuracy": "2",
					"range": "270/360",
					"rate_of_fire": "1",
					"shots": "1(2)",
					"bulk": "-7",
					"calc": {
						"level": 0,
						"range": "270/360",
						"damage": "1d+3 imp"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -5
						},
						{
							"type": "skill",
							"name": "Bow"
						}
					]
				}
			],
			"calc": {
				"extended_value": "180",
				"extended_weight": "2 lb"
			},
			"categories": [
				"Missile Weapon",
				"UsesAmmoType:Arrow"
			]
		},
		{
			"type": "equipment",
			"id": "e67c46ff-081e-4a89-9ede-5667d264b770",
			"quantity": 1,
			"description": "Regular Bow (ST19)",
			"tech_level": "0",
			"value": "190",
			"weight": "2 lb",
			"reference": "B275",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "imp",
						"base": "2d"
					},
					"strength": "19†",
					"accuracy": "2",
					"range": "285/380",
					"rate_of_fire": "1",
					"shots": "1(2)",
					"bulk": "-7",
					"calc": {
						"level": 0,
						"range": "285/380",
						"damage": "2d imp"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -5
						},
						{
							"type": "skill",
							"name": "Bow"
						}
					]
				}
			],
			"calc": {
				"extended_value": "190",
				"extended_weight": "2 lb"
			},
			"categories": [
				"Missile Weapon",
				"UsesAmmoType:Arrow"
			]
		},
		{
			"type": "equipment",
			"id": "e2ff3375-7e63-466d-a41d-9ef33f1545dc",
			"quantity": 1,
			"description": "Regular Bow (ST20)",
			"tech_level": "0",
			"value": "200",
			"weight": "2 lb",
			"reference": "B275",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "imp",
						"base": "2d"
					},
					"strength": "20†",
					"accuracy": "2",
					"range": "300/400",
					"rate_of_fire": "1",
					"shots": "1(2)",
					"bulk": "-7",
					"calc": {
						"level": 0,
						"range": "300/400",
						"damage": "2d imp"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -5
						},
						{
							"type": "skill",
							"name": "Bow"
						}
					]
				}
			],
			"calc": {
				"extended_value": "200",
				"extended_weight": "2 lb"
			},
			"categories": [
				"Missile Weapon",
				"UsesAmmoType:Arrow"
			]
		},
		{
			"type": "equipment",
			"id": "1b423b2a-3e3e-44fe-a3ad-7ccfabf1d879",
			"quantity": 1,
			"description": "Reich 2 .338 Tungsten Sniper",
			"tech_level": "9",
			"legality_class": "3",
			"value": "5600",
			"weight": "17.5 lb",
			"reference": "B279",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "pi",
						"base": "7d+2",
						"armor_divisor": 2
					},
					"strength": "11B†",
					"accuracy": "6+3",
					"range": "1500/5500",
					"rate_of_fire": "1",
					"shots": "4+1(3)",
					"bulk": "-6",
					"recoil": "4",
					"calc": {
						"level": 0,
						"range": "1500/5500",
						"damage": "7d+2(2) pi"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Pistol",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Rifle"
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Shotgun",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Light Machine Gun",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Submachine Gun",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Musket",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Grenade Launcher",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Gyroc",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Light Anti-Armor Weapon",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Gun!"
						}
					]
				}
			],
			"calc": {
				"extended_value": "5600",
				"extended_weight": "17.5 lb"
			},
			"categories": [
				"Missile Weapon"
			]
		},
		{
			"type": "equipment",
			"id": "1bdb6145-6fef-436e-b863-ad5ff481651d",
			"quantity": 1,
			"description": "Reinforced Boots",
			"tech_level": "7",
			"value": "75",
			"weight": "3 lb",
			"reference": "B284",
			"calc": {
				"extended_value": "75",
				"extended_weight": "3 lb"
			},
			"features": [
				{
					"type": "dr_bonus",
					"amount": 2,
					"location": "foot"
				},
				{
					"type": "weapon_bonus",
					"amount": 1,
					"selection_type": "weapons_with_name",
					"specialization": {
						"compare": "is",
						"qualifier": "Kick"
					}
				}
			],
			"categories": [
				"Footwear"
			]
		},
		{
			"type": "equipment",
			"id": "7622b8c0-562a-4147-80a3-afd3bdf2fc3b",
			"quantity": 1,
			"description": "Revolver, .36",
			"tech_level": "5",
			"legality_class": "3",
			"value": "150",
			"weight": "2.5 lb",
			"reference": "B278",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "pi",
						"base": "2d-1"
					},
					"strength": "10",
					"accuracy": "1",
					"range": "120/1300",
					"rate_of_fire": "1",
					"shots": "6(3i)",
					"bulk": "-2",
					"recoil": "2",
					"calc": {
						"level": 0,
						"range": "120/1300",
						"damage": "2d-1 pi"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Pistol"
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Rifle",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Shotgun",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Light Machine Gun",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Submachine Gun",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Musket",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Grenade Launcher",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Gyroc",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Light Anti-Armor Weapon",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Gun!"
						}
					]
				}
			],
			"calc": {
				"extended_value": "150",
				"extended_weight": "2.5 lb"
			},
			"categories": [
				"Missile Weapon"
			]
		},
		{
			"type": "equipment",
			"id": "c24b4a82-23a7-4916-8395-4b08f9d1c7ca",
			"quantity": 1,
			"description": "Revolver, .38",
			"tech_level": "6",
			"legality_class": "3",
			"value": "400",
			"weight": "2 lb",
			"reference": "B278",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "pi",
						"base": "2d-1"
					},
					"strength": "8",
					"accuracy": "2",
					"range": "120/1500",
					"rate_of_fire": "3",
					"shots": "6(3i)",
					"bulk": "-2",
					"recoil": "2",
					"calc": {
						"level": 0,
						"range": "120/1500",
						"damage": "2d-1 pi"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Pistol"
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Rifle",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Shotgun",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Light Machine Gun",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Submachine Gun",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Musket",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Grenade Launcher",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Gyroc",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Light Anti-Armor Weapon",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Gun!"
						}
					]
				}
			],
			"calc": {
				"extended_value": "400",
				"extended_weight": "2 lb"
			},
			"categories": [
				"Missile Weapon"
			]
		},
		{
			"type": "equipment",
			"id": "e6d67927-6e0c-4bba-a63f-b84c5d57c61b",
			"quantity": 1,
			"description": "Revolver, .44M",
			"tech_level": "7",
			"legality_class": "3",
			"value": "900",
			"weight": "3.25 lb",
			"reference": "B278",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "pi+",
						"base": "3d"
					},
					"strength": "11",
					"accuracy": "2",
					"range": "200/2500",
					"rate_of_fire": "3",
					"shots": "6(3i)",
					"bulk": "-3",
					"recoil": "4",
					"calc": {
						"level": 0,
						"range": "200/2500",
						"damage": "3d pi+"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Pistol"
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Rifle",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Shotgun",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Light Machine Gun",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Submachine Gun",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Musket",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Grenade Launcher",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Gyroc",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Light Anti-Armor Weapon",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Gun!"
						}
					]
				}
			],
			"calc": {
				"extended_value": "900",
				"extended_weight": "3.25 lb"
			},
			"categories": [
				"Missile Weapon"
			]
		},
		{
			"type": "equipment",
			"id": "d00aa3d8-da92-4451-9449-7823dafaac66",
			"quantity": 1,
			"description": "Revolver, .357M",
			"tech_level": "7",
			"legality_class": "3",
			"value": "500",
			"weight": "3 lb",
			"reference": "B278",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "pi",
						"base": "3d-1"
					},
					"strength": "10",
					"accuracy": "2",
					"range": "185/2000",
					"rate_of_fire": "3",
					"shots": "6(3i)",
					"bulk": "-2",
					"recoil": "3",
					"calc": {
						"level": 0,
						"range": "185/2000",
						"damage": "3d-1 pi"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Pistol"
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Rifle",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Shotgun",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Light Machine Gun",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Submachine Gun",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Musket",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Grenade Launcher",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Gyroc",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Light Anti-Armor Weapon",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Gun!"
						}
					]
				}
			],
			"calc": {
				"extended_value": "500",
				"extended_weight": "3 lb"
			},
			"categories": [
				"Missile Weapon"
			]
		},
		{
			"type": "equipment",
			"id": "08a53ef8-fb7f-48df-a058-223e1b4078d6",
			"quantity": 1,
			"description": "Rifle-Musket, .577",
			"tech_level": "5",
			"legality_class": "3",
			"value": "150",
			"weight": "8.5 lb",
			"reference": "B279",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "pi+",
						"base": "4d"
					},
					"strength": "10†",
					"accuracy": "4",
					"range": "700/2100",
					"rate_of_fire": "1",
					"shots": "1(15)",
					"bulk": "-6",
					"recoil": "3",
					"calc": {
						"level": 0,
						"range": "700/2100",
						"damage": "4d pi+"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Pistol",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Rifle"
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Shotgun",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Light Machine Gun",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Submachine Gun",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Musket",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Grenade Launcher",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Gyroc",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Light Anti-Armor Weapon",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Gun!"
						}
					]
				}
			],
			"calc": {
				"extended_value": "150",
				"extended_weight": "8.5 lb"
			},
			"categories": [
				"Missile Weapon"
			]
		},
		{
			"type": "equipment",
			"id": "68ce7438-2609-4891-a741-44836be621b6",
			"quantity": 1,
			"description": "Rope, 3/4\\", 10 yards",
			"tech_level": "1",
			"value": "25",
			"weight": "5 lb",
			"reference": "B288",
			"calc": {
				"extended_value": "25",
				"extended_weight": "5 lb"
			},
			"notes": "Supports 1,100 lbs.",
			"categories": [
				"Camping and Survival Gear"
			]
		},
		{
			"type": "equipment",
			"id": "0b922d46-a557-4e93-b71f-23382b0913f5",
			"quantity": 1,
			"description": "Rope, 3/4\\", 20 yards",
			"tech_level": "1",
			"value": "50",
			"weight": "10 lb",
			"reference": "B288",
			"calc": {
				"extended_value": "50",
				"extended_weight": "10 lb"
			},
			"notes": "Supports 1,100 lbs.",
			"categories": [
				"Camping and Survival Gear"
			]
		},
		{
			"type": "equipment",
			"id": "46d169e1-2732-46a2-8a1e-af0e6251ba90",
			"quantity": 1,
			"description": "Rope, 3/8\\", 10 yards",
			"tech_level": "0",
			"value": "5",
			"weight": "1.5 lb",
			"reference": "B288",
			"calc": {
				"extended_value": "5",
				"extended_weight": "1.5 lb"
			},
			"notes": "Supports 300 lbs.",
			"categories": [
				"Camping and Survival Gear"
			]
		},
		{
			"type": "equipment",
			"id": "0bc34f12-4fe7-4f1d-8fa3-75f737c7561f",
			"quantity": 1,
			"description": "Rope, 3/8\\", 20 yards",
			"tech_level": "0",
			"value": "10",
			"weight": "3 lb",
			"reference": "B288",
			"calc": {
				"extended_value": "10",
				"extended_weight": "3 lb"
			},
			"notes": "Supports 300 lbs.",
			"categories": [
				"Camping and Survival Gear"
			]
		},
		{
			"type": "equipment",
			"id": "32d2ceb3-6246-46a0-a57e-289aa5eeeea8",
			"quantity": 1,
			"description": "RPG, 85mm",
			"tech_level": "7",
			"legality_class": "1",
			"value": "800",
			"weight": "21 lb",
			"reference": "B281",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "cr ex",
						"base": "6dx3",
						"armor_divisor": 10
					},
					"strength": "10†",
					"accuracy": "3+1",
					"range": "300/1000",
					"rate_of_fire": "1",
					"shots": "1(5)",
					"bulk": "-6",
					"recoil": "1",
					"calc": {
						"level": 0,
						"range": "300/1000",
						"damage": "6dx3(10) cr ex"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Pistol",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Rifle",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Shotgun",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Light Machine Gun",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Submachine Gun",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Musket",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Grenade Launcher",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Gyroc",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Light Anti-Armor Weapon"
						},
						{
							"type": "skill",
							"name": "Gun!"
						}
					]
				}
			],
			"calc": {
				"extended_value": "800",
				"extended_weight": "21 lb"
			},
			"categories": [
				"Missile Weapon"
			]
		},
		{
			"type": "equipment",
			"id": "67e27e4d-e217-4a82-831f-40a38e864ab8",
			"quantity": 1,
			"description": "Saber",
			"tech_level": "4",
			"value": "700",
			"weight": "2 lb",
			"reference": "B273",
			"weapons": [
				{
					"type": "melee_weapon",
					"damage": {
						"type": "cut",
						"st": "sw",
						"base": "-1"
					},
					"strength": "8",
					"usage": "Swung",
					"reach": "1",
					"parry": "0F",
					"block": "No",
					"calc": {
						"level": 0,
						"parry": "0F",
						"block": "No",
						"damage": "sw-1 cut"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -5
						},
						{
							"type": "skill",
							"name": "Saber"
						},
						{
							"type": "skill",
							"name": "Broadsword",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Main-Gauche",
							"modifier": -3
						},
						{
							"type": "skill",
							"name": "Rapier",
							"modifier": -3
						},
						{
							"type": "skill",
							"name": "Shortsword",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Smallsword",
							"modifier": -3
						},
						{
							"type": "skill",
							"name": "Sword!"
						}
					]
				},
				{
					"type": "melee_weapon",
					"damage": {
						"type": "imp",
						"st": "thr",
						"base": "1"
					},
					"strength": "8",
					"usage": "Thrust",
					"reach": "1",
					"parry": "0F",
					"block": "No",
					"calc": {
						"level": 0,
						"parry": "0F",
						"block": "No",
						"damage": "thr+1 imp"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -5
						},
						{
							"type": "skill",
							"name": "Saber"
						},
						{
							"type": "skill",
							"name": "Broadsword",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Main-Gauche",
							"modifier": -3
						},
						{
							"type": "skill",
							"name": "Rapier",
							"modifier": -3
						},
						{
							"type": "skill",
							"name": "Shortsword",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Smallsword",
							"modifier": -3
						},
						{
							"type": "skill",
							"name": "Sword!"
						}
					]
				}
			],
			"calc": {
				"extended_value": "700",
				"extended_weight": "2 lb"
			},
			"categories": [
				"Melee Weapon"
			]
		},
		{
			"type": "equipment",
			"id": "facbbcc0-a5af-4233-b082-fc6b8f3d3e4e",
			"quantity": 1,
			"description": "Saddle and Tack",
			"tech_level": "2",
			"value": "150",
			"weight": "15 lb",
			"reference": "B289",
			"calc": {
				"extended_value": "150",
				"extended_weight": "15 lb"
			},
			"notes": "Basic equipment for Riding skill.",
			"categories": [
				"Equestrian Gear"
			]
		},
		{
			"type": "equipment_container",
			"id": "ee08112d-106e-4f35-ae5d-0abe9bac6191",
			"description": "Saddlebags",
			"tech_level": "1",
			"value": "100",
			"weight": "3 lb",
			"reference": "B289",
			"calc": {
				"extended_value": "100",
				"extended_weight": "3 lb"
			},
			"prereqs": {
				"type": "prereq_list",
				"all": true,
				"prereqs": [
					{
						"type": "contained_weight_prereq",
						"has": true,
						"qualifier": {
							"compare": "at_most",
							"qualifier": "40 lb"
						}
					}
				]
			},
			"categories": [
				"Equestrian Gear"
			],
			"open": true
		},
		{
			"type": "equipment",
			"id": "b37e2a27-db5a-4c44-a579-060040c14835",
			"quantity": 1,
			"description": "SAM, 70mm",
			"tech_level": "8",
			"legality_class": "1",
			"value": "38000",
			"weight": "18 lb",
			"reference": "B281",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "cr ex",
						"base": "6dx3",
						"fragmentation": "6d",
						"fragmentation_type": "cut"
					},
					"strength": "10†",
					"accuracy": "7",
					"range": "1000/8800",
					"rate_of_fire": "1",
					"shots": "1(20)",
					"bulk": "-8",
					"recoil": "1",
					"calc": {
						"level": 0,
						"range": "1000/8800",
						"damage": "6dx3 cr ex [6d cut]"
					},
					"defaults": [
						{
							"type": "iq",
							"modifier": -5
						},
						{
							"type": "skill",
							"name": "Artillery",
							"specialization": "Guided Missile"
						}
					]
				}
			],
			"calc": {
				"extended_value": "38000",
				"extended_weight": "18 lb"
			},
			"categories": [
				"Missile Weapon"
			]
		},
		{
			"type": "equipment",
			"id": "ef26ccce-bbcc-43ca-9f73-05eb99ee3125",
			"quantity": 1,
			"description": "Sandals",
			"tech_level": "0",
			"value": "25",
			"weight": "0.5 lb",
			"reference": "B284",
			"calc": {
				"extended_value": "25",
				"extended_weight": "0.5 lb"
			},
			"features": [
				{
					"type": "dr_bonus",
					"amount": 1,
					"location": "foot",
					"specialization": "underside"
				}
			],
			"notes": "Concealable",
			"categories": [
				"Footwear"
			]
		},
		{
			"type": "equipment",
			"id": "e4d8a947-2565-4949-a443-1b2a30d784cf",
			"quantity": 1,
			"description": "Sap",
			"tech_level": "1",
			"value": "20",
			"weight": "1 lb",
			"reference": "B271",
			"weapons": [
				{
					"type": "melee_weapon",
					"damage": {
						"type": "cr",
						"st": "thr"
					},
					"strength": "7",
					"usage": "Swung",
					"reach": "C",
					"parry": "0",
					"block": "No",
					"calc": {
						"level": 0,
						"parry": "0",
						"block": "No",
						"damage": "thr cr"
					},
					"defaults": [
						{
							"type": "dx"
						},
						{
							"type": "skill",
							"name": "Brawling"
						}
					]
				}
			],
			"calc": {
				"extended_value": "20",
				"extended_weight": "1 lb"
			},
			"categories": [
				"Melee Weapon"
			]
		},
		{
			"type": "equipment",
			"id": "a3de2867-935f-43aa-9aca-1429b39f96f7",
			"quantity": 1,
			"description": "Satellite Phone",
			"tech_level": "8",
			"value": "3000",
			"weight": "3 lb",
			"reference": "B288",
			"calc": {
				"extended_value": "3000",
				"extended_weight": "3 lb"
			},
			"notes": "Global range, satellite relay. 1 hr.",
			"categories": [
				"Communications and Information Gear"
			]
		},
		{
			"type": "equipment",
			"id": "daebec24-549c-411c-883a-9d4da0f4bfe2",
			"quantity": 1,
			"description": "Saw",
			"tech_level": "0",
			"value": "150",
			"weight": "3 lb",
			"reference": "B289",
			"calc": {
				"extended_value": "150",
				"extended_weight": "3 lb"
			},
			"notes": "A lumberjack\'s tool, not a carpentry saw",
			"categories": [
				"Tools"
			]
		},
		{
			"type": "equipment",
			"id": "37f5447c-8566-4a59-8b84-5272704fe90b",
			"quantity": 1,
			"description": "SAW, 5.56mm",
			"tech_level": "7",
			"legality_class": "1",
			"value": "4800",
			"weight": "24 lb",
			"reference": "B281",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "pi",
						"base": "5d+1"
					},
					"strength": "12B†",
					"accuracy": "5",
					"range": "800/3500",
					"rate_of_fire": "12!",
					"shots": "200(5)",
					"bulk": "-6",
					"recoil": "2",
					"calc": {
						"level": 0,
						"range": "800/3500",
						"damage": "5d+1 pi"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Pistol",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Rifle",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Shotgun",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Light Machine Gun"
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Submachine Gun",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Musket",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Grenade Launcher",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Gyroc",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Light Anti-Armor Weapon",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Gun!"
						}
					]
				}
			],
			"calc": {
				"extended_value": "4800",
				"extended_weight": "24 lb"
			},
			"categories": [
				"Missile Weapon"
			]
		},
		{
			"type": "equipment",
			"id": "937a2a7a-76b4-4937-8949-7e1248afe3fe",
			"quantity": 1,
			"description": "Scale Armor",
			"tech_level": "2",
			"value": "420",
			"weight": "35 lb",
			"reference": "B283",
			"calc": {
				"extended_value": "420",
				"extended_weight": "35 lb"
			},
			"features": [
				{
					"type": "dr_bonus",
					"amount": 4,
					"location": "torso"
				},
				{
					"type": "dr_bonus",
					"amount": 4,
					"location": "vitals"
				},
				{
					"type": "dr_bonus",
					"amount": 4,
					"location": "groin"
				}
			],
			"categories": [
				"Body Armor"
			]
		},
		{
			"type": "equipment",
			"id": "f1ab1686-327b-42b5-9393-8b94d33cdc63",
			"quantity": 1,
			"description": "Scale Leggings",
			"tech_level": "2",
			"legality_class": "3",
			"value": "250",
			"weight": "21 lb",
			"reference": "B283",
			"calc": {
				"extended_value": "250",
				"extended_weight": "21 lb"
			},
			"features": [
				{
					"type": "dr_bonus",
					"amount": 4,
					"location": "leg"
				}
			],
			"categories": [
				"Limb Armor"
			]
		},
		{
			"type": "equipment",
			"id": "101460c5-21a0-46ae-90e9-3fb586f56e57",
			"quantity": 1,
			"description": "Scale Sleeves",
			"tech_level": "2",
			"legality_class": "3",
			"value": "210",
			"weight": "14 lb",
			"reference": "B283",
			"calc": {
				"extended_value": "210",
				"extended_weight": "14 lb"
			},
			"features": [
				{
					"type": "dr_bonus",
					"amount": 4,
					"location": "arm"
				}
			],
			"categories": [
				"Limb Armor"
			]
		},
		{
			"type": "equipment",
			"id": "6e15c4ff-fec5-411a-b23e-93d12ad69727",
			"quantity": 1,
			"description": "Scope, 4x",
			"tech_level": "6",
			"value": "150",
			"weight": "1.5 lb",
			"reference": "B289",
			"calc": {
				"extended_value": "150",
				"extended_weight": "1.5 lb"
			},
			"notes": "+2 to Acc for aimed shots only.",
			"categories": [
				"Weapon and Combat Accessories"
			]
		},
		{
			"type": "equipment",
			"id": "c04ca6e6-6f8f-4221-95b4-1a88f7bf1dee",
			"quantity": 1,
			"description": "Scope, 4x, Thermal Imaging",
			"tech_level": "8",
			"value": "8000",
			"weight": "4 lb",
			"reference": "B289",
			"calc": {
				"extended_value": "8000",
				"extended_weight": "4 lb"
			},
			"notes": "+2 to Acc for aimed shots only. Gives the user Infravision. 2 hrs.",
			"categories": [
				"Weapon and Combat Accessories"
			]
		},
		{
			"type": "equipment",
			"id": "f0893d8b-c139-4913-bac5-41ed21e3b62d",
			"quantity": 1,
			"description": "Scorpion",
			"tech_level": "2",
			"legality_class": "2",
			"value": "5000",
			"weight": "110 lb",
			"reference": "B281",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "imp",
						"base": "5d"
					},
					"strength": "45M†",
					"accuracy": "3",
					"range": "415/520",
					"rate_of_fire": "1",
					"shots": "1(30)",
					"bulk": "-10",
					"recoil": "-",
					"calc": {
						"level": 0,
						"range": "415/520",
						"damage": "5d imp"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Gunner",
							"specialization": "Catapult"
						},
						{
							"type": "skill",
							"name": "Gunner",
							"specialization": "Beams",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Gunner",
							"specialization": "Cannon",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Gunner",
							"specialization": "Machine Gun",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Gunner",
							"specialization": "Rockets",
							"modifier": -4
						}
					]
				}
			],
			"calc": {
				"extended_value": "5000",
				"extended_weight": "110 lb"
			},
			"categories": [
				"Missile Weapon"
			]
		},
		{
			"type": "equipment",
			"id": "b5375059-4889-400c-8279-6f1c7f346bef",
			"quantity": 1,
			"description": "Scuba Gear",
			"tech_level": "6",
			"value": "1500",
			"weight": "32 lb",
			"reference": "B288",
			"calc": {
				"extended_value": "1500",
				"extended_weight": "32 lb"
			},
			"notes": "Includes 2-hour underwater air tank",
			"categories": [
				"Camping and Survival Gear"
			]
		},
		{
			"type": "equipment",
			"id": "31fe1f64-541c-4297-a86d-79fd16d65c12",
			"quantity": 1,
			"description": "Scythe",
			"tech_level": "1",
			"value": "15",
			"weight": "5 lb",
			"reference": "B274",
			"weapons": [
				{
					"type": "melee_weapon",
					"damage": {
						"type": "cut",
						"st": "sw",
						"base": "2"
					},
					"strength": "11‡",
					"usage": "Swung",
					"reach": "1",
					"parry": "0U",
					"block": "No",
					"calc": {
						"level": 0,
						"parry": "0U",
						"block": "No",
						"damage": "sw+2 cut"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -5
						},
						{
							"type": "skill",
							"name": "Two-Handed Axe/Mace"
						},
						{
							"type": "skill",
							"name": "Axe/Mace",
							"modifier": -3
						},
						{
							"type": "skill",
							"name": "Polearm",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Two-Handed Flail",
							"modifier": -4
						}
					]
				},
				{
					"type": "melee_weapon",
					"damage": {
						"type": "imp",
						"st": "sw"
					},
					"strength": "11‡",
					"usage": "Thrust",
					"reach": "1",
					"parry": "0U",
					"block": "No",
					"calc": {
						"level": 0,
						"parry": "0U",
						"block": "No",
						"damage": "sw imp"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -5
						},
						{
							"type": "skill",
							"name": "Two-Handed Axe/Mace"
						},
						{
							"type": "skill",
							"name": "Axe/Mace",
							"modifier": -3
						},
						{
							"type": "skill",
							"name": "Polearm",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Two-Handed Flail",
							"modifier": -4
						}
					]
				}
			],
			"calc": {
				"extended_value": "15",
				"extended_weight": "5 lb"
			},
			"notes": "May get stuck in 2nd mode",
			"categories": [
				"Melee Weapon"
			]
		},
		{
			"type": "equipment",
			"id": "b7a37ad6-8c6f-4707-a82e-628212582576",
			"quantity": 1,
			"description": "Self-Loading Rifle, 7.62mm",
			"tech_level": "6",
			"legality_class": "3",
			"value": "600",
			"weight": "10 lb",
			"reference": "B279",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "pi",
						"base": "7d"
					},
					"strength": "10†",
					"accuracy": "5",
					"range": "1000/4200",
					"rate_of_fire": "3",
					"shots": "8(3)",
					"bulk": "-5",
					"recoil": "3",
					"calc": {
						"level": 0,
						"range": "1000/4200",
						"damage": "7d pi"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Pistol",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Rifle"
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Shotgun",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Light Machine Gun",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Submachine Gun",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Musket",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Grenade Launcher",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Gyroc",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Light Anti-Armor Weapon",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Gun!"
						}
					]
				}
			],
			"calc": {
				"extended_value": "600",
				"extended_weight": "10 lb"
			},
			"categories": [
				"Missile Weapon"
			]
		},
		{
			"type": "equipment",
			"id": "bebf3351-b0b5-4451-969b-4de13bbeeceb",
			"quantity": 1,
			"description": "Shoes",
			"tech_level": "1",
			"value": "40",
			"weight": "2 lb",
			"reference": "B284",
			"calc": {
				"extended_value": "40",
				"extended_weight": "2 lb"
			},
			"features": [
				{
					"type": "dr_bonus",
					"amount": 1,
					"location": "foot"
				}
			],
			"notes": "Flexible; Concealable",
			"categories": [
				"Footwear"
			]
		},
		{
			"type": "equipment",
			"id": "e03e3111-51d2-486e-b83b-f809d207936e",
			"quantity": 1,
			"description": "Short Bow (ST7)",
			"tech_level": "0",
			"value": "50",
			"weight": "2 lb",
			"reference": "B275",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "imp",
						"base": "1d-3"
					},
					"strength": "7†",
					"accuracy": "1",
					"range": "70/105",
					"rate_of_fire": "1",
					"shots": "1(2)",
					"bulk": "-6",
					"calc": {
						"level": 0,
						"range": "70/105",
						"damage": "1d-3 imp"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -5
						},
						{
							"type": "skill",
							"name": "Bow"
						}
					]
				}
			],
			"calc": {
				"extended_value": "50",
				"extended_weight": "2 lb"
			},
			"categories": [
				"Missile Weapon",
				"UsesAmmoType:Arrow"
			]
		},
		{
			"type": "equipment",
			"id": "08836ec9-288e-420d-b886-4cd26e247e4a",
			"quantity": 1,
			"description": "Short Bow (ST8)",
			"tech_level": "0",
			"value": "55",
			"weight": "2 lb",
			"reference": "B275",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "imp",
						"base": "1d-3"
					},
					"strength": "8†",
					"accuracy": "1",
					"range": "80/120",
					"rate_of_fire": "1",
					"shots": "1(2)",
					"bulk": "-6",
					"calc": {
						"level": 0,
						"range": "80/120",
						"damage": "1d-3 imp"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -5
						},
						{
							"type": "skill",
							"name": "Bow"
						}
					]
				}
			],
			"calc": {
				"extended_value": "55",
				"extended_weight": "2 lb"
			},
			"categories": [
				"Missile Weapon",
				"UsesAmmoType:Arrow"
			]
		},
		{
			"type": "equipment",
			"id": "6919fdb9-0361-4d13-be66-97f33242cac0",
			"quantity": 1,
			"description": "Short Bow (ST9)",
			"tech_level": "0",
			"value": "60",
			"weight": "2 lb",
			"reference": "B275",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "imp",
						"base": "1d-2"
					},
					"strength": "9†",
					"accuracy": "1",
					"range": "90/135",
					"rate_of_fire": "1",
					"shots": "1(2)",
					"bulk": "-6",
					"calc": {
						"level": 0,
						"range": "90/135",
						"damage": "1d-2 imp"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -5
						},
						{
							"type": "skill",
							"name": "Bow"
						}
					]
				}
			],
			"calc": {
				"extended_value": "60",
				"extended_weight": "2 lb"
			},
			"categories": [
				"Missile Weapon",
				"UsesAmmoType:Arrow"
			]
		},
		{
			"type": "equipment",
			"id": "b273e8dc-e76b-45b3-b745-2b194ec03591",
			"quantity": 1,
			"description": "Short Bow (ST10)",
			"tech_level": "0",
			"value": "65",
			"weight": "2 lb",
			"reference": "B275",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "imp",
						"base": "1d-2"
					},
					"strength": "10†",
					"accuracy": "1",
					"range": "100/150",
					"rate_of_fire": "1",
					"shots": "1(2)",
					"bulk": "-6",
					"calc": {
						"level": 0,
						"range": "100/150",
						"damage": "1d-2 imp"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -5
						},
						{
							"type": "skill",
							"name": "Bow"
						}
					]
				}
			],
			"calc": {
				"extended_value": "65",
				"extended_weight": "2 lb"
			},
			"categories": [
				"Missile Weapon",
				"UsesAmmoType:Arrow"
			]
		},
		{
			"type": "equipment",
			"id": "37eeac02-2e00-4dfe-9535-c9fc9bf7626f",
			"quantity": 1,
			"description": "Short Bow (ST11)",
			"tech_level": "0",
			"value": "70",
			"weight": "2 lb",
			"reference": "B275",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "imp",
						"base": "1d-1"
					},
					"strength": "11†",
					"accuracy": "1",
					"range": "110/165",
					"rate_of_fire": "1",
					"shots": "1(2)",
					"bulk": "-6",
					"calc": {
						"level": 0,
						"range": "110/165",
						"damage": "1d-1 imp"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -5
						},
						{
							"type": "skill",
							"name": "Bow"
						}
					]
				}
			],
			"calc": {
				"extended_value": "70",
				"extended_weight": "2 lb"
			},
			"categories": [
				"Missile Weapon",
				"UsesAmmoType:Arrow"
			]
		},
		{
			"type": "equipment",
			"id": "727262e3-7bd5-4b7e-8d54-7b721d0f6709",
			"quantity": 1,
			"description": "Short Bow (ST12)",
			"tech_level": "0",
			"value": "75",
			"weight": "2 lb",
			"reference": "B275",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "imp",
						"base": "1d-1"
					},
					"strength": "12†",
					"accuracy": "1",
					"range": "120/180",
					"rate_of_fire": "1",
					"shots": "1(2)",
					"bulk": "-6",
					"calc": {
						"level": 0,
						"range": "120/180",
						"damage": "1d-1 imp"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -5
						},
						{
							"type": "skill",
							"name": "Bow"
						}
					]
				}
			],
			"calc": {
				"extended_value": "75",
				"extended_weight": "2 lb"
			},
			"categories": [
				"Missile Weapon",
				"UsesAmmoType:Arrow"
			]
		},
		{
			"type": "equipment",
			"id": "9cb43156-ad8b-4332-8e30-98c1e1130da6",
			"quantity": 1,
			"description": "Short Bow (ST13)",
			"tech_level": "0",
			"value": "80",
			"weight": "2 lb",
			"reference": "B275",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "imp",
						"base": "1d"
					},
					"strength": "13†",
					"accuracy": "1",
					"range": "130/195",
					"rate_of_fire": "1",
					"shots": "1(2)",
					"bulk": "-6",
					"calc": {
						"level": 0,
						"range": "130/195",
						"damage": "1d imp"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -5
						},
						{
							"type": "skill",
							"name": "Bow"
						}
					]
				}
			],
			"calc": {
				"extended_value": "80",
				"extended_weight": "2 lb"
			},
			"categories": [
				"Missile Weapon",
				"UsesAmmoType:Arrow"
			]
		},
		{
			"type": "equipment",
			"id": "ff5cb83a-10eb-4242-9b57-d83dda5324c1",
			"quantity": 1,
			"description": "Short Bow (ST14)",
			"tech_level": "0",
			"value": "85",
			"weight": "2 lb",
			"reference": "B275",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "imp",
						"base": "1d"
					},
					"strength": "14†",
					"accuracy": "1",
					"range": "140/210",
					"rate_of_fire": "1",
					"shots": "1(2)",
					"bulk": "-6",
					"calc": {
						"level": 0,
						"range": "140/210",
						"damage": "1d imp"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -5
						},
						{
							"type": "skill",
							"name": "Bow"
						}
					]
				}
			],
			"calc": {
				"extended_value": "85",
				"extended_weight": "2 lb"
			},
			"categories": [
				"Missile Weapon",
				"UsesAmmoType:Arrow"
			]
		},
		{
			"type": "equipment",
			"id": "826445c3-907d-4592-9322-f05251fd3a19",
			"quantity": 1,
			"description": "Short Bow (ST15)",
			"tech_level": "0",
			"value": "90",
			"weight": "2 lb",
			"reference": "B275",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "imp",
						"base": "1d+1"
					},
					"strength": "15†",
					"accuracy": "1",
					"range": "150/225",
					"rate_of_fire": "1",
					"shots": "1(2)",
					"bulk": "-6",
					"calc": {
						"level": 0,
						"range": "150/225",
						"damage": "1d+1 imp"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -5
						},
						{
							"type": "skill",
							"name": "Bow"
						}
					]
				}
			],
			"calc": {
				"extended_value": "90",
				"extended_weight": "2 lb"
			},
			"categories": [
				"Missile Weapon",
				"UsesAmmoType:Arrow"
			]
		},
		{
			"type": "equipment",
			"id": "2038604a-d0b8-4f54-a57b-daf299bb37b9",
			"quantity": 1,
			"description": "Short Bow (ST16)",
			"tech_level": "0",
			"value": "95",
			"weight": "2 lb",
			"reference": "B275",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "imp",
						"base": "1d+1"
					},
					"strength": "16†",
					"accuracy": "1",
					"range": "160/240",
					"rate_of_fire": "1",
					"shots": "1(2)",
					"bulk": "-6",
					"calc": {
						"level": 0,
						"range": "160/240",
						"damage": "1d+1 imp"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -5
						},
						{
							"type": "skill",
							"name": "Bow"
						}
					]
				}
			],
			"calc": {
				"extended_value": "95",
				"extended_weight": "2 lb"
			},
			"categories": [
				"Missile Weapon",
				"UsesAmmoType:Arrow"
			]
		},
		{
			"type": "equipment",
			"id": "8e1ad584-1ef3-4cac-b486-f912c6473403",
			"quantity": 1,
			"description": "Short Bow (ST17)",
			"tech_level": "0",
			"value": "100",
			"weight": "2 lb",
			"reference": "B275",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "imp",
						"base": "1d+2"
					},
					"strength": "17†",
					"accuracy": "1",
					"range": "170/255",
					"rate_of_fire": "1",
					"shots": "1(2)",
					"bulk": "-6",
					"calc": {
						"level": 0,
						"range": "170/255",
						"damage": "1d+2 imp"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -5
						},
						{
							"type": "skill",
							"name": "Bow"
						}
					]
				}
			],
			"calc": {
				"extended_value": "100",
				"extended_weight": "2 lb"
			},
			"categories": [
				"Missile Weapon",
				"UsesAmmoType:Arrow"
			]
		},
		{
			"type": "equipment",
			"id": "e5364a48-9a8e-47da-a5ce-dc59cca49ed6",
			"quantity": 1,
			"description": "Short Bow (ST18)",
			"tech_level": "0",
			"value": "105",
			"weight": "2 lb",
			"reference": "B275",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "imp",
						"base": "1d+2"
					},
					"strength": "18†",
					"accuracy": "1",
					"range": "180/270",
					"rate_of_fire": "1",
					"shots": "1(2)",
					"bulk": "-6",
					"calc": {
						"level": 0,
						"range": "180/270",
						"damage": "1d+2 imp"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -5
						},
						{
							"type": "skill",
							"name": "Bow"
						}
					]
				}
			],
			"calc": {
				"extended_value": "105",
				"extended_weight": "2 lb"
			},
			"categories": [
				"Missile Weapon",
				"UsesAmmoType:Arrow"
			]
		},
		{
			"type": "equipment",
			"id": "5b6b58e5-e38e-4025-8e2e-ec3405b34630",
			"quantity": 1,
			"description": "Short Bow (ST19)",
			"tech_level": "0",
			"value": "110",
			"weight": "2 lb",
			"reference": "B275",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "imp",
						"base": "2d-1"
					},
					"strength": "19†",
					"accuracy": "1",
					"range": "190/285",
					"rate_of_fire": "1",
					"shots": "1(2)",
					"bulk": "-6",
					"calc": {
						"level": 0,
						"range": "190/285",
						"damage": "2d-1 imp"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -5
						},
						{
							"type": "skill",
							"name": "Bow"
						}
					]
				}
			],
			"calc": {
				"extended_value": "110",
				"extended_weight": "2 lb"
			},
			"categories": [
				"Missile Weapon",
				"UsesAmmoType:Arrow"
			]
		},
		{
			"type": "equipment",
			"id": "7366f303-4f64-4afa-bdde-efb49fa935f6",
			"quantity": 1,
			"description": "Short Bow (ST20)",
			"tech_level": "0",
			"value": "115",
			"weight": "2 lb",
			"reference": "B275",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "imp",
						"base": "2d-1"
					},
					"strength": "20†",
					"accuracy": "1",
					"range": "200/300",
					"rate_of_fire": "1",
					"shots": "1(2)",
					"bulk": "-6",
					"calc": {
						"level": 0,
						"range": "200/300",
						"damage": "2d-1 imp"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -5
						},
						{
							"type": "skill",
							"name": "Bow"
						}
					]
				}
			],
			"calc": {
				"extended_value": "115",
				"extended_weight": "2 lb"
			},
			"categories": [
				"Missile Weapon",
				"UsesAmmoType:Arrow"
			]
		},
		{
			"type": "equipment",
			"id": "6da09c97-983a-4095-815a-a9ed920da1fb",
			"quantity": 1,
			"description": "Short Staff",
			"tech_level": "0",
			"value": "20",
			"weight": "1 lb",
			"reference": "B273",
			"weapons": [
				{
					"type": "melee_weapon",
					"damage": {
						"type": "cr",
						"st": "sw"
					},
					"strength": "6",
					"usage": "Swung",
					"reach": "1",
					"parry": "0F",
					"block": "No",
					"calc": {
						"level": 0,
						"parry": "0F",
						"block": "No",
						"damage": "sw cr"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -5
						},
						{
							"type": "skill",
							"name": "Smallsword"
						},
						{
							"type": "skill",
							"name": "Main-Gauche",
							"modifier": -3
						},
						{
							"type": "skill",
							"name": "Rapier",
							"modifier": -3
						},
						{
							"type": "skill",
							"name": "Saber",
							"modifier": -3
						},
						{
							"type": "skill",
							"name": "Shortsword",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Sword!"
						}
					]
				},
				{
					"type": "melee_weapon",
					"damage": {
						"type": "cr",
						"st": "thr"
					},
					"strength": "6",
					"usage": "Thrust",
					"reach": "1",
					"parry": "0F",
					"block": "No",
					"calc": {
						"level": 0,
						"parry": "0F",
						"block": "No",
						"damage": "thr cr"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -5
						},
						{
							"type": "skill",
							"name": "Smallsword"
						},
						{
							"type": "skill",
							"name": "Main-Gauche",
							"modifier": -3
						},
						{
							"type": "skill",
							"name": "Rapier",
							"modifier": -3
						},
						{
							"type": "skill",
							"name": "Saber",
							"modifier": -3
						},
						{
							"type": "skill",
							"name": "Shortsword",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Sword!"
						}
					]
				}
			],
			"calc": {
				"extended_value": "20",
				"extended_weight": "1 lb"
			},
			"categories": [
				"Melee Weapon"
			]
		},
		{
			"type": "equipment",
			"id": "e3ae405d-6177-4a44-a1d5-34f80b89f7b0",
			"quantity": 1,
			"description": "Shortsword",
			"tech_level": "2",
			"value": "400",
			"weight": "2 lb",
			"reference": "B273",
			"weapons": [
				{
					"type": "melee_weapon",
					"damage": {
						"type": "cut",
						"st": "sw"
					},
					"strength": "8",
					"usage": "Swung",
					"reach": "1",
					"parry": "0",
					"block": "No",
					"calc": {
						"level": 0,
						"parry": "0",
						"block": "No",
						"damage": "sw cut"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -5
						},
						{
							"type": "skill",
							"name": "Shortsword"
						},
						{
							"type": "skill",
							"name": "Broadsword",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Force Sword",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Jitte/Sai",
							"modifier": -3
						},
						{
							"type": "skill",
							"name": "Knife",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Saber",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Smallsword",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Tonfa",
							"modifier": -3
						},
						{
							"type": "skill",
							"name": "Sword!"
						}
					]
				},
				{
					"type": "melee_weapon",
					"damage": {
						"type": "imp",
						"st": "thr"
					},
					"strength": "8",
					"usage": "Thrust",
					"reach": "1",
					"parry": "0",
					"block": "No",
					"calc": {
						"level": 0,
						"parry": "0",
						"block": "No",
						"damage": "thr imp"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -5
						},
						{
							"type": "skill",
							"name": "Shortsword"
						},
						{
							"type": "skill",
							"name": "Broadsword",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Force Sword",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Jitte/Sai",
							"modifier": -3
						},
						{
							"type": "skill",
							"name": "Knife",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Saber",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Smallsword",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Tonfa",
							"modifier": -3
						},
						{
							"type": "skill",
							"name": "Sword!"
						}
					]
				}
			],
			"calc": {
				"extended_value": "400",
				"extended_weight": "2 lb"
			},
			"categories": [
				"Melee Weapon"
			]
		},
		{
			"type": "equipment",
			"id": "5591fcc0-37d3-4e54-9d84-f65bce7e0387",
			"quantity": 1,
			"description": "Shotgun Mike",
			"tech_level": "6",
			"value": "250",
			"weight": "2 lb",
			"reference": "B289",
			"calc": {
				"extended_value": "250",
				"extended_weight": "2 lb"
			},
			"notes": "Gives (TL-5) levels of Parabolic Hearing.",
			"categories": [
				"Law-Enforcement",
				"Spy Gear",
				"Thief"
			]
		},
		{
			"type": "equipment_container",
			"id": "3723a598-f9b2-4ee2-819f-52d45279ebe1",
			"description": "Shoulder Quiver",
			"tech_level": "0",
			"value": "10",
			"weight": "0.5 lb",
			"reference": "B289",
			"calc": {
				"extended_value": "10",
				"extended_weight": "0.5 lb"
			},
			"notes": "Holds 12 arrows or bolts",
			"categories": [
				"Weapon and Combat Accessories"
			],
			"open": true
		},
		{
			"type": "equipment",
			"id": "06dae99e-1c95-4908-9b20-1e8d7e1bed8f",
			"quantity": 1,
			"description": "Shovel",
			"tech_level": "1",
			"value": "12",
			"weight": "6 lb",
			"reference": "B289",
			"calc": {
				"extended_value": "12",
				"extended_weight": "6 lb"
			},
			"notes": "Speeds up digging",
			"categories": [
				"Tools"
			]
		},
		{
			"type": "equipment",
			"id": "7e7014d8-1f6d-468a-a6aa-a9b6453b446f",
			"quantity": 1,
			"description": "Shuriken",
			"tech_level": "3",
			"value": "3",
			"weight": "0.1 lb",
			"reference": "B276",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "cut",
						"st": "thr",
						"base": "-1"
					},
					"strength": "5",
					"accuracy": "1",
					"range": "x0.5/x1",
					"rate_of_fire": "1",
					"shots": "T(1)",
					"bulk": "0",
					"calc": {
						"level": 0,
						"range": "x0.5/x1",
						"damage": "thr-1 cut"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Thrown Weapon",
							"specialization": "Shuriken"
						},
						{
							"type": "skill",
							"name": "Throwing",
							"modifier": -2
						}
					]
				}
			],
			"calc": {
				"extended_value": "3",
				"extended_weight": "0.1 lb"
			},
			"categories": [
				"Missile Weapon"
			]
		},
		{
			"type": "equipment",
			"id": "95c05fca-6a15-4130-a604-75b5f64d70ed",
			"quantity": 1,
			"description": "Silencer, Pistol or SMG",
			"tech_level": "6",
			"value": "400",
			"weight": "1 lb",
			"reference": "B289",
			"calc": {
				"extended_value": "400",
				"extended_weight": "1 lb"
			},
			"notes": "Reduces damage by -1 per die; see Silencers (B412)",
			"categories": [
				"Weapon and Combat Accessories"
			]
		},
		{
			"type": "equipment",
			"id": "0528afc6-90c3-40c8-b988-2f6f6a4e5997",
			"quantity": 1,
			"description": "Silver Coin",
			"tech_level": "1",
			"value": "4",
			"weight": "0.004 lb",
			"reference": "B264",
			"calc": {
				"extended_value": "4",
				"extended_weight": "0.004 lb"
			},
			"categories": [
				"Money: GURPS Standard Medieval Coins"
			]
		},
		{
			"type": "equipment",
			"id": "849f6806-1f91-47b6-add3-fef2fdbd7f78",
			"quantity": 1,
			"description": "Sleeping Bag",
			"tech_level": "6",
			"value": "25",
			"weight": "7 lb",
			"reference": "B288",
			"calc": {
				"extended_value": "25",
				"extended_weight": "7 lb"
			},
			"categories": [
				"Camping and Survival Gear"
			]
		},
		{
			"type": "equipment",
			"id": "fa85b9c9-9d98-4d21-b33e-d0e912cd98e9",
			"quantity": 1,
			"description": "Sleeping Bag, Insulated",
			"tech_level": "7",
			"value": "100",
			"weight": "15 lb",
			"reference": "B288",
			"calc": {
				"extended_value": "100",
				"extended_weight": "15 lb"
			},
			"notes": "+3 HT to resist freezing",
			"categories": [
				"Camping and Survival Gear"
			]
		},
		{
			"type": "equipment",
			"id": "318d404b-4e35-479d-887a-53e81c158f09",
			"quantity": 1,
			"description": "Sleeping Fur",
			"tech_level": "0",
			"value": "50",
			"weight": "8 lb",
			"reference": "B288",
			"calc": {
				"extended_value": "50",
				"extended_weight": "8 lb"
			},
			"categories": [
				"Camping and Survival Gear"
			]
		},
		{
			"type": "equipment",
			"id": "cab85c0a-01e9-437f-b5d7-c64a1452dcb0",
			"quantity": 1,
			"description": "Sling",
			"tech_level": "0",
			"value": "20",
			"weight": "0.5 lb",
			"reference": "B276",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "pi",
						"st": "sw"
					},
					"strength": "6",
					"accuracy": "0",
					"range": "x6/x10",
					"rate_of_fire": "1",
					"shots": "1(2)",
					"bulk": "-4",
					"calc": {
						"level": 0,
						"range": "x6/x10",
						"damage": "sw pi"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -6
						},
						{
							"type": "skill",
							"name": "Sling"
						}
					]
				}
			],
			"calc": {
				"extended_value": "20",
				"extended_weight": "0.5 lb"
			},
			"categories": [
				"Missile Weapon",
				"UsesAmmoType:Sling"
			]
		},
		{
			"type": "equipment",
			"id": "f0d68d43-d9f8-4dfe-acab-bea0af696a14",
			"quantity": 1,
			"description": "Sling Stone",
			"tech_level": "0",
			"value": "0",
			"weight": "0.05 lb",
			"reference": "B276",
			"calc": {
				"extended_value": "0",
				"extended_weight": "0.05 lb"
			},
			"categories": [
				"AmmoType:Sling",
				"Ammunition",
				"Missile Weapon"
			]
		},
		{
			"type": "equipment",
			"id": "e3c1f380-1380-4d3f-adc2-fce98369059e",
			"quantity": 1,
			"description": "Small Buckler",
			"tech_level": "1",
			"value": "40",
			"weight": "8 lb",
			"reference": "B287",
			"weapons": [
				{
					"type": "melee_weapon",
					"damage": {
						"type": "cr",
						"st": "thr"
					},
					"strength": "0",
					"reach": "1",
					"parry": "No",
					"block": "+0",
					"calc": {
						"level": 0,
						"parry": "No",
						"block": "+0",
						"damage": "thr cr"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Shield",
							"specialization": "Shield",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Shield",
							"specialization": "Force Shield",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Shield",
							"specialization": "Buckler"
						}
					]
				}
			],
			"calc": {
				"extended_value": "40",
				"extended_weight": "8 lb"
			},
			"features": [
				{
					"type": "attribute_bonus",
					"amount": 1,
					"attribute": "dodge"
				},
				{
					"type": "attribute_bonus",
					"amount": 1,
					"attribute": "parry"
				},
				{
					"type": "attribute_bonus",
					"amount": 1,
					"attribute": "block"
				}
			],
			"categories": [
				"Shield"
			]
		},
		{
			"type": "equipment",
			"id": "39959317-cb5f-4b49-bcc5-8a58a9d4cd25",
			"quantity": 1,
			"description": "Small Buckler with Spike",
			"tech_level": "1",
			"value": "60",
			"weight": "13 lb",
			"reference": "B287",
			"weapons": [
				{
					"type": "melee_weapon",
					"damage": {
						"type": "cr",
						"st": "thr",
						"base": "1"
					},
					"strength": "0",
					"reach": "1",
					"parry": "No",
					"block": "+0",
					"calc": {
						"level": 0,
						"parry": "No",
						"block": "+0",
						"damage": "thr+1 cr"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Shield",
							"specialization": "Shield",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Shield",
							"specialization": "Force Shield",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Shield",
							"specialization": "Buckler"
						}
					]
				}
			],
			"calc": {
				"extended_value": "60",
				"extended_weight": "13 lb"
			},
			"features": [
				{
					"type": "attribute_bonus",
					"amount": 1,
					"attribute": "dodge"
				},
				{
					"type": "attribute_bonus",
					"amount": 1,
					"attribute": "parry"
				},
				{
					"type": "attribute_bonus",
					"amount": 1,
					"attribute": "block"
				}
			],
			"categories": [
				"Shield"
			]
		},
		{
			"type": "equipment",
			"id": "ea9a9f5e-c863-4ed7-86e1-e875f2c0deca",
			"quantity": 1,
			"description": "Small Knife",
			"tech_level": "0",
			"value": "30",
			"weight": "0.5 lb",
			"reference": "B272",
			"weapons": [
				{
					"type": "melee_weapon",
					"damage": {
						"type": "cut",
						"st": "sw",
						"base": "-3"
					},
					"strength": "5",
					"usage": "Swung",
					"reach": "C,1",
					"parry": "-1",
					"block": "No",
					"calc": {
						"level": 0,
						"parry": "-1",
						"block": "No",
						"damage": "sw-3 cut"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Knife"
						},
						{
							"type": "skill",
							"name": "Force Sword",
							"modifier": -3
						},
						{
							"type": "skill",
							"name": "Main-Gauche",
							"modifier": -3
						},
						{
							"type": "skill",
							"name": "Shortsword",
							"modifier": -3
						},
						{
							"type": "skill",
							"name": "Sword!"
						}
					]
				},
				{
					"type": "melee_weapon",
					"damage": {
						"type": "imp",
						"st": "thr",
						"base": "-1"
					},
					"strength": "5",
					"usage": "Thrust",
					"reach": "C",
					"parry": "-1",
					"block": "No",
					"calc": {
						"level": 0,
						"parry": "-1",
						"block": "No",
						"damage": "thr-1 imp"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Knife"
						},
						{
							"type": "skill",
							"name": "Force Sword",
							"modifier": -3
						},
						{
							"type": "skill",
							"name": "Main-Gauche",
							"modifier": -3
						},
						{
							"type": "skill",
							"name": "Shortsword",
							"modifier": -3
						},
						{
							"type": "skill",
							"name": "Sword!"
						}
					]
				},
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "imp",
						"st": "thr",
						"base": "-1"
					},
					"strength": "5",
					"usage": "Thrown",
					"accuracy": "+0",
					"range": "x0.5/x1",
					"rate_of_fire": "1",
					"shots": "T(1)",
					"bulk": "-1",
					"calc": {
						"level": 0,
						"range": "x0.5/x1",
						"damage": "thr-1 imp"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Thrown Weapon",
							"specialization": "Knife"
						}
					]
				}
			],
			"calc": {
				"extended_value": "30",
				"extended_weight": "0.5 lb"
			},
			"categories": [
				"Melee Weapon",
				"Missile Weapon"
			]
		},
		{
			"type": "equipment",
			"id": "b1de7113-270b-4689-89ef-1d758cafdd2c",
			"quantity": 1,
			"description": "Small Mace",
			"tech_level": "2",
			"value": "35",
			"weight": "3 lb",
			"reference": "B271",
			"weapons": [
				{
					"type": "melee_weapon",
					"damage": {
						"type": "cr",
						"st": "sw",
						"base": "2"
					},
					"strength": "10",
					"usage": "Swung",
					"reach": "1",
					"parry": "0U",
					"block": "No",
					"calc": {
						"level": 0,
						"parry": "0U",
						"block": "No",
						"damage": "sw+2 cr"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -5
						},
						{
							"type": "skill",
							"name": "Axe/Mace"
						},
						{
							"type": "skill",
							"name": "Flail",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Two-Handed Axe/Mace",
							"modifier": -3
						}
					]
				},
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "cr",
						"st": "sw",
						"base": "2"
					},
					"strength": "10",
					"usage": "Thrown",
					"accuracy": "1",
					"range": "x1/x1.5",
					"rate_of_fire": "1",
					"shots": "T(1)",
					"bulk": "-3",
					"calc": {
						"level": 0,
						"range": "x1/x1.5",
						"damage": "sw+2 cr"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Thrown Weapon",
							"specialization": "Axe/Mace"
						}
					]
				}
			],
			"calc": {
				"extended_value": "35",
				"extended_weight": "3 lb"
			},
			"categories": [
				"Melee Weapon",
				"Missile Weapon"
			]
		},
		{
			"type": "equipment",
			"id": "c2b8ebcc-0bde-440c-88cf-3a721d560a04",
			"quantity": 1,
			"description": "Small Shield",
			"tech_level": "1",
			"value": "40",
			"weight": "8 lb",
			"reference": "B287",
			"weapons": [
				{
					"type": "melee_weapon",
					"damage": {
						"type": "cr",
						"st": "thr"
					},
					"strength": "0",
					"usage": "Shield Bash",
					"reach": "1",
					"parry": "No",
					"block": "+0",
					"calc": {
						"level": 0,
						"parry": "No",
						"block": "+0",
						"damage": "thr cr"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Shield",
							"specialization": "Buckler",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Shield",
							"specialization": "Force Shield",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Shield",
							"specialization": "Shield"
						}
					]
				}
			],
			"calc": {
				"extended_value": "40",
				"extended_weight": "8 lb"
			},
			"features": [
				{
					"type": "attribute_bonus",
					"amount": 1,
					"attribute": "dodge"
				},
				{
					"type": "attribute_bonus",
					"amount": 1,
					"attribute": "parry"
				},
				{
					"type": "attribute_bonus",
					"amount": 1,
					"attribute": "block"
				}
			],
			"categories": [
				"Shield"
			]
		},
		{
			"type": "equipment",
			"id": "9be2f32c-d9d6-4111-a0e5-6370cb14df1f",
			"quantity": 1,
			"description": "Small Shield with Spike",
			"tech_level": "1",
			"value": "60",
			"weight": "13 lb",
			"reference": "B287",
			"weapons": [
				{
					"type": "melee_weapon",
					"damage": {
						"type": "cr",
						"st": "thr",
						"base": "1"
					},
					"strength": "0",
					"usage": "Shield Bash",
					"reach": "1",
					"parry": "No",
					"block": "+0",
					"calc": {
						"level": 0,
						"parry": "No",
						"block": "+0",
						"damage": "thr+1 cr"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Shield",
							"specialization": "Buckler",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Shield",
							"specialization": "Force Shield",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Shield",
							"specialization": "Shield"
						}
					]
				}
			],
			"calc": {
				"extended_value": "60",
				"extended_weight": "13 lb"
			},
			"features": [
				{
					"type": "attribute_bonus",
					"amount": 1,
					"attribute": "dodge"
				},
				{
					"type": "attribute_bonus",
					"amount": 1,
					"attribute": "parry"
				},
				{
					"type": "attribute_bonus",
					"amount": 1,
					"attribute": "block"
				}
			],
			"categories": [
				"Shield"
			]
		},
		{
			"type": "equipment",
			"id": "aaa45028-af74-4d9e-bb50-021df0e7b54a",
			"quantity": 1,
			"description": "Smallsword",
			"tech_level": "4",
			"value": "400",
			"weight": "1.5 lb",
			"reference": "B273",
			"weapons": [
				{
					"type": "melee_weapon",
					"damage": {
						"type": "imp",
						"st": "thr",
						"base": "1"
					},
					"strength": "5",
					"usage": "Thrust",
					"reach": "1",
					"parry": "0F",
					"block": "No",
					"calc": {
						"level": 0,
						"parry": "0F",
						"block": "No",
						"damage": "thr+1 imp"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -5
						},
						{
							"type": "skill",
							"name": "Smallsword"
						},
						{
							"type": "skill",
							"name": "Main-Gauche",
							"modifier": -3
						},
						{
							"type": "skill",
							"name": "Rapier",
							"modifier": -3
						},
						{
							"type": "skill",
							"name": "Saber",
							"modifier": -3
						},
						{
							"type": "skill",
							"name": "Shortsword",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Sword!"
						}
					]
				}
			],
			"calc": {
				"extended_value": "400",
				"extended_weight": "1.5 lb"
			},
			"categories": [
				"Melee Weapon"
			]
		},
		{
			"type": "equipment",
			"id": "249b3c1a-8e6e-4a17-8c35-149f31a0f88c",
			"quantity": 1,
			"description": "SMG, .45",
			"tech_level": "6",
			"legality_class": "2",
			"value": "2200",
			"weight": "15.7 lb",
			"reference": "B278",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "pi+",
						"base": "2d+1"
					},
					"strength": "11†",
					"accuracy": "3",
					"range": "190/1750",
					"rate_of_fire": "13",
					"shots": "50+1(5)",
					"bulk": "-4",
					"recoil": "3",
					"calc": {
						"level": 0,
						"range": "190/1750",
						"damage": "2d+1 pi+"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Pistol",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Rifle",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Shotgun",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Light Machine Gun",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Submachine Gun"
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Musket",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Grenade Launcher",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Gyroc",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Light Anti-Armor Weapon",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Gun!"
						}
					]
				}
			],
			"calc": {
				"extended_value": "2200",
				"extended_weight": "15.7 lb"
			},
			"categories": [
				"Missile Weapon"
			]
		},
		{
			"type": "equipment",
			"id": "d5d6ae82-1f6d-4b4b-8ac3-108337061abd",
			"quantity": 1,
			"description": "SMG, 9mm",
			"tech_level": "6",
			"legality_class": "2",
			"value": "700",
			"weight": "10.5 lb",
			"reference": "B278",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "pi",
						"base": "3d-1"
					},
					"strength": "10†",
					"accuracy": "3",
					"range": "160/1900",
					"rate_of_fire": "8!",
					"shots": "32(3)",
					"bulk": "-4",
					"recoil": "2",
					"calc": {
						"level": 0,
						"range": "160/1900",
						"damage": "3d-1 pi"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Pistol",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Rifle",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Shotgun",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Light Machine Gun",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Submachine Gun"
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Musket",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Grenade Launcher",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Gyroc",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Light Anti-Armor Weapon",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Gun!"
						}
					]
				}
			],
			"calc": {
				"extended_value": "700",
				"extended_weight": "10.5 lb"
			},
			"categories": [
				"Missile Weapon"
			]
		},
		{
			"type": "equipment",
			"id": "c74350ec-0e63-45c0-ac45-b200f00e30de",
			"quantity": 1,
			"description": "SMG, 9mm",
			"tech_level": "7",
			"legality_class": "2",
			"value": "1200",
			"weight": "7.5 lb",
			"reference": "B278",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "pi",
						"base": "3d-1"
					},
					"strength": "10†",
					"accuracy": "4",
					"range": "160/1900",
					"rate_of_fire": "13",
					"shots": "30+1(3)",
					"bulk": "-4",
					"recoil": "2",
					"calc": {
						"level": 0,
						"range": "160/1900",
						"damage": "3d-1 pi"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Pistol",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Rifle",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Shotgun",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Light Machine Gun",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Submachine Gun"
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Musket",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Grenade Launcher",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Gyroc",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Light Anti-Armor Weapon",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Gun!"
						}
					]
				}
			],
			"calc": {
				"extended_value": "1200",
				"extended_weight": "7.5 lb"
			},
			"categories": [
				"Missile Weapon"
			]
		},
		{
			"type": "equipment",
			"id": "8d44e66f-c8c0-49e9-9ee6-23835ad418b7",
			"quantity": 1,
			"description": "Sniper Rifle, .338",
			"tech_level": "8",
			"legality_class": "3",
			"value": "5600",
			"weight": "17.5 lb",
			"reference": "B279",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "pi",
						"base": "9d+1"
					},
					"strength": "11B†",
					"accuracy": "6+3",
					"range": "1500/5500",
					"rate_of_fire": "1",
					"shots": "4+1(3)",
					"bulk": "-6",
					"recoil": "4",
					"calc": {
						"level": 0,
						"range": "1500/5500",
						"damage": "9d+1 pi"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Pistol",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Rifle"
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Shotgun",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Light Machine Gun",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Submachine Gun",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Musket",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Grenade Launcher",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Gyroc",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Light Anti-Armor Weapon",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Gun!"
						}
					]
				}
			],
			"calc": {
				"extended_value": "5600",
				"extended_weight": "17.5 lb"
			},
			"categories": [
				"Missile Weapon"
			]
		},
		{
			"type": "equipment",
			"id": "6fd4656f-d4b3-4992-8e0e-aaa33ab4ba0a",
			"quantity": 1,
			"description": "Snub Revolver, .38",
			"tech_level": "6",
			"legality_class": "3",
			"value": "250",
			"weight": "1.5 lb",
			"reference": "B278",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "pi",
						"base": "1d+2"
					},
					"strength": "8",
					"accuracy": "1",
					"range": "120/1250",
					"rate_of_fire": "3",
					"shots": "5(3i)",
					"bulk": "-1",
					"recoil": "3",
					"calc": {
						"level": 0,
						"range": "120/1250",
						"damage": "1d+2 pi"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Pistol"
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Rifle",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Shotgun",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Light Machine Gun",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Submachine Gun",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Musket",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Grenade Launcher",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Gyroc",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Light Anti-Armor Weapon",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Gun!"
						}
					]
				}
			],
			"calc": {
				"extended_value": "250",
				"extended_weight": "1.5 lb"
			},
			"categories": [
				"Missile Weapon"
			]
		},
		{
			"type": "equipment",
			"id": "e5d39e1d-e61b-4004-9416-8f8cae7fe09a",
			"quantity": 1,
			"description": "Sollerets",
			"tech_level": "3",
			"legality_class": "3",
			"value": "150",
			"weight": "7 lb",
			"reference": "B284",
			"calc": {
				"extended_value": "150",
				"extended_weight": "7 lb"
			},
			"features": [
				{
					"type": "dr_bonus",
					"amount": 4,
					"location": "foot"
				},
				{
					"type": "weapon_bonus",
					"amount": 1,
					"selection_type": "weapons_with_name",
					"specialization": {
						"compare": "is",
						"qualifier": "Kick"
					}
				}
			],
			"categories": [
				"Footwear"
			]
		},
		{
			"type": "equipment",
			"id": "80d75e14-8ecf-47ed-8b05-ec8c907402f1",
			"quantity": 1,
			"description": "Space Armor",
			"tech_level": "9",
			"legality_class": "2",
			"value": "20000",
			"weight": "45 lb",
			"reference": "B285",
			"calc": {
				"extended_value": "20000",
				"extended_weight": "45 lb"
			},
			"prereqs": {
				"type": "prereq_list",
				"all": true,
				"prereqs": [
					{
						"type": "skill_prereq",
						"has": true,
						"name": {
							"compare": "is",
							"qualifier": "vacc suit"
						}
					}
				]
			},
			"features": [
				{
					"type": "dr_bonus",
					"amount": 30,
					"location": "neck"
				},
				{
					"type": "dr_bonus",
					"amount": 50,
					"location": "torso"
				},
				{
					"type": "dr_bonus",
					"amount": 50,
					"location": "vitals"
				},
				{
					"type": "dr_bonus",
					"amount": 30,
					"location": "groin"
				},
				{
					"type": "dr_bonus",
					"amount": 30,
					"location": "arm"
				},
				{
					"type": "dr_bonus",
					"amount": 30,
					"location": "hand"
				},
				{
					"type": "dr_bonus",
					"amount": 30,
					"location": "leg"
				},
				{
					"type": "dr_bonus",
					"amount": 30,
					"location": "foot"
				}
			],
			"categories": [
				"Environment Suits"
			]
		},
		{
			"type": "equipment",
			"id": "95f2d5da-3d8a-4580-b2f3-5691cc3c76e0",
			"quantity": 1,
			"description": "Space Armor",
			"tech_level": "10",
			"legality_class": "2",
			"value": "20000",
			"weight": "45 lb",
			"reference": "B285",
			"calc": {
				"extended_value": "20000",
				"extended_weight": "45 lb"
			},
			"prereqs": {
				"type": "prereq_list",
				"all": true,
				"prereqs": [
					{
						"type": "skill_prereq",
						"has": true,
						"name": {
							"compare": "is",
							"qualifier": "vacc suit"
						}
					}
				]
			},
			"features": [
				{
					"type": "dr_bonus",
					"amount": 45,
					"location": "neck"
				},
				{
					"type": "dr_bonus",
					"amount": 75,
					"location": "torso"
				},
				{
					"type": "dr_bonus",
					"amount": 75,
					"location": "vitals"
				},
				{
					"type": "dr_bonus",
					"amount": 45,
					"location": "groin"
				},
				{
					"type": "dr_bonus",
					"amount": 45,
					"location": "arm"
				},
				{
					"type": "dr_bonus",
					"amount": 45,
					"location": "hand"
				},
				{
					"type": "dr_bonus",
					"amount": 45,
					"location": "leg"
				},
				{
					"type": "dr_bonus",
					"amount": 45,
					"location": "foot"
				}
			],
			"categories": [
				"Environment Suits"
			]
		},
		{
			"type": "equipment",
			"id": "7aaec730-807a-4e67-9500-00a4fe261438",
			"quantity": 1,
			"description": "Space Armor",
			"tech_level": "11",
			"legality_class": "2",
			"value": "20000",
			"weight": "45 lb",
			"reference": "B285",
			"calc": {
				"extended_value": "20000",
				"extended_weight": "45 lb"
			},
			"prereqs": {
				"type": "prereq_list",
				"all": true,
				"prereqs": [
					{
						"type": "skill_prereq",
						"has": true,
						"name": {
							"compare": "is",
							"qualifier": "vacc suit"
						}
					}
				]
			},
			"features": [
				{
					"type": "dr_bonus",
					"amount": 60,
					"location": "neck"
				},
				{
					"type": "dr_bonus",
					"amount": 100,
					"location": "torso"
				},
				{
					"type": "dr_bonus",
					"amount": 100,
					"location": "vitals"
				},
				{
					"type": "dr_bonus",
					"amount": 60,
					"location": "groin"
				},
				{
					"type": "dr_bonus",
					"amount": 60,
					"location": "arm"
				},
				{
					"type": "dr_bonus",
					"amount": 60,
					"location": "hand"
				},
				{
					"type": "dr_bonus",
					"amount": 60,
					"location": "leg"
				},
				{
					"type": "dr_bonus",
					"amount": 60,
					"location": "foot"
				}
			],
			"categories": [
				"Environment Suits"
			]
		},
		{
			"type": "equipment",
			"id": "022fda15-11c1-4fde-8ac6-7a81207749b8",
			"quantity": 1,
			"description": "Space Armor Helmet",
			"tech_level": "9",
			"legality_class": "2",
			"value": "3000",
			"weight": "7 lb",
			"reference": "B285",
			"calc": {
				"extended_value": "3000",
				"extended_weight": "7 lb"
			},
			"features": [
				{
					"type": "dr_bonus",
					"amount": 30,
					"location": "eye"
				},
				{
					"type": "dr_bonus",
					"amount": 40,
					"location": "skull"
				},
				{
					"type": "dr_bonus",
					"amount": 30,
					"location": "face"
				}
			],
			"categories": [
				"Environment Suits"
			]
		},
		{
			"type": "equipment",
			"id": "dd3a1f92-72d0-4b23-a3a2-c1f4fac8f57e",
			"quantity": 1,
			"description": "Space Armor Helmet",
			"tech_level": "10",
			"legality_class": "2",
			"value": "3000",
			"weight": "7 lb",
			"reference": "B285",
			"calc": {
				"extended_value": "3000",
				"extended_weight": "7 lb"
			},
			"features": [
				{
					"type": "dr_bonus",
					"amount": 45,
					"location": "eye"
				},
				{
					"type": "dr_bonus",
					"amount": 60,
					"location": "skull"
				},
				{
					"type": "dr_bonus",
					"amount": 45,
					"location": "face"
				}
			],
			"categories": [
				"Environment Suits"
			]
		},
		{
			"type": "equipment",
			"id": "135f9d82-3d15-4b57-a2b8-02adb0e02113",
			"quantity": 1,
			"description": "Space Armor Helmet",
			"tech_level": "11",
			"legality_class": "2",
			"value": "3000",
			"weight": "7 lb",
			"reference": "B285",
			"calc": {
				"extended_value": "3000",
				"extended_weight": "7 lb"
			},
			"features": [
				{
					"type": "dr_bonus",
					"amount": 60,
					"location": "eye"
				},
				{
					"type": "dr_bonus",
					"amount": 80,
					"location": "skull"
				},
				{
					"type": "dr_bonus",
					"amount": 60,
					"location": "face"
				}
			],
			"categories": [
				"Environment Suits"
			]
		},
		{
			"type": "equipment",
			"id": "31d2443a-a3a6-4904-a8c0-8efc87ce2a38",
			"quantity": 1,
			"description": "Space Helmet",
			"tech_level": "7",
			"value": "25000",
			"weight": "10 lb",
			"reference": "B285",
			"calc": {
				"extended_value": "25000",
				"extended_weight": "10 lb"
			},
			"features": [
				{
					"type": "dr_bonus",
					"amount": 3,
					"location": "eye"
				},
				{
					"type": "dr_bonus",
					"amount": 3,
					"location": "skull"
				},
				{
					"type": "dr_bonus",
					"amount": 3,
					"location": "face"
				}
			],
			"categories": [
				"Environment Suits"
			]
		},
		{
			"type": "equipment",
			"id": "ac63e123-2a73-4e36-8446-8477df342292",
			"quantity": 1,
			"description": "Space Suit",
			"tech_level": "7",
			"value": "2000000",
			"weight": "225 lb",
			"reference": "B285",
			"calc": {
				"extended_value": "2000000",
				"extended_weight": "225 lb"
			},
			"prereqs": {
				"type": "prereq_list",
				"all": true,
				"prereqs": [
					{
						"type": "skill_prereq",
						"has": true,
						"name": {
							"compare": "is",
							"qualifier": "vacc suit"
						}
					}
				]
			},
			"features": [
				{
					"type": "dr_bonus",
					"amount": 2,
					"location": "neck"
				},
				{
					"type": "dr_bonus",
					"amount": 2,
					"location": "torso"
				},
				{
					"type": "dr_bonus",
					"amount": 2,
					"location": "vitals"
				},
				{
					"type": "dr_bonus",
					"amount": 2,
					"location": "groin"
				},
				{
					"type": "dr_bonus",
					"amount": 2,
					"location": "arm"
				},
				{
					"type": "dr_bonus",
					"amount": 2,
					"location": "hand"
				},
				{
					"type": "dr_bonus",
					"amount": 2,
					"location": "leg"
				},
				{
					"type": "dr_bonus",
					"amount": 2,
					"location": "foot"
				}
			],
			"categories": [
				"Environment Suits"
			]
		},
		{
			"type": "equipment",
			"id": "a5fc6c51-8b65-4df2-bfb2-71bb4ec63d55",
			"quantity": 1,
			"description": "Spear",
			"tech_level": "0",
			"value": "40",
			"weight": "4 lb",
			"reference": "B273",
			"weapons": [
				{
					"type": "melee_weapon",
					"damage": {
						"type": "imp",
						"st": "thr",
						"base": "2"
					},
					"strength": "9",
					"usage": "Thrust",
					"reach": "1*",
					"parry": "0",
					"block": "No",
					"calc": {
						"level": 0,
						"parry": "0",
						"block": "No",
						"damage": "thr+2 imp"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -5
						},
						{
							"type": "skill",
							"name": "Spear"
						},
						{
							"type": "skill",
							"name": "Polearm",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Staff",
							"modifier": -2
						}
					]
				},
				{
					"type": "melee_weapon",
					"damage": {
						"type": "imp",
						"st": "thr",
						"base": "3"
					},
					"strength": "9†",
					"usage": "Thrust",
					"reach": "1,2*",
					"parry": "0",
					"block": "No",
					"calc": {
						"level": 0,
						"parry": "0",
						"block": "No",
						"damage": "thr+3 imp"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -5
						},
						{
							"type": "skill",
							"name": "Spear"
						},
						{
							"type": "skill",
							"name": "Polearm",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Staff",
							"modifier": -2
						}
					]
				},
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "imp",
						"st": "thr",
						"base": "3"
					},
					"strength": "9",
					"usage": "Thrown",
					"accuracy": "+2",
					"range": "x1/x1.5",
					"rate_of_fire": "1",
					"shots": "T(1)",
					"bulk": "-6",
					"calc": {
						"level": 0,
						"range": "x1/x1.5",
						"damage": "thr+3 imp"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Thrown Weapon",
							"specialization": "Spear"
						},
						{
							"type": "skill",
							"name": "Spear Thrower",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Thrown Weapon",
							"specialization": "Harpoon",
							"modifier": -2
						}
					]
				}
			],
			"calc": {
				"extended_value": "40",
				"extended_weight": "4 lb"
			},
			"categories": [
				"Melee Weapon",
				"Missile Weapon"
			]
		},
		{
			"type": "equipment",
			"id": "e64ab80b-4097-4435-9b65-5312c15ef41b",
			"quantity": 1,
			"description": "Spinning Wheel",
			"tech_level": "3",
			"value": "100",
			"weight": "40 lb",
			"reference": "B289",
			"calc": {
				"extended_value": "100",
				"extended_weight": "40 lb"
			},
			"notes": "Produces yarn six times as fast.",
			"categories": [
				"Tools"
			]
		},
		{
			"type": "equipment",
			"id": "cbfd9c68-72a6-48f9-b1ff-67b6c92a8bb5",
			"quantity": 1,
			"description": "Spurs",
			"tech_level": "2",
			"value": "20",
			"weight": "0 lb",
			"reference": "B289",
			"calc": {
				"extended_value": "20",
				"extended_weight": "0 lb"
			},
			"notes": "+1 to control a mount.",
			"categories": [
				"Equestrian Gear"
			]
		},
		{
			"type": "equipment",
			"id": "87e89bc9-228d-4f38-9950-4107ecf69222",
			"quantity": 1,
			"description": "Spy Camera",
			"tech_level": "6",
			"value": "500",
			"weight": "0 lb",
			"reference": "B289",
			"calc": {
				"extended_value": "500",
				"extended_weight": "0 lb"
			},
			"notes": "Holds 36 exposures, uses microfilm",
			"categories": [
				"Optics and Sensors"
			]
		},
		{
			"type": "equipment",
			"id": "fe65bdb8-fbdd-456a-aa2e-126b9b0cd3df",
			"quantity": 1,
			"description": "Staff Sling",
			"tech_level": "1",
			"value": "20",
			"weight": "2 lb",
			"reference": "B276",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "pi",
						"st": "sw",
						"base": "1"
					},
					"strength": "7†",
					"accuracy": "1",
					"range": "x10/x15",
					"rate_of_fire": "1",
					"shots": "1(2)",
					"bulk": "-6",
					"calc": {
						"level": 0,
						"range": "x10/x15",
						"damage": "sw+1 pi"
					},
					"defaults": [
						{
							"type": "skill",
							"name": "Sling"
						},
						{
							"type": "dx",
							"modifier": -6
						}
					]
				}
			],
			"calc": {
				"extended_value": "20",
				"extended_weight": "2 lb"
			},
			"categories": [
				"Missile Weapon",
				"UsesAmmoType:Sling"
			]
		},
		{
			"type": "equipment",
			"id": "78f0f697-ffac-4d9c-b87e-0f2398f6fb40",
			"quantity": 1,
			"description": "Steel Breastplate",
			"tech_level": "3",
			"legality_class": "3",
			"value": "500",
			"weight": "18 lb",
			"reference": "B283",
			"calc": {
				"extended_value": "500",
				"extended_weight": "18 lb"
			},
			"features": [
				{
					"type": "dr_bonus",
					"amount": 5,
					"location": "torso",
					"specialization": "frontal"
				},
				{
					"type": "dr_bonus",
					"amount": 5,
					"location": "vitals",
					"specialization": "frontal"
				}
			],
			"categories": [
				"Body Armor"
			]
		},
		{
			"type": "equipment",
			"id": "c74a4c0a-a546-45dc-8469-d6fc1404696a",
			"quantity": 1,
			"description": "Steel Corselet",
			"tech_level": "3",
			"legality_class": "3",
			"value": "1300",
			"weight": "35 lb",
			"reference": "B283",
			"calc": {
				"extended_value": "1300",
				"extended_weight": "35 lb"
			},
			"features": [
				{
					"type": "dr_bonus",
					"amount": 6,
					"location": "groin"
				},
				{
					"type": "dr_bonus",
					"amount": 6,
					"location": "torso"
				},
				{
					"type": "dr_bonus",
					"amount": 6,
					"location": "vitals"
				}
			],
			"categories": [
				"Body Armor"
			]
		},
		{
			"type": "equipment",
			"id": "000fb61f-22ed-44c7-9e9e-43cbb1cb16a3",
			"quantity": 1,
			"description": "Steel Laminate Plate",
			"tech_level": "3",
			"legality_class": "3",
			"value": "900",
			"weight": "30 lb",
			"reference": "B283",
			"calc": {
				"extended_value": "900",
				"extended_weight": "30 lb"
			},
			"features": [
				{
					"type": "dr_bonus",
					"amount": 5,
					"location": "groin"
				},
				{
					"type": "dr_bonus",
					"amount": 5,
					"location": "torso"
				},
				{
					"type": "dr_bonus",
					"amount": 5,
					"location": "vitals"
				}
			],
			"categories": [
				"Body Armor"
			]
		},
		{
			"type": "equipment",
			"id": "818ead77-068f-4992-bdcf-83a567c5743a",
			"quantity": 1,
			"description": "Steel Pot",
			"tech_level": "6",
			"value": "60",
			"weight": "3 lb",
			"reference": "B285",
			"calc": {
				"extended_value": "60",
				"extended_weight": "3 lb"
			},
			"features": [
				{
					"type": "dr_bonus",
					"amount": 4,
					"location": "skull"
				}
			],
			"categories": [
				"Headgear"
			]
		},
		{
			"type": "equipment",
			"id": "d4338e38-73be-4b66-94d6-1faf0e9dfe8e",
			"quantity": 1,
			"description": "Stirrups",
			"tech_level": "3",
			"value": "125",
			"weight": "20 lb",
			"reference": "B289",
			"calc": {
				"extended_value": "125",
				"extended_weight": "20 lb"
			},
			"notes": "Make it easy to mount a horse and give +1 to control mount. Required to use Lance skill. With ordinary saddle",
			"categories": [
				"Equestrian Gear"
			]
		},
		{
			"type": "equipment",
			"id": "f1ee3ef0-7f95-4500-b545-78aa499f1d59",
			"quantity": 1,
			"description": "Studded Leather Skirt",
			"tech_level": "1",
			"value": "60",
			"weight": "4 lb",
			"reference": "B283",
			"calc": {
				"extended_value": "60",
				"extended_weight": "4 lb"
			},
			"features": [
				{
					"type": "dr_bonus",
					"amount": 3,
					"location": "groin"
				},
				{
					"type": "dr_bonus",
					"amount": 3,
					"location": "leg"
				},
				{
					"type": "dr_bonus",
					"amount": -1,
					"location": "groin",
					"specialization": "crushing"
				},
				{
					"type": "dr_bonus",
					"amount": -1,
					"location": "leg",
					"specialization": "crushing"
				}
			],
			"notes": "Flexible",
			"categories": [
				"Limb Armor"
			]
		},
		{
			"type": "equipment",
			"id": "1e21ea10-6562-4e91-8f2e-1ee3aaa5f77a",
			"quantity": 1,
			"description": "Stun Gun",
			"tech_level": "8",
			"value": "100",
			"weight": "1 lb",
			"reference": "B271",
			"weapons": [
				{
					"type": "melee_weapon",
					"damage": {
						"type": "HT-3(0.5) aff"
					},
					"strength": "2",
					"reach": "C,1",
					"parry": "No",
					"block": "No",
					"calc": {
						"level": 0,
						"parry": "No",
						"block": "No",
						"damage": "HT-3(0.5) aff"
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
			"calc": {
				"extended_value": "100",
				"extended_weight": "1 lb"
			},
			"categories": [
				"Missile Weapon"
			]
		},
		{
			"type": "equipment",
			"id": "119f599f-ff61-4b0b-bc07-05b6bd66dbca",
			"quantity": 1,
			"description": "Suitcase Lab",
			"tech_level": "5",
			"value": "3000",
			"weight": "10 lb",
			"reference": "B289",
			"calc": {
				"extended_value": "3000",
				"extended_weight": "10 lb"
			},
			"notes": "Basic equipment for a specific scientific skill (e.g., Chemistry or Forensics).",
			"categories": [
				"Tools"
			]
		},
		{
			"type": "equipment_container",
			"id": "b39fd8bd-8087-4872-9b8a-1759ba117cf5",
			"description": "Suitcase, Hard",
			"tech_level": "5",
			"value": "250",
			"weight": "8 lb",
			"reference": "B288",
			"calc": {
				"extended_value": "250",
				"extended_weight": "8 lb"
			},
			"prereqs": {
				"type": "prereq_list",
				"all": true,
				"prereqs": [
					{
						"type": "contained_weight_prereq",
						"has": true,
						"qualifier": {
							"compare": "at_most",
							"qualifier": "100 lb"
						}
					}
				]
			},
			"notes": "DR4, with key lock",
			"categories": [
				"Camping and Survival Gear"
			],
			"open": true
		},
		{
			"type": "equipment",
			"id": "98f5f21a-9beb-4d9a-b58b-00ee4e4cc5a8",
			"quantity": 1,
			"description": "Surgical Instruments",
			"tech_level": "1",
			"value": "300",
			"weight": "15 lb",
			"reference": "B289",
			"calc": {
				"extended_value": "300",
				"extended_weight": "15 lb"
			},
			"notes": "Includes scalpels, forceps, etc. Basic equipment für Surgery skill.",
			"categories": [
				"Medical Gear"
			]
		},
		{
			"type": "equipment",
			"id": "25e74610-ac82-4de8-a57a-b60384a7a04a",
			"quantity": 1,
			"description": "Tactical Suit",
			"tech_level": "9",
			"legality_class": "2",
			"value": "3000",
			"weight": "15 lb",
			"reference": "B284",
			"calc": {
				"extended_value": "3000",
				"extended_weight": "15 lb"
			},
			"prereqs": {
				"type": "prereq_list",
				"all": true,
				"prereqs": [
					{
						"type": "skill_prereq",
						"has": true,
						"name": {
							"compare": "is",
							"qualifier": "nbc suit"
						}
					}
				]
			},
			"features": [
				{
					"type": "dr_bonus",
					"amount": 20,
					"location": "skull"
				},
				{
					"type": "dr_bonus",
					"amount": 20,
					"location": "neck"
				},
				{
					"type": "dr_bonus",
					"amount": 20,
					"location": "torso"
				},
				{
					"type": "dr_bonus",
					"amount": 20,
					"location": "vitals"
				},
				{
					"type": "dr_bonus",
					"amount": 20,
					"location": "groin"
				},
				{
					"type": "dr_bonus",
					"amount": 20,
					"location": "arm"
				},
				{
					"type": "dr_bonus",
					"amount": 20,
					"location": "hand"
				},
				{
					"type": "dr_bonus",
					"amount": 20,
					"location": "leg"
				},
				{
					"type": "dr_bonus",
					"amount": 20,
					"location": "foot"
				}
			],
			"categories": [
				"Body Armor"
			]
		},
		{
			"type": "equipment",
			"id": "dda4357c-949e-46ae-b540-f2c6a4dea3af",
			"quantity": 1,
			"description": "Tactical Suit",
			"tech_level": "10",
			"legality_class": "2",
			"value": "3000",
			"weight": "15 lb",
			"reference": "B284",
			"calc": {
				"extended_value": "3000",
				"extended_weight": "15 lb"
			},
			"prereqs": {
				"type": "prereq_list",
				"all": true,
				"prereqs": [
					{
						"type": "skill_prereq",
						"has": true,
						"name": {
							"compare": "is",
							"qualifier": "nbc suit"
						}
					}
				]
			},
			"features": [
				{
					"type": "dr_bonus",
					"amount": 30,
					"location": "skull"
				},
				{
					"type": "dr_bonus",
					"amount": 30,
					"location": "neck"
				},
				{
					"type": "dr_bonus",
					"amount": 30,
					"location": "torso"
				},
				{
					"type": "dr_bonus",
					"amount": 30,
					"location": "vitals"
				},
				{
					"type": "dr_bonus",
					"amount": 30,
					"location": "groin"
				},
				{
					"type": "dr_bonus",
					"amount": 30,
					"location": "arm"
				},
				{
					"type": "dr_bonus",
					"amount": 30,
					"location": "hand"
				},
				{
					"type": "dr_bonus",
					"amount": 30,
					"location": "leg"
				},
				{
					"type": "dr_bonus",
					"amount": 30,
					"location": "foot"
				}
			],
			"categories": [
				"Body Armor"
			]
		},
		{
			"type": "equipment",
			"id": "b1b9d0a4-bce4-4315-896f-b026692a36fc",
			"quantity": 1,
			"description": "Tactical Suit",
			"tech_level": "11",
			"legality_class": "2",
			"value": "3000",
			"weight": "15 lb",
			"reference": "B284",
			"calc": {
				"extended_value": "3000",
				"extended_weight": "15 lb"
			},
			"prereqs": {
				"type": "prereq_list",
				"all": true,
				"prereqs": [
					{
						"type": "skill_prereq",
						"has": true,
						"name": {
							"compare": "is",
							"qualifier": "nbc suit"
						}
					}
				]
			},
			"features": [
				{
					"type": "dr_bonus",
					"amount": 40,
					"location": "skull"
				},
				{
					"type": "dr_bonus",
					"amount": 40,
					"location": "neck"
				},
				{
					"type": "dr_bonus",
					"amount": 40,
					"location": "torso"
				},
				{
					"type": "dr_bonus",
					"amount": 40,
					"location": "vitals"
				},
				{
					"type": "dr_bonus",
					"amount": 40,
					"location": "groin"
				},
				{
					"type": "dr_bonus",
					"amount": 40,
					"location": "arm"
				},
				{
					"type": "dr_bonus",
					"amount": 40,
					"location": "hand"
				},
				{
					"type": "dr_bonus",
					"amount": 40,
					"location": "leg"
				},
				{
					"type": "dr_bonus",
					"amount": 40,
					"location": "foot"
				}
			],
			"categories": [
				"Body Armor"
			]
		},
		{
			"type": "equipment",
			"id": "ab37fe49-39e1-4b36-82f7-edaf5ec4f7c4",
			"quantity": 1,
			"description": "Tactical Vest",
			"tech_level": "8",
			"legality_class": "2",
			"value": "900",
			"weight": "9 lb",
			"reference": "B284",
			"calc": {
				"extended_value": "900",
				"extended_weight": "9 lb"
			},
			"features": [
				{
					"type": "dr_bonus",
					"amount": 12,
					"location": "torso"
				},
				{
					"type": "dr_bonus",
					"amount": 12,
					"location": "vitals"
				},
				{
					"type": "dr_bonus",
					"amount": 12,
					"location": "groin"
				}
			],
			"categories": [
				"Body Armor"
			]
		},
		{
			"type": "equipment",
			"id": "316bb597-bdd5-4662-812b-5f2528d906cb",
			"quantity": 1,
			"description": "Tactical Vest",
			"tech_level": "9",
			"legality_class": "2",
			"value": "900",
			"weight": "9 lb",
			"reference": "B284",
			"calc": {
				"extended_value": "900",
				"extended_weight": "9 lb"
			},
			"features": [
				{
					"type": "dr_bonus",
					"amount": 18,
					"location": "torso"
				},
				{
					"type": "dr_bonus",
					"amount": 18,
					"location": "vitals"
				},
				{
					"type": "dr_bonus",
					"amount": 18,
					"location": "groin"
				}
			],
			"categories": [
				"Body Armor"
			]
		},
		{
			"type": "equipment",
			"id": "7b423277-eb22-4c94-8ad0-678556d8a7d1",
			"quantity": 1,
			"description": "Tactical Vest",
			"tech_level": "10",
			"legality_class": "2",
			"value": "900",
			"weight": "9 lb",
			"reference": "B284",
			"calc": {
				"extended_value": "900",
				"extended_weight": "9 lb"
			},
			"features": [
				{
					"type": "dr_bonus",
					"amount": 24,
					"location": "torso"
				},
				{
					"type": "dr_bonus",
					"amount": 24,
					"location": "vitals"
				},
				{
					"type": "dr_bonus",
					"amount": 24,
					"location": "groin"
				}
			],
			"categories": [
				"Body Armor"
			]
		},
		{
			"type": "equipment",
			"id": "6feb8d27-8029-4be1-8155-c79f85f3611c",
			"quantity": 1,
			"description": "Tactical Vest",
			"tech_level": "11",
			"legality_class": "2",
			"value": "900",
			"weight": "9 lb",
			"reference": "B284",
			"calc": {
				"extended_value": "900",
				"extended_weight": "9 lb"
			},
			"features": [
				{
					"type": "dr_bonus",
					"amount": 32,
					"location": "torso"
				},
				{
					"type": "dr_bonus",
					"amount": 32,
					"location": "vitals"
				},
				{
					"type": "dr_bonus",
					"amount": 32,
					"location": "groin"
				}
			],
			"categories": [
				"Body Armor"
			]
		},
		{
			"type": "equipment",
			"id": "7bc8e351-cba1-4e5d-97e8-8ff595d3a787",
			"quantity": 1,
			"description": "Tactical Vest Trauma Plates",
			"tech_level": "8",
			"legality_class": "2",
			"value": "600",
			"weight": "9 lb",
			"reference": "B284",
			"calc": {
				"extended_value": "600",
				"extended_weight": "9 lb"
			},
			"features": [
				{
					"type": "dr_bonus",
					"amount": 23,
					"location": "torso"
				},
				{
					"type": "dr_bonus",
					"amount": 23,
					"location": "vitals"
				}
			],
			"categories": [
				"Body Armor"
			]
		},
		{
			"type": "equipment",
			"id": "b5654f01-213a-4e87-8666-69572711f0f0",
			"quantity": 1,
			"description": "Telescope",
			"tech_level": "4",
			"value": "500",
			"weight": "6 lb",
			"reference": "B289",
			"calc": {
				"extended_value": "500",
				"extended_weight": "6 lb"
			},
			"notes": "Gives (TL-3) levels of Telescopic Vision.",
			"categories": [
				"Optics and Sensors"
			]
		},
		{
			"type": "equipment",
			"id": "2a5a09c8-29dd-427d-845b-0fac02a4c7a1",
			"quantity": 1,
			"description": "Tent, 1-Man",
			"tech_level": "0",
			"value": "50",
			"weight": "5 lb",
			"reference": "B288",
			"calc": {
				"extended_value": "50",
				"extended_weight": "5 lb"
			},
			"notes": "Includes ropes; no poles needed",
			"categories": [
				"Camping and Survival Gear"
			]
		},
		{
			"type": "equipment",
			"id": "af3dc772-f481-422f-96a8-cb10e2f12252",
			"quantity": 1,
			"description": "Tent, 2-Man",
			"tech_level": "0",
			"value": "80",
			"weight": "12 lb",
			"reference": "B288",
			"calc": {
				"extended_value": "80",
				"extended_weight": "12 lb"
			},
			"notes": "Includes ropes; requires one 6\' pole",
			"categories": [
				"Camping and Survival Gear"
			]
		},
		{
			"type": "equipment",
			"id": "1c1138f3-d1e0-4f72-825f-6b27785b8dcd",
			"quantity": 1,
			"description": "Tent, 4-Man",
			"tech_level": "0",
			"value": "150",
			"weight": "30 lb",
			"reference": "B288",
			"calc": {
				"extended_value": "150",
				"extended_weight": "30 lb"
			},
			"notes": "Includes ropes; requires two 6\' poles",
			"categories": [
				"Camping and Survival Gear"
			]
		},
		{
			"type": "equipment",
			"id": "a829d799-7506-4076-8c77-a7917fb916b8",
			"quantity": 1,
			"description": "Tent, 20-Man",
			"tech_level": "1",
			"value": "300",
			"weight": "100 lb",
			"reference": "B288",
			"calc": {
				"extended_value": "300",
				"extended_weight": "100 lb"
			},
			"notes": "Includes ropes; requires 12 6\' poles, 4 10\' poles",
			"categories": [
				"Camping and Survival Gear"
			]
		},
		{
			"type": "equipment_container",
			"id": "e77068a8-d9c3-42ba-ac43-a36754e5c998",
			"description": "Thermos Bottle",
			"tech_level": "5",
			"value": "10",
			"weight": "2 lb",
			"reference": "B288",
			"calc": {
				"extended_value": "10",
				"extended_weight": "2 lb"
			},
			"prereqs": {
				"type": "prereq_list",
				"all": true,
				"prereqs": [
					{
						"type": "contained_weight_prereq",
						"has": true,
						"qualifier": {
							"compare": "at_most",
							"qualifier": "1 lb"
						}
					}
				]
			},
			"notes": "Keeps 1 pint hot [24 hours] or cold [72 hours]",
			"categories": [
				"Camping and Survival Gear"
			],
			"open": true
		},
		{
			"type": "equipment",
			"id": "244ed05d-f5c4-452f-aded-88f092e6fa09",
			"quantity": 1,
			"description": "Throwing Axe",
			"tech_level": "0",
			"value": "60",
			"weight": "4 lb",
			"reference": "B271",
			"weapons": [
				{
					"type": "melee_weapon",
					"damage": {
						"type": "cut",
						"st": "sw",
						"base": "2"
					},
					"strength": "11",
					"usage": "Swung",
					"reach": "1",
					"parry": "0U",
					"block": "No",
					"calc": {
						"level": 0,
						"parry": "0U",
						"block": "No",
						"damage": "sw+2 cut"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -5
						},
						{
							"type": "skill",
							"name": "Axe/Mace"
						},
						{
							"type": "skill",
							"name": "Flail",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Two-Handed Axe/Mace",
							"modifier": -3
						}
					]
				},
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "cut",
						"st": "sw",
						"base": "2"
					},
					"strength": "11",
					"usage": "Thrown",
					"accuracy": "2",
					"range": "x1/x1.5",
					"rate_of_fire": "1",
					"shots": "T(1)",
					"bulk": "-3",
					"calc": {
						"level": 0,
						"range": "x1/x1.5",
						"damage": "sw+2 cut"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Thrown Weapon",
							"specialization": "Axe/Mace"
						}
					]
				}
			],
			"calc": {
				"extended_value": "60",
				"extended_weight": "4 lb"
			},
			"categories": [
				"Melee Weapon",
				"Missile Weapon"
			]
		},
		{
			"type": "equipment",
			"id": "f4a38ef1-ef41-4a9e-bd30-54c7324fbbd9",
			"quantity": 1,
			"description": "Thrusting Bastard Sword",
			"tech_level": "3",
			"value": "750",
			"weight": "5 lb",
			"reference": "B271",
			"weapons": [
				{
					"type": "melee_weapon",
					"damage": {
						"type": "cut",
						"st": "sw",
						"base": "1"
					},
					"strength": "11",
					"usage": "Swung",
					"usage_notes": "1-handed",
					"reach": "1,2",
					"parry": "0U",
					"block": "No",
					"calc": {
						"level": 0,
						"parry": "0U",
						"block": "No",
						"damage": "sw+1 cut"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -5
						},
						{
							"type": "skill",
							"name": "Broadsword"
						},
						{
							"type": "skill",
							"name": "Force Sword",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Rapier",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Saber",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Shortsword",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Two-Handed Sword"
						},
						{
							"type": "skill",
							"name": "Sword!"
						}
					]
				},
				{
					"type": "melee_weapon",
					"damage": {
						"type": "imp",
						"st": "thr",
						"base": "2"
					},
					"strength": "11",
					"usage": "Thrust",
					"usage_notes": "1-handed",
					"reach": "2",
					"parry": "0U",
					"block": "No",
					"calc": {
						"level": 0,
						"parry": "0U",
						"block": "No",
						"damage": "thr+2 imp"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -5
						},
						{
							"type": "skill",
							"name": "Broadsword"
						},
						{
							"type": "skill",
							"name": "Force Sword",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Rapier",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Saber",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Shortsword",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Two-Handed Sword"
						},
						{
							"type": "skill",
							"name": "Sword!"
						}
					]
				},
				{
					"type": "melee_weapon",
					"damage": {
						"type": "cut",
						"st": "sw",
						"base": "2"
					},
					"strength": "10†",
					"usage": "Swung",
					"usage_notes": "2-handed",
					"reach": "1,2",
					"parry": "0",
					"block": "No",
					"calc": {
						"level": 0,
						"parry": "0",
						"block": "No",
						"damage": "sw+2 cut"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -5
						},
						{
							"type": "skill",
							"name": "Two-Handed Sword"
						},
						{
							"type": "skill",
							"name": "Broadsword",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Force Sword",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Sword!"
						}
					]
				},
				{
					"type": "melee_weapon",
					"damage": {
						"type": "imp",
						"st": "thr",
						"base": "3"
					},
					"strength": "10†",
					"usage": "Thrust",
					"usage_notes": "2-handed",
					"reach": "2",
					"parry": "0",
					"block": "No",
					"calc": {
						"level": 0,
						"parry": "0",
						"block": "No",
						"damage": "thr+3 imp"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -5
						},
						{
							"type": "skill",
							"name": "Two-Handed Sword"
						},
						{
							"type": "skill",
							"name": "Broadsword",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Force Sword",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Sword!"
						}
					]
				}
			],
			"calc": {
				"extended_value": "750",
				"extended_weight": "5 lb"
			},
			"categories": [
				"Melee Weapon"
			]
		},
		{
			"type": "equipment",
			"id": "73b03761-8c1a-40fe-93bc-b986e56f961c",
			"quantity": 1,
			"description": "Thrusting Broadsword",
			"tech_level": "2",
			"value": "600",
			"weight": "3 lb",
			"reference": "B271",
			"weapons": [
				{
					"type": "melee_weapon",
					"damage": {
						"type": "cut",
						"st": "sw",
						"base": "1"
					},
					"strength": "10",
					"usage": "Swung",
					"reach": "1",
					"parry": "0",
					"block": "No",
					"calc": {
						"level": 0,
						"parry": "0",
						"block": "No",
						"damage": "sw+1 cut"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -5
						},
						{
							"type": "skill",
							"name": "Force Sword",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Broadsword"
						},
						{
							"type": "skill",
							"name": "Rapier",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Saber",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Shortsword",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Two-Handed Sword",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Sword!"
						}
					]
				},
				{
					"type": "melee_weapon",
					"damage": {
						"type": "imp",
						"st": "thr",
						"base": "2"
					},
					"strength": "10",
					"usage": "Thrust",
					"reach": "1",
					"parry": "0",
					"block": "No",
					"calc": {
						"level": 0,
						"parry": "0",
						"block": "No",
						"damage": "thr+2 imp"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -5
						},
						{
							"type": "skill",
							"name": "Force Sword",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Broadsword"
						},
						{
							"type": "skill",
							"name": "Rapier",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Saber",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Shortsword",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Two-Handed Sword",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Sword!"
						}
					]
				}
			],
			"calc": {
				"extended_value": "600",
				"extended_weight": "3 lb"
			},
			"categories": [
				"Melee Weapon"
			]
		},
		{
			"type": "equipment",
			"id": "b63be021-454b-4694-87da-fe3bdc5f520a",
			"quantity": 1,
			"description": "Thrusting Greatsword",
			"tech_level": "3",
			"value": "900",
			"weight": "7 lb",
			"reference": "B274",
			"weapons": [
				{
					"type": "melee_weapon",
					"damage": {
						"type": "cut",
						"st": "sw",
						"base": "3"
					},
					"strength": "12†",
					"usage": "Swung",
					"reach": "1,2",
					"parry": "0",
					"block": "No",
					"calc": {
						"level": 0,
						"parry": "0",
						"block": "No",
						"damage": "sw+3 cut"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -5
						},
						{
							"type": "skill",
							"name": "Two-Handed Sword"
						},
						{
							"type": "skill",
							"name": "Broadsword",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Force Sword",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Sword!"
						}
					]
				},
				{
					"type": "melee_weapon",
					"damage": {
						"type": "imp",
						"st": "thr",
						"base": "3"
					},
					"strength": "12†",
					"usage": "Thrust",
					"reach": "2",
					"parry": "0",
					"block": "No",
					"calc": {
						"level": 0,
						"parry": "0",
						"block": "No",
						"damage": "thr+3 imp"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -5
						},
						{
							"type": "skill",
							"name": "Two-Handed Sword"
						},
						{
							"type": "skill",
							"name": "Broadsword",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Force Sword",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Sword!"
						}
					]
				}
			],
			"calc": {
				"extended_value": "900",
				"extended_weight": "7 lb"
			},
			"categories": [
				"Melee Weapon"
			]
		},
		{
			"type": "equipment",
			"id": "fbb501fa-6876-42b4-a656-573a6635047c",
			"quantity": 1,
			"description": "Torch",
			"tech_level": "0",
			"value": "3",
			"weight": "1 lb",
			"reference": "B288",
			"calc": {
				"extended_value": "3",
				"extended_weight": "1 lb"
			},
			"notes": "Burns for 1 hour",
			"categories": [
				"Camping and Survival Gear"
			]
		},
		{
			"type": "equipment",
			"id": "200b1679-4b33-4f28-aa09-b03aa43221ff",
			"quantity": 1,
			"description": "Transistor Radio",
			"tech_level": "7",
			"value": "15",
			"weight": "0.5 lb",
			"reference": "B288",
			"calc": {
				"extended_value": "15",
				"extended_weight": "0.5 lb"
			},
			"notes": "Receive-only; picks up radio stations. 8 hrs.",
			"categories": [
				"Communications and Information Gear"
			]
		},
		{
			"type": "equipment",
			"id": "c49e1583-1a89-4f92-a209-0607e438dbed",
			"quantity": 1,
			"description": "Traveler\'s Rations",
			"tech_level": "0",
			"value": "2",
			"weight": "0.5 lb",
			"reference": "B288",
			"calc": {
				"extended_value": "2",
				"extended_weight": "0.5 lb"
			},
			"notes": "One meal",
			"categories": [
				"Camping and Survival Gear"
			]
		},
		{
			"type": "equipment",
			"id": "68cb01e6-1d55-4a99-82a3-bbcf03efbe52",
			"quantity": 1,
			"description": "TV Set, Mini",
			"tech_level": "7",
			"value": "150",
			"weight": "3 lb",
			"reference": "B288",
			"calc": {
				"extended_value": "150",
				"extended_weight": "3 lb"
			},
			"notes": "5\\\" x 5\\\" flat-screen. 4 hrs.",
			"categories": [
				"Communications and Information Gear"
			]
		},
		{
			"type": "equipment",
			"id": "2c1ab893-ca79-4890-97fe-a386942f0d4e",
			"quantity": 1,
			"description": "Typewriter, Manual",
			"tech_level": "6",
			"value": "200",
			"weight": "10 lb",
			"reference": "B289",
			"calc": {
				"extended_value": "200",
				"extended_weight": "10 lb"
			},
			"categories": [
				"Communications and Information Gear"
			]
		},
		{
			"type": "equipment",
			"id": "14b9d115-2e3e-4c08-bce5-937fd243caca",
			"quantity": 1,
			"description": "Under-Barrel, 40mm",
			"tech_level": "7",
			"legality_class": "1",
			"value": "500",
			"weight": "3.5 lb",
			"reference": "B281",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "cr ex",
						"base": "4d",
						"armor_divisor": 10,
						"fragmentation": "2d",
						"fragmentation_type": "cut"
					},
					"strength": "11",
					"accuracy": "2",
					"range": "150/440",
					"rate_of_fire": "1",
					"shots": "1(3)",
					"bulk": "-",
					"recoil": "2",
					"calc": {
						"level": 0,
						"range": "150/440",
						"damage": "4d(10) cr ex [2d cut]"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Pistol",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Rifle",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Shotgun",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Light Machine Gun",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Submachine Gun",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Musket",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Grenade Launcher"
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Gyroc",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Light Anti-Armor Weapon",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Gun!"
						}
					]
				}
			],
			"calc": {
				"extended_value": "500",
				"extended_weight": "3.5 lb"
			},
			"categories": [
				"Missile Weapon"
			]
		},
		{
			"type": "equipment",
			"id": "8e211bee-dfb8-48b6-900b-e769946f2594",
			"quantity": 1,
			"description": "Vacc Suit",
			"tech_level": "9",
			"value": "10000",
			"weight": "25 lb",
			"reference": "B285",
			"calc": {
				"extended_value": "10000",
				"extended_weight": "25 lb"
			},
			"prereqs": {
				"type": "prereq_list",
				"all": true,
				"prereqs": [
					{
						"type": "skill_prereq",
						"has": true,
						"name": {
							"compare": "is",
							"qualifier": "vacc suit"
						}
					}
				]
			},
			"features": [
				{
					"type": "dr_bonus",
					"amount": 6,
					"location": "neck"
				},
				{
					"type": "dr_bonus",
					"amount": 6,
					"location": "torso"
				},
				{
					"type": "dr_bonus",
					"amount": 6,
					"location": "vitals"
				},
				{
					"type": "dr_bonus",
					"amount": 6,
					"location": "groin"
				},
				{
					"type": "dr_bonus",
					"amount": 6,
					"location": "arm"
				},
				{
					"type": "dr_bonus",
					"amount": 6,
					"location": "hand"
				},
				{
					"type": "dr_bonus",
					"amount": 6,
					"location": "leg"
				},
				{
					"type": "dr_bonus",
					"amount": 6,
					"location": "foot"
				}
			],
			"categories": [
				"Environment Suits"
			]
		},
		{
			"type": "equipment",
			"id": "bc5fe97d-0382-4f42-8120-d1d46cd38ab0",
			"quantity": 1,
			"description": "Vacc Suit",
			"tech_level": "10",
			"value": "10000",
			"weight": "25 lb",
			"reference": "B285",
			"calc": {
				"extended_value": "10000",
				"extended_weight": "25 lb"
			},
			"prereqs": {
				"type": "prereq_list",
				"all": true,
				"prereqs": [
					{
						"type": "skill_prereq",
						"has": true,
						"name": {
							"compare": "is",
							"qualifier": "vacc suit"
						}
					}
				]
			},
			"features": [
				{
					"type": "dr_bonus",
					"amount": 9,
					"location": "neck"
				},
				{
					"type": "dr_bonus",
					"amount": 9,
					"location": "torso"
				},
				{
					"type": "dr_bonus",
					"amount": 9,
					"location": "vitals"
				},
				{
					"type": "dr_bonus",
					"amount": 9,
					"location": "groin"
				},
				{
					"type": "dr_bonus",
					"amount": 9,
					"location": "arm"
				},
				{
					"type": "dr_bonus",
					"amount": 9,
					"location": "hand"
				},
				{
					"type": "dr_bonus",
					"amount": 9,
					"location": "leg"
				},
				{
					"type": "dr_bonus",
					"amount": 9,
					"location": "foot"
				}
			],
			"categories": [
				"Environment Suits"
			]
		},
		{
			"type": "equipment",
			"id": "abd6bfe3-488d-4407-9d08-e55cc62af5ab",
			"quantity": 1,
			"description": "Vacc Suit",
			"tech_level": "11",
			"value": "10000",
			"weight": "25 lb",
			"reference": "B285",
			"calc": {
				"extended_value": "10000",
				"extended_weight": "25 lb"
			},
			"prereqs": {
				"type": "prereq_list",
				"all": true,
				"prereqs": [
					{
						"type": "skill_prereq",
						"has": true,
						"name": {
							"compare": "is",
							"qualifier": "vacc suit"
						}
					}
				]
			},
			"features": [
				{
					"type": "dr_bonus",
					"amount": 12,
					"location": "neck"
				},
				{
					"type": "dr_bonus",
					"amount": 12,
					"location": "torso"
				},
				{
					"type": "dr_bonus",
					"amount": 12,
					"location": "vitals"
				},
				{
					"type": "dr_bonus",
					"amount": 12,
					"location": "groin"
				},
				{
					"type": "dr_bonus",
					"amount": 12,
					"location": "arm"
				},
				{
					"type": "dr_bonus",
					"amount": 12,
					"location": "hand"
				},
				{
					"type": "dr_bonus",
					"amount": 12,
					"location": "leg"
				},
				{
					"type": "dr_bonus",
					"amount": 12,
					"location": "foot"
				}
			],
			"categories": [
				"Environment Suits"
			]
		},
		{
			"type": "equipment",
			"id": "ac151a71-2759-450e-aed0-ccddafda6dcf",
			"quantity": 1,
			"description": "Vacc Suit Helmet",
			"tech_level": "9",
			"value": "2000",
			"weight": "5 lb",
			"reference": "B285",
			"calc": {
				"extended_value": "2000",
				"extended_weight": "5 lb"
			},
			"features": [
				{
					"type": "dr_bonus",
					"amount": 6,
					"location": "eye"
				},
				{
					"type": "dr_bonus",
					"amount": 6,
					"location": "skull"
				},
				{
					"type": "dr_bonus",
					"amount": 6,
					"location": "face"
				}
			],
			"categories": [
				"Environment Suits"
			]
		},
		{
			"type": "equipment",
			"id": "63f759ce-94db-4e12-aee3-286fca29f412",
			"quantity": 1,
			"description": "Vacc Suit Helmet",
			"tech_level": "10",
			"value": "2000",
			"weight": "5 lb",
			"reference": "B285",
			"calc": {
				"extended_value": "2000",
				"extended_weight": "5 lb"
			},
			"features": [
				{
					"type": "dr_bonus",
					"amount": 9,
					"location": "eye"
				},
				{
					"type": "dr_bonus",
					"amount": 9,
					"location": "skull"
				},
				{
					"type": "dr_bonus",
					"amount": 9,
					"location": "face"
				}
			],
			"categories": [
				"Environment Suits"
			]
		},
		{
			"type": "equipment",
			"id": "9a148969-8912-4d9b-9039-ef086faf2025",
			"quantity": 1,
			"description": "Vacc Suit Helmet",
			"tech_level": "11",
			"value": "2000",
			"weight": "5 lb",
			"reference": "B285",
			"calc": {
				"extended_value": "2000",
				"extended_weight": "5 lb"
			},
			"features": [
				{
					"type": "dr_bonus",
					"amount": 12,
					"location": "eye"
				},
				{
					"type": "dr_bonus",
					"amount": 12,
					"location": "skull"
				},
				{
					"type": "dr_bonus",
					"amount": 12,
					"location": "face"
				}
			],
			"categories": [
				"Environment Suits"
			]
		},
		{
			"type": "equipment",
			"id": "6174624a-0514-44d8-8336-c7f8c217a515",
			"quantity": 1,
			"description": "War Saddle",
			"tech_level": "3",
			"value": "250",
			"weight": "35 lb",
			"reference": "B289",
			"calc": {
				"extended_value": "250",
				"extended_weight": "35 lb"
			},
			"notes": "+1 to Riding skill to stay seated, 50% chance user will stay seated even if unconscious. With stirrups",
			"categories": [
				"Equestrian Gear"
			]
		},
		{
			"type": "equipment",
			"id": "a4b6ad6a-ea60-4508-bacd-895fe116aa81",
			"quantity": 1,
			"description": "Warhammer",
			"tech_level": "3",
			"value": "100",
			"weight": "7 lb",
			"reference": "B274",
			"weapons": [
				{
					"type": "melee_weapon",
					"damage": {
						"type": "imp",
						"st": "sw",
						"base": "3"
					},
					"strength": "12‡",
					"usage": "Swung",
					"reach": "1,2*",
					"parry": "0U",
					"block": "No",
					"calc": {
						"level": 0,
						"parry": "0U",
						"block": "No",
						"damage": "sw+3 imp"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -5
						},
						{
							"type": "skill",
							"name": "Two-Handed Axe/Mace"
						},
						{
							"type": "skill",
							"name": "Axe/Mace",
							"modifier": -3
						},
						{
							"type": "skill",
							"name": "Polearm",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Two-Handed Flail",
							"modifier": -4
						}
					]
				}
			],
			"calc": {
				"extended_value": "100",
				"extended_weight": "7 lb"
			},
			"notes": "May get stuck",
			"categories": [
				"Melee Weapon"
			]
		},
		{
			"type": "equipment",
			"id": "6d771726-f370-43fb-bda9-3f2372c495d0",
			"quantity": 1,
			"description": "Water Purification Tablets",
			"tech_level": "6",
			"value": "5",
			"weight": "0.1 lb",
			"reference": "B288",
			"calc": {
				"extended_value": "5",
				"extended_weight": "0.1 lb"
			},
			"notes": "Bottle of 50; Purifies 1 quart each",
			"categories": [
				"Camping and Survival Gear"
			]
		},
		{
			"type": "equipment",
			"id": "f5416bbd-7d4e-4a7d-82ac-a961f3508eb8",
			"quantity": 1,
			"description": "Wax Tablet",
			"tech_level": "1",
			"value": "10",
			"weight": "2 lb",
			"reference": "B289",
			"calc": {
				"extended_value": "10",
				"extended_weight": "2 lb"
			},
			"notes": "For writing; erasable",
			"categories": [
				"Communications and Information Gear"
			]
		},
		{
			"type": "equipment_container",
			"id": "423d59c3-b95a-4555-ba1b-d59244d6d0c7",
			"description": "Web Gear",
			"tech_level": "6",
			"value": "50",
			"weight": "2 lb",
			"reference": "B289",
			"calc": {
				"extended_value": "50",
				"extended_weight": "2 lb"
			},
			"notes": "Belt and suspenders with puches and rings for gear",
			"categories": [
				"Weapon and Combat Accessories"
			],
			"open": true
		},
		{
			"type": "equipment",
			"id": "f5452607-358c-4096-a7e3-ba654123bff5",
			"quantity": 1,
			"description": "Wheel-Lock Pistol, .60",
			"tech_level": "4",
			"legality_class": "3",
			"value": "200",
			"weight": "3.25 lb",
			"reference": "B278",
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "pi+",
						"base": "1d+1"
					},
					"strength": "10",
					"accuracy": "1",
					"range": "75/400",
					"rate_of_fire": "1",
					"shots": "1(20)",
					"bulk": "-3",
					"recoil": "2",
					"calc": {
						"level": 0,
						"range": "75/400",
						"damage": "1d+1 pi+"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Pistol"
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Rifle",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Shotgun",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Light Machine Gun",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Submachine Gun",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Musket",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Grenade Launcher",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Gyroc",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Guns",
							"specialization": "Light Anti-Armor Weapon",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Gun!"
						}
					]
				}
			],
			"calc": {
				"extended_value": "200",
				"extended_weight": "3.25 lb"
			},
			"categories": [
				"Missile Weapon"
			]
		},
		{
			"type": "equipment_container",
			"id": "63ae8826-a0cd-4c63-b4ef-1444f07cfaef",
			"description": "Wheelbarrow",
			"tech_level": "2",
			"value": "60",
			"weight": "18 lb",
			"reference": "B289",
			"calc": {
				"extended_value": "60",
				"extended_weight": "18 lb"
			},
			"prereqs": {
				"type": "prereq_list",
				"all": true,
				"prereqs": [
					{
						"type": "contained_weight_prereq",
						"has": true,
						"qualifier": {
							"compare": "at_most",
							"qualifier": "350 lb"
						}
					}
				]
			},
			"notes": "Divide effective weight of load by 5a",
			"categories": [
				"Tools"
			],
			"open": true
		},
		{
			"type": "equipment",
			"id": "4fd9d855-cb1c-466e-ba87-0da53e757e8f",
			"quantity": 1,
			"description": "Whetstone",
			"tech_level": "1",
			"value": "5",
			"weight": "1 lb",
			"reference": "B289",
			"calc": {
				"extended_value": "5",
				"extended_weight": "1 lb"
			},
			"notes": "For sharpening tools and wapons",
			"categories": [
				"Tools"
			]
		},
		{
			"type": "equipment",
			"id": "b10b7a66-16b0-488b-924c-f75e50df7eb1",
			"quantity": 1,
			"description": "Whip, 1 yard long",
			"tech_level": "1",
			"value": "20",
			"weight": "2 lb",
			"reference": "B274",
			"weapons": [
				{
					"type": "melee_weapon",
					"damage": {
						"type": "cr",
						"st": "sw",
						"base": "-2",
						"armor_divisor": 0.5
					},
					"strength": "6",
					"reach": "1",
					"parry": "-2U",
					"block": "No",
					"calc": {
						"level": 0,
						"parry": "-2U",
						"block": "No",
						"damage": "sw-2(0.5) cr"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -5
						},
						{
							"type": "skill",
							"name": "Whip"
						},
						{
							"type": "skill",
							"name": "Kusari",
							"modifier": -3
						},
						{
							"type": "skill",
							"name": "Monowire Whip",
							"modifier": -3
						}
					]
				}
			],
			"calc": {
				"extended_value": "20",
				"extended_weight": "2 lb"
			},
			"categories": [
				"Melee Weapon"
			]
		},
		{
			"type": "equipment",
			"id": "2f73cd55-1dbe-46dd-bf45-222db67c0215",
			"quantity": 1,
			"description": "Whip, 2 yards long",
			"tech_level": "1",
			"value": "40",
			"weight": "4 lb",
			"reference": "B274",
			"weapons": [
				{
					"type": "melee_weapon",
					"damage": {
						"type": "cr",
						"st": "sw",
						"base": "-2",
						"armor_divisor": 0.5
					},
					"strength": "7",
					"reach": "1-2*",
					"parry": "-2U",
					"block": "No",
					"calc": {
						"level": 0,
						"parry": "-2U",
						"block": "No",
						"damage": "sw-2(0.5) cr"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -5
						},
						{
							"type": "skill",
							"name": "Whip"
						},
						{
							"type": "skill",
							"name": "Kusari",
							"modifier": -3
						},
						{
							"type": "skill",
							"name": "Monowire Whip",
							"modifier": -3
						}
					]
				}
			],
			"calc": {
				"extended_value": "40",
				"extended_weight": "4 lb"
			},
			"categories": [
				"Melee Weapon"
			]
		},
		{
			"type": "equipment",
			"id": "d870e8e8-caf2-4a31-bd2d-1606ff86ed6d",
			"quantity": 1,
			"description": "Whip, 3 yards long",
			"tech_level": "1",
			"value": "60",
			"weight": "6 lb",
			"reference": "B274",
			"weapons": [
				{
					"type": "melee_weapon",
					"damage": {
						"type": "cr",
						"st": "sw",
						"base": "-2",
						"armor_divisor": 0.5
					},
					"strength": "8",
					"reach": "1-3*",
					"parry": "-2U",
					"block": "No",
					"calc": {
						"level": 0,
						"parry": "-2U",
						"block": "No",
						"damage": "sw-2(0.5) cr"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -5
						},
						{
							"type": "skill",
							"name": "Whip"
						},
						{
							"type": "skill",
							"name": "Kusari",
							"modifier": -3
						},
						{
							"type": "skill",
							"name": "Monowire Whip",
							"modifier": -3
						}
					]
				}
			],
			"calc": {
				"extended_value": "60",
				"extended_weight": "6 lb"
			},
			"categories": [
				"Melee Weapon"
			]
		},
		{
			"type": "equipment",
			"id": "38d10487-7924-4890-810f-e4057ec2ed0b",
			"quantity": 1,
			"description": "Whip, 4 yards long",
			"tech_level": "1",
			"value": "80",
			"weight": "8 lb",
			"reference": "B274",
			"weapons": [
				{
					"type": "melee_weapon",
					"damage": {
						"type": "cr",
						"st": "sw",
						"base": "-2",
						"armor_divisor": 0.5
					},
					"strength": "9",
					"reach": "1-4*",
					"parry": "-2U",
					"block": "No",
					"calc": {
						"level": 0,
						"parry": "-2U",
						"block": "No",
						"damage": "sw-2(0.5) cr"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -5
						},
						{
							"type": "skill",
							"name": "Whip"
						},
						{
							"type": "skill",
							"name": "Kusari",
							"modifier": -3
						},
						{
							"type": "skill",
							"name": "Monowire Whip",
							"modifier": -3
						}
					]
				}
			],
			"calc": {
				"extended_value": "80",
				"extended_weight": "8 lb"
			},
			"categories": [
				"Melee Weapon"
			]
		},
		{
			"type": "equipment",
			"id": "6b3b2290-a7a2-4987-a7ab-172a93f0cb97",
			"quantity": 1,
			"description": "Whip, 5 yards long",
			"tech_level": "1",
			"value": "100",
			"weight": "10 lb",
			"reference": "B274",
			"weapons": [
				{
					"type": "melee_weapon",
					"damage": {
						"type": "cr",
						"st": "sw",
						"base": "-2",
						"armor_divisor": 0.5
					},
					"strength": "10",
					"reach": "1-5*",
					"parry": "-2U",
					"block": "No",
					"calc": {
						"level": 0,
						"parry": "-2U",
						"block": "No",
						"damage": "sw-2(0.5) cr"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -5
						},
						{
							"type": "skill",
							"name": "Whip"
						},
						{
							"type": "skill",
							"name": "Kusari",
							"modifier": -3
						},
						{
							"type": "skill",
							"name": "Monowire Whip",
							"modifier": -3
						}
					]
				}
			],
			"calc": {
				"extended_value": "100",
				"extended_weight": "10 lb"
			},
			"categories": [
				"Melee Weapon"
			]
		},
		{
			"type": "equipment",
			"id": "28f1e800-13c1-43ff-bbca-6978971c4432",
			"quantity": 1,
			"description": "Whip, 6 yards long",
			"tech_level": "1",
			"value": "120",
			"weight": "12 lb",
			"reference": "B274",
			"weapons": [
				{
					"type": "melee_weapon",
					"damage": {
						"type": "cr",
						"st": "sw",
						"base": "-2",
						"armor_divisor": 0.5
					},
					"strength": "11",
					"reach": "1-6*",
					"parry": "-2U",
					"block": "No",
					"calc": {
						"level": 0,
						"parry": "-2U",
						"block": "No",
						"damage": "sw-2(0.5) cr"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -5
						},
						{
							"type": "skill",
							"name": "Whip"
						},
						{
							"type": "skill",
							"name": "Kusari",
							"modifier": -3
						},
						{
							"type": "skill",
							"name": "Monowire Whip",
							"modifier": -3
						}
					]
				}
			],
			"calc": {
				"extended_value": "120",
				"extended_weight": "12 lb"
			},
			"categories": [
				"Melee Weapon"
			]
		},
		{
			"type": "equipment",
			"id": "00c0c8d9-5794-48e0-a9cf-dfbe14e40712",
			"quantity": 1,
			"description": "Whip, 7 yards long",
			"tech_level": "1",
			"value": "140",
			"weight": "14 lb",
			"reference": "B274",
			"weapons": [
				{
					"type": "melee_weapon",
					"damage": {
						"type": "cr",
						"st": "sw",
						"base": "-2",
						"armor_divisor": 0.5
					},
					"strength": "12",
					"reach": "1-7*",
					"parry": "-2U",
					"block": "No",
					"calc": {
						"level": 0,
						"parry": "-2U",
						"block": "No",
						"damage": "sw-2(0.5) cr"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -5
						},
						{
							"type": "skill",
							"name": "Whip"
						},
						{
							"type": "skill",
							"name": "Kusari",
							"modifier": -3
						},
						{
							"type": "skill",
							"name": "Monowire Whip",
							"modifier": -3
						}
					]
				}
			],
			"calc": {
				"extended_value": "140",
				"extended_weight": "14 lb"
			},
			"categories": [
				"Melee Weapon"
			]
		},
		{
			"type": "equipment_container",
			"id": "30557b3e-ac4d-4673-9925-2364e67f1a94",
			"description": "Wineskin",
			"tech_level": "0",
			"value": "10",
			"weight": "0.25 lb",
			"reference": "B288",
			"calc": {
				"extended_value": "10",
				"extended_weight": "0.25 lb"
			},
			"prereqs": {
				"type": "prereq_list",
				"all": true,
				"prereqs": [
					{
						"type": "contained_weight_prereq",
						"has": true,
						"qualifier": {
							"compare": "at_most",
							"qualifier": "8 lb"
						}
					}
				]
			},
			"categories": [
				"Camping and Survival Gear"
			],
			"open": true
		},
		{
			"type": "equipment",
			"id": "f0da8560-294d-46e4-aebb-98a966c8d7ab",
			"quantity": 1,
			"description": "Wooden Stake",
			"tech_level": "0",
			"value": "4",
			"weight": "0.5 lb",
			"reference": "B272",
			"weapons": [
				{
					"type": "melee_weapon",
					"damage": {
						"type": "imp",
						"st": "thr",
						"armor_divisor": 0.5
					},
					"strength": "5",
					"usage": "Thrust",
					"reach": "C",
					"parry": "-1",
					"block": "No",
					"calc": {
						"level": 0,
						"parry": "-1",
						"block": "No",
						"damage": "thr(0.5) imp"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Knife"
						},
						{
							"type": "skill",
							"name": "Force Sword",
							"modifier": -3
						},
						{
							"type": "skill",
							"name": "Main-Gauche",
							"modifier": -3
						},
						{
							"type": "skill",
							"name": "Shortsword",
							"modifier": -3
						},
						{
							"type": "skill",
							"name": "Sword!"
						}
					]
				},
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "imp",
						"st": "thr",
						"armor_divisor": 0.5
					},
					"strength": "5",
					"usage": "Thrown",
					"accuracy": "+0",
					"range": "x0.5/x1",
					"rate_of_fire": "1",
					"shots": "T(1)",
					"bulk": "-2",
					"calc": {
						"level": 0,
						"range": "x0.5/x1",
						"damage": "thr(0.5) imp"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -4
						},
						{
							"type": "skill",
							"name": "Thrown Weapon",
							"specialization": "Knife"
						}
					]
				}
			],
			"calc": {
				"extended_value": "4",
				"extended_weight": "0.5 lb"
			},
			"categories": [
				"Melee Weapon",
				"Missile Weapon"
			]
		},
		{
			"type": "equipment",
			"id": "b8dd0a30-b73f-42e0-88a4-5bead0098656",
			"quantity": 1,
			"description": "Wristwatch",
			"tech_level": "6",
			"value": "20",
			"weight": "0.075 lb",
			"reference": "B288",
			"calc": {
				"extended_value": "20",
				"extended_weight": "0.075 lb"
			},
			"categories": [
				"Camping and Survival Gear"
			]
		}
	]
}');

