insert into GCS (FolderId, Filename, Stuffs) values (
15,
'Advantages',
'{
	"type": "advantage_list",
	"version": 2,
	"id": "a4f148b7-60ec-4948-98ed-7adc3d998440",
	"rows": [
		{
			"type": "advantage",
			"id": "aa524785-968c-43c4-bd1a-94c1d2263b35",
			"name": "360° Vision",
			"physical": true,
			"exotic": true,
			"base_points": 25,
			"modifiers": [
				{
					"type": "modifier",
					"id": "49d8792f-35b1-4cf6-ba95-071c87b0bae6",
					"disabled": true,
					"name": "Easy to hit ",
					"reference": "B34",
					"cost_type": "percentage",
					"cost": -20,
					"affects": "total",
					"notes": "Others can target your eyes at -6"
				},
				{
					"type": "modifier",
					"id": "f7d427d0-1509-4a07-8896-bf7f40bbc808",
					"disabled": true,
					"name": "Panoptic 1",
					"reference": "P39",
					"cost_type": "percentage",
					"cost": 20,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "5002586b-ad58-459d-b542-bc5ba3766505",
					"disabled": true,
					"name": "Panoptic 2",
					"reference": "P39",
					"cost_type": "percentage",
					"cost": 60,
					"affects": "total"
				}
			],
			"reference": "B34,P39",
			"calc": {
				"points": 25
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "2f8a7457-2741-412f-82b3-6180433eeeec",
			"name": "@Mental Quirk@",
			"mental": true,
			"base_points": -1,
			"reference": "B162",
			"calc": {
				"points": -1
			},
			"categories": [
				"Quirk"
			]
		},
		{
			"type": "advantage",
			"id": "5e3e5c1a-9c2a-4c9f-b3b6-a5a6db91d7de",
			"name": "@Physical Quirk@",
			"physical": true,
			"base_points": -1,
			"reference": "B164",
			"calc": {
				"points": -1
			},
			"categories": [
				"Quirk"
			]
		},
		{
			"type": "advantage",
			"id": "25c2f293-248a-4c7b-8487-5cf5c77d572d",
			"name": "@Type@ Rank",
			"physical": true,
			"levels": "1",
			"points_per_level": 5,
			"modifiers": [
				{
					"type": "modifier",
					"id": "f2152f52-b337-4072-ab43-d66afcbc319e",
					"disabled": true,
					"name": "Replaces Status",
					"reference": "B29",
					"cost_type": "points",
					"cost": 5,
					"affects": "levels_only"
				},
				{
					"type": "modifier",
					"id": "42caab58-9f7b-4911-9ef0-a47a92e63801",
					"disabled": true,
					"name": "Courtesy",
					"reference": "B29",
					"cost_type": "points",
					"cost": -4,
					"affects": "levels_only"
				}
			],
			"reference": "B29",
			"calc": {
				"points": 5
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "5f10acf3-8205-4194-80ad-f76b63ef867d",
			"name": "Absent-Mindedness",
			"mental": true,
			"base_points": -15,
			"reference": "B122",
			"calc": {
				"points": -15
			},
			"features": [
				{
					"type": "conditional_modifier",
					"amount": -5,
					"situation": "to all IQ and IQ-based skill rolls, save those for the task you are currently concentrating on"
				}
			],
			"notes": "Once adrift in your own thoughts, you must roll against Perception-5 in order to notice any event short of personal physical injury",
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "b074474a-27f9-4d63-8f35-3be884ae5343",
			"name": "Absolute Direction",
			"mental": true,
			"physical": true,
			"base_points": 5,
			"modifiers": [
				{
					"type": "modifier",
					"id": "940c9da3-6966-4ea6-9974-517614d0606b",
					"disabled": true,
					"name": "Requires signal",
					"reference": "B34",
					"cost_type": "percentage",
					"cost": -20,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "12730389-6652-4df8-8b34-ad078b76e408",
					"disabled": true,
					"name": "3D Spatial Sense",
					"reference": "B34",
					"cost_type": "points",
					"cost": 5,
					"affects": "total",
					"features": [
						{
							"type": "skill_bonus",
							"amount": 1,
							"selection_type": "skills_with_name",
							"name": {
								"compare": "starts_with",
								"qualifier": "piloting"
							}
						},
						{
							"type": "skill_bonus",
							"amount": 2,
							"selection_type": "skills_with_name",
							"name": {
								"compare": "is",
								"qualifier": "aerobatics"
							}
						},
						{
							"type": "skill_bonus",
							"amount": 2,
							"selection_type": "skills_with_name",
							"name": {
								"compare": "is",
								"qualifier": "free fall"
							}
						},
						{
							"type": "skill_bonus",
							"amount": 2,
							"selection_type": "skills_with_name",
							"specialization": {
								"compare": "is",
								"qualifier": "hyperspace"
							},
							"name": {
								"compare": "is",
								"qualifier": "navigation"
							}
						},
						{
							"type": "skill_bonus",
							"amount": 2,
							"selection_type": "skills_with_name",
							"specialization": {
								"compare": "is",
								"qualifier": "space"
							},
							"name": {
								"compare": "is",
								"qualifier": "navigation"
							}
						}
					]
				}
			],
			"reference": "B34",
			"calc": {
				"points": 5
			},
			"features": [
				{
					"type": "skill_bonus",
					"amount": 3,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "body sense"
					}
				},
				{
					"type": "skill_bonus",
					"amount": 3,
					"selection_type": "skills_with_name",
					"specialization": {
						"compare": "is",
						"qualifier": "air"
					},
					"name": {
						"compare": "is",
						"qualifier": "navigation"
					}
				},
				{
					"type": "skill_bonus",
					"amount": 3,
					"selection_type": "skills_with_name",
					"specialization": {
						"compare": "is",
						"qualifier": "land"
					},
					"name": {
						"compare": "is",
						"qualifier": "navigation"
					}
				},
				{
					"type": "skill_bonus",
					"amount": 3,
					"selection_type": "skills_with_name",
					"specialization": {
						"compare": "is",
						"qualifier": "sea"
					},
					"name": {
						"compare": "is",
						"qualifier": "navigation"
					}
				}
			],
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "4c6e2770-48ae-433a-bdef-bfeb0ecabf98",
			"name": "Absolute Timing",
			"mental": true,
			"base_points": 2,
			"modifiers": [
				{
					"type": "modifier",
					"id": "e1830b10-082b-4286-aa34-c825edbdf81a",
					"disabled": true,
					"name": "Chronolocation",
					"cost_type": "points",
					"cost": 3,
					"affects": "total"
				}
			],
			"reference": "B35",
			"calc": {
				"points": 2
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "022696ab-7dca-44ed-b10d-14d6a4a8bec1",
			"name": "Acceleration Weakness",
			"physical": true,
			"base_points": -1,
			"reference": "B165",
			"calc": {
				"points": -1
			},
			"categories": [
				"Quirk"
			]
		},
		{
			"type": "advantage",
			"id": "575c2259-e845-4c57-b496-72850c68f623",
			"name": "Accessory (@Tool@)",
			"physical": true,
			"exotic": true,
			"base_points": 1,
			"reference": "B100",
			"calc": {
				"points": 1
			},
			"categories": [
				"Perk"
			]
		},
		{
			"type": "advantage",
			"id": "a47241c6-a068-43a9-b20a-5c9e597fe73a",
			"name": "Acrophobia (Heights)",
			"mental": true,
			"base_points": -10,
			"cr": 12,
			"cr_adj": "action_penalty",
			"reference": "B150",
			"calc": {
				"points": -10
			},
			"notes": "You may not voluntarily go more than 15 feet above ground, unless you are inside a building and away from windows. If there is some chance of an actual fall, self-control rolls are at -5.",
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "38e672e9-fe7a-4537-b955-268820fda6d6",
			"name": "Acute Hearing",
			"physical": true,
			"levels": "1",
			"points_per_level": 2,
			"reference": "B35",
			"calc": {
				"points": 2
			},
			"features": [
				{
					"type": "attribute_bonus",
					"amount": 1,
					"per_level": true,
					"attribute": "hearing"
				}
			],
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "0dd1dc69-72aa-4bec-a7a8-527e31a71bc1",
			"name": "Acute Sense (@Special Sense@)",
			"physical": true,
			"levels": "1",
			"points_per_level": 2,
			"reference": "B35",
			"calc": {
				"points": 2
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "2295ec18-75d8-4f4c-9274-c0164d2f6773",
			"name": "Acute Taste & Smell",
			"physical": true,
			"levels": "1",
			"points_per_level": 2,
			"reference": "B35",
			"calc": {
				"points": 2
			},
			"features": [
				{
					"type": "attribute_bonus",
					"amount": 1,
					"per_level": true,
					"attribute": "taste_smell"
				}
			],
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "9c56727d-81e9-415c-b531-f02efc6337de",
			"name": "Acute Touch",
			"physical": true,
			"levels": "1",
			"points_per_level": 2,
			"reference": "B35",
			"calc": {
				"points": 2
			},
			"features": [
				{
					"type": "attribute_bonus",
					"amount": 1,
					"per_level": true,
					"attribute": "touch"
				}
			],
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "d2e3a21e-af10-4dec-9854-cd5b81dbe179",
			"name": "Acute Vision",
			"physical": true,
			"levels": "1",
			"points_per_level": 2,
			"reference": "B35",
			"calc": {
				"points": 2
			},
			"features": [
				{
					"type": "attribute_bonus",
					"amount": 1,
					"per_level": true,
					"attribute": "vision"
				}
			],
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "11b0f87e-a312-42bd-b84b-758a1f732811",
			"name": "Addiction (@Substance@)",
			"mental": true,
			"physical": true,
			"modifiers": [
				{
					"type": "modifier",
					"id": "8c2a3142-a939-4004-ad5d-499ae6fa3566",
					"disabled": true,
					"name": "Cost: Cheap",
					"reference": "B122",
					"cost_type": "points",
					"cost": -5,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "8d31553a-eba7-4b1e-bb5d-95754c733ba6",
					"disabled": true,
					"name": "Cost: Expensive",
					"reference": "B122",
					"cost_type": "points",
					"cost": -10,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "b9d4f346-f139-475e-953f-f53d605bd61c",
					"disabled": true,
					"name": "Cost: Very Expensive",
					"reference": "B122",
					"cost_type": "points",
					"cost": -20,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "9d544143-e3b7-4eaa-8cdb-d6c856158971",
					"disabled": true,
					"name": "Effects: Hallucinogenic",
					"reference": "B122",
					"cost_type": "points",
					"cost": -10,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "0ef02da7-a1ec-4f5d-814a-c2770b79ead0",
					"disabled": true,
					"name": "Effects: Highly Addictive (-5 on withdrawal roll)",
					"reference": "B122",
					"cost_type": "points",
					"cost": -5,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "90ed43c8-dad6-4c78-bf22-cf13846b6489",
					"disabled": true,
					"name": "Effects: Incapacitating",
					"reference": "B122",
					"cost_type": "points",
					"cost": -10,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "bcf905ae-5148-48e8-8842-1b5b342a276d",
					"disabled": true,
					"name": "Effects: Totally Addictive (-10 on withdrawal roll)",
					"reference": "B122",
					"cost_type": "points",
					"cost": -10,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "7b7bbaee-545a-4860-bbf7-c5b1b4675ca1",
					"disabled": true,
					"name": "Illegal",
					"reference": "B122",
					"cost_type": "points",
					"cost": 0,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "4d21d742-337e-4ad6-b89e-4ee43576518c",
					"disabled": true,
					"name": "Legal",
					"reference": "B122",
					"cost_type": "points",
					"cost": 5,
					"affects": "total"
				}
			],
			"reference": "B122",
			"calc": {
				"points": 0
			},
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "0be9f06e-b877-436c-970c-f05da435ab65",
			"name": "Affliction",
			"physical": true,
			"exotic": true,
			"levels": "1",
			"points_per_level": 10,
			"modifiers": [
				{
					"type": "modifier",
					"id": "fb2bbe63-7b0c-47e0-a533-52ebdb265640",
					"disabled": true,
					"name": "Advantage; one point per level",
					"cost_type": "percentage",
					"cost": 10,
					"affects": "total",
					"levels": 1
				},
				{
					"type": "modifier",
					"id": "e4dea0ea-c86d-423b-8a0a-b3e1481171f3",
					"disabled": true,
					"name": "Atribute Penalty; -1 to ST or HT per level",
					"cost_type": "percentage",
					"cost": 5,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "49956660-30ef-48b9-b1ce-e2abdaa101ae",
					"disabled": true,
					"name": "Atribute Penalty; -1 to DX or IQ per level",
					"cost_type": "percentage",
					"cost": 10,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "e37fa2a4-d3d0-4085-88d9-14c4ac39b900",
					"disabled": true,
					"name": "Mortal Condition; Coma",
					"cost_type": "percentage",
					"cost": 250,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "1019fc06-aae9-440f-b9a6-4650d974c910",
					"disabled": true,
					"name": "Mortal Condition; Heart Attack",
					"cost_type": "percentage",
					"cost": 300,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "15c2556d-f943-4ec6-9968-d223f21ea263",
					"disabled": true,
					"name": "Disadvantage; one point per level",
					"cost_type": "percentage",
					"cost": 1,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "7be5192a-bb13-484d-a975-cc3a9a3c4583",
					"disabled": true,
					"name": "Incapacitating Condition; Daze",
					"cost_type": "percentage",
					"cost": 50,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "1c4994ac-ad21-423d-9349-27345244508e",
					"disabled": true,
					"name": "Incapacitating Condition; Hallucination",
					"cost_type": "percentage",
					"cost": 50,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "66de56e6-a515-4308-b619-ff9b3e715d9c",
					"disabled": true,
					"name": "Incapacitating Condition; Retching",
					"cost_type": "percentage",
					"cost": 50,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "19b80ea4-3ac2-4824-bc8d-4171dc30ea48",
					"disabled": true,
					"name": "Incapacitating Condition; Agony",
					"cost_type": "percentage",
					"cost": 100,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "0c56500c-f51f-42d5-aef9-48c8159bd14a",
					"disabled": true,
					"name": "Incapacitating Condition; Choking",
					"cost_type": "percentage",
					"cost": 100,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "f44536cd-a8ac-4371-8838-2c8eaf4f1d19",
					"disabled": true,
					"name": "Incapacitating Condition; Ecstasy",
					"cost_type": "percentage",
					"cost": 100,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "3b310279-5f60-4839-af06-17d2c595f098",
					"disabled": true,
					"name": "Incapacitating Condition; Seizure",
					"cost_type": "percentage",
					"cost": 100,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "76e23c90-0e9d-4875-804c-1020cf74cf2b",
					"disabled": true,
					"name": "Incapacitating Condition; Paralysis",
					"cost_type": "percentage",
					"cost": 150,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "400f0258-0e95-4bf4-9b95-68f0fc7bdfca",
					"disabled": true,
					"name": "Incapacitating Condition; Sleep",
					"cost_type": "percentage",
					"cost": 150,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "46158c59-7a07-40b8-ae7f-81b3792689e2",
					"disabled": true,
					"name": "Incapacitating Condition; Unconsciousness",
					"cost_type": "percentage",
					"cost": 200,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "a372b04a-e3aa-418b-a7a3-d49bf26403e6",
					"disabled": true,
					"name": "Irritating Condition; Tipsy",
					"cost_type": "percentage",
					"cost": 10,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "837ad5b8-520c-4af1-be78-860b7d1e0fbd",
					"disabled": true,
					"name": "Irritating Condition; Coughing",
					"cost_type": "percentage",
					"cost": 20,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "3981b459-1f22-4195-a5c7-4691ded548ba",
					"disabled": true,
					"name": "Irritating Condition; Drunk",
					"cost_type": "percentage",
					"cost": 20,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "f677e6ef-8a76-44ce-acf9-eb76d134d185",
					"disabled": true,
					"name": "Irritating Condition; Moderate Pain",
					"cost_type": "percentage",
					"cost": 20,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "e31fafa7-bfcf-4167-836b-421e0df3f905",
					"disabled": true,
					"name": "Irritating Condition; Euphoria",
					"cost_type": "percentage",
					"cost": 30,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "2110fad4-3e27-4ef7-bfa0-a61c4da83827",
					"disabled": true,
					"name": "Irritating Condition; Nauseated",
					"cost_type": "percentage",
					"cost": 30,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "5cbc540d-faf3-46d3-9b6f-72da32ed69b7",
					"disabled": true,
					"name": "Irritating Condition; Severe Pain",
					"cost_type": "percentage",
					"cost": 40,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "92cb7753-a6d9-4ca6-a600-35c9714be11b",
					"disabled": true,
					"name": "Irritating Condition; Terrible Pain",
					"cost_type": "percentage",
					"cost": 60,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "2a50ade7-439c-40a7-82c7-f602408d5647",
					"disabled": true,
					"name": "Negated Advantage; one point per level",
					"cost_type": "percentage",
					"cost": 1,
					"affects": "total",
					"levels": 1
				},
				{
					"type": "modifier",
					"id": "7c274539-82ce-4383-a5d0-e77489c389cc",
					"disabled": true,
					"name": "Stunning",
					"cost_type": "percentage",
					"cost": 10,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "2fb0867d-ce8b-4b93-80c0-93984958cedf",
					"disabled": true,
					"name": "Cumulative",
					"cost_type": "percentage",
					"cost": 400,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "660043b1-1b1e-4942-b23a-b8fa25b2d637",
					"disabled": true,
					"name": "Cancellation",
					"reference": "PSI13",
					"cost_type": "percentage",
					"cost": 10,
					"affects": "total"
				}
			],
			"reference": "B35,P39,PSI13",
			"calc": {
				"points": 10
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "71f9755b-9533-4c3c-8b34-7fedcca8d89c",
			"name": "Agoraphobia (Open Spaces)",
			"mental": true,
			"base_points": -10,
			"cr": 12,
			"cr_adj": "action_penalty",
			"reference": "B150",
			"calc": {
				"points": -10
			},
			"notes": "You are uncomfortable whenever you are outside, and actually become frightened when there are no walls within 50 feet.",
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "636f6575-dfa3-4c4f-b12e-0411c5f43c30",
			"name": "Aichmophobia/TL5- (Sharp Things)",
			"mental": true,
			"base_points": -15,
			"cr": 12,
			"cr_adj": "action_penalty",
			"reference": "B150",
			"calc": {
				"points": -15
			},
			"notes": "You are afraid of anything pointed. Swords, spears, knives, and needles all give you fits. Trying to use a sharp weapon, or being threatened with one, requires a self-control roll at -2.",
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "b9683d47-9443-4f84-8deb-ea95b418d3c6",
			"name": "Aichmophobia/TL6+ (Sharp Things)",
			"mental": true,
			"base_points": -10,
			"cr": 12,
			"cr_adj": "action_penalty",
			"reference": "B150",
			"calc": {
				"points": -10
			},
			"notes": "You are afraid of anything pointed. Swords, spears, knives, and needles all give you fits. Trying to use a sharp weapon, or being threatened with one, requires a self-control roll at -2.",
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "d3f937d8-f6d1-47d8-bb62-f3aaad0d6285",
			"name": "Ailurophobia (Cats)",
			"mental": true,
			"base_points": -5,
			"cr": 12,
			"cr_adj": "action_penalty",
			"reference": "B149",
			"calc": {
				"points": -5
			},
			"notes": "This includes all felines: lions, tigers, panthers, etc.",
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "7ada3a6c-f75a-4c6b-8b4c-3056a6a493ac",
			"name": "Alcohol Intolerance",
			"physical": true,
			"base_points": -1,
			"reference": "B165",
			"calc": {
				"points": -1
			},
			"features": [
				{
					"type": "conditional_modifier",
					"amount": -2,
					"situation": "on all HT rolls related to drinking"
				}
			],
			"categories": [
				"Quirk"
			]
		},
		{
			"type": "advantage",
			"id": "7be117c6-c65e-4ed0-a1b4-37007326708a",
			"name": "Alcohol Tolerance",
			"physical": true,
			"base_points": 1,
			"reference": "B100",
			"calc": {
				"points": 1
			},
			"features": [
				{
					"type": "conditional_modifier",
					"amount": 2,
					"situation": "on all HT rolls related to drinking"
				}
			],
			"categories": [
				"Perk"
			]
		},
		{
			"type": "advantage",
			"id": "129bddd6-e507-4b36-9d44-e23e72a54796",
			"name": "Alcoholism",
			"physical": true,
			"base_points": -15,
			"modifiers": [
				{
					"type": "modifier",
					"id": "5a04e358-3a50-47d7-ba70-9c169c2d736a",
					"disabled": true,
					"name": "Illegal",
					"reference": "B122",
					"cost_type": "points",
					"cost": -5,
					"affects": "total"
				}
			],
			"reference": "B122",
			"calc": {
				"points": -15
			},
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "b5be5c9e-af78-40a3-8f94-c061622c27d7",
			"name": "Ally (@Who@)",
			"social": true,
			"modifiers": [
				{
					"type": "modifier",
					"id": "c1eb750d-bdd1-4483-a293-892526735fad",
					"disabled": true,
					"name": "Point total",
					"reference": "B37",
					"cost_type": "points",
					"cost": 1,
					"affects": "total",
					"notes": "25% of your starting points"
				},
				{
					"type": "modifier",
					"id": "0b93dc24-8f30-4c58-8595-a5f2bd05173d",
					"disabled": true,
					"name": "Point total",
					"reference": "B37",
					"cost_type": "points",
					"cost": 2,
					"affects": "total",
					"notes": "50% of your starting points"
				},
				{
					"type": "modifier",
					"id": "469b4a79-c6cf-4f87-be4d-c39428a08d9b",
					"disabled": true,
					"name": "Point total",
					"reference": "B37",
					"cost_type": "points",
					"cost": 3,
					"affects": "total",
					"notes": "75% of your starting points"
				},
				{
					"type": "modifier",
					"id": "1c5fa2a8-39df-4651-a06b-21635ead97ca",
					"disabled": true,
					"name": "Point total",
					"reference": "B37",
					"cost_type": "points",
					"cost": 5,
					"affects": "total",
					"notes": "100% of your starting points"
				},
				{
					"type": "modifier",
					"id": "b9452cfa-cda2-4ce0-8531-7a6b9c33ddb9",
					"disabled": true,
					"name": "Point total",
					"reference": "B37",
					"cost_type": "points",
					"cost": 10,
					"affects": "total",
					"notes": "150% of your starting points"
				},
				{
					"type": "modifier",
					"id": "d2c39c4d-c98d-4266-8b8c-dcd6383e3a0a",
					"disabled": true,
					"name": "Appears constantly",
					"reference": "B36",
					"cost_type": "multiplier",
					"cost": 4,
					"notes": "No roll required"
				},
				{
					"type": "modifier",
					"id": "1f0b6315-dff4-473e-bdef-19346d578523",
					"disabled": true,
					"name": "Appears almost all the time",
					"reference": "B36",
					"cost_type": "multiplier",
					"cost": 3,
					"notes": "15-"
				},
				{
					"type": "modifier",
					"id": "558c0415-bdd8-4a47-bf06-09fd5e1d7e80",
					"disabled": true,
					"name": "Appears quite often",
					"reference": "B36",
					"cost_type": "multiplier",
					"cost": 2,
					"notes": "12-"
				},
				{
					"type": "modifier",
					"id": "be41be9a-9e87-47cf-bff3-755e3635a670",
					"disabled": true,
					"name": "Appears fairly often",
					"reference": "B36",
					"cost_type": "multiplier",
					"cost": 1,
					"notes": "9-"
				},
				{
					"type": "modifier",
					"id": "90ea2d51-49e6-484c-9cb3-461df7b7bd54",
					"disabled": true,
					"name": "Appears quite rarely",
					"reference": "B36",
					"cost_type": "multiplier",
					"cost": 0.5,
					"notes": "6-"
				},
				{
					"type": "modifier",
					"id": "9b920170-2506-4d12-b871-be1100043704",
					"disabled": true,
					"name": "Group of 6-10",
					"reference": "B37",
					"cost_type": "multiplier",
					"cost": 6
				},
				{
					"type": "modifier",
					"id": "d0e44bc7-5889-46ec-879f-3d9ba9a4e54f",
					"disabled": true,
					"name": "Group of 11-20",
					"reference": "B37",
					"cost_type": "multiplier",
					"cost": 8
				},
				{
					"type": "modifier",
					"id": "8fc8e24d-4b27-4e45-9b3a-5a6f64ada309",
					"disabled": true,
					"name": "Group of 21-50",
					"reference": "B37",
					"cost_type": "multiplier",
					"cost": 10
				},
				{
					"type": "modifier",
					"id": "1dedde55-e356-448c-961a-53dc73e8e58b",
					"disabled": true,
					"name": "Group of 51-100",
					"reference": "B37",
					"cost_type": "multiplier",
					"cost": 12
				},
				{
					"type": "modifier",
					"id": "a6fa2681-e601-4915-9e43-e357c1119e73",
					"disabled": true,
					"name": "Group of 101-1000",
					"reference": "B37",
					"cost_type": "multiplier",
					"cost": 18
				},
				{
					"type": "modifier",
					"id": "d176a29c-87f6-41b9-8d4e-10beb54d1822",
					"disabled": true,
					"name": "Group of 1001-10000",
					"reference": "B37",
					"cost_type": "multiplier",
					"cost": 24
				},
				{
					"type": "modifier",
					"id": "8584249f-64fa-4939-87eb-63382071fbf3",
					"disabled": true,
					"name": "Group of 10001-100000",
					"reference": "B37",
					"cost_type": "multiplier",
					"cost": 30
				},
				{
					"type": "modifier",
					"id": "7429f8b9-70f3-4fe7-8c48-a9d1b9c06e0a",
					"disabled": true,
					"name": "Group of 100001-1000000",
					"reference": "B37",
					"cost_type": "multiplier",
					"cost": 36
				},
				{
					"type": "modifier",
					"id": "1423dd75-af66-4dfb-bf98-39ebd775beb3",
					"disabled": true,
					"name": "Minion",
					"reference": "B38",
					"cost_type": "percentage",
					"cost": 50,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "6dc2adbd-08c7-4ef0-8614-22ec36071dbb",
					"disabled": true,
					"name": "Minion",
					"reference": "B38",
					"cost_type": "percentage",
					"cost": 0,
					"affects": "total",
					"notes": "IQ 0 or Slave Mentality"
				},
				{
					"type": "modifier",
					"id": "d8886838-7444-495b-aa11-02ac3ae23dd2",
					"disabled": true,
					"name": "Special Abilities",
					"reference": "B38",
					"cost_type": "percentage",
					"cost": 50,
					"affects": "total",
					"notes": "@Abilities@"
				},
				{
					"type": "modifier",
					"id": "d00c3a09-82c4-4569-81df-955e8e62ef34",
					"disabled": true,
					"name": "Summonable",
					"reference": "B38",
					"cost_type": "percentage",
					"cost": 100,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "d3be4428-f357-41d5-8bce-142240934518",
					"disabled": true,
					"name": "Sympathy",
					"reference": "B38",
					"cost_type": "percentage",
					"cost": -25,
					"affects": "total",
					"notes": "Death of one party reduces the other to 0 HP"
				},
				{
					"type": "modifier",
					"id": "036a0c85-d7af-4de9-af22-eea6cec5ed47",
					"disabled": true,
					"name": "Sympathy",
					"reference": "B38",
					"cost_type": "percentage",
					"cost": -5,
					"affects": "total",
					"notes": "Death of one party reduces the other to 0 HP and wounds affect ally but not you"
				},
				{
					"type": "modifier",
					"id": "f3001c31-1cbb-4f95-af86-c92a7755a044",
					"disabled": true,
					"name": "Sympathy",
					"reference": "B38",
					"cost_type": "percentage",
					"cost": -50,
					"affects": "total",
					"notes": "Death of one party kills the other"
				},
				{
					"type": "modifier",
					"id": "30df2a61-903a-4f3f-b7ce-6319dcc61e6a",
					"disabled": true,
					"name": "Sympathy",
					"reference": "B38",
					"cost_type": "percentage",
					"cost": -10,
					"affects": "total",
					"notes": "Death of one party kills the other and wounds affect ally but not you"
				},
				{
					"type": "modifier",
					"id": "2777d1e3-2b29-4c22-b543-d2553828e7e9",
					"disabled": true,
					"name": "Unwilling",
					"reference": "B38",
					"cost_type": "percentage",
					"cost": -50,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "689f0318-5bb4-45b8-bc81-74c14097fe68",
					"disabled": true,
					"name": "Favor",
					"reference": "B55",
					"cost_type": "multiplier",
					"cost": 0.2
				}
			],
			"reference": "B36,P41",
			"calc": {
				"points": 0
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "3a7d4158-d8a1-49ee-8e24-1039ef6d053f",
			"name": "Altered Time Rate",
			"physical": true,
			"exotic": true,
			"levels": "1",
			"points_per_level": 100,
			"modifiers": [
				{
					"type": "modifier",
					"id": "83b21f26-0b44-46ba-9ed1-f9ba5e894b93",
					"disabled": true,
					"name": "Super-Speed",
					"reference": "P42",
					"cost_type": "percentage",
					"cost": 20,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "ab7d7a11-5761-454c-83d0-6fb899ed2fe4",
					"disabled": true,
					"name": "Non-Combat Speed",
					"reference": "P42",
					"cost_type": "percentage",
					"cost": -60,
					"affects": "total"
				}
			],
			"reference": "B38,P41,MA42",
			"calc": {
				"points": 100
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "0cada0d4-a829-4c74-ad21-51ea713f1bd3",
			"name": "Alternate Form",
			"physical": true,
			"exotic": true,
			"base_points": 15,
			"modifiers": [
				{
					"type": "modifier",
					"id": "c1c44e83-3ed1-4bc0-b82f-fda332179650",
					"disabled": true,
					"name": "Cosmetic",
					"reference": "B84",
					"cost_type": "percentage",
					"cost": -50,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "44695e7e-edf2-41c2-a7a7-2fbbf21eb447",
					"disabled": true,
					"name": "Absorptive Change",
					"reference": "P75",
					"cost_type": "percentage",
					"cost": 5,
					"affects": "total",
					"levels": 1,
					"notes": "@Level of Absorptive Change. 1 None, 2, Light, 3, Medium, 4, Heavy, 5, Extra Heavy@"
				},
				{
					"type": "modifier",
					"id": "97308e27-18e1-4c68-8104-4098c26448a7",
					"disabled": true,
					"name": "Active Change",
					"reference": "P75",
					"cost_type": "percentage",
					"cost": 20,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "11645648-495b-4b39-912c-6d26f988a6fa",
					"disabled": true,
					"name": "Non-Reciprocal Damage",
					"reference": "P75",
					"cost_type": "percentage",
					"cost": 50,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "45ceba06-f5ae-495c-b9b2-96b7f2497751",
					"disabled": true,
					"name": "Once On, Stays On",
					"reference": "P75",
					"cost_type": "percentage",
					"cost": 50,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "bbea117c-d516-4e75-9e31-938be1279103",
					"disabled": true,
					"name": "Reciprocal Rest",
					"reference": "P75",
					"cost_type": "percentage",
					"cost": 30,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "96ab176f-cf69-4d13-b95f-25915798aa45",
					"disabled": true,
					"name": "Projected Form",
					"reference": "P75",
					"cost_type": "percentage",
					"cost": -50,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "9bfe7531-8c8f-4dc6-890b-5d0001a57e7a",
					"disabled": true,
					"name": "Takes Extra Time",
					"reference": "B115",
					"cost_type": "percentage",
					"cost": -10,
					"affects": "total",
					"levels": 1
				}
			],
			"reference": "B83",
			"calc": {
				"points": 15
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "95973344-cd66-4863-a0bb-b765f87e1100",
			"name": "Alternate Identity",
			"social": true,
			"base_points": 5,
			"modifiers": [
				{
					"type": "modifier",
					"id": "1bf094b0-5554-4090-bc9d-16e47afb8475",
					"disabled": true,
					"name": "Illegal",
					"cost_type": "points",
					"cost": 10,
					"affects": "total"
				}
			],
			"reference": "B39",
			"calc": {
				"points": 5
			},
			"notes": "@Identity@",
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "5dc66a7f-9895-4ee9-9e11-6c6dd00243f8",
			"name": "Ambidexterity",
			"physical": true,
			"base_points": 5,
			"reference": "B39",
			"calc": {
				"points": 5
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "768189d4-55ca-4b22-b9e4-bb0fdd1a6521",
			"name": "Amnesia (Partial)",
			"physical": true,
			"base_points": -10,
			"reference": "B123",
			"calc": {
				"points": -10
			},
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "2e3ad348-32ad-4dde-8b47-328c5a0122ce",
			"name": "Amnesia (Total)",
			"physical": true,
			"base_points": -25,
			"reference": "B123",
			"calc": {
				"points": -25
			},
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "003f1809-fb3f-48c6-b962-2c8177457f20",
			"name": "Amphibious",
			"physical": true,
			"exotic": true,
			"base_points": 10,
			"reference": "B40,P42",
			"calc": {
				"points": 10
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "2791d2f1-2f7a-4344-ba6f-6fc5e0f5f6b3",
			"name": "Animal Empathy",
			"mental": true,
			"base_points": 5,
			"modifiers": [
				{
					"type": "modifier",
					"id": "13ea22a2-2f11-4abb-87ad-4d3895a102ad",
					"disabled": true,
					"name": "Remote",
					"reference": "P48",
					"cost_type": "percentage",
					"cost": 50,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "b4758d45-4f13-4e8e-b88e-7bc884a82425",
					"disabled": true,
					"name": "Specialized",
					"reference": "B87",
					"cost_type": "percentage",
					"cost": -40,
					"affects": "total",
					"notes": "All aquatic animals"
				},
				{
					"type": "modifier",
					"id": "4e91bc03-4e47-4b36-a1a1-ce7a045f06ce",
					"disabled": true,
					"name": "Specialized",
					"reference": "B87",
					"cost_type": "percentage",
					"cost": -40,
					"affects": "total",
					"notes": "All land animals"
				},
				{
					"type": "modifier",
					"id": "7e994dfc-f800-4dda-8f17-6491254d0fd6",
					"disabled": true,
					"name": "Specialized",
					"reference": "B87",
					"cost_type": "percentage",
					"cost": -50,
					"affects": "total",
					"notes": "@One class: Mammals, Birds, etc.@"
				},
				{
					"type": "modifier",
					"id": "c4779572-f091-4862-898c-726b35c34f36",
					"disabled": true,
					"name": "Specialized",
					"reference": "B87",
					"cost_type": "percentage",
					"cost": -60,
					"affects": "total",
					"notes": "@One family: Felines, Parrots, etc.@"
				},
				{
					"type": "modifier",
					"id": "cc7ea23b-89a8-4a5f-be4a-dbfa9bcdd8ec",
					"disabled": true,
					"name": "Specialized",
					"reference": "B87",
					"cost_type": "percentage",
					"cost": -80,
					"affects": "total",
					"notes": "@One species: House Cats, Macaws, etc.@"
				}
			],
			"reference": "B40,P48",
			"calc": {
				"points": 5
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "6e92e57c-8049-44b4-b9b3-2d77a7d42a74",
			"name": "Appearance",
			"physical": true,
			"modifiers": [
				{
					"type": "modifier",
					"id": "db88e777-c246-49aa-87cc-8c1dbfef8cd0",
					"disabled": true,
					"name": "Attractive",
					"reference": "B21",
					"cost_type": "points",
					"cost": 4,
					"affects": "total",
					"features": [
						{
							"type": "reaction_bonus",
							"amount": 1,
							"situation": "from others"
						}
					]
				},
				{
					"type": "modifier",
					"id": "2fda71e1-13b5-4bed-8188-83946dbbb13b",
					"disabled": true,
					"name": "Average",
					"reference": "B21",
					"cost_type": "points",
					"cost": 0,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "59011a6b-7cd8-4a59-8a7b-af75aa057843",
					"disabled": true,
					"name": "Beautiful",
					"reference": "B21",
					"cost_type": "points",
					"cost": 12,
					"affects": "total",
					"features": [
						{
							"type": "reaction_bonus",
							"amount": 4,
							"situation": "from those attracted to members of your sex, +2 from everyone else"
						}
					]
				},
				{
					"type": "modifier",
					"id": "f2ef3d46-2535-466f-b85d-82d3a9a59937",
					"disabled": true,
					"name": "Beautiful (Androgynous)",
					"reference": "B21",
					"cost_type": "points",
					"cost": 12,
					"affects": "total",
					"features": [
						{
							"type": "reaction_bonus",
							"amount": 3,
							"situation": "from others"
						}
					]
				},
				{
					"type": "modifier",
					"id": "260c9611-0aad-407d-a8f2-cdeab7f8e022",
					"disabled": true,
					"name": "Beautiful (Impressive)",
					"reference": "B21",
					"cost_type": "points",
					"cost": 12,
					"affects": "total",
					"features": [
						{
							"type": "reaction_bonus",
							"amount": 3,
							"situation": "from others"
						}
					]
				},
				{
					"type": "modifier",
					"id": "1d6d3fc1-a874-42ee-a40a-ab72d7d653ff",
					"disabled": true,
					"name": "Handsome",
					"reference": "B21",
					"cost_type": "points",
					"cost": 12,
					"affects": "total",
					"features": [
						{
							"type": "reaction_bonus",
							"amount": 4,
							"situation": "from those attracted to members of your sex, +2 from everyone else"
						}
					]
				},
				{
					"type": "modifier",
					"id": "66b67232-40a9-49ce-a30c-a41aa79a86e8",
					"disabled": true,
					"name": "Handsome (Androgynous)",
					"reference": "B21",
					"cost_type": "points",
					"cost": 12,
					"affects": "total",
					"features": [
						{
							"type": "reaction_bonus",
							"amount": 3,
							"situation": "from others"
						}
					]
				},
				{
					"type": "modifier",
					"id": "5c3f10f5-fb42-44a7-9953-ce727ebc4c89",
					"disabled": true,
					"name": "Handsome (Impressive)",
					"reference": "B21",
					"cost_type": "points",
					"cost": 12,
					"affects": "total",
					"features": [
						{
							"type": "reaction_bonus",
							"amount": 3,
							"situation": "from others"
						}
					]
				},
				{
					"type": "modifier",
					"id": "cfef51b4-8526-47be-bb28-49c4e7db46b5",
					"disabled": true,
					"name": "Hideous",
					"reference": "B21",
					"cost_type": "points",
					"cost": -16,
					"affects": "total",
					"features": [
						{
							"type": "reaction_bonus",
							"amount": -4,
							"situation": "from others"
						}
					]
				},
				{
					"type": "modifier",
					"id": "67eda3d3-3b02-4324-b86a-cad4432e2092",
					"disabled": true,
					"name": "Horrific",
					"reference": "B21",
					"cost_type": "points",
					"cost": -24,
					"affects": "total",
					"features": [
						{
							"type": "reaction_bonus",
							"amount": -6,
							"situation": "from others"
						}
					]
				},
				{
					"type": "modifier",
					"id": "1d0d263d-39e6-4b05-96c9-bcab7c73917a",
					"disabled": true,
					"name": "Impressive",
					"reference": "B21",
					"cost_type": "points",
					"cost": 0,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "ea5ee8d3-92de-44f7-b869-97bbcb0a0446",
					"disabled": true,
					"name": "Monstrous",
					"reference": "B21",
					"cost_type": "points",
					"cost": -20,
					"affects": "total",
					"features": [
						{
							"type": "reaction_bonus",
							"amount": -5,
							"situation": "from others"
						}
					]
				},
				{
					"type": "modifier",
					"id": "bcec029e-a194-48dd-a4f3-d79852417ff1",
					"disabled": true,
					"name": "Off-the-Shelf Looks",
					"reference": "B21",
					"cost_type": "percentage",
					"cost": -50,
					"affects": "total",
					"notes": "Halves the usual reaction bonus - adjust manually"
				},
				{
					"type": "modifier",
					"id": "4e3e372b-d8bb-41c3-a675-1c37f39c0a06",
					"disabled": true,
					"name": "Transcendent",
					"reference": "B21",
					"cost_type": "points",
					"cost": 20,
					"affects": "total",
					"features": [
						{
							"type": "reaction_bonus",
							"amount": 8,
							"situation": "from those attracted to members of your sex, +2 from everyone else. Exception: Members of the same sex with reason to dislike you (more than -4 in reaction penalties regardless of bonuses) resent your good looks and react at -2 instead."
						}
					]
				},
				{
					"type": "modifier",
					"id": "2bb71c80-552e-499d-a4e6-e57f26881a8c",
					"disabled": true,
					"name": "Transcendent (Androgynous)",
					"reference": "B21",
					"cost_type": "points",
					"cost": 20,
					"affects": "total",
					"features": [
						{
							"type": "reaction_bonus",
							"amount": 5,
							"situation": "from others"
						}
					]
				},
				{
					"type": "modifier",
					"id": "ddf25679-e521-4ac2-b914-5b31d097cc09",
					"disabled": true,
					"name": "Transcendent (Impressive)",
					"reference": "B21",
					"cost_type": "points",
					"cost": 20,
					"affects": "total",
					"features": [
						{
							"type": "reaction_bonus",
							"amount": 5,
							"situation": "from others"
						}
					]
				},
				{
					"type": "modifier",
					"id": "52c66ff0-cb7b-4bd8-8d77-4e6f78fa6ce4",
					"disabled": true,
					"name": "Ugly",
					"reference": "B21",
					"cost_type": "points",
					"cost": -8,
					"affects": "total",
					"features": [
						{
							"type": "reaction_bonus",
							"amount": -2,
							"situation": "from others"
						}
					]
				},
				{
					"type": "modifier",
					"id": "f2ade180-af68-4cdb-91c2-2b6062b625b5",
					"disabled": true,
					"name": "Unattractive",
					"reference": "B21",
					"cost_type": "points",
					"cost": -4,
					"affects": "total",
					"features": [
						{
							"type": "reaction_bonus",
							"amount": -1,
							"situation": "from others"
						}
					]
				},
				{
					"type": "modifier",
					"id": "585340a8-301a-451e-918c-89fac91595d4",
					"disabled": true,
					"name": "Universal",
					"reference": "B21",
					"cost_type": "percentage",
					"cost": 25,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "e1bcea51-b24b-4e72-a625-be62b9161aaf",
					"disabled": true,
					"name": "Very Beautiful",
					"reference": "B21",
					"cost_type": "points",
					"cost": 16,
					"affects": "total",
					"features": [
						{
							"type": "reaction_bonus",
							"amount": 6,
							"situation": "from those attracted to members of your sex, +2 from everyone else. Exception: Members of the same sex with reason to dislike you (more than -4 in reaction penalties regardless of bonuses) resent your good looks and react at -2 instead."
						}
					]
				},
				{
					"type": "modifier",
					"id": "45fe1d7c-54ed-4171-ac37-0c14d3825e89",
					"disabled": true,
					"name": "Very Beautiful (Androgynous)",
					"reference": "B21",
					"cost_type": "points",
					"cost": 16,
					"affects": "total",
					"features": [
						{
							"type": "reaction_bonus",
							"amount": 4,
							"situation": "from others"
						}
					]
				},
				{
					"type": "modifier",
					"id": "211f4936-94c1-4043-862b-d73a066832ac",
					"disabled": true,
					"name": "Very Beautiful (Impressive)",
					"reference": "B21",
					"cost_type": "points",
					"cost": 16,
					"affects": "total",
					"features": [
						{
							"type": "reaction_bonus",
							"amount": 4,
							"situation": "from others"
						}
					]
				},
				{
					"type": "modifier",
					"id": "8c0bc9b1-f818-427e-838e-9cb3f1125587",
					"disabled": true,
					"name": "Very Handsome",
					"reference": "B21",
					"cost_type": "points",
					"cost": 16,
					"affects": "total",
					"features": [
						{
							"type": "reaction_bonus",
							"amount": 6,
							"situation": "from those attracted to members of your sex, +2 from everyone else. Exception: Members of the same sex with reason to dislike you (more than -4 in reaction penalties regardless of bonuses) resent your good looks and react at -2 instead."
						}
					]
				},
				{
					"type": "modifier",
					"id": "1cf4494d-453a-403d-890b-7233286080e7",
					"disabled": true,
					"name": "Very Handsome (Androgynous)",
					"reference": "B21",
					"cost_type": "points",
					"cost": 16,
					"affects": "total",
					"features": [
						{
							"type": "reaction_bonus",
							"amount": 4,
							"situation": "from others"
						}
					]
				},
				{
					"type": "modifier",
					"id": "19314e0f-05c4-4488-adf0-ba1785d46b23",
					"disabled": true,
					"name": "Very Handsome (Impressive)",
					"reference": "B21",
					"cost_type": "points",
					"cost": 16,
					"affects": "total",
					"features": [
						{
							"type": "reaction_bonus",
							"amount": 4,
							"situation": "from others"
						}
					]
				}
			],
			"reference": "B21",
			"calc": {
				"points": 0
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "62e9cef9-31c9-4eb0-81ad-bd9fa95c37da",
			"name": "Arachnophobia (Spiders)",
			"mental": true,
			"base_points": -5,
			"cr": 12,
			"cr_adj": "action_penalty",
			"reference": "B150",
			"calc": {
				"points": -5
			},
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "11d11e31-a390-4f12-9c1f-6d353847d2b7",
			"name": "Arm DX",
			"physical": true,
			"levels": "1",
			"points_per_level": 16,
			"modifiers": [
				{
					"type": "modifier",
					"id": "40e4e9d1-3dcf-4caa-8881-f30f423a50b1",
					"disabled": true,
					"name": "Only one arm",
					"reference": "B40",
					"cost_type": "points",
					"cost": -4,
					"affects": "levels_only",
					"notes": "@Which@"
				},
				{
					"type": "modifier",
					"id": "659e3180-486a-459f-b9f6-2357556370a8",
					"disabled": true,
					"name": "No fine manipulators",
					"reference": "B145",
					"cost_type": "percentage",
					"cost": -40,
					"affects": "total"
				}
			],
			"reference": "B40",
			"calc": {
				"points": 16
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "45d282f6-7671-459b-8e87-97d8df4736b9",
			"name": "Arm ST",
			"physical": true,
			"levels": "1",
			"points_per_level": 5,
			"modifiers": [
				{
					"type": "modifier",
					"id": "72b97686-cb9a-4eee-9dfd-4df41b60674c",
					"disabled": true,
					"name": "No fine manipulators",
					"reference": "B145",
					"cost_type": "percentage",
					"cost": -40,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "36e05989-7f56-433f-871c-e9516ae1aa8c",
					"disabled": true,
					"name": "Only one arm",
					"reference": "B40",
					"cost_type": "points",
					"cost": -2,
					"affects": "levels_only",
					"notes": "@Which@"
				},
				{
					"type": "modifier",
					"id": "e77c3cf3-d2c5-4268-84e7-176445e63593",
					"disabled": true,
					"name": "Three arms",
					"reference": "B40",
					"cost_type": "points",
					"cost": 3,
					"affects": "levels_only"
				},
				{
					"type": "modifier",
					"id": "adb7bdf6-f0d3-494f-a1da-977efad5eb71",
					"disabled": true,
					"name": "Size",
					"cost_type": "percentage",
					"cost": -10,
					"affects": "total",
					"levels": 1
				}
			],
			"reference": "B40",
			"calc": {
				"points": 5
			},
			"notes": "Only applies to efforts to lift, throw, or attack with those arms or hands. If a task requires multiple hands and they don\'t have the same ST, use the average ST.",
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "eb77d866-160f-4fea-8fc5-42bdadb620e7",
			"name": "Attentive",
			"mental": true,
			"base_points": -1,
			"reference": "B163",
			"calc": {
				"points": -1
			},
			"features": [
				{
					"type": "conditional_modifier",
					"amount": 1,
					"situation": "to skill rolls when working on lengthy tasks, but -3 to notice any important interruption"
				}
			],
			"categories": [
				"Quirk"
			]
		},
		{
			"type": "advantage",
			"id": "c95bf369-12ff-4013-852d-81925f29e6ae",
			"name": "Autophobia (Being Alone)",
			"mental": true,
			"base_points": -15,
			"cr": 12,
			"cr_adj": "action_penalty",
			"reference": "B149",
			"calc": {
				"points": -15
			},
			"notes": "You cannot stand to be alone, and do anything in your power to avoid it.",
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "874b559f-1af2-424e-9150-f6343d73be7f",
			"name": "Autotrance",
			"mental": true,
			"base_points": 1,
			"reference": "B101",
			"calc": {
				"points": 1
			},
			"categories": [
				"Perk"
			]
		},
		{
			"type": "advantage",
			"id": "71c70fd8-6917-4038-8131-7c7370ecdbbe",
			"name": "Bad Back",
			"physical": true,
			"base_points": -15,
			"modifiers": [
				{
					"type": "modifier",
					"id": "42d07232-2402-4a80-909e-47679015ba3a",
					"disabled": true,
					"name": "Severe",
					"reference": "B123",
					"cost_type": "points",
					"cost": -10,
					"affects": "total",
					"notes": "The HT roll is at -2"
				}
			],
			"reference": "B123",
			"calc": {
				"points": -15
			},
			"notes": "Throw out your back whenever you make a ST roll, and whenever you roll 17 or 18 on an attack or defense roll in melee combat, or on a roll for an “athletic” skill such as Acrobatics, make a HT roll as well",
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "a5f01483-a108-44c8-a697-6993d25bb5c7",
			"name": "Bad Grip",
			"physical": true,
			"levels": "1",
			"points_per_level": -5,
			"reference": "B123",
			"calc": {
				"points": -5
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
							"qualifier": "no fine manipulators"
						}
					}
				]
			},
			"features": [
				{
					"type": "conditional_modifier",
					"amount": -2,
					"per_level": true,
					"situation": "to tasks that require a firm grip (max 3 levels)"
				}
			],
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "227d7609-ce56-4314-8c6a-9d5cb8863e9b",
			"name": "Bad Sight (Farsighted)",
			"physical": true,
			"base_points": -25,
			"modifiers": [
				{
					"type": "modifier",
					"id": "5f9a7d75-de73-40c4-bbc9-f8f6a058a9ba",
					"disabled": true,
					"name": "Mitigator",
					"cost_type": "percentage",
					"cost": -60,
					"affects": "total",
					"notes": "Glasses"
				}
			],
			"reference": "B123",
			"calc": {
				"points": -25
			},
			"features": [
				{
					"type": "conditional_modifier",
					"amount": -6,
					"situation": "to Vision rolls to spot items within 1 yd"
				},
				{
					"type": "conditional_modifier",
					"amount": -3,
					"situation": "to DX for any close manual task, including close combat"
				}
			],
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "e8a65836-d72c-452f-a8d4-fdb7d68aa745",
			"name": "Bad Sight (Nearsighted)",
			"physical": true,
			"base_points": -25,
			"modifiers": [
				{
					"type": "modifier",
					"id": "bcf5ee4d-8f70-41e5-81ee-9f4a2956f9c3",
					"disabled": true,
					"name": "Mitigator",
					"cost_type": "percentage",
					"cost": -60,
					"affects": "total",
					"notes": "Glasses"
				}
			],
			"reference": "B123",
			"calc": {
				"points": -25
			},
			"features": [
				{
					"type": "conditional_modifier",
					"amount": -6,
					"situation": "to Vision rolls to spot items more than 1 yd away"
				},
				{
					"type": "conditional_modifier",
					"amount": -2,
					"situation": "to all melee attacks"
				}
			],
			"notes": "Double actual distance to the target when calculating the range modifier for ranged attacks",
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "b496ea1c-9e05-4609-8092-76a896f5ef37",
			"name": "Bad Smell",
			"physical": true,
			"base_points": -10,
			"reference": "B124",
			"calc": {
				"points": -10
			},
			"features": [
				{
					"type": "reaction_bonus",
					"amount": -2,
					"situation": "from most people and animals (although pests or carrion-eating scavengers might be attracted to you!)"
				}
			],
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "eccfc218-dec2-47ab-98e1-d39e75e5b519",
			"name": "Bad Temper",
			"mental": true,
			"base_points": -10,
			"cr": 12,
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
			"id": "6faaf511-d782-4997-a535-b7469dfd35bd",
			"name": "Berserk",
			"mental": true,
			"base_points": -10,
			"cr": 12,
			"modifiers": [
				{
					"type": "modifier",
					"id": "1760bea2-00ee-41fa-af42-452dbb538251",
					"disabled": true,
					"name": "Battle Rage",
					"cost_type": "percentage",
					"cost": 50,
					"affects": "total"
				}
			],
			"reference": "B124",
			"calc": {
				"points": -10
			},
			"notes": "Make a self-control roll any time you suffer damage over 1/4 your HP in the space of one second, and whenever you witness equivalent harm to a loved one",
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "fa8dc745-e31b-404f-af4b-e68d548542e3",
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
			"id": "935b6760-b508-4de2-a8b8-9da71d47cc7a",
			"name": "Binding",
			"physical": true,
			"exotic": true,
			"levels": "1",
			"points_per_level": 2,
			"modifiers": [
				{
					"type": "modifier",
					"id": "013cd6ca-bf61-47f4-b896-7e797e7cf4e1",
					"disabled": true,
					"name": "Engulfing",
					"reference": "B40",
					"cost_type": "percentage",
					"cost": 60,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "245c6cd5-a6be-467b-9e18-fc196982f531",
					"disabled": true,
					"name": "Only Damaged by @Burning/Corrosion/Cutting/Crushing@",
					"reference": "B40",
					"cost_type": "percentage",
					"cost": 30,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "feff8222-53e6-431e-b946-0d13bdf135e4",
					"disabled": true,
					"name": "Only Damaged by @1. Choose one from Burning/Corrosion/Cutting/Crushing@ or @2. Choose one from Burning/Corrosion/Cutting/Crushing@",
					"reference": "B40",
					"cost_type": "percentage",
					"cost": 20,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "877b5159-04fd-4eb7-a0b3-6bd4e7f5dbfc",
					"disabled": true,
					"name": "Only Damaged by @1. Choose one from Burning/Corrosion/Cutting/Crushing@, @2. Choose one from Burning/Corrosion/Cutting/Crushing@ or @3. Choose one from Burning/Corrosion/Cutting/Crushing@",
					"reference": "B40",
					"cost_type": "percentage",
					"cost": 10,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "1a95d878-1843-491c-af6b-ac99226c01c2",
					"disabled": true,
					"name": "Sticky",
					"reference": "B40",
					"cost_type": "percentage",
					"cost": 20,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "5cd53657-d2b7-4d49-b5be-e9d5efeedc4a",
					"disabled": true,
					"name": "Unbreakable",
					"reference": "B40",
					"cost_type": "percentage",
					"cost": 40,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "301d843f-3824-4ae7-acbc-2a1ab8247a9a",
					"disabled": true,
					"name": "One Shot",
					"reference": "B40",
					"cost_type": "percentage",
					"cost": -10,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "aca140a4-3b30-4354-aacb-529aa91497ed",
					"disabled": true,
					"name": "Super-Binding",
					"reference": "SU25",
					"cost_type": "percentage",
					"cost": 400,
					"affects": "total"
				}
			],
			"reference": "B40,P42",
			"calc": {
				"points": 2
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "914296e1-facd-4368-817d-8bc082cd678e",
			"name": "Blessed",
			"mental": true,
			"supernatural": true,
			"base_points": 10,
			"reference": "B40,P43",
			"calc": {
				"points": 10
			},
			"features": [
				{
					"type": "reaction_bonus",
					"amount": 1,
					"situation": "from followers of your deity"
				}
			],
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "dc3c1927-01c0-444b-bef9-63253e4328c0",
			"name": "Blindness",
			"physical": true,
			"base_points": -50,
			"reference": "B124",
			"calc": {
				"points": -50
			},
			"features": [
				{
					"type": "skill_bonus",
					"amount": -6,
					"selection_type": "skills_with_name",
					"category": {
						"compare": "contains",
						"qualifier": "combat"
					}
				}
			],
			"notes": "Cannot target hit locations",
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "bc9fe5de-5ea0-4b35-85b1-30fe4c51e3ed",
			"name": "Bloodlust",
			"mental": true,
			"base_points": -10,
			"cr": 12,
			"reference": "B125",
			"calc": {
				"points": -10
			},
			"notes": "You must make a self-control roll whenever you need to accept a surrender, evade a sentry, take a prisoner, etc.",
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "ba57553b-2696-4dba-b584-5fa06a0f3c51",
			"name": "Blunt Claws",
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
						"level": 0,
						"parry": "0",
						"block": "No",
						"damage": "thr-1 (+1 per die) cr"
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
						"level": 0,
						"parry": "No",
						"block": "No",
						"damage": "thr (+1 per die) cr"
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
			"reference": "B42,MA42",
			"calc": {
				"points": 3
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "0d1735a1-4157-43dc-90b4-de6ef99b8083",
			"name": "Bowlegged",
			"physical": true,
			"base_points": -1,
			"reference": "B165",
			"calc": {
				"points": -1
			},
			"features": [
				{
					"type": "skill_bonus",
					"amount": -1,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "Jumping"
					}
				},
				{
					"type": "reaction_bonus",
					"amount": -1,
					"situation": "from those who think Bowlegged looks funny"
				}
			],
			"categories": [
				"Quirk"
			]
		},
		{
			"type": "advantage",
			"id": "263aed25-4fe6-4eb9-8112-b8b49c30d21f",
			"name": "Brachiator",
			"physical": true,
			"exotic": true,
			"base_points": 5,
			"reference": "B41",
			"calc": {
				"points": 5
			},
			"features": [
				{
					"type": "skill_bonus",
					"amount": 2,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "climbing"
					}
				}
			],
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "654ea79a-24fa-455f-acac-a2475d0417f6",
			"name": "Breath-Holding",
			"physical": true,
			"exotic": true,
			"levels": "1",
			"points_per_level": 2,
			"reference": "B41",
			"calc": {
				"points": 2
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "d125979e-78da-40db-9f8f-6223b9b56cd2",
			"name": "Broad-Minded",
			"mental": true,
			"base_points": -1,
			"reference": "B163",
			"calc": {
				"points": -1
			},
			"categories": [
				"Quirk"
			]
		},
		{
			"type": "advantage",
			"id": "e7d50a59-49bb-4875-a369-a06d2f3fdd79",
			"name": "Brontophobia (Loud Noises)",
			"mental": true,
			"base_points": -10,
			"cr": 12,
			"cr_adj": "action_penalty",
			"reference": "B150",
			"calc": {
				"points": -10
			},
			"notes": "You avoid any situation where loud noises are likely. A sudden loud noise requires an immediate self-control roll. A thunderstorm is a traumatic experience for you!",
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "0cfc2588-8279-4f68-bc05-3d1a6a7bbf64",
			"name": "Bully",
			"mental": true,
			"base_points": -10,
			"cr": 12,
			"reference": "B125",
			"calc": {
				"points": -10
			},
			"features": [
				{
					"type": "reaction_bonus",
					"amount": -2,
					"situation": "from others"
				}
			],
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "c2bdc321-75fb-486f-98d9-2ba1ce038293",
			"name": "Callous",
			"mental": true,
			"base_points": -5,
			"reference": "B125",
			"calc": {
				"points": -5
			},
			"features": [
				{
					"type": "skill_bonus",
					"amount": -3,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "psychology"
					}
				},
				{
					"type": "skill_bonus",
					"amount": -3,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "teaching"
					}
				},
				{
					"type": "reaction_bonus",
					"amount": -1,
					"situation": "from past victims and anyone with Empathy"
				},
				{
					"type": "conditional_modifier",
					"amount": 1,
					"situation": "to Interrogation and Intimidation rolls when you use threats or torture"
				}
			],
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "39c6ef7a-c718-41e8-a2d6-f062cdc58f62",
			"name": "Cannot Float",
			"physical": true,
			"base_points": -1,
			"reference": "B165",
			"calc": {
				"points": -1
			},
			"categories": [
				"Quirk"
			]
		},
		{
			"type": "advantage",
			"id": "7ef4281a-e69a-4e41-9246-66887da008bd",
			"name": "Cannot Learn",
			"mental": true,
			"base_points": -30,
			"reference": "B125",
			"calc": {
				"points": -30
			},
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "faf68507-ab47-4bd4-b345-1dc341a8a891",
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
			"id": "0d0e38d4-437e-4c62-b193-6347e68083e4",
			"name": "Cannot Speak (Mute)",
			"physical": true,
			"base_points": -25,
			"reference": "B125",
			"calc": {
				"points": -25
			},
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "1572d938-504a-4a58-a034-f0cde837eb4e",
			"name": "Careful",
			"mental": true,
			"base_points": -1,
			"reference": "B163",
			"calc": {
				"points": -1
			},
			"categories": [
				"Quirk"
			]
		},
		{
			"type": "advantage",
			"id": "6d4a8c78-a431-4860-962b-c2713ba6ddc5",
			"name": "Catfall",
			"physical": true,
			"exotic": true,
			"base_points": 10,
			"modifiers": [
				{
					"type": "modifier",
					"id": "4f09c6de-6a88-4593-9e01-2441530cb0e6",
					"disabled": true,
					"name": "Feather Fall",
					"reference": "P43",
					"cost_type": "percentage",
					"cost": 20,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "d05208e4-b857-4e41-b7fa-3b7fa594ac68",
					"disabled": true,
					"name": "Parachute",
					"reference": "P43",
					"cost_type": "percentage",
					"cost": -30,
					"affects": "total"
				}
			],
			"reference": "B41,P43",
			"calc": {
				"points": 10
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "4fbcb45c-d58a-4cab-9fbf-cff3423c3c98",
			"name": "Chameleon",
			"physical": true,
			"exotic": true,
			"levels": "1",
			"points_per_level": 5,
			"modifiers": [
				{
					"type": "modifier",
					"id": "00059922-c93e-4c7e-a116-67b0748e7e9b",
					"disabled": true,
					"name": "Extended",
					"reference": "B41",
					"cost_type": "percentage",
					"cost": 0,
					"affects": "total",
					"notes": "@Sense@"
				},
				{
					"type": "modifier",
					"id": "45abbec3-81d7-4e37-a2e8-54f6b5006379",
					"disabled": true,
					"name": "Always On",
					"reference": "B41",
					"cost_type": "percentage",
					"cost": -10,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "4e939794-d937-4c17-9f2b-1049b58dd80f",
					"disabled": true,
					"name": "Controllable",
					"reference": "P43",
					"cost_type": "percentage",
					"cost": 20,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "3322a029-d9a2-4fcd-b414-82df0832319c",
					"disabled": true,
					"name": "Dynamic",
					"reference": "P43",
					"cost_type": "percentage",
					"cost": 40,
					"affects": "total"
				}
			],
			"reference": "B41,P43",
			"calc": {
				"points": 5
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "015fba89-655d-4595-8b3a-feda11a066eb",
			"name": "Channeling",
			"mental": true,
			"supernatural": true,
			"base_points": 10,
			"modifiers": [
				{
					"type": "modifier",
					"id": "edd19d8c-c1a5-4e0b-825e-68bdb2311e59",
					"disabled": true,
					"name": "Aware",
					"reference": "P43",
					"cost_type": "percentage",
					"cost": 50,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "f6d0fe32-74e8-40a7-9190-0175e4341e33",
					"disabled": true,
					"name": "Specialized",
					"reference": "P44",
					"cost_type": "percentage",
					"cost": -50,
					"affects": "total",
					"notes": "@Type@"
				}
			],
			"reference": "B41,P43",
			"calc": {
				"points": 10
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "8fdafaf5-5a2a-43f9-a3da-fd1570fd2823",
			"name": "Charisma",
			"mental": true,
			"levels": "1",
			"points_per_level": 5,
			"reference": "B41",
			"calc": {
				"points": 5
			},
			"features": [
				{
					"type": "skill_bonus",
					"amount": 1,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "fortune-telling"
					}
				},
				{
					"type": "skill_bonus",
					"amount": 1,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "leadership"
					}
				},
				{
					"type": "skill_bonus",
					"amount": 1,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "panhandling"
					}
				},
				{
					"type": "skill_bonus",
					"amount": 1,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "public speaking"
					}
				},
				{
					"type": "reaction_bonus",
					"amount": 1,
					"per_level": true,
					"situation": "from sapient being with whom you actively interact (converse, lecture, etc.)"
				},
				{
					"type": "reaction_bonus",
					"amount": 1,
					"per_level": true,
					"situation": "to Influence rolls"
				}
			],
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "024c8d37-55ac-49ba-bce2-65168846d5a3",
			"name": "Charitable",
			"mental": true,
			"base_points": -15,
			"cr": 12,
			"reference": "B125",
			"calc": {
				"points": -15
			},
			"notes": "Make a self-control roll in any situation where you could render aid or are specifically asked for help, but should resist the urge",
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "caed728e-66ff-4b42-87c8-3bedb3282fa1",
			"name": "Chauvinistic",
			"mental": true,
			"levels": "0",
			"base_points": -1,
			"reference": "B163",
			"calc": {
				"points": -1
			},
			"features": [
				{
					"type": "reaction_bonus",
					"amount": -1,
					"situation": "from individuals sensitive to criticism or insults that you interact with"
				}
			],
			"categories": [
				"Quirk"
			]
		},
		{
			"type": "advantage",
			"id": "2ae950d5-118d-4bb9-aab6-c163cc413217",
			"name": "Chronic Depression",
			"mental": true,
			"base_points": -15,
			"cr": 12,
			"reference": "B126",
			"calc": {
				"points": -15
			},
			"notes": "Make a self-control roll to do anything but acquire and consume the minimum necessities for survival, or whenever you must choose between two or more actions",
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "c86b08c8-6cd7-456c-9318-34445dd45fb2",
			"name": "Chronic Pain",
			"physical": true,
			"modifiers": [
				{
					"type": "modifier",
					"id": "d91248c9-1b15-4ca2-9086-a955b35f0671",
					"disabled": true,
					"name": "1 hour interval",
					"reference": "B126",
					"cost_type": "multiplier",
					"cost": 0.5
				},
				{
					"type": "modifier",
					"id": "90c10398-4a43-4c00-8a35-f3ad8a7d5587",
					"disabled": true,
					"name": "2 hour interval",
					"reference": "B126",
					"cost_type": "multiplier",
					"cost": 1
				},
				{
					"type": "modifier",
					"id": "4f0475ab-7585-41c2-bb6a-55697255ec06",
					"disabled": true,
					"name": "4 hour interval",
					"reference": "B126",
					"cost_type": "multiplier",
					"cost": 1.5
				},
				{
					"type": "modifier",
					"id": "52382709-62d2-4b29-acbb-981c544572cf",
					"disabled": true,
					"name": "8 hour interval",
					"reference": "B126",
					"cost_type": "multiplier",
					"cost": 2
				},
				{
					"type": "modifier",
					"id": "3306be3c-32b1-4a9d-a1d6-b5da48a27984",
					"disabled": true,
					"name": "FR: 6",
					"cost_type": "multiplier",
					"cost": 0.5
				},
				{
					"type": "modifier",
					"id": "6bacf261-4c9f-48f0-8bac-a997500f6a31",
					"disabled": true,
					"name": "FR: 9",
					"cost_type": "multiplier",
					"cost": 1
				},
				{
					"type": "modifier",
					"id": "f9b7d3ec-bd50-45f8-9bdc-0a22049c8b8c",
					"disabled": true,
					"name": "FR: 12",
					"cost_type": "multiplier",
					"cost": 2
				},
				{
					"type": "modifier",
					"id": "0705a2b4-722d-4e22-bf7f-b838faba0723",
					"disabled": true,
					"name": "FR: 15",
					"cost_type": "multiplier",
					"cost": 3
				},
				{
					"type": "modifier",
					"id": "6016fdac-c5ae-45b5-9885-09aac3c1c418",
					"disabled": true,
					"name": "Mild",
					"reference": "B126",
					"cost_type": "points",
					"cost": -5,
					"affects": "total",
					"notes": "-2 to DX, IQ, and self-control rolls"
				},
				{
					"type": "modifier",
					"id": "39db4b82-481e-48b3-a721-4818cb747661",
					"disabled": true,
					"name": "Severe",
					"reference": "B126",
					"cost_type": "points",
					"cost": -10,
					"affects": "total",
					"notes": "-4 to DX, IQ, and self-control rolls"
				},
				{
					"type": "modifier",
					"id": "137345ad-aaaa-44ca-9aa4-85521beb0839",
					"disabled": true,
					"name": "Agonizing",
					"reference": "B126",
					"cost_type": "points",
					"cost": -15,
					"affects": "total",
					"notes": "-6 to DX, IQ, and self-control rolls"
				}
			],
			"reference": "B126",
			"calc": {
				"points": 0
			},
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "476070e9-31ae-4a3b-b6c6-0ea0a4d92547",
			"name": "Chummy",
			"mental": true,
			"base_points": -5,
			"reference": "B126",
			"calc": {
				"points": -5
			},
			"features": [
				{
					"type": "reaction_bonus",
					"amount": 2,
					"situation": "to others"
				},
				{
					"type": "conditional_modifier",
					"amount": -1,
					"situation": "to IQ-based skills when alone"
				}
			],
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "4b3fc6bc-8ae2-4f82-bfb4-cca81340cffb",
			"name": "Claim to Hospitality",
			"social": true,
			"modifiers": [
				{
					"type": "modifier",
					"id": "a1868c09-c5aa-4e29-aa78-9a913758e874",
					"disabled": true,
					"name": "@Friend with crash space@ (crash space)",
					"cost_type": "points",
					"cost": 1,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "588a85b9-dee5-434f-8ae8-c4299199774b",
					"disabled": true,
					"name": "@Group@ - @Services@",
					"cost_type": "points",
					"cost": 1,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "e82cc14d-4886-438a-bf2a-5ed037e42feb",
					"disabled": true,
					"name": "@Group@ - Has @Resources@",
					"cost_type": "points",
					"cost": 2,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "0ab328aa-fa3f-4d99-a712-c58c20fea34d",
					"disabled": true,
					"name": "@Large Group@ - Has @Lots of Services@",
					"cost_type": "points",
					"cost": 5,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "3eba09ad-d753-47f8-b429-2e0481b56d0d",
					"disabled": true,
					"name": "@Vast Group@ - @Complete Services@",
					"cost_type": "points",
					"cost": 10,
					"affects": "total"
				}
			],
			"reference": "B41",
			"calc": {
				"points": 0
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "6951f69c-c425-4b41-b087-cd04aaf8f507",
			"name": "Clairsentience",
			"mental": true,
			"supernatural": true,
			"base_points": 50,
			"modifiers": [
				{
					"type": "modifier",
					"id": "43727ba6-a2a4-429f-908d-edb044ef5af0",
					"disabled": true,
					"name": "Clairaudience",
					"cost_type": "percentage",
					"cost": -30,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "1d1fc2e5-b83e-46f3-b2d0-deda7433ef33",
					"disabled": true,
					"name": "Clairosmia",
					"cost_type": "percentage",
					"cost": -60,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "a942711b-a8cf-4380-a5ed-d7bb8a2e279c",
					"disabled": true,
					"name": "Clairvoyance",
					"cost_type": "percentage",
					"cost": -10,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "eb3c4d95-ac7f-4680-9403-a0ddd8e4990a",
					"disabled": true,
					"name": "Visible",
					"cost_type": "percentage",
					"cost": -10,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "7aa0567f-a8b7-44ea-9ba4-d06bc752b3b8",
					"disabled": true,
					"name": "Aware",
					"reference": "P44",
					"cost_type": "percentage",
					"cost": 50,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "d936d074-3572-42dc-ad31-3b6b553befde",
					"disabled": true,
					"name": "Projection",
					"reference": "P43",
					"cost_type": "percentage",
					"cost": 0,
					"affects": "total",
					"notes": "Only affects insubstantial world"
				},
				{
					"type": "modifier",
					"id": "accd74a9-e86f-49e1-91f6-775f0890f5b2",
					"disabled": true,
					"name": "Projection",
					"reference": "P44",
					"cost_type": "percentage",
					"cost": 140,
					"affects": "total",
					"notes": "Can use abilities on material world"
				},
				{
					"type": "modifier",
					"id": "b588f9c9-f12b-48cc-974f-10e98cafeabe",
					"disabled": true,
					"name": "Second Nature",
					"reference": "P44",
					"cost_type": "percentage",
					"cost": 70,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "e32a20e3-5980-4e9d-a44b-55f79994f7a6",
					"disabled": true,
					"name": "Fixed Range",
					"reference": "PSI13",
					"cost_type": "percentage",
					"cost": -5,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "da6f785c-5d1a-48a5-b83f-2129364bde09",
					"disabled": true,
					"name": "Normal Sight",
					"reference": "PSI13",
					"cost_type": "percentage",
					"cost": -20,
					"affects": "total"
				}
			],
			"reference": "B42,P44,PSI13",
			"calc": {
				"points": 50
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "59a18fe3-13f2-4fca-a0f8-b1813a0686dd",
			"name": "Claustrophobia (Enclosed Spaces)",
			"mental": true,
			"base_points": -15,
			"cr": 12,
			"cr_adj": "action_penalty",
			"reference": "B149",
			"calc": {
				"points": -15
			},
			"notes": "You are uncomfortable any time you can’t see the sky – or at least a very high ceiling. In a small room or vehicle, you feel the walls closing in on you... You need air! This is a dangerous fear for someone who plans to go underground.",
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "79af2e2a-b2f2-485c-9a7d-890395010754",
			"name": "Clerical Investment",
			"social": true,
			"base_points": 5,
			"reference": "B43",
			"calc": {
				"points": 5
			},
			"features": [
				{
					"type": "reaction_bonus",
					"amount": 1,
					"situation": "from members of your religion and those who respect your faith"
				}
			],
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "1d97882f-bb3e-45e4-b552-d5a9b4dda3e9",
			"name": "Clinging",
			"physical": true,
			"exotic": true,
			"base_points": 20,
			"modifiers": [
				{
					"type": "modifier",
					"id": "bf94f1cf-9acc-4913-a1bf-28553c516265",
					"disabled": true,
					"name": "Specific",
					"reference": "B43",
					"cost_type": "percentage",
					"cost": -40,
					"affects": "total",
					"notes": "@Common Material@"
				},
				{
					"type": "modifier",
					"id": "6884b8ed-5253-4957-a4f5-afe1af0d00e8",
					"disabled": true,
					"name": "Specific",
					"reference": "B43",
					"cost_type": "percentage",
					"cost": -60,
					"affects": "total",
					"notes": "@Uncommon Material@"
				},
				{
					"type": "modifier",
					"id": "663e38e8-106e-4f47-9a54-eda468283fdb",
					"disabled": true,
					"name": "Specific",
					"reference": "B43",
					"cost_type": "percentage",
					"cost": -80,
					"affects": "total",
					"notes": "@Absurd Material@"
				},
				{
					"type": "modifier",
					"id": "18d2579e-28a7-4b3c-bce6-ceb406a1474a",
					"disabled": true,
					"name": "Attraction",
					"reference": "P45",
					"cost_type": "percentage",
					"cost": 25,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "7727966d-c45e-4b70-af7b-81dd1892c5ea",
					"disabled": true,
					"name": "Requires Low Gravity",
					"reference": "P45",
					"cost_type": "percentage",
					"cost": -5,
					"affects": "total",
					"levels": 1
				}
			],
			"reference": "B43,P45",
			"calc": {
				"points": 20
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "bd56b1ff-55d0-4f27-8ed4-a7101a23a827",
			"name": "Clueless",
			"mental": true,
			"base_points": -10,
			"reference": "B126",
			"calc": {
				"points": -10
			},
			"features": [
				{
					"type": "skill_bonus",
					"amount": -4,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "starts_with",
						"qualifier": "savoir-faire"
					}
				},
				{
					"type": "reaction_bonus",
					"amount": -2,
					"situation": "from others"
				},
				{
					"type": "conditional_modifier",
					"amount": 4,
					"situation": "to resist Sex Appeal"
				}
			],
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "4782f246-2624-452a-9974-30d6b5ffa997",
			"name": "Code of Honor",
			"mental": true,
			"levels": "0",
			"base_points": -1,
			"reference": "B163,MA53",
			"calc": {
				"points": -1
			},
			"notes": "@Subject@",
			"categories": [
				"Quirk"
			]
		},
		{
			"type": "advantage",
			"id": "b1c4d1e3-81ea-4b84-9d90-221de11b83b8",
			"name": "Code of Honor (Chivalry)",
			"mental": true,
			"base_points": -15,
			"reference": "B127",
			"calc": {
				"points": -15
			},
			"notes": "Protect any lady, and anyone weaker than yourself. Never break your word. Never ignore an insult to yourself, a lady, your liege-lord, or your faith; insults may only be wiped out by an apology or a duel (not necessarily to the death!). Never take advantage of an opponent in any way; weapons and circumstances must be equal (even in open war if the foe is also noble and chivalrous). Accept any challenge to arms from anyone of greater or equal rank.",
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "9f74cca6-0d99-4b16-89b1-3ac3122fbf80",
			"name": "Code of Honor (Gentleman\'s)",
			"mental": true,
			"base_points": -10,
			"reference": "B127",
			"calc": {
				"points": -10
			},
			"notes": "Never break your word. Never ignore an insult to yourself, a lady, or your flag; insults may only be wiped out by an apology or a duel (not necessarily to the death!). Never take advantage of an opponent in any way; weapons and circumstances must be equal (except in open war). This only applies between gentlemen.",
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "4334f76e-8ed1-4f1a-b9bb-0a626acb5b7a",
			"name": "Code of Honor (Pirate\'s)",
			"mental": true,
			"base_points": -5,
			"reference": "B127",
			"calc": {
				"points": -5
			},
			"notes": "Always avenge an insult, regardless of the danger; your buddy’s foe is your own; never attack a fellow crewman or buddy except in a fair, open duel.",
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "be5292c1-f73b-487f-a31c-1231e69f9e48",
			"name": "Code of Honor (Professional)",
			"mental": true,
			"base_points": -5,
			"reference": "B127",
			"calc": {
				"points": -5
			},
			"notes": "Adhere to the ethics of your profession; always do your job to the best of your ability; support your guild, union, or professional association.",
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "a2be5cfc-59b7-4106-a492-221b15e4491c",
			"name": "Code of Honor (Soldier\'s)",
			"mental": true,
			"base_points": -10,
			"reference": "B127",
			"calc": {
				"points": -10
			},
			"notes": "An officer should be tough but fair, lead from the front, and look out for his men; an enlisted man should look out for his buddies and take care of his kit. Every soldier should be willing to fight and die for the honor of his unit, service, and country; follow orders; obey the “rules of war”; treat an honorable enemy with respect (a dishonorable enemy deserves a bullet); and wear the uniform with pride.",
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "dedcbeb7-9cd5-4f1a-9a20-855638f5d3a3",
			"name": "Code of Honor (Theatrical)",
			"mental": true,
			"base_points": -5,
			"reference": "B127, BS186",
			"calc": {
				"points": -5
			},
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "319dbe98-c847-4d23-b4ef-517f72b68d25",
			"name": "Coitophobia (Sex)",
			"mental": true,
			"base_points": -10,
			"cr": 12,
			"cr_adj": "action_penalty",
			"reference": "B150",
			"calc": {
				"points": -10
			},
			"notes": "You are terrified by the idea of sexual relations or the loss of your virginity.",
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "7ddbd12c-c28d-4b1f-b365-979d62c54215",
			"name": "Cold-Blooded",
			"physical": true,
			"exotic": true,
			"base_points": -5,
			"reference": "B127",
			"calc": {
				"points": -5
			},
			"notes": "Under 50-degrees",
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "61dcbcb6-343b-47b0-b3a1-9b92d05ba2fb",
			"name": "Cold-Blooded",
			"physical": true,
			"exotic": true,
			"base_points": -10,
			"reference": "B127",
			"calc": {
				"points": -10
			},
			"notes": "Under 65-degrees",
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "f549766f-e0cd-4867-b1e3-662c8dbc0d3b",
			"name": "Colorblindness",
			"physical": true,
			"base_points": -10,
			"reference": "B127",
			"calc": {
				"points": -10
			},
			"features": [
				{
					"type": "skill_bonus",
					"amount": -1,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "contains",
						"qualifier": "artist"
					}
				},
				{
					"type": "skill_bonus",
					"amount": -1,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "contains",
						"qualifier": "chemistry"
					}
				},
				{
					"type": "skill_bonus",
					"amount": -1,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "contains",
						"qualifier": "driving"
					}
				},
				{
					"type": "skill_bonus",
					"amount": -1,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "merchant"
					}
				},
				{
					"type": "skill_bonus",
					"amount": -1,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "contains",
						"qualifier": "piloting"
					}
				},
				{
					"type": "skill_bonus",
					"amount": -1,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "contains",
						"qualifier": "tracking"
					}
				}
			],
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "66a5b4a2-29be-47a3-a1b9-c8a14e6922c0",
			"name": "Combat Paralysis",
			"physical": true,
			"base_points": -15,
			"reference": "B127",
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
							"qualifier": "Combat Reflexes"
						}
					}
				]
			},
			"features": [
				{
					"type": "attribute_bonus",
					"amount": -2,
					"attribute": "fright_check"
				}
			],
			"notes": "In any situation in which personal harm seems imminent, make a HT roll. Do not roll until the instant you need to fight, run, pull the trigger, or whatever. Any roll over 13 is a failure, even if you have HT 14+. On a success, you can act normally. On a failure, you are mentally stunned. ",
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "04171edc-4d0e-4ce3-b06f-1815e60b7488",
			"name": "Combat Reflexes",
			"mental": true,
			"base_points": 15,
			"reference": "B43",
			"calc": {
				"points": 15
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
							"qualifier": "Enhanced Time Sense"
						}
					}
				]
			},
			"features": [
				{
					"type": "skill_bonus",
					"amount": 1,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "starts_with",
						"qualifier": "fast-draw"
					}
				},
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
				},
				{
					"type": "attribute_bonus",
					"amount": 2,
					"attribute": "fright_check"
				},
				{
					"type": "conditional_modifier",
					"amount": 6,
					"situation": "on all IQ rolls to wake up or to recover from surprise or mental stun"
				},
				{
					"type": "conditional_modifier",
					"amount": 1,
					"situation": "to initiative rolls for your side (+2 if you are the leader)"
				}
			],
			"notes": "Never freeze",
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "66436989-dd48-41f6-bbf7-e4f77418168d",
			"name": "Comfortable Wealth",
			"social": true,
			"base_points": 10,
			"reference": "B25",
			"calc": {
				"points": 10
			},
			"notes": "Starting wealth is twice normal",
			"categories": [
				"Advantage",
				"Wealth"
			]
		},
		{
			"type": "advantage",
			"id": "1015855f-fbdd-4e01-a1d1-ce4e155b6995",
			"name": "Common Sense",
			"mental": true,
			"base_points": 10,
			"modifiers": [
				{
					"type": "modifier",
					"id": "9061b3d4-8442-4a84-ae19-0ba89e6857d7",
					"disabled": true,
					"name": "Concious",
					"reference": "P45",
					"cost_type": "percentage",
					"cost": 50,
					"affects": "total"
				}
			],
			"reference": "B43,P45",
			"calc": {
				"points": 10
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "969e1ae4-ea35-4a09-9df8-61731221dcea",
			"name": "Compartmentalized Mind",
			"mental": true,
			"exotic": true,
			"levels": "1",
			"points_per_level": 50,
			"modifiers": [
				{
					"type": "modifier",
					"id": "37af2236-c0d8-43cf-9fd4-7f0ece9086c7",
					"disabled": true,
					"name": "Massively Parallel",
					"reference": "SU26",
					"cost_type": "percentage",
					"cost": 20,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "a1d7b482-7c31-4b3b-8f7f-81468ca827fb",
					"disabled": true,
					"name": "Controls",
					"reference": "B43",
					"cost_type": "points",
					"cost": -25,
					"affects": "base_only"
				},
				{
					"type": "modifier",
					"id": "e4c7b1f0-c041-4bd1-8d09-b4d08227947c",
					"disabled": true,
					"name": "Dedicated Controls",
					"reference": "B43",
					"cost_type": "points",
					"cost": -40,
					"affects": "base_only"
				},
				{
					"type": "modifier",
					"id": "2da733f6-90ea-4f75-8c8a-52cbf2f5f9ca",
					"disabled": true,
					"name": "Limited, One Ability",
					"reference": "PSI13",
					"cost_type": "percentage",
					"cost": -30,
					"affects": "total",
					"notes": "@Ability@"
				},
				{
					"type": "modifier",
					"id": "aab954da-74fa-42de-a380-3cc99da3285a",
					"disabled": true,
					"name": "Limited, One Power",
					"reference": "PSI13",
					"cost_type": "percentage",
					"cost": -20,
					"affects": "total",
					"notes": "@Power@"
				},
				{
					"type": "modifier",
					"id": "2e138614-a8d3-4872-88fe-34c81fcf246c",
					"disabled": true,
					"name": "Mental Separation Only",
					"reference": "PSI13",
					"cost_type": "percentage",
					"cost": -80,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "b31f32ff-138e-49a4-85e5-79a04cab2ba0",
					"disabled": true,
					"name": "Mentalism",
					"reference": "PSI14",
					"cost_type": "percentage",
					"cost": -10,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "db5c300f-5ef1-456a-aea0-76f777a376a5",
					"disabled": true,
					"name": "No Mental Separation",
					"reference": "PSI14",
					"cost_type": "percentage",
					"cost": -20,
					"affects": "total"
				}
			],
			"reference": "B43,PSI13",
			"calc": {
				"points": 50
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "9255a0b7-679a-44ab-b99a-15e5ea655896",
			"name": "Compulsive Carousing",
			"mental": true,
			"base_points": -5,
			"cr": 12,
			"reference": "B128",
			"calc": {
				"points": -5
			},
			"features": [
				{
					"type": "reaction_bonus",
					"amount": 1,
					"situation": "from like-minded extroverts"
				},
				{
					"type": "reaction_bonus",
					"amount": -1,
					"situation": "or worse from sober-minded citizens (GM discretion)"
				}
			],
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "16db88e5-8a55-412b-b678-affe7a3add70",
			"name": "Compulsive Gambling",
			"mental": true,
			"base_points": -5,
			"cr": 12,
			"reference": "B128",
			"calc": {
				"points": -5
			},
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "0093fd7e-cb05-4a5d-9814-091a78305431",
			"name": "Compulsive Generosity",
			"mental": true,
			"base_points": -5,
			"cr": 12,
			"cr_adj": "minor_cost_of_living_increase",
			"reference": "B128",
			"calc": {
				"points": -5
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
							"qualifier": "miserliness"
						}
					}
				]
			},
			"features": [
				{
					"type": "reaction_bonus",
					"amount": 1,
					"situation": "from pious folk"
				}
			],
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "49173051-0793-4376-bb58-8d70e020a302",
			"name": "Compulsive Lying",
			"mental": true,
			"base_points": -15,
			"cr": 12,
			"reference": "B128",
			"calc": {
				"points": -15
			},
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "e40b53fa-0f9e-4e40-80b1-bcd475ee6317",
			"name": "Compulsive Spending",
			"mental": true,
			"base_points": -5,
			"cr": 12,
			"cr_adj": "major_cost_of_living_increase",
			"reference": "B129",
			"calc": {
				"points": -5
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
							"qualifier": "miserliness"
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
			"id": "7405f300-c2a1-4c41-a667-e9e0c6fc79cd",
			"name": "Compulsive Vowing",
			"mental": true,
			"base_points": -5,
			"cr": 12,
			"reference": "B129",
			"calc": {
				"points": -5
			},
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "968817d3-5ba1-4b9e-8fd2-f98610042450",
			"name": "Confused",
			"physical": true,
			"base_points": -10,
			"cr": 12,
			"reference": "B129",
			"calc": {
				"points": -10
			},
			"notes": "In a strange place, or when there’s a commotion going on, you must make a self-control roll",
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "61a7b4a2-6ba7-444c-be6a-5c92d5b8f35f",
			"name": "Congenial",
			"mental": true,
			"base_points": -1,
			"reference": "B164",
			"calc": {
				"points": -1
			},
			"categories": [
				"Quirk"
			]
		},
		{
			"type": "advantage",
			"id": "74d5f4fe-8e89-4fb8-bf1f-47be8daad1e2",
			"name": "Constriction Attack",
			"physical": true,
			"exotic": true,
			"base_points": 15,
			"modifiers": [
				{
					"type": "modifier",
					"id": "0d75e183-9a6b-4a50-8566-8966d795fcd4",
					"disabled": true,
					"name": "Engulfing",
					"reference": "P45",
					"cost_type": "percentage",
					"cost": 60,
					"affects": "total"
				}
			],
			"reference": "B43,P45",
			"calc": {
				"points": 15
			},
			"notes": "If you succeed on a grapple against an opponent no larger than your own SM, on your next turn, and each successive turn, roll a Quick Contest of your ST vs. your victim’s ST or HT, whichever is higher. If you win, your victim takes damage equal to your margin of victory; otherwise, no damage is inflicted",
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "f8327c39-3fc5-4841-83cc-a16207de2d0a",
			"name": "Contact (@Who@)",
			"social": true,
			"modifiers": [
				{
					"type": "modifier",
					"id": "8b0fefc6-5071-44c5-89ca-f8453e588828",
					"disabled": true,
					"name": "Effective skill",
					"cost_type": "points",
					"cost": 1,
					"affects": "total",
					"notes": "12"
				},
				{
					"type": "modifier",
					"id": "833fb095-f6c4-459c-8660-474161fdd329",
					"disabled": true,
					"name": "Effective skill",
					"cost_type": "points",
					"cost": 2,
					"affects": "total",
					"notes": "15"
				},
				{
					"type": "modifier",
					"id": "9e2567e7-25d8-4843-aab9-bd953050e948",
					"disabled": true,
					"name": "Effective skill",
					"cost_type": "points",
					"cost": 3,
					"affects": "total",
					"notes": "18"
				},
				{
					"type": "modifier",
					"id": "63b4314d-f722-442c-a1d8-c53b4c5733a5",
					"disabled": true,
					"name": "Effective skill",
					"cost_type": "points",
					"cost": 4,
					"affects": "total",
					"notes": "21"
				},
				{
					"type": "modifier",
					"id": "083ee360-33df-4ab1-8bf5-520f9e31f2e7",
					"disabled": true,
					"name": "Can obtain information using supernatural talents",
					"cost_type": "points",
					"cost": 1,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "20f09f2b-9eeb-4fc3-9b60-7c5d0e2e69b3",
					"disabled": true,
					"name": "Group",
					"cost_type": "multiplier",
					"cost": 5
				},
				{
					"type": "modifier",
					"id": "815c9373-73e7-4edc-8a82-a72820d3851f",
					"disabled": true,
					"name": "Appears almost all the time",
					"cost_type": "multiplier",
					"cost": 3,
					"notes": "15-"
				},
				{
					"type": "modifier",
					"id": "05183ed1-b4d0-4f10-a14f-a1b164a8992e",
					"disabled": true,
					"name": "Appears quite often",
					"cost_type": "multiplier",
					"cost": 2,
					"notes": "12-"
				},
				{
					"type": "modifier",
					"id": "2687a0a0-cf05-4650-a350-7790c38999e3",
					"disabled": true,
					"name": "Appears fairly often",
					"cost_type": "multiplier",
					"cost": 1,
					"notes": "9-"
				},
				{
					"type": "modifier",
					"id": "44ffa02d-134b-4d0a-a47e-8d9edef75dc8",
					"disabled": true,
					"name": "Appears quite rarely",
					"cost_type": "multiplier",
					"cost": 0.5,
					"notes": "6-"
				},
				{
					"type": "modifier",
					"id": "ed43bb5c-a588-42cb-a135-c515dafb5d60",
					"disabled": true,
					"name": "Completely reliable",
					"cost_type": "multiplier",
					"cost": 3
				},
				{
					"type": "modifier",
					"id": "db8d124a-a83b-4d66-85ed-f70ce7eadcf8",
					"disabled": true,
					"name": "Usually reliable",
					"cost_type": "multiplier",
					"cost": 2
				},
				{
					"type": "modifier",
					"id": "51804516-d8da-4c44-9585-2c6cd33482c3",
					"disabled": true,
					"name": "Somewhat reliable",
					"cost_type": "multiplier",
					"cost": 1
				},
				{
					"type": "modifier",
					"id": "9665355f-8bc0-495c-a77f-f0aed8e2f600",
					"disabled": true,
					"name": "Unreliable",
					"cost_type": "multiplier",
					"cost": 0.5
				},
				{
					"type": "modifier",
					"id": "b5112ac7-096a-42ce-9dd1-3fea5b78eb76",
					"disabled": true,
					"name": "Favor",
					"reference": "B55",
					"cost_type": "multiplier",
					"cost": 0.2
				}
			],
			"reference": "B44",
			"calc": {
				"points": 0
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "3535400e-1e85-4428-91ea-a933f8637332",
			"name": "Cowardice",
			"mental": true,
			"base_points": -10,
			"cr": 12,
			"reference": "B129",
			"calc": {
				"points": -10
			},
			"notes": "Make a self-control roll any time you are called on to risk physical danger. Roll at -5 if you must risk death.",
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "14e3a2e7-da09-47d4-a2cc-d44f8e436f54",
			"name": "Crippling Shyness",
			"mental": true,
			"base_points": -20,
			"reference": "B154",
			"calc": {
				"points": -20
			},
			"prereqs": {
				"type": "prereq_list",
				"all": true,
				"prereqs": [
					{
						"type": "skill_prereq",
						"has": false,
						"name": {
							"compare": "is",
							"qualifier": "Acting"
						}
					},
					{
						"type": "skill_prereq",
						"has": false,
						"name": {
							"compare": "is",
							"qualifier": "Carousing"
						}
					},
					{
						"type": "skill_prereq",
						"has": false,
						"name": {
							"compare": "is",
							"qualifier": "Diplomacy"
						}
					},
					{
						"type": "skill_prereq",
						"has": false,
						"name": {
							"compare": "is",
							"qualifier": "Fast-Talk"
						}
					},
					{
						"type": "skill_prereq",
						"has": false,
						"name": {
							"compare": "is",
							"qualifier": "Intimidation"
						}
					},
					{
						"type": "skill_prereq",
						"has": false,
						"name": {
							"compare": "is",
							"qualifier": "Leadership"
						}
					},
					{
						"type": "skill_prereq",
						"has": false,
						"name": {
							"compare": "is",
							"qualifier": "Merchant"
						}
					},
					{
						"type": "skill_prereq",
						"has": false,
						"name": {
							"compare": "is",
							"qualifier": "Panhandling"
						}
					},
					{
						"type": "skill_prereq",
						"has": false,
						"name": {
							"compare": "is",
							"qualifier": "Performance"
						}
					},
					{
						"type": "skill_prereq",
						"has": false,
						"name": {
							"compare": "is",
							"qualifier": "Politics"
						}
					},
					{
						"type": "skill_prereq",
						"has": false,
						"name": {
							"compare": "is",
							"qualifier": "Public Speaking"
						}
					},
					{
						"type": "skill_prereq",
						"has": false,
						"name": {
							"compare": "is",
							"qualifier": "Savoir-Faire"
						}
					},
					{
						"type": "skill_prereq",
						"has": false,
						"name": {
							"compare": "is",
							"qualifier": "Sex Appeal"
						}
					},
					{
						"type": "skill_prereq",
						"has": false,
						"name": {
							"compare": "is",
							"qualifier": "Streetwise"
						}
					},
					{
						"type": "skill_prereq",
						"has": false,
						"name": {
							"compare": "is",
							"qualifier": "Teaching"
						}
					}
				]
			},
			"features": [
				{
					"type": "skill_bonus",
					"amount": -4,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "Acting"
					}
				},
				{
					"type": "skill_bonus",
					"amount": -4,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "Carousing"
					}
				},
				{
					"type": "skill_bonus",
					"amount": -4,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "Diplomacy"
					}
				},
				{
					"type": "skill_bonus",
					"amount": -4,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "Fast-Talk"
					}
				},
				{
					"type": "skill_bonus",
					"amount": -4,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "Intimidation"
					}
				},
				{
					"type": "skill_bonus",
					"amount": -4,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "Leadership"
					}
				},
				{
					"type": "skill_bonus",
					"amount": -4,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "Merchant"
					}
				},
				{
					"type": "skill_bonus",
					"amount": -4,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "Panhandling"
					}
				},
				{
					"type": "skill_bonus",
					"amount": -4,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "Performance"
					}
				},
				{
					"type": "skill_bonus",
					"amount": -4,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "Politics"
					}
				},
				{
					"type": "skill_bonus",
					"amount": -4,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "Public Speaking"
					}
				},
				{
					"type": "skill_bonus",
					"amount": -4,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "Savoir-Faire"
					}
				},
				{
					"type": "skill_bonus",
					"amount": -4,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "Sex Appeal"
					}
				},
				{
					"type": "skill_bonus",
					"amount": -4,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "Streetwise"
					}
				},
				{
					"type": "skill_bonus",
					"amount": -4,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "Teaching"
					}
				}
			],
			"notes": "You avoid strangers whenever possible.",
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "472dde2f-2a43-4b72-90cf-6e5780c05bd3",
			"name": "Crushing Striker (@Body Part@)",
			"physical": true,
			"exotic": true,
			"base_points": 5,
			"weapons": [
				{
					"type": "melee_weapon",
					"damage": {
						"type": "cr",
						"st": "thr",
						"modifier_per_die": 1
					},
					"reach": "C",
					"parry": "0",
					"block": "No",
					"calc": {
						"level": 0,
						"parry": "0",
						"block": "No",
						"damage": "thr (+1 per die) cr"
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
			"reference": "B88,MA47",
			"calc": {
				"points": 5
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "a5032dbb-3109-43b5-8c2c-2e1a1d0fe889",
			"name": "Cultural Adaptability",
			"mental": true,
			"base_points": 10,
			"modifiers": [
				{
					"type": "modifier",
					"id": "93b78dfa-518a-4672-8ebd-fb558ebbff17",
					"disabled": true,
					"name": "Xeno",
					"cost_type": "points",
					"cost": 10,
					"affects": "total"
				}
			],
			"reference": "B46",
			"calc": {
				"points": 10
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "e8bfbdc6-b47c-470a-a80c-fe4574662193",
			"name": "Cultural Familiarity (@Culture@)",
			"mental": true,
			"base_points": 1,
			"modifiers": [
				{
					"type": "modifier",
					"id": "ab12b725-01c8-4fc4-8e71-619a54c79496",
					"disabled": true,
					"name": "Alien",
					"cost_type": "points",
					"cost": 1,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "f72aa995-6766-4eaf-a3ca-0f4ff76d47c5",
					"disabled": true,
					"name": "Native",
					"cost_type": "points",
					"cost": -1,
					"affects": "total"
				}
			],
			"reference": "B23",
			"calc": {
				"points": 1
			},
			"notes": "Do not suffer the normal -3 penalty for unfamiliarity",
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "b19ec0a6-0ae1-4167-9ae6-1a793b1e2ef2",
			"name": "Curious",
			"mental": true,
			"base_points": -5,
			"cr": 12,
			"reference": "B129",
			"calc": {
				"points": -5
			},
			"notes": "Make a self-control roll when presented with an interesting item or situation",
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "e2585ed8-5712-4e90-b772-487c05128eb1",
			"name": "Cursed",
			"mental": true,
			"supernatural": true,
			"base_points": -75,
			"reference": "B129",
			"calc": {
				"points": -75
			},
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "5fd5945d-41f6-44fc-92d4-6825b0e8df0f",
			"name": "Cutting Striker (@Body Part@)",
			"physical": true,
			"exotic": true,
			"base_points": 7,
			"weapons": [
				{
					"type": "melee_weapon",
					"damage": {
						"type": "cut",
						"st": "thr",
						"modifier_per_die": 1
					},
					"reach": "C",
					"parry": "0",
					"block": "No",
					"calc": {
						"level": 0,
						"parry": "0",
						"block": "No",
						"damage": "thr (+1 per die) cut"
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
			"reference": "B88",
			"calc": {
				"points": 7
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "126f049b-f69d-4c65-8769-6226778fbedc",
			"name": "Cybernetics",
			"physical": true,
			"reference": "B46",
			"calc": {
				"points": 0
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "d879da84-cf4e-40e6-8a94-f9c3184537ce",
			"name": "Cynophobia (Dogs)",
			"mental": true,
			"base_points": -5,
			"cr": 12,
			"cr_adj": "action_penalty",
			"reference": "B149",
			"calc": {
				"points": -5
			},
			"notes": "This includes all canines: foxes, wolves, coyotes, wild dogs, etc.",
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "38652476-0c95-4a35-8068-3f96a25d2f09",
			"name": "Damage Resistance",
			"physical": true,
			"exotic": true,
			"levels": "1",
			"points_per_level": 5,
			"modifiers": [
				{
					"type": "modifier",
					"id": "71e0ea7a-bb0e-409d-b01d-aa247b4e66f6",
					"disabled": true,
					"name": "Force Field",
					"reference": "B47",
					"cost_type": "percentage",
					"cost": 20,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "a5e89aca-0b61-483e-8ae3-d6086856cf9a",
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
					"id": "0377b71f-5bfe-44a7-b1a0-db38c7952845",
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
					"id": "db27da09-5815-4776-9af9-6d9741d8e52a",
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
					"id": "0e4c391b-1076-40f2-92b6-c5d3c60b78fd",
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
					"id": "8b422514-296a-4b7c-b350-6b7e7d2be0e9",
					"disabled": true,
					"name": "Reflection",
					"reference": "B47",
					"cost_type": "percentage",
					"cost": 100,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "419ab96d-ea87-4894-b6d8-a6ee32a5d416",
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
					"id": "a8c6d43d-430e-4773-a64c-200f75009e65",
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
					"id": "e9503abd-7621-42c4-8ced-3981ec7c6d9a",
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
					"id": "1585a884-94e2-4152-b7b7-d3b6cc253c58",
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
					"id": "131c5627-2f5a-4f3f-8a52-08417003bc95",
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
					"id": "132e7d43-7920-45f5-bcde-036029aa49f2",
					"disabled": true,
					"name": "Flexible",
					"reference": "B47",
					"cost_type": "percentage",
					"cost": -20,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "d9e01c00-3ac2-4f4d-ae5f-45b34441df13",
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
					"id": "72f08aac-bc4a-43fe-875b-8747b7397bec",
					"disabled": true,
					"name": "Semi-Ablative",
					"reference": "B47",
					"cost_type": "percentage",
					"cost": -20,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "13410164-cee1-4956-832c-47bcf41fdab8",
					"disabled": true,
					"name": "Can\'t wear armor",
					"reference": "B47",
					"cost_type": "percentage",
					"cost": -40,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "9ad2a005-947f-4ef9-ba99-ed88a4adaa49",
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
					"id": "34ffce90-cba0-4d1a-a8ce-b3e6b12a51e3",
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
					"id": "10940926-bf24-4984-a984-d974384f0874",
					"disabled": true,
					"name": "Tough Skin",
					"cost_type": "percentage",
					"cost": -40,
					"affects": "total",
					"notes": "Effects that just require skin contact or a scratch ignore this DR"
				},
				{
					"type": "modifier",
					"id": "db046fce-bac2-4fae-98d4-ee66925c0e9e",
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
					"id": "b112e7ab-adac-40ef-a544-598ae0f7436f",
					"disabled": true,
					"name": "Ablative",
					"reference": "B47",
					"cost_type": "percentage",
					"cost": -80,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "3b761122-5da1-46dd-992c-2f9df40890cb",
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
					"id": "0ed89045-94df-4ab0-ac26-53103a2ad43f",
					"disabled": true,
					"name": "Laminate",
					"reference": "RSWL18",
					"cost_type": "percentage",
					"cost": 10,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "a1baddab-14e3-402e-a209-1eee48ba98ec",
					"disabled": true,
					"name": "Malediction-Proof",
					"reference": "PSI14",
					"cost_type": "percentage",
					"cost": 50,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "b1b407f3-24ca-4beb-8f3a-d362891e5af9",
					"disabled": true,
					"name": "Maledictions Only",
					"reference": "PSI14",
					"cost_type": "percentage",
					"cost": 0,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "a48b115e-bf63-41f8-84cd-3b6d1e41653e",
					"disabled": true,
					"name": "Partial (@Location, 1 level per -1 Per Hit Modifier, Torso is -10% thus level 1@)",
					"reference": "B47",
					"cost_type": "percentage",
					"cost": -10,
					"affects": "total"
				}
			],
			"reference": "B47,P45,MA43,PSI14",
			"calc": {
				"points": 5
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
			"type": "advantage",
			"id": "8b115f06-4639-4dba-a683-b6ddfedfa429",
			"name": "Danger Sense",
			"mental": true,
			"base_points": 15,
			"reference": "B47,P46",
			"calc": {
				"points": 15
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "aa97ce3a-9358-4183-874e-e8ff9f7159f3",
			"name": "Daredevil",
			"mental": true,
			"base_points": 15,
			"reference": "B47",
			"calc": {
				"points": 15
			},
			"features": [
				{
					"type": "conditional_modifier",
					"amount": 1,
					"situation": "to skill rolls any time you take an unnecessary risk (in the GM’s opinion)"
				}
			],
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "814685b5-1d29-418c-afb9-e8eae8d1193f",
			"name": "Dark Vision",
			"physical": true,
			"exotic": true,
			"base_points": 25,
			"modifiers": [
				{
					"type": "modifier",
					"id": "d8886d7f-b079-4e07-9f7a-749f509e1bc0",
					"disabled": true,
					"name": "Can see colors in the dark",
					"cost_type": "percentage",
					"cost": 20,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "f515b6a5-62d7-4105-9622-ffc131556f64",
					"disabled": true,
					"name": "Hypersensory",
					"reference": "P46",
					"cost_type": "percentage",
					"cost": 40,
					"affects": "total"
				}
			],
			"reference": "B47,P46",
			"calc": {
				"points": 25
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "dfe55b8a-751d-4cdb-81a6-d83ce20449e7",
			"name": "Dead Broke",
			"social": true,
			"base_points": -25,
			"reference": "B25",
			"calc": {
				"points": -25
			},
			"notes": "Starting wealth is 0",
			"categories": [
				"Disadvantage",
				"Wealth"
			]
		},
		{
			"type": "advantage",
			"id": "84366244-3b82-41b8-8b39-0da3fdb98d8e",
			"name": "Deafness",
			"physical": true,
			"base_points": -20,
			"reference": "B129",
			"calc": {
				"points": -20
			},
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "72a21967-202b-4c54-8ec1-0b014a15a733",
			"name": "Debt",
			"social": true,
			"levels": "1",
			"points_per_level": -1,
			"reference": "B26",
			"calc": {
				"points": -1
			},
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "231ad434-ade2-4298-b5b7-747112cc05b3",
			"name": "Decreased Basic Move",
			"physical": true,
			"levels": "1",
			"points_per_level": -5,
			"reference": "B17",
			"calc": {
				"points": -5
			},
			"features": [
				{
					"type": "attribute_bonus",
					"amount": -1,
					"per_level": true,
					"attribute": "basic_move"
				}
			],
			"categories": [
				"Attribute",
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "32dcafe1-ffbe-43bb-ab24-888274985812",
			"name": "Decreased Basic Speed",
			"physical": true,
			"levels": "1",
			"points_per_level": -5,
			"reference": "B17",
			"calc": {
				"points": -5
			},
			"features": [
				{
					"type": "attribute_bonus",
					"amount": -0.25,
					"decimal": true,
					"per_level": true,
					"attribute": "basic_speed"
				}
			],
			"categories": [
				"Attribute",
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "60baf689-5166-4747-9ab0-2e11f657dcc3",
			"name": "Decreased Dexterity",
			"physical": true,
			"levels": "1",
			"points_per_level": -20,
			"reference": "B15",
			"calc": {
				"points": -20
			},
			"features": [
				{
					"type": "attribute_bonus",
					"amount": -1,
					"per_level": true,
					"attribute": "dx"
				}
			],
			"categories": [
				"Attribute",
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "1cb2a343-7ea3-495b-8878-02fab1b165fa",
			"name": "Decreased Health",
			"physical": true,
			"levels": "1",
			"points_per_level": -10,
			"reference": "B14",
			"calc": {
				"points": -10
			},
			"features": [
				{
					"type": "attribute_bonus",
					"amount": -1,
					"per_level": true,
					"attribute": "ht"
				}
			],
			"categories": [
				"Attribute",
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "0270b797-f1bb-4a7c-a7fe-a60b8c31b322",
			"name": "Decreased Intelligence",
			"mental": true,
			"levels": "1",
			"points_per_level": -20,
			"reference": "B15",
			"calc": {
				"points": -20
			},
			"features": [
				{
					"type": "attribute_bonus",
					"amount": -1,
					"per_level": true,
					"attribute": "iq"
				}
			],
			"categories": [
				"Attribute",
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "e1dcfe7f-3e88-44bc-8445-eab184bd35f2",
			"name": "Decreased Perception",
			"mental": true,
			"physical": true,
			"levels": "1",
			"points_per_level": -5,
			"reference": "B16",
			"calc": {
				"points": -5
			},
			"features": [
				{
					"type": "attribute_bonus",
					"amount": -1,
					"per_level": true,
					"attribute": "per"
				}
			],
			"categories": [
				"Attribute",
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "a0e2d307-b76c-4752-9cec-48abb99e74a3",
			"name": "Decreased Strength",
			"physical": true,
			"levels": "1",
			"points_per_level": -10,
			"reference": "B14",
			"calc": {
				"points": -10
			},
			"features": [
				{
					"type": "attribute_bonus",
					"amount": -1,
					"per_level": true,
					"attribute": "st"
				}
			],
			"categories": [
				"Attribute",
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "4a10aa4f-1ca0-4e3c-b575-7e9da8fa8884",
			"name": "Decreased Time Rate",
			"mental": true,
			"exotic": true,
			"base_points": -100,
			"reference": "B129",
			"calc": {
				"points": -100
			},
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "2e3f95c2-6ad3-456c-bf9f-72b49cdc2582",
			"name": "Decreased Will",
			"mental": true,
			"levels": "1",
			"points_per_level": -5,
			"reference": "B16",
			"calc": {
				"points": -5
			},
			"features": [
				{
					"type": "attribute_bonus",
					"amount": -1,
					"per_level": true,
					"attribute": "will"
				}
			],
			"categories": [
				"Attribute",
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "f41a8092-34e7-46ec-a2d8-227811780028",
			"name": "Deep Sleeper",
			"physical": true,
			"base_points": 1,
			"reference": "B101",
			"calc": {
				"points": 1
			},
			"categories": [
				"Perk"
			]
		},
		{
			"type": "advantage",
			"id": "af434784-d06d-47f6-90f4-33c6f422356d",
			"name": "Delusion (@Belief@)",
			"mental": true,
			"modifiers": [
				{
					"type": "modifier",
					"id": "ac2f3661-107e-4425-a132-9d90df099e7c",
					"disabled": true,
					"name": "Minor",
					"reference": "B130",
					"cost_type": "points",
					"cost": -5,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "aecc1c19-74f1-4379-b1e9-baed32ec4088",
					"disabled": true,
					"name": "Major",
					"reference": "B130",
					"cost_type": "points",
					"cost": -10,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "dbb776b3-9d95-4203-8e0c-9d500dae7615",
					"disabled": true,
					"name": "Severe",
					"reference": "B130",
					"cost_type": "points",
					"cost": -15,
					"affects": "total"
				}
			],
			"reference": "B130",
			"calc": {
				"points": 0
			},
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "75e581f3-66c1-4102-bce8-ae1459c73b51",
			"name": "Delusions",
			"mental": true,
			"levels": "0",
			"base_points": -1,
			"reference": "B164,MA53",
			"calc": {
				"points": -1
			},
			"notes": "@Subject@",
			"categories": [
				"Quirk"
			]
		},
		{
			"type": "advantage",
			"id": "ad93731b-6ab5-4a41-ae0b-168cdf6e5ed5",
			"name": "Demophobia (Crowds)",
			"mental": true,
			"base_points": -15,
			"cr": 12,
			"cr_adj": "action_penalty",
			"reference": "B149",
			"calc": {
				"points": -15
			},
			"notes": "Any group of over a dozen people sets off this fear unless they are all well known to you. The self-control roll is at -1 for over 25 people, -2 for a crowd of 100 or more, -3 for 1,000, -4 for 10,000, and so on.",
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "0b04cb1b-da61-4ada-83e7-4f707512c4be",
			"name": "Dependent (@Who@)",
			"social": true,
			"modifiers": [
				{
					"type": "modifier",
					"id": "26ab3118-378c-4c31-9b4b-8a9a525faab7",
					"disabled": true,
					"name": "Point total",
					"reference": "B131",
					"cost_type": "points",
					"cost": -1,
					"affects": "total",
					"notes": "100% of your starting points"
				},
				{
					"type": "modifier",
					"id": "1a68ec2f-8c3f-4e3e-bd98-2499614a1431",
					"disabled": true,
					"name": "Point total",
					"reference": "B131",
					"cost_type": "points",
					"cost": -2,
					"affects": "total",
					"notes": "75% of your starting points"
				},
				{
					"type": "modifier",
					"id": "c0ce555f-bb53-403a-85eb-70a498853fd0",
					"disabled": true,
					"name": "Point total",
					"reference": "B131",
					"cost_type": "points",
					"cost": -5,
					"affects": "total",
					"notes": "50% of your starting points"
				},
				{
					"type": "modifier",
					"id": "9be77b60-79ba-4837-af58-4977dfaf3198",
					"disabled": true,
					"name": "Point total",
					"reference": "B131",
					"cost_type": "points",
					"cost": -10,
					"affects": "total",
					"notes": "25% of your starting points"
				},
				{
					"type": "modifier",
					"id": "58fe8f1f-162c-49a3-b7a3-20f203cb53b4",
					"disabled": true,
					"name": "Point total",
					"reference": "B131",
					"cost_type": "points",
					"cost": -15,
					"affects": "total",
					"notes": "0 or fewer points"
				},
				{
					"type": "modifier",
					"id": "fbbc1cc5-5076-4f43-a8ff-98bc1af558d6",
					"disabled": true,
					"name": "Appears almost all the time",
					"reference": "B36",
					"cost_type": "multiplier",
					"cost": 3,
					"notes": "15-"
				},
				{
					"type": "modifier",
					"id": "4e14bf0b-9d2c-4d9d-bd5b-468bbcfccb83",
					"disabled": true,
					"name": "Appears quite often",
					"reference": "B36",
					"cost_type": "multiplier",
					"cost": 2,
					"notes": "12-"
				},
				{
					"type": "modifier",
					"id": "06e56e19-030d-4618-8733-60e5c7b753da",
					"disabled": true,
					"name": "Appears fairly often",
					"reference": "B36",
					"cost_type": "multiplier",
					"cost": 1,
					"notes": "9-"
				},
				{
					"type": "modifier",
					"id": "b4f921c5-ccc8-4368-9543-d77fb9b23217",
					"disabled": true,
					"name": "Appears quite rarely",
					"reference": "B36",
					"cost_type": "multiplier",
					"cost": 0.5,
					"notes": "6-"
				},
				{
					"type": "modifier",
					"id": "e3c0b972-e9db-4323-a3b2-53b00836dff8",
					"disabled": true,
					"name": "Group",
					"reference": "B131",
					"cost_type": "multiplier",
					"cost": 2
				},
				{
					"type": "modifier",
					"id": "9b3a8cbf-a2af-4a29-ab6f-c10dc19e7001",
					"disabled": true,
					"name": "Acquaintance",
					"reference": "B131",
					"cost_type": "multiplier",
					"cost": 0.5
				},
				{
					"type": "modifier",
					"id": "738ac024-b159-4dea-9724-f23f833f5b6e",
					"disabled": true,
					"name": "Friend",
					"reference": "B131",
					"cost_type": "multiplier",
					"cost": 1
				},
				{
					"type": "modifier",
					"id": "7768eb5d-8010-4f30-9435-398d20591c25",
					"disabled": true,
					"name": "Loved one",
					"reference": "B131",
					"cost_type": "multiplier",
					"cost": 2
				}
			],
			"reference": "B131",
			"calc": {
				"points": 0
			},
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "2be6271c-17e9-4723-8e0d-21294ce60e3d",
			"name": "Dependency (@Substance@)",
			"physical": true,
			"exotic": true,
			"modifiers": [
				{
					"type": "modifier",
					"id": "4793e870-35c1-498e-8f21-2369f0e86283",
					"disabled": true,
					"name": "Rarity: Rare",
					"reference": "B130",
					"cost_type": "points",
					"cost": -30,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "5c4d859a-415c-4a03-a374-0ca3a45a2c9d",
					"disabled": true,
					"name": "Rarity: Occasional",
					"reference": "B130",
					"cost_type": "points",
					"cost": -20,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "520935c5-8877-47cd-bd7f-ab3949ba81ab",
					"disabled": true,
					"name": "Rarity: Common",
					"reference": "B130",
					"cost_type": "points",
					"cost": -10,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "ad3fe009-26bc-45b1-88fc-247e7e201084",
					"disabled": true,
					"name": "Rarity: Very Common",
					"reference": "B130",
					"cost_type": "points",
					"cost": -5,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "402098c4-6f70-42be-9136-66b7b6e15758",
					"disabled": true,
					"name": "Illegal",
					"reference": "B130",
					"cost_type": "points",
					"cost": -5,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "ba8f3e93-e409-478b-99c3-ecfbefa70089",
					"disabled": true,
					"name": "Frequency: Constantly",
					"reference": "B130",
					"cost_type": "multiplier",
					"cost": 5,
					"notes": "Lose 1 HP per minute without it"
				},
				{
					"type": "modifier",
					"id": "86310a2f-c8cd-413e-88ae-da012c6edcbb",
					"disabled": true,
					"name": "Frequency: Hourly",
					"reference": "B130",
					"cost_type": "multiplier",
					"cost": 4,
					"notes": "Lose 1 HP per 10 minutes after missing a hourly dose"
				},
				{
					"type": "modifier",
					"id": "39c664b4-4398-4b97-8aad-b0bafcfe895e",
					"disabled": true,
					"name": "Frequency: Daily",
					"reference": "B130",
					"cost_type": "multiplier",
					"cost": 3,
					"notes": "Lose 1 HP per hour after missing a daily dose"
				},
				{
					"type": "modifier",
					"id": "ccad68c0-a7fd-4606-9dcd-6ae5b5b3872f",
					"disabled": true,
					"name": "Frequency: Weekly",
					"reference": "B130",
					"cost_type": "multiplier",
					"cost": 2,
					"notes": "Lose 1 HP per six hours after missing a weekly dose"
				},
				{
					"type": "modifier",
					"id": "61e299a6-7dc0-43fc-8d6a-be932b848ec3",
					"disabled": true,
					"name": "Frequency: Monthly",
					"reference": "B130",
					"cost_type": "multiplier",
					"cost": 1,
					"notes": "Lose 1 HP per day after missing a monthly dose"
				},
				{
					"type": "modifier",
					"id": "9a1ae412-539a-438b-9020-45cc3d29d8c3",
					"disabled": true,
					"name": "Frequency: Seasonally",
					"reference": "B130",
					"cost_type": "multiplier",
					"cost": 0.33333,
					"notes": "Lose 1 HP per 3 days after missing a seasonal dose"
				},
				{
					"type": "modifier",
					"id": "746dbfd5-1295-449a-beb6-65adc25b6a88",
					"disabled": true,
					"name": "Frequency: Yearly",
					"reference": "B130",
					"cost_type": "multiplier",
					"cost": 0.1,
					"notes": "Lose 1 HP per 2 weeks after missing a yearly dose"
				},
				{
					"type": "modifier",
					"id": "f9a60134-427e-48be-b97a-7cf8fdf83e86",
					"disabled": true,
					"name": "Aging",
					"reference": "B130",
					"cost_type": "percentage",
					"cost": 30,
					"affects": "total",
					"notes": "Age 2 years for each HP lost due to this dependency"
				}
			],
			"reference": "B130",
			"calc": {
				"points": 0
			},
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "ef158f0a-9a6f-43b8-b55b-6a2ad43cc193",
			"name": "Destiny (@Advantage@)",
			"mental": true,
			"supernatural": true,
			"modifiers": [
				{
					"type": "modifier",
					"id": "6f2811e8-23c5-4607-8784-6440d886ae9d",
					"disabled": true,
					"name": "Minor",
					"reference": "B132",
					"cost_type": "points",
					"cost": 5,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "9f7054e1-9a04-4d65-bed5-8666a41ea51a",
					"disabled": true,
					"name": "Major",
					"reference": "B132",
					"cost_type": "points",
					"cost": 10,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "68d0328e-ec9f-4eac-99d2-14d52d7670db",
					"disabled": true,
					"name": "Great",
					"reference": "B132",
					"cost_type": "points",
					"cost": 15,
					"affects": "total"
				}
			],
			"reference": "B132",
			"calc": {
				"points": 0
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "c2c5812a-611e-4fab-9156-e01a541eb6c6",
			"name": "Destiny (@Disadvantage@)",
			"mental": true,
			"supernatural": true,
			"modifiers": [
				{
					"type": "modifier",
					"id": "99c7f16d-d8ff-4a73-a437-44bb7de13b5f",
					"disabled": true,
					"name": "Minor",
					"reference": "B132",
					"cost_type": "points",
					"cost": -5,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "79b205d8-3fc9-4f31-82d1-e900e76709f9",
					"disabled": true,
					"name": "Major",
					"reference": "B132",
					"cost_type": "points",
					"cost": -10,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "0cde7987-3798-471f-9a29-3d4b9f67dca7",
					"disabled": true,
					"name": "Great",
					"reference": "B132",
					"cost_type": "points",
					"cost": -15,
					"affects": "total"
				}
			],
			"reference": "B132",
			"calc": {
				"points": 0
			},
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "2354ea98-2169-47e2-a388-eb5f1fd6107a",
			"name": "Detect",
			"mental": true,
			"physical": true,
			"exotic": true,
			"modifiers": [
				{
					"type": "modifier",
					"id": "60b71753-e781-483e-aaed-306417206ccf",
					"disabled": true,
					"name": "@Rare Substance/Condition@",
					"reference": "B48",
					"cost_type": "points",
					"cost": 5,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "4a9894b2-d3c8-4ae5-96a5-0d1f74051590",
					"disabled": true,
					"name": "@Occasional Substance/Condition@",
					"reference": "B48",
					"cost_type": "points",
					"cost": 10,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "de19c244-f725-4491-a3ed-5b9b09d5d0f4",
					"disabled": true,
					"name": "@Common Substance/Condition@",
					"reference": "B48",
					"cost_type": "points",
					"cost": 20,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "fcd07e0a-c328-4c7c-8a6f-2ac1dd92f5de",
					"disabled": true,
					"name": "@Very Common Substance/Condition@",
					"reference": "B48",
					"cost_type": "points",
					"cost": 30,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "64352b79-d299-410e-b363-ff6658516cb5",
					"disabled": true,
					"name": "Precise",
					"reference": "B48",
					"cost_type": "percentage",
					"cost": 100,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "9467dba5-9922-4705-a594-270656ff40e6",
					"disabled": true,
					"name": "Signal Detection",
					"reference": "B48",
					"cost_type": "percentage",
					"cost": 0,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "0fbf0474-0c96-4b4f-ae40-6e1ca088d6c3",
					"disabled": true,
					"name": "Vague",
					"reference": "B48",
					"cost_type": "percentage",
					"cost": -50,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "42b1310a-0243-4d6f-b246-e6ce8a4f9907",
					"disabled": true,
					"name": "Analyzing",
					"reference": "P47",
					"cost_type": "percentage",
					"cost": 100,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "72e6a01c-845c-43c4-b44d-a5eab5e18433",
					"disabled": true,
					"name": "Lock-On",
					"reference": "PSI14",
					"cost_type": "percentage",
					"cost": 50,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "006e0217-13f4-4867-bd92-ea1345e75182",
					"disabled": true,
					"name": "Precise, Nontargeting",
					"reference": "PSI14",
					"cost_type": "percentage",
					"cost": 90,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "13075e67-2cd1-4157-96b4-1658e72ee85b",
					"disabled": true,
					"name": "Analysis Only",
					"reference": "PSI14",
					"cost_type": "percentage",
					"cost": -50,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "5f1633d1-7d44-4523-a3a0-9438af35e0ac",
					"disabled": true,
					"name": "Cannot Analyze",
					"reference": "PSI14",
					"cost_type": "percentage",
					"cost": -10,
					"affects": "total"
				}
			],
			"reference": "B48,P47,PSI14",
			"calc": {
				"points": 0
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "78e4a6e4-4b4e-4cba-befb-e6b94f08dcd4",
			"name": "Digital Mind",
			"physical": true,
			"exotic": true,
			"base_points": 5,
			"reference": "B49",
			"calc": {
				"points": 5
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "f5f2ddca-d121-4de6-b008-5dc79743c356",
			"name": "Disciplines of Faith (Asceticism)",
			"mental": true,
			"base_points": -15,
			"reference": "B132",
			"calc": {
				"points": -15
			},
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "139a39d7-32ed-454f-8ac1-594da8ba3e8c",
			"name": "Disciplines of Faith (Monasticism)",
			"mental": true,
			"base_points": -10,
			"reference": "B132",
			"calc": {
				"points": -10
			},
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "fb1956af-2e18-466b-a4e2-c610b01b1fa5",
			"name": "Disciplines of Faith (Mysticism)",
			"mental": true,
			"base_points": -10,
			"reference": "B132",
			"calc": {
				"points": -10
			},
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "bccc8f80-a2b9-46c0-832b-bd7b5af4cecc",
			"name": "Disciplines of Faith (Ritualism)",
			"mental": true,
			"base_points": -5,
			"reference": "B132",
			"calc": {
				"points": -5
			},
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "483ea600-46a2-406d-a14b-cf98bab9783c",
			"name": "Discriminatory Hearing",
			"physical": true,
			"exotic": true,
			"base_points": 15,
			"modifiers": [
				{
					"type": "modifier",
					"id": "b968ab2c-d4f1-428a-bf9e-94c3406f33be",
					"disabled": true,
					"name": "Only underwater",
					"reference": "B49",
					"cost_type": "percentage",
					"cost": -30,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "fe690e94-8e06-4247-a2d3-2d2b6409183c",
					"disabled": true,
					"name": "Profiling",
					"reference": "P47",
					"cost_type": "percentage",
					"cost": 50,
					"affects": "total"
				}
			],
			"reference": "B49,P47",
			"calc": {
				"points": 15
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "96458c8f-9018-4324-9661-b7e6b10966c0",
			"name": "Discriminatory Smell",
			"physical": true,
			"exotic": true,
			"base_points": 15,
			"modifiers": [
				{
					"type": "modifier",
					"id": "17ab7dd3-7774-4c6f-b4b8-f4e209866f47",
					"disabled": true,
					"name": "Emotion Sense",
					"reference": "B49",
					"cost_type": "percentage",
					"cost": 50,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "5b99c3b7-6e6e-44a5-b0e5-e7738f4a1ede",
					"disabled": true,
					"name": "Profiling",
					"reference": "P47",
					"cost_type": "percentage",
					"cost": 50,
					"affects": "total"
				}
			],
			"reference": "B49,P47",
			"calc": {
				"points": 15
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "3a375b36-9924-448d-a2fb-42b662991f68",
			"name": "Discriminatory Taste",
			"physical": true,
			"exotic": true,
			"base_points": 10,
			"modifiers": [
				{
					"type": "modifier",
					"id": "1eec1474-e960-46eb-81f0-a886cf61d920",
					"disabled": true,
					"name": "Profiling",
					"reference": "P47",
					"cost_type": "percentage",
					"cost": 50,
					"affects": "total"
				}
			],
			"reference": "B49,P47",
			"calc": {
				"points": 10
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "829c67e7-d2c5-4c57-8a13-dd8872042334",
			"name": "Dislikes @Item@",
			"mental": true,
			"levels": "0",
			"base_points": -1,
			"reference": "B164",
			"calc": {
				"points": -1
			},
			"categories": [
				"Quirk"
			]
		},
		{
			"type": "advantage",
			"id": "65d38b87-29b6-4ee4-9d79-af18850fe9cd",
			"name": "Distinctive Features",
			"physical": true,
			"base_points": -1,
			"reference": "B165",
			"calc": {
				"points": -1
			},
			"features": [
				{
					"type": "skill_bonus",
					"amount": -1,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "disguise"
					}
				},
				{
					"type": "skill_bonus",
					"amount": -1,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "shadowing"
					}
				},
				{
					"type": "conditional_modifier",
					"amount": 1,
					"situation": "to others’ attempts to identify or follow you"
				}
			],
			"categories": [
				"Quirk"
			]
		},
		{
			"type": "advantage",
			"id": "a1936722-2aba-4b01-bc90-07bcb42455d5",
			"name": "Distractible",
			"mental": true,
			"base_points": -1,
			"reference": "B164",
			"calc": {
				"points": -1
			},
			"features": [
				{
					"type": "conditional_modifier",
					"amount": -1,
					"situation": "on any long task"
				}
			],
			"categories": [
				"Quirk"
			]
		},
		{
			"type": "advantage",
			"id": "8ff5a8e5-986d-4e4c-9f62-0eeb317b790b",
			"name": "Disturbing Voice",
			"physical": true,
			"base_points": -10,
			"reference": "B132",
			"calc": {
				"points": -10
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
							"qualifier": "voice"
						}
					}
				]
			},
			"features": [
				{
					"type": "skill_bonus",
					"amount": -2,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "diplomacy"
					}
				},
				{
					"type": "skill_bonus",
					"amount": -2,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "fast-talk"
					}
				},
				{
					"type": "skill_bonus",
					"amount": -2,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "performance"
					}
				},
				{
					"type": "skill_bonus",
					"amount": -2,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "public speaking"
					}
				},
				{
					"type": "skill_bonus",
					"amount": -2,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "sex appeal"
					}
				},
				{
					"type": "skill_bonus",
					"amount": -2,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "singing"
					}
				}
			],
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "dbc23631-73c7-4b3b-9b42-7d5f72bbe302",
			"name": "Divine Curse",
			"mental": true,
			"supernatural": true,
			"modifiers": [
				{
					"type": "modifier",
					"id": "ad6b1bbd-4509-4607-bb31-4716db09ef1d",
					"disabled": true,
					"name": "Minor",
					"cost_type": "points",
					"cost": -5,
					"affects": "total",
					"notes": "@Curse@"
				},
				{
					"type": "modifier",
					"id": "766b3697-51ee-4c4a-ba2a-8b645f8235ce",
					"disabled": true,
					"name": "Major",
					"cost_type": "points",
					"cost": -10,
					"affects": "total",
					"notes": "@Curse@"
				},
				{
					"type": "modifier",
					"id": "88fd98f0-b110-4dac-8444-fcaba43512bd",
					"disabled": true,
					"name": "Severe",
					"cost_type": "points",
					"cost": -15,
					"affects": "total",
					"notes": "@Curse@"
				}
			],
			"reference": "B132",
			"calc": {
				"points": 0
			},
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "233a65c5-8947-4e43-90db-db1b1c68b5c0",
			"name": "Doesn\'t Breathe",
			"physical": true,
			"exotic": true,
			"base_points": 20,
			"modifiers": [
				{
					"type": "modifier",
					"id": "f13441e8-6a94-4715-8359-eeda924394c8",
					"disabled": true,
					"name": "Gills",
					"reference": "B49",
					"cost_type": "percentage",
					"cost": -50,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "b43ccd22-d6c7-4f5a-b280-55943589bd9d",
					"disabled": true,
					"name": "Gills",
					"reference": "B49",
					"cost_type": "points",
					"cost": -20,
					"affects": "total",
					"notes": "Suffocates in air"
				},
				{
					"type": "modifier",
					"id": "1ba12fe1-335e-4d84-9bbe-bbceb062c966",
					"disabled": true,
					"name": "Oxygen Absorption",
					"reference": "B49",
					"cost_type": "percentage",
					"cost": -25,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "c6fc6b99-b257-41e8-b7f9-4737752adaa9",
					"disabled": true,
					"name": "Oxygen Storage",
					"reference": "B49",
					"cost_type": "percentage",
					"cost": -50,
					"affects": "total",
					"notes": "Can hold breath 25 times as long as normal"
				},
				{
					"type": "modifier",
					"id": "191bb6c2-2e0a-4b94-bf46-75db1d9e4b04",
					"disabled": true,
					"name": "Oxygen Storage",
					"reference": "B49",
					"cost_type": "percentage",
					"cost": -40,
					"affects": "total",
					"notes": "Can hold breath 50 times as long as normal"
				},
				{
					"type": "modifier",
					"id": "9801cedb-4b05-4d86-b65f-3c0d4418b8a7",
					"disabled": true,
					"name": "Oxygen Storage",
					"reference": "B49",
					"cost_type": "percentage",
					"cost": -30,
					"affects": "total",
					"notes": "Can hold breath 100 times as long as normal"
				},
				{
					"type": "modifier",
					"id": "8b514228-a261-4a95-ab1d-45b893a77df1",
					"disabled": true,
					"name": "Oxygen Storage",
					"reference": "B49",
					"cost_type": "percentage",
					"cost": -20,
					"affects": "total",
					"notes": "Can hold breath 200 times as long as normal"
				},
				{
					"type": "modifier",
					"id": "cc70e80e-c5a7-4193-bd17-50da8902073b",
					"disabled": true,
					"name": "Oxygen Storage",
					"reference": "B49",
					"cost_type": "percentage",
					"cost": -10,
					"affects": "total",
					"notes": "Can hold breath 300 times as long as normal"
				},
				{
					"type": "modifier",
					"id": "5bf5ac51-9155-48dd-a836-c61786f9e602",
					"disabled": true,
					"name": "Oxygen Combustion",
					"reference": "B49",
					"cost_type": "percentage",
					"cost": -50,
					"affects": "total"
				}
			],
			"reference": "B49",
			"calc": {
				"points": 20
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "2f1c1223-0e1f-4cdc-8d93-9b4ecaeb3a6a",
			"name": "Doesn\'t Eat or Drink",
			"physical": true,
			"exotic": true,
			"base_points": 10,
			"reference": "B50",
			"calc": {
				"points": 10
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "b4f532c9-913d-4295-8a52-7f051b7f77b0",
			"name": "Doesn\'t Sleep",
			"physical": true,
			"exotic": true,
			"base_points": 20,
			"reference": "B50",
			"calc": {
				"points": 20
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "23eee513-2699-48d0-a7a8-49b14df00169",
			"name": "Dominance",
			"mental": true,
			"exotic": true,
			"base_points": 20,
			"reference": "B50",
			"calc": {
				"points": 20
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "a606b364-cea6-4b58-9c8a-d4c99a4164e5",
			"name": "Draining",
			"physical": true,
			"supernatural": true,
			"modifiers": [
				{
					"type": "modifier",
					"id": "0b3cd004-28b0-4c0f-97ad-749d0aae1b10",
					"disabled": true,
					"name": "Common",
					"cost_type": "points",
					"cost": -5,
					"affects": "total",
					"notes": "@Substance@"
				},
				{
					"type": "modifier",
					"id": "3c8a963e-83aa-4147-abbc-8a749c522ed4",
					"disabled": true,
					"name": "Occasional",
					"cost_type": "points",
					"cost": -10,
					"affects": "total",
					"notes": "@Substance@"
				},
				{
					"type": "modifier",
					"id": "86c1bb1d-7504-48d7-b9e1-72aaf533570b",
					"disabled": true,
					"name": "Rare",
					"cost_type": "points",
					"cost": -15,
					"affects": "total",
					"notes": "@Substance@"
				},
				{
					"type": "modifier",
					"id": "e47610c1-d110-4443-a360-ae490fbaf687",
					"disabled": true,
					"name": "Illegal",
					"cost_type": "points",
					"cost": -5,
					"affects": "total"
				}
			],
			"reference": "B132",
			"calc": {
				"points": 0
			},
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "03fe2b6c-9fe3-4685-b568-cbc2de72c44b",
			"name": "Dread",
			"mental": true,
			"supernatural": true,
			"levels": "1",
			"base_points": -9,
			"points_per_level": -1,
			"modifiers": [
				{
					"type": "modifier",
					"id": "26a11c89-957c-40e7-8019-ee40fa16ed7a",
					"disabled": true,
					"name": "Very Common",
					"reference": "B161",
					"cost_type": "multiplier",
					"cost": 3,
					"notes": "@What@"
				},
				{
					"type": "modifier",
					"id": "1fd3d231-fb8a-4a7f-bef8-91c2b7bb93cb",
					"disabled": true,
					"name": "Common",
					"reference": "B161",
					"cost_type": "multiplier",
					"cost": 2,
					"notes": "@What@"
				},
				{
					"type": "modifier",
					"id": "3a064e40-65f4-4df8-b61e-011ece7d9954",
					"disabled": true,
					"name": "Occasional",
					"reference": "B161",
					"cost_type": "multiplier",
					"cost": 1,
					"notes": "@What@"
				},
				{
					"type": "modifier",
					"id": "954e3d1f-d580-4ca7-944b-d445c24b71ed",
					"disabled": true,
					"name": "Rare",
					"reference": "B161",
					"cost_type": "multiplier",
					"cost": 0.5,
					"notes": "@What@"
				},
				{
					"type": "modifier",
					"id": "c7ec97d0-96d7-4c66-94fc-fc7a1d658291",
					"disabled": true,
					"name": "Cannot be trapped",
					"reference": "B133",
					"cost_type": "percentage",
					"cost": -50,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "9ab2d451-192b-4849-9e5a-97e08978ca3c",
					"disabled": true,
					"name": "Insensitive",
					"reference": "H25",
					"cost_type": "percentage",
					"cost": -50,
					"affects": "total"
				}
			],
			"reference": "B132",
			"calc": {
				"points": -10
			},
			"notes": "May not come within level yards of @What@",
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "2bb0ee0e-a22d-4717-bf7b-ee09fc776fb3",
			"name": "Dreamer",
			"mental": true,
			"base_points": -1,
			"reference": "B164",
			"calc": {
				"points": -1
			},
			"features": [
				{
					"type": "conditional_modifier",
					"amount": -1,
					"situation": "on any long task"
				}
			],
			"categories": [
				"Quirk"
			]
		},
		{
			"type": "advantage",
			"id": "d560a167-5675-411c-a2f2-956304a26c57",
			"name": "Dull",
			"mental": true,
			"base_points": -1,
			"reference": "B164",
			"calc": {
				"points": -1
			},
			"categories": [
				"Quirk"
			]
		},
		{
			"type": "advantage",
			"id": "08ec8fc8-2bf6-4ce6-bd2c-b992681ce194",
			"name": "Duplication",
			"mental": true,
			"physical": true,
			"exotic": true,
			"levels": "1",
			"points_per_level": 35,
			"modifiers": [
				{
					"type": "modifier",
					"id": "06dc87c8-2e0b-4b07-aa2f-25254687774e",
					"disabled": true,
					"name": "Duplicated Gear",
					"reference": "B51",
					"cost_type": "percentage",
					"cost": 100,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "16f3b0da-f33a-4970-ba77-044b8c51985f",
					"disabled": true,
					"name": "No Sympathetic Injury",
					"reference": "B51",
					"cost_type": "percentage",
					"cost": 20,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "d6acfcde-9d4b-4173-8ff4-4a4fa1ecd185",
					"disabled": true,
					"name": "Digital",
					"reference": "B51",
					"cost_type": "percentage",
					"cost": -60,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "94c3a3f6-55a9-4fd5-ad41-e17bdaac4ced",
					"disabled": true,
					"name": "Shared Resources",
					"reference": "B51",
					"cost_type": "percentage",
					"cost": -40,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "f69aa4f5-7e73-4fb7-ae44-f1cfe37b9f68",
					"disabled": true,
					"name": "Construct",
					"reference": "P48",
					"cost_type": "percentage",
					"cost": 60,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "eec5c5b4-22a7-4099-864b-940646cb19fa",
					"disabled": true,
					"name": "Sequential",
					"reference": "P48",
					"cost_type": "percentage",
					"cost": -40,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "9bbc9dfc-c0ab-4a5b-be00-21ce8ae464f9",
					"disabled": true,
					"name": "Multiplication",
					"reference": "SU26",
					"cost_type": "percentage",
					"cost": 20,
					"affects": "total"
				}
			],
			"reference": "B50,P48",
			"calc": {
				"points": 35
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "afc12fc8-21a3-4b87-b541-86148579a289",
			"name": "Duty (@Duty@)",
			"social": true,
			"modifiers": [
				{
					"type": "modifier",
					"id": "fb0c80a4-4c65-4521-9e18-7378dda34a46",
					"disabled": true,
					"name": "FR: 6",
					"cost_type": "points",
					"cost": -2,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "92ade39a-a64c-4ff4-a84b-89ab92a6e217",
					"disabled": true,
					"name": "FR: 9",
					"cost_type": "points",
					"cost": -5,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "80577150-cbdb-4c26-bde4-1ad85a7deec2",
					"disabled": true,
					"name": "FR: 12",
					"cost_type": "points",
					"cost": -10,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "d6406b89-6289-4b8c-b7c7-4d25add3c352",
					"disabled": true,
					"name": "FR: 15",
					"cost_type": "points",
					"cost": -15,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "f4458d02-9b67-42f8-8f31-5837064fb751",
					"disabled": true,
					"name": "Extremely Hazardous",
					"cost_type": "points",
					"cost": -5,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "814f2484-cac1-4eca-af21-f9eaca8c0d0a",
					"disabled": true,
					"name": "Involuntary",
					"cost_type": "points",
					"cost": -5,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "5d87b90f-fc68-4d78-8547-7c2ef58ae7bd",
					"disabled": true,
					"name": "Nonhazardous",
					"cost_type": "points",
					"cost": 5,
					"affects": "total"
				}
			],
			"reference": "B133",
			"calc": {
				"points": 0
			},
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "8999487a-7c11-4d69-8c4c-29b0a387ee98",
			"name": "Dwarfism",
			"physical": true,
			"base_points": -15,
			"reference": "B19",
			"calc": {
				"points": -15
			},
			"features": [
				{
					"type": "attribute_bonus",
					"amount": -1,
					"attribute": "basic_move"
				},
				{
					"type": "skill_bonus",
					"amount": -2,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "disguise"
					}
				},
				{
					"type": "skill_bonus",
					"amount": -2,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "shadowing"
					}
				},
				{
					"type": "attribute_bonus",
					"amount": -1,
					"attribute": "sm"
				}
			],
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "aff5cc76-af5a-48a0-b293-4df0c8e1206b",
			"name": "Dyslexia",
			"mental": true,
			"base_points": -10,
			"reference": "B134",
			"calc": {
				"points": -10
			},
			"notes": "You have a written comprehension level of \\"None\\" for all languages, which cannot be improved",
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "f968d43d-a86f-4321-9d89-550e5dc65790",
			"name": "Easy to Kill",
			"physical": true,
			"levels": "1",
			"points_per_level": -2,
			"reference": "B134",
			"calc": {
				"points": -2
			},
			"features": [
				{
					"type": "conditional_modifier",
					"amount": -1,
					"per_level": true,
					"situation": "to HT rolls made for survival at -HP or below, and on any HT roll where failure means instant death. You may not reduce your HT roll below 3."
				}
			],
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "698e85f9-69d2-42d3-9c40-99064d41559f",
			"name": "Easy to Read",
			"mental": true,
			"base_points": -10,
			"reference": "B134",
			"calc": {
				"points": -10
			},
			"features": [
				{
					"type": "conditional_modifier",
					"amount": 4,
					"situation": "to others on all Empathy, Body Language, and Psychology rolls to discern your intentions or the truth of your words"
				},
				{
					"type": "conditional_modifier",
					"amount": 4,
					"situation": "to others on IQ, Detect Lies, and Gambling rolls in any Quick Contest with your Acting, Fast-Talk, or Gambling skill when you try to lie or bluff"
				}
			],
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "0b3da3e5-9ef2-4982-b324-ce4289c3dd08",
			"name": "Eidetic Memory",
			"mental": true,
			"base_points": 5,
			"modifiers": [
				{
					"type": "modifier",
					"id": "309120f1-8e25-46bf-ba83-6c998f4d9025",
					"disabled": true,
					"name": "Photographic",
					"reference": "B51",
					"cost_type": "points",
					"cost": 5,
					"affects": "total"
				}
			],
			"reference": "B51",
			"calc": {
				"points": 5
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "dd658917-ec5e-49d7-a48e-154e98a1eac6",
			"name": "Elastic Skin",
			"physical": true,
			"exotic": true,
			"base_points": 20,
			"reference": "B51,P48",
			"calc": {
				"points": 20
			},
			"features": [
				{
					"type": "skill_bonus",
					"amount": 4,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "disguise"
					}
				}
			],
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "d9e79f83-2230-4862-ab1f-c2196caa9410",
			"name": "Electrical",
			"physical": true,
			"exotic": true,
			"base_points": -20,
			"reference": "B134",
			"calc": {
				"points": -20
			},
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "5581bccb-9e2f-4e01-b431-626cd9df23ab",
			"name": "Empathy",
			"mental": true,
			"base_points": 15,
			"modifiers": [
				{
					"type": "modifier",
					"id": "15130107-a6e2-4b7f-9092-477a1428f637",
					"disabled": true,
					"name": "Remote",
					"reference": "P48",
					"cost_type": "percentage",
					"cost": 50,
					"affects": "total"
				}
			],
			"reference": "B51,P48",
			"calc": {
				"points": 15
			},
			"features": [
				{
					"type": "skill_bonus",
					"amount": 3,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "detect lies"
					}
				},
				{
					"type": "skill_bonus",
					"amount": 3,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "fortune-telling"
					}
				},
				{
					"type": "skill_bonus",
					"amount": 3,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "psychology"
					}
				}
			],
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "95beefc7-28e0-455c-9292-b9f81ba35249",
			"name": "Empathy (Sensitive)",
			"mental": true,
			"base_points": 5,
			"modifiers": [
				{
					"type": "modifier",
					"id": "8c04f995-be36-4786-9763-d0ce15d1ee75",
					"disabled": true,
					"name": "Remote",
					"reference": "P48",
					"cost_type": "percentage",
					"cost": 50,
					"affects": "total"
				}
			],
			"reference": "B51",
			"calc": {
				"points": 5
			},
			"features": [
				{
					"type": "skill_bonus",
					"amount": 1,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "detect lies"
					}
				},
				{
					"type": "skill_bonus",
					"amount": 1,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "fortune-telling"
					}
				},
				{
					"type": "skill_bonus",
					"amount": 1,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "psychology"
					}
				}
			],
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "1eac5656-2e0d-468f-afb0-3c95c3de761d",
			"name": "Enemy (@Who@)",
			"social": true,
			"modifiers": [
				{
					"type": "modifier",
					"id": "de332956-d4a1-4af6-9339-34f1fa617363",
					"disabled": true,
					"name": "Weak Individual",
					"reference": "B135",
					"cost_type": "points",
					"cost": -5,
					"affects": "total",
					"notes": "50% of your starting points"
				},
				{
					"type": "modifier",
					"id": "73913cf5-78dc-4fa9-93e8-9182656fb07e",
					"disabled": true,
					"name": "Equal Individual",
					"reference": "B135",
					"cost_type": "points",
					"cost": -10,
					"affects": "total",
					"notes": "100% of your starting points"
				},
				{
					"type": "modifier",
					"id": "81b5a233-41ef-48a3-8d98-450dab7c74a2",
					"disabled": true,
					"name": "Powerful Individual",
					"reference": "B135",
					"cost_type": "points",
					"cost": -20,
					"affects": "total",
					"notes": ">150% of your starting points"
				},
				{
					"type": "modifier",
					"id": "4ad57666-9f27-4986-9191-16d65214969b",
					"disabled": true,
					"name": "Weak Group",
					"reference": "B135",
					"cost_type": "points",
					"cost": -10,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "8427a345-55ea-4e91-a797-cef5991899d4",
					"disabled": true,
					"name": "Medium Group",
					"reference": "B135",
					"cost_type": "points",
					"cost": -20,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "4de4b388-72a9-4143-b57b-c3ea069c1600",
					"disabled": true,
					"name": "Appears almost all the time",
					"reference": "B36",
					"cost_type": "multiplier",
					"cost": 3,
					"notes": "15-"
				},
				{
					"type": "modifier",
					"id": "98bee615-b142-4c48-be3d-ce6e87cec21b",
					"disabled": true,
					"name": "Appears quite often",
					"reference": "B36",
					"cost_type": "multiplier",
					"cost": 2,
					"notes": "12-"
				},
				{
					"type": "modifier",
					"id": "8e56e038-28dd-41ed-b516-969294228bca",
					"disabled": true,
					"name": "Appears fairly often",
					"reference": "B36",
					"cost_type": "multiplier",
					"cost": 1,
					"notes": "9-"
				},
				{
					"type": "modifier",
					"id": "04e80fd4-8cc7-423e-8af5-3906657f8cb2",
					"disabled": true,
					"name": "Appears quite rarely",
					"reference": "B36",
					"cost_type": "multiplier",
					"cost": 0.5,
					"notes": "6-"
				},
				{
					"type": "modifier",
					"id": "08aa132f-60f2-4bed-b3a3-ef4321d2f09f",
					"disabled": true,
					"name": "Large/Powerful Group",
					"reference": "B135",
					"cost_type": "points",
					"cost": -30,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "19ea1f4b-fc64-4c1d-8217-1c7f5cd09190",
					"disabled": true,
					"name": "Utterly Formidable Group",
					"reference": "B135",
					"cost_type": "points",
					"cost": -40,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "1f9b2afd-1cb9-460a-ba7d-8315a7698ba8",
					"disabled": true,
					"name": "Unknown",
					"reference": "B135",
					"cost_type": "points",
					"cost": -5,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "f6364f57-15e6-4d03-bc3f-ebf2c4718dac",
					"disabled": true,
					"name": "Evil Twin",
					"reference": "B135",
					"cost_type": "points",
					"cost": 0,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "4560fba2-c960-4c2d-9201-f69dc83ed26f",
					"disabled": true,
					"name": "Evil Twin",
					"reference": "B135",
					"cost_type": "points",
					"cost": -5,
					"affects": "total",
					"notes": "More skilled or extra abilities"
				},
				{
					"type": "modifier",
					"id": "f948ad5e-0ca0-4e8f-84c1-d65105981603",
					"disabled": true,
					"name": "Evil Twin",
					"reference": "B135",
					"cost_type": "points",
					"cost": -10,
					"affects": "total",
					"notes": "More skilled and extra abilities"
				},
				{
					"type": "modifier",
					"id": "43075921-7dd0-468f-9609-296e9f7ebf0b",
					"disabled": true,
					"name": "Watcher",
					"reference": "B135",
					"cost_type": "multiplier",
					"cost": 0.25
				},
				{
					"type": "modifier",
					"id": "85d6d113-01ac-4074-a7ce-21572db84555",
					"disabled": true,
					"name": "Rival",
					"reference": "B135",
					"cost_type": "multiplier",
					"cost": 0.5
				},
				{
					"type": "modifier",
					"id": "1b7c0201-7ba5-46e9-9c3d-2398527a3712",
					"disabled": true,
					"name": "Hunter",
					"reference": "B135",
					"cost_type": "multiplier",
					"cost": 1
				}
			],
			"reference": "B135",
			"calc": {
				"points": 0
			},
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "54a568c1-ed32-459b-9585-8c94284b7818",
			"name": "Enhanced Block",
			"mental": true,
			"levels": "1",
			"points_per_level": 5,
			"reference": "B51,MA43",
			"calc": {
				"points": 5
			},
			"features": [
				{
					"type": "attribute_bonus",
					"amount": 1,
					"per_level": true,
					"attribute": "block"
				}
			],
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "5f691766-367a-45ad-a696-ba3fa674e8cb",
			"name": "Enhanced Dodge",
			"mental": true,
			"levels": "1",
			"points_per_level": 15,
			"reference": "B51,MA43",
			"calc": {
				"points": 15
			},
			"features": [
				{
					"type": "attribute_bonus",
					"amount": 1,
					"per_level": true,
					"attribute": "dodge"
				}
			],
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "bdd03b24-27af-406c-9d91-1a6354ca2489",
			"allow_half_levels": true,
			"name": "Enhanced Move (@type@)",
			"physical": true,
			"exotic": true,
			"levels": "1",
			"points_per_level": 20,
			"modifiers": [
				{
					"type": "modifier",
					"id": "79398643-ba30-4f08-9b12-3405312a3683",
					"disabled": true,
					"name": "Handling Bonus",
					"reference": "B52",
					"cost_type": "percentage",
					"cost": 5,
					"affects": "total",
					"levels": 1
				},
				{
					"type": "modifier",
					"id": "dabd68ec-58b3-401a-af89-de37b838c42c",
					"disabled": true,
					"name": "Handling Penalty",
					"reference": "B52",
					"cost_type": "percentage",
					"cost": -5,
					"affects": "total",
					"levels": 1
				},
				{
					"type": "modifier",
					"id": "e316a3e2-cc8d-4b99-8cd0-bd01ccf20388",
					"disabled": true,
					"name": "Newtonian",
					"reference": "B52",
					"cost_type": "percentage",
					"cost": -50,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "e653e29f-bbea-4a68-8d44-9845da45fad9",
					"disabled": true,
					"name": "Road-Bound",
					"reference": "B52",
					"cost_type": "percentage",
					"cost": -50,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "c02f53b9-8918-478b-a962-3d1a8157f312",
					"disabled": true,
					"name": "All-Out",
					"reference": "P49",
					"cost_type": "percentage",
					"cost": -20,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "ca26e704-8033-4901-bb38-c0e0510ed357",
					"disabled": true,
					"name": "Cosmic",
					"reference": "SU26",
					"cost_type": "percentage",
					"cost": 50,
					"affects": "total",
					"notes": "Instantaneous Acceleration"
				},
				{
					"type": "modifier",
					"id": "fa245c74-9d18-4ca8-8c4e-024c63ccaac1",
					"disabled": true,
					"name": "Cosmic",
					"reference": "SU27",
					"cost_type": "percentage",
					"cost": 50,
					"affects": "total",
					"notes": "Complete Maneuverability"
				}
			],
			"reference": "B52,P49",
			"calc": {
				"points": 20
			},
			"notes": "Multiply normal @type@ Move by 1 + level",
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "e0023e3d-bbdc-409f-b0fe-a6b1f71411a2",
			"name": "Enhanced Parry (@Melee weapon skill@)",
			"mental": true,
			"levels": "1",
			"points_per_level": 5,
			"reference": "B51,MA43",
			"calc": {
				"points": 5
			},
			"features": [
				{
					"type": "conditional_modifier",
					"amount": 1,
					"situation": "to Parry with @Melee weapon skill@"
				}
			],
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "f0f60a7a-d83b-4ef5-9570-61e729e159e9",
			"name": "Enhanced Parry (All parries)",
			"mental": true,
			"levels": "1",
			"points_per_level": 10,
			"reference": "B51,MA43",
			"calc": {
				"points": 10
			},
			"features": [
				{
					"type": "attribute_bonus",
					"amount": 1,
					"per_level": true,
					"attribute": "parry"
				}
			],
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "e57a1c94-a9be-4d5f-9da8-09c751c2c086",
			"name": "Enhanced Parry (Bare hands)",
			"mental": true,
			"levels": "1",
			"points_per_level": 5,
			"reference": "B51",
			"calc": {
				"points": 5
			},
			"features": [
				{
					"type": "conditional_modifier",
					"amount": 1,
					"situation": "to Parry with bare hands"
				}
			],
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "3ab3121b-372e-44da-bde6-14588183a155",
			"name": "Enhanced Time Sense",
			"mental": true,
			"exotic": true,
			"base_points": 45,
			"reference": "B52,MA44",
			"calc": {
				"points": 45
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
							"qualifier": "Combat Reflexes"
						}
					}
				]
			},
			"features": [
				{
					"type": "skill_bonus",
					"amount": 1,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "contains",
						"qualifier": "fast-draw"
					}
				},
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
				},
				{
					"type": "attribute_bonus",
					"amount": 2,
					"attribute": "fright_check"
				},
				{
					"type": "conditional_modifier",
					"amount": 6,
					"situation": "on all IQ rolls to wake up or to recover from surprise or mental stun"
				},
				{
					"type": "conditional_modifier",
					"amount": 1,
					"situation": "to your side on initiative rolls (+2 if you\'re the leader)"
				}
			],
			"notes": "You immediately act in combat before those without Enhanced Time Sense; Never freeze",
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "ce14f74c-fac3-45e6-98a4-ab032cb9d52f",
			"name": "Enhanced Tracking",
			"physical": true,
			"exotic": true,
			"levels": "1",
			"points_per_level": 5,
			"modifiers": [
				{
					"type": "modifier",
					"id": "f76c7193-67d5-47b3-8b4f-0446b38c550e",
					"disabled": true,
					"name": "Multiple Lock-Ons",
					"reference": "P49",
					"cost_type": "percentage",
					"cost": 20,
					"affects": "total"
				}
			],
			"reference": "B53,P49",
			"calc": {
				"points": 5
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "317da0b6-4914-4d51-9a00-2a54d43782d0",
			"name": "Entomophobia (Insects)",
			"mental": true,
			"base_points": -10,
			"cr": 12,
			"cr_adj": "action_penalty",
			"reference": "B150",
			"calc": {
				"points": -10
			},
			"notes": "You are afraid of all “bugs.” Large or poisonous ones give -3 to self-control rolls. Very large ones, or large numbers, give -6. Avoid hills of giant ants.",
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "81842e23-cfbd-47d7-bf57-477ca64e055d",
			"name": "Epilepsy",
			"physical": true,
			"base_points": -30,
			"reference": "B136",
			"calc": {
				"points": -30
			},
			"notes": "Make a HT roll whenever you are in a stressful situation (especially if your life or the life of a friend is threatened). If you have any sort of Phobia, exposure to the object of your fear counts as a stressful situation; roll vs. HT once every 10 minutes. On a failure, you suffer a seizure that lasts 1d minutes and costs you 1d FP. You can do nothing during that time.",
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "e51ecc63-f9f8-48c9-a298-496e32010b53",
			"name": "Expression",
			"mental": true,
			"levels": "0",
			"base_points": -1,
			"reference": "B164",
			"calc": {
				"points": -1
			},
			"notes": "\\"@Saying@\\"",
			"categories": [
				"Quirk"
			]
		},
		{
			"type": "advantage",
			"id": "10973b1a-b73b-4362-b78a-7ad52457d839",
			"name": "Extended Lifespan",
			"physical": true,
			"exotic": true,
			"levels": "1",
			"points_per_level": 2,
			"reference": "B53",
			"calc": {
				"points": 2
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "6c1a5272-b611-40ac-a1de-0087b89a3e56",
			"name": "Extra Arm",
			"physical": true,
			"exotic": true,
			"levels": "1",
			"points_per_level": 10,
			"modifiers": [
				{
					"type": "modifier",
					"id": "a4a4b3db-88eb-412b-8bee-74150d9f3040",
					"disabled": true,
					"name": "Extra-Flexible",
					"reference": "B53",
					"cost_type": "percentage",
					"cost": 50,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "942fdfcb-f239-4c40-9224-2e1507a43e60",
					"disabled": true,
					"name": "Long",
					"reference": "B53",
					"cost_type": "percentage",
					"cost": 100,
					"affects": "total",
					"levels": 1
				},
				{
					"type": "modifier",
					"id": "3b1fbbca-405f-4592-b831-3ae68f98ee38",
					"disabled": true,
					"name": "Foot Manipulators",
					"reference": "B53",
					"cost_type": "percentage",
					"cost": -30,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "82659421-f2c1-4300-9119-c2406b9403fc",
					"disabled": true,
					"name": "No Physical Attack",
					"reference": "B53",
					"cost_type": "percentage",
					"cost": -50,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "c6ffffa4-1d92-4c7d-9aac-2097aa9a944e",
					"disabled": true,
					"name": "Short",
					"reference": "B53",
					"cost_type": "percentage",
					"cost": -50,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "3d074340-af06-4b70-aa84-22da87bb081d",
					"disabled": true,
					"name": "Weak",
					"reference": "B53",
					"cost_type": "percentage",
					"cost": -25,
					"affects": "total",
					"notes": "Half body ST"
				},
				{
					"type": "modifier",
					"id": "b2cccad5-b178-43ec-afc4-eae1c478a0cc",
					"disabled": true,
					"name": "Weak",
					"reference": "B53",
					"cost_type": "percentage",
					"cost": -50,
					"affects": "total",
					"notes": "Quarter body ST"
				},
				{
					"type": "modifier",
					"id": "9c654aa3-228f-4f8b-9f0f-58672c44ea9a",
					"disabled": true,
					"name": "Weapon Mount",
					"reference": "B53",
					"cost_type": "percentage",
					"cost": -80,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "e6cb0172-3f80-40db-a521-1c88f00105f6",
					"disabled": true,
					"name": "No Grasping Hand",
					"reference": "MATG28",
					"cost_type": "percentage",
					"cost": -40,
					"affects": "total"
				}
			],
			"reference": "B53",
			"calc": {
				"points": 10
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "5c829387-ad51-4765-acb3-363526658fd4",
			"name": "Extra Attack",
			"physical": true,
			"levels": "1",
			"points_per_level": 25,
			"modifiers": [
				{
					"type": "modifier",
					"id": "93a98a1c-c1a9-4435-91ca-749a69332a0f",
					"disabled": true,
					"name": "Multi-Strike",
					"reference": "P49",
					"cost_type": "percentage",
					"cost": 20,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "0a903be4-0089-4554-9aa0-c1992ba1c7db",
					"disabled": true,
					"name": "Single Skill",
					"reference": "P49",
					"cost_type": "percentage",
					"cost": -20,
					"affects": "total",
					"notes": "@Skill@"
				}
			],
			"reference": "B53,P49,MA44",
			"calc": {
				"points": 25
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "4aec1709-0f45-461a-b72d-879f26b22e5f",
			"name": "Extra Fatigue Points",
			"physical": true,
			"levels": "1",
			"points_per_level": 3,
			"reference": "B16",
			"calc": {
				"points": 3
			},
			"features": [
				{
					"type": "attribute_bonus",
					"amount": 1,
					"per_level": true,
					"attribute": "fp"
				}
			],
			"categories": [
				"Advantage",
				"Attribute"
			]
		},
		{
			"type": "advantage",
			"id": "5c827048-75a3-4899-9cba-498b08d6e85c",
			"name": "Extra Fatigue Points",
			"physical": true,
			"levels": "1",
			"points_per_level": 3,
			"modifiers": [
				{
					"type": "modifier",
					"id": "45214028-e559-4766-a2e7-144aa0c8e5ce",
					"name": "Magic Only",
					"cost_type": "percentage",
					"cost": -10,
					"affects": "total",
					"notes": "Subject to involuntary FP drain"
				}
			],
			"reference": "B16",
			"calc": {
				"points": 3
			},
			"categories": [
				"Advantage",
				"Attribute"
			]
		},
		{
			"type": "advantage",
			"id": "1961983f-bc1a-4120-8fd3-13894e334995",
			"name": "Extra Head",
			"physical": true,
			"levels": "1",
			"points_per_level": 15,
			"modifiers": [
				{
					"type": "modifier",
					"id": "7f302706-640a-4325-a824-9c45b26aefb8",
					"disabled": true,
					"name": "Extraneous",
					"reference": "B54",
					"cost_type": "percentage",
					"cost": -20,
					"affects": "total"
				}
			],
			"reference": "B54",
			"calc": {
				"points": 15
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "191c3ab3-b135-499d-bb85-53828206a4b4",
			"name": "Extra Hit Points",
			"physical": true,
			"levels": "1",
			"points_per_level": 2,
			"modifiers": [
				{
					"type": "modifier",
					"id": "910bfd80-869d-46d8-aa30-5c7c5bae59a4",
					"disabled": true,
					"name": "Size",
					"cost_type": "percentage",
					"cost": -10,
					"affects": "total",
					"levels": 1
				},
				{
					"type": "modifier",
					"id": "c8507381-4dc6-4aa2-9f6c-f6298e772f03",
					"disabled": true,
					"name": "No Fine Manipulators",
					"cost_type": "percentage",
					"cost": -40,
					"affects": "total"
				}
			],
			"reference": "B16",
			"calc": {
				"points": 2
			},
			"features": [
				{
					"type": "attribute_bonus",
					"amount": 1,
					"per_level": true,
					"attribute": "hp"
				}
			],
			"categories": [
				"Advantage",
				"Attribute"
			]
		},
		{
			"type": "advantage",
			"id": "cf875dd7-1d65-4c22-9b9c-30848c1d3d5d",
			"name": "Extra Legs",
			"physical": true,
			"exotic": true,
			"modifiers": [
				{
					"type": "modifier",
					"id": "a89ee115-6a18-4524-911a-2566b8a30625",
					"disabled": true,
					"name": "@3 or 4@",
					"reference": "B54",
					"cost_type": "points",
					"cost": 5,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "abd75efb-89ee-4d46-a18f-8009d6ce19ad",
					"disabled": true,
					"name": "@5 or 6@",
					"reference": "B55",
					"cost_type": "points",
					"cost": 10,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "6639c262-12d3-486e-a428-747ddffe3a1b",
					"disabled": true,
					"name": "@7+@",
					"reference": "B55",
					"cost_type": "points",
					"cost": 15,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "145e8ef9-8230-4184-9a4f-e4205e475964",
					"disabled": true,
					"name": "Long",
					"reference": "B55",
					"cost_type": "percentage",
					"cost": 100,
					"affects": "total",
					"levels": 1
				},
				{
					"type": "modifier",
					"id": "456497b3-3df5-4c41-a02e-23c21ba5c780",
					"disabled": true,
					"name": "Cannot Kick",
					"reference": "B55",
					"cost_type": "percentage",
					"cost": -50,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "f45fe2c9-1576-42d0-a98a-c7f495df7b5e",
					"disabled": true,
					"name": "Extra Flexible",
					"reference": "MATG27",
					"cost_type": "percentage",
					"cost": 50,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "6e155478-b830-4718-a134-188f08d2f0bf",
					"disabled": true,
					"name": "Prehensile Feet",
					"reference": "MATG28",
					"cost_type": "percentage",
					"cost": 20,
					"affects": "total"
				}
			],
			"reference": "B54",
			"calc": {
				"points": 0
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "31024b75-45be-4976-a261-1becc81e1fb2",
			"name": "Extra Life",
			"mental": true,
			"exotic": true,
			"levels": "1",
			"points_per_level": 25,
			"modifiers": [
				{
					"type": "modifier",
					"id": "a3306518-3b87-4aee-81ae-dc3f22d6e14a",
					"disabled": true,
					"name": "Copy",
					"reference": "B55",
					"cost_type": "percentage",
					"cost": -20,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "f039db6b-bd60-4bf0-a322-f0495cb185f8",
					"disabled": true,
					"name": "Requires Body",
					"reference": "B55",
					"cost_type": "percentage",
					"cost": -20,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "739fb53c-ef1a-4e34-bb37-074b6b66899f",
					"disabled": true,
					"name": "Requires Body",
					"reference": "B55",
					"cost_type": "percentage",
					"cost": -40,
					"affects": "total",
					"notes": "@Illegal, rare or expensive body@"
				},
				{
					"type": "modifier",
					"id": "b0d4534a-0b0c-4fda-bf4e-c10b75c4f6e4",
					"disabled": true,
					"name": "Brain Pod",
					"reference": "RSWL19",
					"cost_type": "percentage",
					"cost": -20,
					"affects": "total"
				}
			],
			"reference": "B55",
			"calc": {
				"points": 25
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "ac964106-43b8-43bb-8dc3-0e4822c5ad52",
			"name": "Extra Mouth",
			"physical": true,
			"exotic": true,
			"levels": "1",
			"points_per_level": 5,
			"reference": "B55",
			"calc": {
				"points": 5
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "5ad9c2bd-fe8e-4c7a-9fba-96b8c0837b60",
			"name": "Extra Sleep",
			"physical": true,
			"levels": "1",
			"points_per_level": -2,
			"reference": "B136",
			"calc": {
				"points": -2
			},
			"notes": "Require 1 hour/level more sleep for a full night\'s rest (max 4)",
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "9a28293b-1ccc-4cfb-8c86-d78cde3342a8",
			"name": "Extraordinary Luck",
			"mental": true,
			"base_points": 30,
			"modifiers": [
				{
					"type": "modifier",
					"id": "ce98072c-602b-43f3-8eee-302019194e73",
					"disabled": true,
					"name": "Active",
					"reference": "B66",
					"cost_type": "percentage",
					"cost": -40,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "92d81ffe-3420-42a5-9d8c-f3d3d124c45c",
					"disabled": true,
					"name": "Aspected",
					"reference": "B66",
					"cost_type": "percentage",
					"cost": -20,
					"affects": "total",
					"notes": "@Aspect@"
				},
				{
					"type": "modifier",
					"id": "f19083da-6b06-4316-9297-66ab804adb4f",
					"disabled": true,
					"name": "Defensive",
					"reference": "B66",
					"cost_type": "percentage",
					"cost": -20,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "7493e850-b3cb-44f7-be30-9aea7a1cff7f",
					"disabled": true,
					"name": "Wishing",
					"reference": "P59",
					"cost_type": "percentage",
					"cost": 100,
					"affects": "total"
				}
			],
			"reference": "B66",
			"calc": {
				"points": 30
			},
			"notes": "Usable once per 30 minutes of play",
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "2c4a0734-adce-4d8d-a108-53cfdbb8e838",
			"name": "Fanaticism (@Group or ideal@)",
			"mental": true,
			"base_points": -15,
			"modifiers": [
				{
					"type": "modifier",
					"id": "478df057-c461-425c-8d04-17a240d0e6e4",
					"disabled": true,
					"name": "Extreme",
					"reference": "B136",
					"cost_type": "percentage",
					"cost": 0,
					"affects": "total"
				}
			],
			"reference": "B136",
			"calc": {
				"points": -15
			},
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "24d3f998-c478-4b7a-acf8-5ed5c3f7926a",
			"name": "Fangs",
			"physical": true,
			"exotic": true,
			"base_points": 2,
			"weapons": [
				{
					"type": "melee_weapon",
					"damage": {
						"type": "imp",
						"st": "thr",
						"base": "-1"
					},
					"usage": "Bite",
					"reach": "C",
					"parry": "No",
					"block": "No",
					"calc": {
						"level": 0,
						"parry": "No",
						"block": "No",
						"damage": "thr-1 imp"
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
				"points": 2
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "549d97d6-7088-4c78-bde7-e5001280b4eb",
			"name": "Fashion Sense",
			"mental": true,
			"base_points": 5,
			"reference": "B21",
			"calc": {
				"points": 5
			},
			"features": [
				{
					"type": "reaction_bonus",
					"amount": 1,
					"situation": "from others in social situations when you have a chance to plan your attire in advance"
				},
				{
					"type": "conditional_modifier",
					"amount": 1,
					"situation": "to someone else\'s reaction bonus from others when you put together their outfit"
				}
			],
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "1ed095f2-3ef4-4d7e-b00c-b235bcff6d8a",
			"name": "Fat",
			"physical": true,
			"base_points": -3,
			"reference": "B19",
			"calc": {
				"points": -3
			},
			"prereqs": {
				"type": "prereq_list",
				"all": true,
				"prereqs": [
					{
						"type": "attribute_prereq",
						"has": true,
						"which": "ht",
						"qualifier": {
							"compare": "at_most",
							"qualifier": 15
						}
					}
				]
			},
			"features": [
				{
					"type": "skill_bonus",
					"amount": -2,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "disguise"
					}
				},
				{
					"type": "skill_bonus",
					"amount": -2,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "shadowing"
					}
				},
				{
					"type": "skill_bonus",
					"amount": 3,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "swimming"
					}
				},
				{
					"type": "conditional_modifier",
					"amount": 2,
					"situation": "to ST vs knockback"
				}
			],
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "e5ca8d03-48db-441c-90a8-e346e147bb9c",
			"name": "Fearfulness",
			"mental": true,
			"levels": "1",
			"points_per_level": -2,
			"reference": "B136",
			"calc": {
				"points": -2
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
							"qualifier": "fearlessness"
						}
					}
				]
			},
			"features": [
				{
					"type": "attribute_bonus",
					"amount": -1,
					"per_level": true,
					"attribute": "fright_check"
				}
			],
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "5bfcb01b-307c-497a-b362-42c7cc62967f",
			"name": "Fearlessness",
			"mental": true,
			"levels": "1",
			"points_per_level": 2,
			"reference": "B55,MA44",
			"calc": {
				"points": 2
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
							"qualifier": "Fearfulness"
						}
					}
				]
			},
			"features": [
				{
					"type": "attribute_bonus",
					"amount": 1,
					"per_level": true,
					"attribute": "fright_check"
				}
			],
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "5ef9db1e-150c-42b6-b3c8-88e1e519922c",
			"name": "Fewer Fatigue Points",
			"physical": true,
			"levels": "1",
			"points_per_level": -3,
			"reference": "B16",
			"calc": {
				"points": -3
			},
			"features": [
				{
					"type": "attribute_bonus",
					"amount": -1,
					"per_level": true,
					"attribute": "fp"
				}
			],
			"categories": [
				"Attribute",
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "53d2584b-78cb-472b-87ad-b911f98cd510",
			"name": "Fewer Hit Points",
			"physical": true,
			"levels": "1",
			"points_per_level": -2,
			"reference": "B16",
			"calc": {
				"points": -2
			},
			"features": [
				{
					"type": "attribute_bonus",
					"amount": -1,
					"per_level": true,
					"attribute": "hp"
				}
			],
			"categories": [
				"Attribute",
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "238fdc15-f346-4b8c-9817-34e4caeb82d2",
			"name": "Filter Lungs",
			"physical": true,
			"exotic": true,
			"base_points": 5,
			"reference": "B55",
			"calc": {
				"points": 5
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "d93a66a3-94f3-410d-9119-13fb5f1b8171",
			"name": "Filthy Rich",
			"social": true,
			"base_points": 50,
			"reference": "B25",
			"calc": {
				"points": 50
			},
			"notes": "Starting wealth is 100x normal",
			"categories": [
				"Advantage",
				"Wealth"
			]
		},
		{
			"type": "advantage",
			"id": "30963b5e-c943-4f40-9521-bf181e7f207f",
			"name": "Fit",
			"physical": true,
			"base_points": 5,
			"reference": "B55",
			"calc": {
				"points": 5
			},
			"features": [
				{
					"type": "conditional_modifier",
					"amount": 1,
					"situation": "to all HT rolls to stay conscious, avoid death, resist disease, or resist poison"
				}
			],
			"notes": "Recover FP at twice the normal rate (but not FP spent for spells or psi powers)",
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "6e5526d2-66ae-4d7a-918a-7838e1478477",
			"name": "Flashbacks",
			"physical": true,
			"modifiers": [
				{
					"type": "modifier",
					"id": "e66d07e9-3a32-4993-9ec4-ab99f97d440e",
					"disabled": true,
					"name": "Mild",
					"reference": "B136",
					"cost_type": "points",
					"cost": -5,
					"affects": "total",
					"notes": "Duration: 2d seconds; -2 on all skill rolls"
				},
				{
					"type": "modifier",
					"id": "dea65bf7-f5a5-408b-be53-69896a7394b9",
					"disabled": true,
					"name": "Severe",
					"reference": "B136",
					"cost_type": "points",
					"cost": -10,
					"affects": "total",
					"notes": "Duration: 1d minutes; -5 on all skill rolls"
				},
				{
					"type": "modifier",
					"id": "9529ef70-5491-4e2e-b152-9c00304b6972",
					"disabled": true,
					"name": "Crippling",
					"cost_type": "points",
					"cost": -20,
					"affects": "total",
					"notes": "Duration: 3d minutes; Precludes all skill use"
				}
			],
			"reference": "B136",
			"calc": {
				"points": 0
			},
			"notes": "In any situation that the GM feels is stressful, he will roll 3d. On a 6 or less, you have a flashback. The GM will roll whenever you miss a Fright Check or make the roll exactly, and whenever you fail a self-control roll for another stress-related disadvantage.",
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "21b1f468-9725-44aa-a0f2-978d9cde1937",
			"name": "Flexibility",
			"physical": true,
			"base_points": 5,
			"reference": "B56,MA44",
			"calc": {
				"points": 5
			},
			"features": [
				{
					"type": "skill_bonus",
					"amount": 3,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "climbing"
					}
				},
				{
					"type": "skill_bonus",
					"amount": 3,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "escape"
					}
				},
				{
					"type": "skill_bonus",
					"amount": 3,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "erotic art"
					}
				},
				{
					"type": "conditional_modifier",
					"amount": -3,
					"situation": "in penalties may be ignored when due to close quarters"
				}
			],
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "f5e498a7-528c-493c-a793-e9854fe79dc8",
			"name": "Flexibility (Double-Jointed)",
			"physical": true,
			"base_points": 15,
			"reference": "B56",
			"calc": {
				"points": 15
			},
			"features": [
				{
					"type": "skill_bonus",
					"amount": 5,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "climbing"
					}
				},
				{
					"type": "skill_bonus",
					"amount": 5,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "escape"
					}
				},
				{
					"type": "skill_bonus",
					"amount": 5,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "erotic art"
					}
				},
				{
					"type": "conditional_modifier",
					"amount": -5,
					"situation": "in penalties may be ignored when due to close quarters"
				}
			],
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "e12493bf-51f3-4f78-baad-714d3d34b535",
			"name": "Flight",
			"physical": true,
			"exotic": true,
			"base_points": 40,
			"modifiers": [
				{
					"type": "modifier",
					"id": "6ad7ecc5-8832-4a9c-82b4-85254a94daf5",
					"disabled": true,
					"name": "Newtonian Space Flight",
					"reference": "B56",
					"cost_type": "percentage",
					"cost": 25,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "48fd82c3-d8f0-4be7-a69b-1d5c7897f608",
					"disabled": true,
					"name": "Space Flight",
					"reference": "B56",
					"cost_type": "percentage",
					"cost": 50,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "b53b501f-2ecc-4c99-8766-5766e670ce73",
					"disabled": true,
					"name": "Cannot Hover",
					"reference": "B56",
					"cost_type": "percentage",
					"cost": -15,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "6c2b8127-d1d7-4201-bfb4-8fdb13f344e6",
					"disabled": true,
					"name": "Controlled Gliding",
					"reference": "B56",
					"cost_type": "percentage",
					"cost": -45,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "0c826766-8e63-4205-aa62-db6598e2b4f0",
					"disabled": true,
					"name": "Gliding",
					"reference": "B56",
					"cost_type": "percentage",
					"cost": -50,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "19cb7f15-94dc-4622-b798-4eb2d8dd1668",
					"disabled": true,
					"name": "Lighter Than Air",
					"reference": "B56",
					"cost_type": "percentage",
					"cost": -10,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "b924f3a8-46a9-41ca-93ee-8c6980e1624f",
					"disabled": true,
					"name": "Low Ceiling",
					"reference": "B56",
					"cost_type": "percentage",
					"cost": -10,
					"affects": "total",
					"notes": "30\'"
				},
				{
					"type": "modifier",
					"id": "3fdb4313-9cea-4ecd-915e-82a3d9208033",
					"disabled": true,
					"name": "Low Ceiling",
					"reference": "B56",
					"cost_type": "percentage",
					"cost": -20,
					"affects": "total",
					"notes": "10\'"
				},
				{
					"type": "modifier",
					"id": "033099c0-2248-40a9-bc8a-d505297693e8",
					"disabled": true,
					"name": "Low Ceiling",
					"reference": "B56",
					"cost_type": "percentage",
					"cost": -25,
					"affects": "total",
					"notes": "5\'"
				},
				{
					"type": "modifier",
					"id": "eedf31a5-c7ad-4967-9c43-ec1cc31f3680",
					"disabled": true,
					"name": "Small Wings",
					"reference": "B56",
					"cost_type": "percentage",
					"cost": -10,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "3c786352-fa26-4862-8b6a-6cfef78a995c",
					"disabled": true,
					"name": "Space Flight Only",
					"reference": "B56",
					"cost_type": "percentage",
					"cost": -75,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "ef21e56c-ec8d-4d9f-9643-c5ff26f41ad7",
					"disabled": true,
					"name": "Winged",
					"reference": "B56",
					"cost_type": "percentage",
					"cost": -25,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "6551975e-39ce-4013-bf89-1eda2fd4f32e",
					"disabled": true,
					"name": "Planetary",
					"reference": "P50",
					"cost_type": "percentage",
					"cost": -5,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "0151bb33-5645-42aa-afbe-414074cceffb",
					"disabled": true,
					"name": "Requires Surface",
					"reference": "P50",
					"cost_type": "percentage",
					"cost": -20,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "af1cb269-ac6e-4b29-9173-99380703cbf7",
					"disabled": true,
					"name": "Slow",
					"reference": "PSI14",
					"cost_type": "percentage",
					"cost": -25,
					"affects": "total",
					"notes": "Basic Speed"
				},
				{
					"type": "modifier",
					"id": "ecf503cc-493c-4d8a-a0d9-7aa0b79c2bd2",
					"disabled": true,
					"name": "Slow, Move 1",
					"reference": "PSI14",
					"cost_type": "percentage",
					"cost": -45,
					"affects": "total"
				}
			],
			"reference": "B56,P50,PSI14",
			"calc": {
				"points": 40
			},
			"notes": "Air Move is Basic Speed x 2 (drop all fractions)",
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "314db04a-c778-41f3-961d-9571ed5780bf",
			"name": "Fragile (Brittle)",
			"physical": true,
			"exotic": true,
			"base_points": -15,
			"reference": "B136",
			"calc": {
				"points": -15
			},
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "95852e1c-83a6-4941-94bd-f53353b86c42",
			"name": "Fragile (Combustible)",
			"physical": true,
			"exotic": true,
			"base_points": -5,
			"reference": "B136",
			"calc": {
				"points": -5
			},
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "e46381fa-d70b-442a-8746-9494e3fddae1",
			"name": "Fragile (Explosive)",
			"physical": true,
			"exotic": true,
			"base_points": -15,
			"reference": "B137",
			"calc": {
				"points": -15
			},
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "06bb6e36-083b-4543-bcb3-336daa16e2a1",
			"name": "Fragile (Flammable)",
			"physical": true,
			"exotic": true,
			"base_points": -10,
			"reference": "B137",
			"calc": {
				"points": -10
			},
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "cc574fa7-dc7b-48ce-b59b-364188e13da5",
			"name": "Fragile (Unnatural)",
			"physical": true,
			"exotic": true,
			"base_points": -50,
			"reference": "B137",
			"calc": {
				"points": -50
			},
			"notes": "Automatically fail HT roll to stay alive if reduced to -HP or below",
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "12897114-1d09-4642-83c4-080eafc1d5b4",
			"name": "Frightens Animals",
			"mental": true,
			"supernatural": true,
			"base_points": -10,
			"reference": "B137",
			"calc": {
				"points": -10
			},
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "923f65c8-d5c0-4b16-82d1-29e2dc5baa15",
			"name": "Fur",
			"physical": true,
			"exotic": true,
			"base_points": 1,
			"reference": "B101",
			"calc": {
				"points": 1
			},
			"categories": [
				"Perk"
			]
		},
		{
			"type": "advantage",
			"id": "56498945-e5ab-47a0-96e0-06d48497e345",
			"name": "G-Experience",
			"mental": true,
			"levels": "1",
			"points_per_level": 1,
			"reference": "B57",
			"calc": {
				"points": 1
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "2426af56-f400-44e0-b585-3ace31835a71",
			"name": "G-Experience (All)",
			"mental": true,
			"base_points": 10,
			"reference": "B57",
			"calc": {
				"points": 10
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "f65acca1-f4a4-4cf6-bf85-61029c2231bb",
			"name": "G-Intolerance (0.1G increment)",
			"physical": true,
			"base_points": -10,
			"reference": "B137",
			"calc": {
				"points": -10
			},
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "d735e560-b267-47c3-85cc-0ce505ff59fe",
			"name": "G-Intolerance (0.05G increment)",
			"physical": true,
			"base_points": -20,
			"reference": "B137",
			"calc": {
				"points": -20
			},
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "e0c703d9-60ab-4eaa-a2f1-9ac704462cb8",
			"name": "Gadgeteer",
			"mental": true,
			"base_points": 25,
			"modifiers": [
				{
					"type": "modifier",
					"id": "b406c46f-502c-47b3-9be8-5bfb710578cf",
					"disabled": true,
					"name": "Quick",
					"reference": "B57",
					"cost_type": "points",
					"cost": 25,
					"affects": "total"
				}
			],
			"reference": "B57",
			"calc": {
				"points": 25
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "e5dfa930-cd7f-4473-a5c2-6c010fd316bf",
			"name": "Gigantism",
			"physical": true,
			"reference": "B20",
			"calc": {
				"points": 0
			},
			"features": [
				{
					"type": "attribute_bonus",
					"amount": 1,
					"attribute": "basic_move"
				},
				{
					"type": "skill_bonus",
					"amount": -2,
					"selection_type": "skills_with_name",
					"specialization": {
						"compare": "is_not",
						"qualifier": "animals"
					},
					"name": {
						"compare": "is",
						"qualifier": "disguise"
					}
				},
				{
					"type": "skill_bonus",
					"amount": -2,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "shadowing"
					}
				},
				{
					"type": "attribute_bonus",
					"amount": 1,
					"attribute": "sm"
				}
			],
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "7a82138c-1341-48cf-ae22-b061ddfb4fec",
			"name": "Gizmo",
			"mental": true,
			"levels": "1",
			"points_per_level": 5,
			"reference": "B57,MA45",
			"calc": {
				"points": 5
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "8dfb17db-1a7f-49f5-af74-38ced79d3875",
			"name": "Gluttony",
			"mental": true,
			"base_points": -5,
			"cr": 12,
			"reference": "B137",
			"calc": {
				"points": -5
			},
			"notes": "Make a self-control roll when presented with a tempting morsel or good wine that, for some reason, you should resist. If you fail, you partake – regardless of the consequences.",
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "b7a0c1db-f40a-471a-857f-e0c88e218d72",
			"name": "Greed",
			"mental": true,
			"base_points": -15,
			"cr": 12,
			"reference": "B137",
			"calc": {
				"points": -15
			},
			"notes": "Make a self-control roll any time riches are offered – as payment for fair work, gains from adventure, spoils of crime, or just bait. If you fail, you do whatever it takes to get the payoff.",
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "4b19af3b-a279-40f8-9451-e05aefb1aee3",
			"name": "Gregarious",
			"mental": true,
			"base_points": -10,
			"reference": "B126",
			"calc": {
				"points": -10
			},
			"features": [
				{
					"type": "reaction_bonus",
					"amount": 4,
					"situation": "to others"
				},
				{
					"type": "conditional_modifier",
					"amount": -2,
					"situation": "to IQ-based skills when alone, or only -1 if in a group of 4 or less"
				}
			],
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "5d8c5bdd-b9d4-4162-bfdc-e97b105a3b20",
			"name": "Growth",
			"physical": true,
			"exotic": true,
			"levels": "1",
			"points_per_level": 10,
			"modifiers": [
				{
					"type": "modifier",
					"id": "64550492-083e-4c4a-a86b-2b212e7d3ead",
					"disabled": true,
					"name": "Maximum Size Only",
					"reference": "B58",
					"cost_type": "percentage",
					"cost": 0,
					"affects": "total"
				}
			],
			"reference": "B58,P50",
			"calc": {
				"points": 10
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "3f66d9eb-38a0-4914-a13c-bfcd7de462d9",
			"name": "Guilt Complex",
			"mental": true,
			"base_points": -5,
			"reference": "B137",
			"calc": {
				"points": -5
			},
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "40536343-685d-4a93-9e35-4f9513eec973",
			"name": "Gullibility",
			"mental": true,
			"base_points": -10,
			"cr": 12,
			"reference": "B137",
			"calc": {
				"points": -10
			},
			"prereqs": {
				"type": "prereq_list",
				"all": true,
				"prereqs": [
					{
						"type": "skill_prereq",
						"has": false,
						"name": {
							"compare": "is",
							"qualifier": "detect lies"
						}
					}
				]
			},
			"features": [
				{
					"type": "skill_bonus",
					"amount": -3,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "merchant"
					}
				}
			],
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "f0a6cb7c-ce23-4ad2-8a3c-03f2af07c328",
			"name": "Gunslinger",
			"mental": true,
			"base_points": 25,
			"modifiers": [
				{
					"type": "modifier",
					"id": "30a02fdb-7ce9-4fd9-a0ac-a94396ad076a",
					"disabled": true,
					"name": "Arsenal",
					"reference": "GF16",
					"cost_type": "percentage",
					"cost": -20,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "2198c5c5-2969-429c-8f3b-0e32b0e8f5f1",
					"disabled": true,
					"name": "Gun Rack",
					"reference": "GF16",
					"cost_type": "percentage",
					"cost": -40,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "ce2e8e9d-da3d-4462-b1dc-401d29ccb0e1",
					"disabled": true,
					"name": "Type",
					"reference": "GF16",
					"cost_type": "percentage",
					"cost": -60,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "6908987a-73aa-426c-b99e-8ca50cff8f9f",
					"disabled": true,
					"name": "Model",
					"reference": "GF16",
					"cost_type": "percentage",
					"cost": -80,
					"affects": "total"
				}
			],
			"reference": "B58,MA45",
			"calc": {
				"points": 25
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "20470e79-97e9-4330-92a4-35fbc0f0c2ae",
			"name": "Habit",
			"mental": true,
			"levels": "0",
			"base_points": -1,
			"reference": "B164",
			"calc": {
				"points": -1
			},
			"notes": "@Habit@",
			"categories": [
				"Quirk"
			]
		},
		{
			"type": "advantage",
			"id": "29b9aea5-2c57-4879-b7bd-4267233618aa",
			"name": "Ham-Fisted",
			"physical": true,
			"levels": "1",
			"points_per_level": -5,
			"reference": "B138",
			"calc": {
				"points": -5
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
							"qualifier": "high manual dexterity"
						}
					}
				]
			},
			"features": [
				{
					"type": "skill_bonus",
					"amount": -3,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "contains",
						"qualifier": "artist"
					}
				},
				{
					"type": "skill_bonus",
					"amount": -3,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "jeweler"
					}
				},
				{
					"type": "skill_bonus",
					"amount": -3,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "knot-tying"
					}
				},
				{
					"type": "skill_bonus",
					"amount": -3,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "leatherworking"
					}
				},
				{
					"type": "skill_bonus",
					"amount": -3,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "lockpicking"
					}
				},
				{
					"type": "skill_bonus",
					"amount": -3,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "pickpocket"
					}
				},
				{
					"type": "skill_bonus",
					"amount": -3,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "sewing"
					}
				},
				{
					"type": "skill_bonus",
					"amount": -3,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "sleight of hand"
					}
				},
				{
					"type": "skill_bonus",
					"amount": -3,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "surgery"
					}
				},
				{
					"type": "skill_bonus",
					"amount": -3,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "machinist"
					}
				},
				{
					"type": "skill_bonus",
					"amount": -3,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "contains",
						"qualifier": "mechanic"
					}
				},
				{
					"type": "skill_bonus",
					"amount": -3,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "contains",
						"qualifier": "fast-draw"
					}
				},
				{
					"type": "reaction_bonus",
					"amount": -1,
					"per_level": true,
					"situation": "from others where being tidy or well-groomed would matter"
				},
				{
					"type": "reaction_bonus",
					"amount": -1,
					"per_level": true,
					"situation": "to any Influence roll where being tidy or well-groomed would matter"
				}
			],
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "a62238d3-a7d7-496b-9666-d8c7fe152f74",
			"name": "Hard of Hearing",
			"physical": true,
			"base_points": -10,
			"reference": "B138",
			"calc": {
				"points": -10
			},
			"features": [
				{
					"type": "attribute_bonus",
					"amount": -4,
					"attribute": "hearing"
				},
				{
					"type": "conditional_modifier",
					"amount": -4,
					"situation": "to any skill roll where it is important that you understand someone speaking"
				}
			],
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "ec09545b-d95e-43ce-b0ac-91bb8bc0d294",
			"name": "Hard to Kill",
			"physical": true,
			"levels": "1",
			"points_per_level": 2,
			"reference": "B58",
			"calc": {
				"points": 2
			},
			"features": [
				{
					"type": "conditional_modifier",
					"amount": 1,
					"per_level": true,
					"situation": "to HT rolls made for survival at -HP or below, and on any HT roll where failure means instant death. If this bonus makes the difference between success and failure, you collapse, apparently dead (or disabled), but come to in the usual amount of time. A successful Diagnosis roll reveals the truth."
				}
			],
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "defaf12a-c0e9-41f3-922c-89c25a3e70ea",
			"name": "Hard to Subdue",
			"physical": true,
			"levels": "1",
			"points_per_level": 2,
			"reference": "B59",
			"calc": {
				"points": 2
			},
			"features": [
				{
					"type": "conditional_modifier",
					"amount": 1,
					"per_level": true,
					"situation": "to any HT roll to avoid unconsciousness"
				}
			],
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "24252ab6-3576-40cb-a049-4fe3dbb06ac8",
			"name": "Healing",
			"mental": true,
			"exotic": true,
			"base_points": 30,
			"modifiers": [
				{
					"type": "modifier",
					"id": "bba3192a-7571-4c82-a69f-d331c9baa720",
					"disabled": true,
					"name": "Faith Healing",
					"reference": "B59",
					"cost_type": "percentage",
					"cost": 20,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "5e6b1294-e3ba-4718-925a-3274831e9991",
					"disabled": true,
					"name": "Xenohealing",
					"reference": "B59",
					"cost_type": "percentage",
					"cost": 20,
					"affects": "total",
					"notes": "All Mammals"
				},
				{
					"type": "modifier",
					"id": "6532082a-8b8a-49c0-85e4-47556068668a",
					"disabled": true,
					"name": "Xenohealing",
					"reference": "B59",
					"cost_type": "percentage",
					"cost": 40,
					"affects": "total",
					"notes": "All Earthly Life"
				},
				{
					"type": "modifier",
					"id": "8eccd81e-4803-409e-ad5d-e427beb77cd6",
					"disabled": true,
					"name": "Xenohealing",
					"reference": "B59",
					"cost_type": "percentage",
					"cost": 60,
					"affects": "total",
					"notes": "All Carbon-Based Life"
				},
				{
					"type": "modifier",
					"id": "399ab66a-3763-4cc5-b335-3c4e8c69a24c",
					"disabled": true,
					"name": "Xenohealing",
					"reference": "B59",
					"cost_type": "percentage",
					"cost": 80,
					"affects": "total",
					"notes": "Anything Alive"
				},
				{
					"type": "modifier",
					"id": "ff993d1f-034e-43c3-9fe4-cd4d52ffb130",
					"disabled": true,
					"name": "Xenohealing",
					"reference": "B59",
					"cost_type": "percentage",
					"cost": 100,
					"affects": "total",
					"notes": "Anything Animate"
				},
				{
					"type": "modifier",
					"id": "527037e9-28cd-4bb1-9321-a979bc495cb2",
					"disabled": true,
					"name": "Disease Only",
					"reference": "B59",
					"cost_type": "percentage",
					"cost": -40,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "1f5d5f74-706d-4287-ba1d-47b16b53d457",
					"disabled": true,
					"name": "Injuries Only",
					"reference": "B59",
					"cost_type": "percentage",
					"cost": -20,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "3a272e23-ca77-42e9-827a-d8be53006a84",
					"disabled": true,
					"name": "Own Race Only",
					"reference": "B59",
					"cost_type": "percentage",
					"cost": -20,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "f9993b8c-5b39-4e1e-b2f4-c7c80ef0d2ae",
					"disabled": true,
					"name": "Psychic Healing",
					"reference": "B59",
					"cost_type": "percentage",
					"cost": -10,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "129983ab-8dc5-412a-91df-d40fcb2e0acc",
					"disabled": true,
					"name": "Affects Self",
					"reference": "P51",
					"cost_type": "percentage",
					"cost": 50,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "013bc89e-d08b-4208-ba20-ac31c0ebc8f3",
					"disabled": true,
					"name": "Cure Affliction",
					"reference": "P51",
					"cost_type": "percentage",
					"cost": 60,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "4ebea4b1-ed77-49d5-94bb-b336845e5981",
					"disabled": true,
					"name": "Affliction Only",
					"reference": "P51",
					"cost_type": "percentage",
					"cost": -40,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "1218fadc-d473-4a56-a849-c665954ca1e0",
					"disabled": true,
					"name": "Capped",
					"reference": "P51",
					"cost_type": "percentage",
					"cost": -25,
					"affects": "total",
					"notes": "2 FP"
				},
				{
					"type": "modifier",
					"id": "f824e930-4c27-4ab0-9cbe-6c049e3600b0",
					"disabled": true,
					"name": "Capped",
					"reference": "P51",
					"cost_type": "percentage",
					"cost": -20,
					"affects": "total",
					"notes": "4 FP"
				},
				{
					"type": "modifier",
					"id": "c8e4b56a-07af-4452-8bbb-e6a2892d7a88",
					"disabled": true,
					"name": "Capped",
					"reference": "P51",
					"cost_type": "percentage",
					"cost": -15,
					"affects": "total",
					"notes": "6 FP"
				},
				{
					"type": "modifier",
					"id": "4f27cf98-a413-4945-9be1-7828df4bf07b",
					"disabled": true,
					"name": "Capped",
					"reference": "P51",
					"cost_type": "percentage",
					"cost": -10,
					"affects": "total",
					"notes": "8 FP"
				},
				{
					"type": "modifier",
					"id": "c8f40584-eec8-4668-b2d3-66991c5413c7",
					"disabled": true,
					"name": "Capped",
					"reference": "P51",
					"cost_type": "percentage",
					"cost": -5,
					"affects": "total",
					"notes": "10 FP"
				},
				{
					"type": "modifier",
					"id": "a22bb62e-0894-466a-84f0-6de1ffefcea5",
					"disabled": true,
					"name": "Empathic",
					"reference": "P51",
					"cost_type": "percentage",
					"cost": -50,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "cc59ab25-7662-4ba9-9b35-5ce9702fff8e",
					"disabled": true,
					"name": "Restore Limbs",
					"reference": "PSI14",
					"cost_type": "percentage",
					"cost": 80,
					"affects": "total"
				}
			],
			"reference": "B59,P51,PSI14",
			"calc": {
				"points": 30
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "edcfa8d3-063c-4337-bbc6-f2597c0f2680",
			"name": "Heliophobia (Sun)",
			"mental": true,
			"base_points": -15,
			"cr": 12,
			"cr_adj": "action_penalty",
			"reference": "B150",
			"calc": {
				"points": -15
			},
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "cc26a06d-bfba-49ca-89c5-8c3fcf6065da",
			"name": "Hemophilia",
			"physical": true,
			"base_points": -30,
			"reference": "B138",
			"calc": {
				"points": -30
			},
			"prereqs": {
				"type": "prereq_list",
				"all": true,
				"prereqs": [
					{
						"type": "attribute_prereq",
						"has": true,
						"which": "ht",
						"qualifier": {
							"compare": "at_most",
							"qualifier": 10
						}
					}
				]
			},
			"notes": "Any untreated wound bleeds at a rate equal to its original damage every minute",
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "9b27ce82-e114-49b2-be3d-58d78c5a7d8c",
			"name": "Hemophobia (Blood)",
			"mental": true,
			"base_points": -10,
			"cr": 12,
			"cr_adj": "action_penalty",
			"reference": "B149",
			"calc": {
				"points": -10
			},
			"notes": "The sight of blood gives you the screaming willies! You need to make a self-control roll during most combats...",
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "ae4900f3-edca-45e4-86e1-bb76530abe95",
			"name": "Hermaphromorph",
			"physical": true,
			"exotic": true,
			"base_points": 5,
			"reference": "B59",
			"calc": {
				"points": 5
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "30b83f35-7eeb-43c9-8962-34f45e04dbf3",
			"name": "Heroic Feats of @One of Strength, Dexterity, or Health@",
			"mental": true,
			"supernatural": true,
			"base_points": 10,
			"reference": "B41",
			"calc": {
				"points": 10
			},
			"notes": "Once per game session, you may add 1d to @One of Strength, Dexterity, or Health@, which lasts 3d seconds",
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "bdc9cc1a-6b8b-48ad-9833-ddf7fea97392",
			"name": "Herpetophobia (Reptiles)",
			"mental": true,
			"base_points": -10,
			"cr": 12,
			"cr_adj": "action_penalty",
			"reference": "B150",
			"calc": {
				"points": -10
			},
			"notes": "You come unglued at the thought of reptiles, amphibians, and similar scaly slimies. A very large reptile, or a poisonous one, gives -2 to self-control rolls; a horde of reptiles (such as a snake pit) gives -4.",
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "4226edcf-2ac0-453f-8692-e61905e8921d",
			"name": "Hidebound",
			"mental": true,
			"base_points": -5,
			"reference": "B138",
			"calc": {
				"points": -5
			},
			"features": [
				{
					"type": "conditional_modifier",
					"amount": -2,
					"situation": "on any task that requires creativity or invention, including most rolls against Artist skill, all Engineer rolls for new inventions, and all skill rolls made to use the Gadgeteer advantage"
				}
			],
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "22228b89-7c80-4441-9ff3-ac569bfaf1b1",
			"name": "High Manual Dexterity",
			"physical": true,
			"levels": "1",
			"points_per_level": 5,
			"reference": "B59",
			"calc": {
				"points": 5
			},
			"features": [
				{
					"type": "skill_bonus",
					"amount": 1,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "contains",
						"qualifier": "artist"
					}
				},
				{
					"type": "skill_bonus",
					"amount": 1,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "jeweler"
					}
				},
				{
					"type": "skill_bonus",
					"amount": 1,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "knot-tying"
					}
				},
				{
					"type": "skill_bonus",
					"amount": 1,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "leatherworking"
					}
				},
				{
					"type": "skill_bonus",
					"amount": 1,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "lockpicking"
					}
				},
				{
					"type": "skill_bonus",
					"amount": 1,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "pickpocket"
					}
				},
				{
					"type": "skill_bonus",
					"amount": 1,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "sewing"
					}
				},
				{
					"type": "skill_bonus",
					"amount": 1,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "sleight of hand"
					}
				},
				{
					"type": "skill_bonus",
					"amount": 1,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "surgery"
					}
				},
				{
					"type": "skill_bonus",
					"amount": 1,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "machinist"
					}
				},
				{
					"type": "skill_bonus",
					"amount": 1,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "contains",
						"qualifier": "mechanic"
					}
				}
			],
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "c603ba10-9788-4c71-967e-be6c089b0bd2",
			"name": "High Pain Threshold",
			"physical": true,
			"base_points": 10,
			"reference": "B59",
			"calc": {
				"points": 10
			},
			"features": [
				{
					"type": "conditional_modifier",
					"amount": 3,
					"situation": "on all HT rolls to avoid knockdown and stunning"
				},
				{
					"type": "conditional_modifier",
					"amount": 3,
					"situation": "to resist torture"
				}
			],
			"notes": "Never suffer shock penalties when injured",
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "81a9e50b-9204-4ffc-907b-b5a170ed81fc",
			"name": "High TL",
			"mental": true,
			"levels": "1",
			"points_per_level": 5,
			"reference": "B23",
			"calc": {
				"points": 5
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "463d7759-e478-48cc-b483-c9d182acee7f",
			"name": "Higher Purpose",
			"mental": true,
			"exotic": true,
			"base_points": 5,
			"reference": "B59",
			"calc": {
				"points": 5
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "7255d058-ce5b-4ec3-8730-dab0d41aeafa",
			"name": "Honest Face",
			"physical": true,
			"base_points": 1,
			"reference": "B101",
			"calc": {
				"points": 1
			},
			"features": [
				{
					"type": "conditional_modifier",
					"amount": 1,
					"situation": "to trained Acting skill for the sole purpose of \\"acting innocent\\""
				}
			],
			"categories": [
				"Perk"
			]
		},
		{
			"type": "advantage",
			"id": "e9b12a42-c2b7-436e-9752-75438eebbb44",
			"name": "Honesty",
			"mental": true,
			"base_points": -10,
			"cr": 12,
			"reference": "B138",
			"calc": {
				"points": -10
			},
			"notes": "Make a self-control roll when faced with the “need” to break unreasonable laws; if you fail, you must obey the law, whatever the consequences. If you manage to resist your urges and break the law, make a second self-control roll afterward. If you fail, you must turn yourself in to the authorities!",
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "1421b44f-2729-4ca3-80d0-c0cf57d0a818",
			"name": "Hooves",
			"physical": true,
			"base_points": 3,
			"weapons": [
				{
					"type": "melee_weapon",
					"damage": {
						"type": "cr",
						"st": "thr",
						"modifier_per_die": 1
					},
					"usage": "Trample",
					"reach": "C,1",
					"parry": "No",
					"block": "No",
					"calc": {
						"level": 0,
						"parry": "No",
						"block": "No",
						"damage": "thr (+1 per die) cr"
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
			"features": [
				{
					"type": "dr_bonus",
					"amount": 1,
					"location": "foot"
				}
			],
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "d642a33f-906b-438d-9836-c104cc77823e",
			"name": "Hoplophobia (Weapons)",
			"mental": true,
			"base_points": -20,
			"cr": 12,
			"cr_adj": "action_penalty",
			"reference": "B150",
			"calc": {
				"points": -20
			},
			"notes": "The presence of any sort of weaponry is stressful. Trying to use a weapon, or being threatened with one, requires a self-control roll at -2.",
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "8355954c-26f6-42b4-a44c-d57b5a171895",
			"name": "Horizontal",
			"physical": true,
			"exotic": true,
			"base_points": -10,
			"reference": "B139",
			"calc": {
				"points": -10
			},
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "c0169c8e-4530-4faf-8805-b90c5c1b409b",
			"name": "Horrible Hangovers",
			"physical": true,
			"base_points": -1,
			"reference": "B165",
			"calc": {
				"points": -1
			},
			"features": [
				{
					"type": "conditional_modifier",
					"amount": -3,
					"situation": "added to any penalties assessed for excessive drinking the previous evening and add 3 hours to hangover duration"
				}
			],
			"categories": [
				"Quirk"
			]
		},
		{
			"type": "advantage",
			"id": "0e7b4095-ece5-41d6-819d-1f1126ba84a7",
			"name": "Humble",
			"mental": true,
			"base_points": -1,
			"reference": "B164",
			"calc": {
				"points": -1
			},
			"categories": [
				"Quirk"
			]
		},
		{
			"type": "advantage",
			"id": "9529068e-bf65-450a-b04e-5edfbd496d1f",
			"name": "Hunchback",
			"physical": true,
			"base_points": -10,
			"modifiers": [
				{
					"type": "modifier",
					"id": "d47eeba8-96e5-4fcd-8455-1c125ca554a5",
					"disabled": true,
					"name": "DX penalty if not wearing custom-made clothing and armor",
					"reference": "B139",
					"cost_type": "percentage",
					"cost": 0,
					"affects": "total",
					"features": [
						{
							"type": "attribute_bonus",
							"amount": -1,
							"attribute": "dx"
						}
					],
					"notes": "Clothing and armor costs 10% more than usual"
				}
			],
			"reference": "B139",
			"calc": {
				"points": -10
			},
			"prereqs": {
				"type": "prereq_list",
				"all": true,
				"prereqs": [
					{
						"type": "advantage_prereq",
						"has": true,
						"name": {
							"compare": "is",
							"qualifier": "Appearance (Beautiful)"
						}
					},
					{
						"type": "advantage_prereq",
						"has": true,
						"name": {
							"compare": "is",
							"qualifier": "Appearance (Handsome)"
						}
					},
					{
						"type": "advantage_prereq",
						"has": true,
						"name": {
							"compare": "is",
							"qualifier": "Appearance (Very Beautiful)"
						}
					},
					{
						"type": "advantage_prereq",
						"has": true,
						"name": {
							"compare": "is",
							"qualifier": "Appearance (Very Handsome)"
						}
					},
					{
						"type": "advantage_prereq",
						"has": false,
						"name": {
							"compare": "is",
							"qualifier": "Appearance (Attractive)"
						}
					}
				]
			},
			"features": [
				{
					"type": "skill_bonus",
					"amount": -3,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "disguise"
					}
				},
				{
					"type": "skill_bonus",
					"amount": -3,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "shadowing"
					}
				},
				{
					"type": "reaction_bonus",
					"amount": -1,
					"situation": "from others"
				},
				{
					"type": "conditional_modifier",
					"amount": 3,
					"situation": "to others attempting to identify or follow you"
				}
			],
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "1bd075f4-b04a-440f-9483-41a05ecfd4db",
			"name": "Hyperspectral Vision",
			"physical": true,
			"exotic": true,
			"base_points": 25,
			"modifiers": [
				{
					"type": "modifier",
					"id": "5fad754c-890d-45a8-a82e-cd514d8f51eb",
					"disabled": true,
					"name": "Extended Low-Band",
					"reference": "B60",
					"cost_type": "percentage",
					"cost": 30,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "aaf3f5a6-880b-4b10-9784-2ad92b93fdf4",
					"disabled": true,
					"name": "Extended High-Band",
					"reference": "B60",
					"cost_type": "percentage",
					"cost": 30,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "dd67917c-d2df-43bb-9f51-7fc564a47a03",
					"disabled": true,
					"name": "Extended",
					"reference": "P52",
					"cost_type": "percentage",
					"cost": 30,
					"affects": "total",
					"notes": "@Special@"
				}
			],
			"reference": "B60,P51",
			"calc": {
				"points": 25
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
							"qualifier": "infravision"
						}
					},
					{
						"type": "advantage_prereq",
						"has": false,
						"name": {
							"compare": "is",
							"qualifier": "ultravision"
						}
					}
				]
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "d661e939-dee0-41ef-95bb-fdc84b5d1ac5",
			"name": "Illuminated",
			"mental": true,
			"supernatural": true,
			"base_points": 15,
			"reference": "B60",
			"calc": {
				"points": 15
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "3d73e028-af63-4c40-963b-a52d31df4577",
			"name": "Imaginative",
			"mental": true,
			"base_points": -1,
			"reference": "B164",
			"calc": {
				"points": -1
			},
			"categories": [
				"Quirk"
			]
		},
		{
			"type": "advantage",
			"id": "b221e78e-489e-4e44-8d1f-e6d5aeb7f429",
			"name": "Impaling Striker (@Body Part@)",
			"physical": true,
			"exotic": true,
			"base_points": 8,
			"weapons": [
				{
					"type": "melee_weapon",
					"damage": {
						"type": "imp",
						"st": "thr",
						"modifier_per_die": 1
					},
					"reach": "C",
					"parry": "0",
					"block": "No",
					"calc": {
						"level": 0,
						"parry": "0",
						"block": "No",
						"damage": "thr (+1 per die) imp"
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
			"reference": "B88",
			"calc": {
				"points": 8
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "1f1d9592-8114-4b93-b7bb-9b1f33f6088e",
			"name": "Improved G-tolerance",
			"physical": true,
			"modifiers": [
				{
					"type": "modifier",
					"id": "329f36f7-2f56-4595-a439-d6d7ceb722da",
					"disabled": true,
					"name": "0.3G",
					"reference": "B60",
					"cost_type": "points",
					"cost": 5,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "f974ad25-1b2d-4400-8a2e-ed1c315b90d4",
					"disabled": true,
					"name": "0.5G",
					"reference": "B60",
					"cost_type": "points",
					"cost": 10,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "64b8c7e5-bfc0-4819-88c8-04444cd7d848",
					"disabled": true,
					"name": "1G",
					"reference": "B60",
					"cost_type": "points",
					"cost": 15,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "8ccb99b0-305d-475d-8c3e-6c24c519f033",
					"disabled": true,
					"name": "5G",
					"reference": "B60",
					"cost_type": "points",
					"cost": 20,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "93779a78-e4fc-4306-a1fc-6cf389fe3cf0",
					"disabled": true,
					"name": "10G",
					"reference": "B60",
					"cost_type": "points",
					"cost": 25,
					"affects": "total"
				}
			],
			"reference": "B60",
			"calc": {
				"points": 0
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "96247355-0a89-4ae0-a89e-be3a97d31591",
			"name": "Impulsiveness",
			"mental": true,
			"base_points": -10,
			"cr": 12,
			"reference": "B139",
			"calc": {
				"points": -10
			},
			"notes": "Make a self-control roll whenever it would be wise to wait and ponder. If you fail, you must act",
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "e9f8bb20-c5f2-4d2e-aa84-c51e2694e999",
			"name": "Incompetence (@Skill@)",
			"mental": true,
			"levels": "0",
			"base_points": -1,
			"reference": "B164",
			"calc": {
				"points": -1
			},
			"features": [
				{
					"type": "skill_bonus",
					"amount": -4,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "@Skill@"
					}
				}
			],
			"notes": "May only know @Skill@ at default (i.e. no points spent)",
			"categories": [
				"Quirk"
			]
		},
		{
			"type": "advantage",
			"id": "94652862-d400-4cb5-a2aa-cb49c68ce668",
			"name": "Increased Basic Move",
			"physical": true,
			"levels": "1",
			"points_per_level": 5,
			"reference": "B17",
			"calc": {
				"points": 5
			},
			"features": [
				{
					"type": "attribute_bonus",
					"amount": 1,
					"per_level": true,
					"attribute": "basic_move"
				}
			],
			"categories": [
				"Advantage",
				"Attribute"
			]
		},
		{
			"type": "advantage",
			"id": "1db6b8ee-8be2-4b38-8239-70489cf1dbb0",
			"name": "Increased Basic Speed",
			"physical": true,
			"levels": "1",
			"points_per_level": 5,
			"reference": "B17",
			"calc": {
				"points": 5
			},
			"features": [
				{
					"type": "attribute_bonus",
					"amount": 0.25,
					"decimal": true,
					"per_level": true,
					"attribute": "basic_speed"
				}
			],
			"categories": [
				"Advantage",
				"Attribute"
			]
		},
		{
			"type": "advantage",
			"id": "ff5098ba-255e-4b1c-802d-493c80f56200",
			"name": "Increased Consumption",
			"physical": true,
			"modifiers": [
				{
					"type": "modifier",
					"id": "7007ee4f-9997-431c-a0df-c1b4247b9156",
					"disabled": true,
					"name": "Consumption x2",
					"reference": "B139",
					"cost_type": "points",
					"cost": -10,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "6bee8a11-a82a-4562-8832-9b8b9a053500",
					"disabled": true,
					"name": "Consumption x4",
					"reference": "B139",
					"cost_type": "points",
					"cost": -20,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "9b84556f-c65d-4b0f-a9fe-d0a3d8feff8e",
					"disabled": true,
					"name": "Consumption x8",
					"reference": "B139",
					"cost_type": "points",
					"cost": -30,
					"affects": "total"
				}
			],
			"reference": "B139",
			"calc": {
				"points": 0
			},
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "67ea46eb-fcd0-4c60-b76a-1be42c38b521",
			"name": "Increased Dexterity",
			"physical": true,
			"levels": "1",
			"points_per_level": 20,
			"modifiers": [
				{
					"type": "modifier",
					"id": "26b39aca-fc45-404a-9dbd-be0e55323b67",
					"disabled": true,
					"name": "No Fine Manipulators",
					"cost_type": "percentage",
					"cost": -40,
					"affects": "total"
				}
			],
			"reference": "B15",
			"calc": {
				"points": 20
			},
			"features": [
				{
					"type": "attribute_bonus",
					"amount": 1,
					"per_level": true,
					"attribute": "dx"
				}
			],
			"categories": [
				"Advantage",
				"Attribute"
			]
		},
		{
			"type": "advantage",
			"id": "01e6b5a6-d396-4011-9f2e-bc943712fac9",
			"name": "Increased Health",
			"physical": true,
			"levels": "1",
			"points_per_level": 10,
			"reference": "B14",
			"calc": {
				"points": 10
			},
			"features": [
				{
					"type": "attribute_bonus",
					"amount": 1,
					"per_level": true,
					"attribute": "ht"
				}
			],
			"categories": [
				"Advantage",
				"Attribute"
			]
		},
		{
			"type": "advantage",
			"id": "25acb265-040d-41b5-82cf-80da17db93f6",
			"name": "Increased Intelligence",
			"mental": true,
			"levels": "1",
			"points_per_level": 20,
			"reference": "B15",
			"calc": {
				"points": 20
			},
			"features": [
				{
					"type": "attribute_bonus",
					"amount": 1,
					"per_level": true,
					"attribute": "iq"
				}
			],
			"categories": [
				"Advantage",
				"Attribute"
			]
		},
		{
			"type": "advantage",
			"id": "d4540c36-67cc-404c-8c90-21c6c3571e54",
			"name": "Increased Life Support (Extreme Cold, below 0)",
			"physical": true,
			"exotic": true,
			"base_points": -10,
			"reference": "B139",
			"calc": {
				"points": -10
			},
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "1750314e-e987-496a-9afb-d5af462fc483",
			"name": "Increased Life Support (Extreme Heat, above 200)",
			"physical": true,
			"exotic": true,
			"base_points": -10,
			"reference": "B139",
			"calc": {
				"points": -10
			},
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "5c2148ba-43e2-4bd1-842d-c3cd6b46388a",
			"name": "Increased Life Support (Massive)",
			"physical": true,
			"exotic": true,
			"base_points": -10,
			"reference": "B139",
			"calc": {
				"points": -10
			},
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "fce72abd-66db-4e7b-86a7-53ef87f041c5",
			"name": "Increased Life Support (Pressurized)",
			"physical": true,
			"exotic": true,
			"base_points": -10,
			"reference": "B139",
			"calc": {
				"points": -10
			},
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "5b5c318f-50ea-4c2c-894f-5ecabf00d640",
			"name": "Increased Life Support (Radioactive)",
			"physical": true,
			"exotic": true,
			"base_points": -10,
			"reference": "B139",
			"calc": {
				"points": -10
			},
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "d9f09cca-9509-462c-9c62-cb68952bfd78",
			"name": "Increased Perception",
			"mental": true,
			"physical": true,
			"levels": "1",
			"points_per_level": 5,
			"reference": "B16",
			"calc": {
				"points": 5
			},
			"features": [
				{
					"type": "attribute_bonus",
					"amount": 1,
					"per_level": true,
					"attribute": "per"
				}
			],
			"categories": [
				"Advantage",
				"Attribute"
			]
		},
		{
			"type": "advantage",
			"id": "f3ec0e8b-53d2-4f14-ba46-29c1f62a7b7b",
			"name": "Increased Strength",
			"physical": true,
			"levels": "1",
			"points_per_level": 10,
			"modifiers": [
				{
					"type": "modifier",
					"id": "fc2b398f-467b-4c36-857b-98087975f0c4",
					"disabled": true,
					"name": "No Fine Manipulators",
					"reference": "B15",
					"cost_type": "percentage",
					"cost": -40,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "89e24b12-233b-4ad9-a77a-934e7bc640f7",
					"disabled": true,
					"name": "Size",
					"reference": "B15",
					"cost_type": "percentage",
					"cost": -10,
					"affects": "total",
					"levels": 1
				},
				{
					"type": "modifier",
					"id": "4f3a7bdb-ed81-4735-87e8-d9eaeb4856c7",
					"disabled": true,
					"name": "Super-Effort",
					"reference": "SU24",
					"cost_type": "percentage",
					"cost": 300,
					"affects": "total"
				}
			],
			"reference": "B14",
			"calc": {
				"points": 10
			},
			"features": [
				{
					"type": "attribute_bonus",
					"amount": 1,
					"per_level": true,
					"attribute": "st"
				}
			],
			"categories": [
				"Advantage",
				"Attribute"
			]
		},
		{
			"type": "advantage",
			"id": "0f874718-e1a7-4d4f-8855-c067c4e57917",
			"name": "Increased Will",
			"mental": true,
			"levels": "1",
			"points_per_level": 5,
			"reference": "B16",
			"calc": {
				"points": 5
			},
			"features": [
				{
					"type": "attribute_bonus",
					"amount": 1,
					"per_level": true,
					"attribute": "will"
				}
			],
			"categories": [
				"Advantage",
				"Attribute"
			]
		},
		{
			"type": "advantage",
			"id": "672f266f-4e98-4e9f-91ef-ffc64b4d2d82",
			"name": "Incurious",
			"mental": true,
			"base_points": -5,
			"cr": 12,
			"reference": "B140",
			"calc": {
				"points": -5
			},
			"features": [
				{
					"type": "reaction_bonus",
					"amount": -1,
					"situation": "to new things"
				}
			],
			"notes": "Make a self-control roll when confronted with something strange. If you fail, you ignore it!",
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "300f1f8c-dec7-48d6-affb-01f0a2da82cb",
			"name": "Indecisive",
			"mental": true,
			"base_points": -10,
			"cr": 12,
			"reference": "B140",
			"calc": {
				"points": -10
			},
			"notes": "Make a self-control roll whenever a choice confronts you, modified downward by 1 for each alternative you can see. If you fail, you do nothing.",
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "fbba0230-2f88-47a2-a089-b1f38ac3dc99",
			"name": "Independent Income",
			"social": true,
			"levels": "1",
			"points_per_level": 1,
			"reference": "B26",
			"calc": {
				"points": 1
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "ac22577e-4f37-48ca-8304-1c3d27211231",
			"name": "Indomitable",
			"mental": true,
			"base_points": 15,
			"reference": "B60",
			"calc": {
				"points": 15
			},
			"notes": "Impossible to influence through ordinary words or actions",
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "f26788f3-52bb-44b2-a452-db700db0c204",
			"name": "Infectious Attack",
			"physical": true,
			"supernatural": true,
			"base_points": -5,
			"reference": "B140",
			"calc": {
				"points": -5
			},
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "e48b78cb-454b-491d-b3d0-bb649f879596",
			"name": "Infravision",
			"physical": true,
			"exotic": true,
			"base_points": 10,
			"modifiers": [
				{
					"type": "modifier",
					"id": "3e2a555d-c6fe-44a5-ad72-d83e881f28fc",
					"disabled": true,
					"name": "No normal vision",
					"reference": "B60",
					"cost_type": "points",
					"cost": -10,
					"affects": "total"
				}
			],
			"reference": "B60,P87",
			"calc": {
				"points": 10
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "1f296ba5-d5f1-43c4-87ef-bd7f65d45b44",
			"name": "Injury Tolerance",
			"physical": true,
			"exotic": true,
			"modifiers": [
				{
					"type": "modifier",
					"id": "26605205-a95d-4690-9dc0-cc648294a15e",
					"disabled": true,
					"name": "Diffuse",
					"reference": "B60",
					"cost_type": "points",
					"cost": 100,
					"affects": "total",
					"notes": "Immune to crippling injuries. Brain, Vitals and Groin cannot be targeted. Most foes cannot slam or grapple you (GM\'s decision). Do not bleed. Unaffected by blood-borne toxins. Immune to attacks that rely on cutting off blood to part of your body. Impaling and piercing attacks of any size never do more than 1 HP of injury, regardless of penetrating damage. Other attacks never do more than 2 HP of injury. Exception: Area-effect, cone, and explosion attacks cause normal injury"
				},
				{
					"type": "modifier",
					"id": "e98b0c17-141f-45ca-aaf2-5d6ff9f9ab87",
					"disabled": true,
					"name": "Homogenous",
					"reference": "B60",
					"cost_type": "points",
					"cost": 40,
					"affects": "total",
					"notes": "Altered wound modifiers: imp & pi++ are x1/2, pi+ is x1/3, pi is x1/5, pi- is x1/10"
				},
				{
					"type": "modifier",
					"id": "27ef0bd2-f4b7-4c88-9bd4-c84557d3f790",
					"disabled": true,
					"name": "No Blood",
					"reference": "B61",
					"cost_type": "points",
					"cost": 5,
					"affects": "total",
					"notes": "Do not bleed, unaffected by blood-borne toxins, immune to attacks that rely on cutting off blood to part of your body"
				},
				{
					"type": "modifier",
					"id": "4fa959a6-3b06-42d4-b9a9-ad02e2a7f809",
					"disabled": true,
					"name": "No Brain",
					"reference": "B61",
					"cost_type": "points",
					"cost": 5,
					"affects": "total",
					"notes": "Brain cannot be targeted. Blows to the skull or eye are treated like blows to the face, except that eye injury can still cripple the eye"
				},
				{
					"type": "modifier",
					"id": "ff796ec8-c350-48cc-b6a2-74f7c48bc261",
					"disabled": true,
					"name": "No Eyes",
					"reference": "B61",
					"cost_type": "points",
					"cost": 5,
					"affects": "total",
					"notes": "Eyes may not be targeted. Immune to blinding attacks"
				},
				{
					"type": "modifier",
					"id": "cdab2614-a6a1-47ea-8c7c-f42698d872cb",
					"disabled": true,
					"name": "No Head",
					"reference": "B61",
					"cost_type": "points",
					"cost": 7,
					"affects": "total",
					"notes": "Skull, Brain and Face cannot be targeted"
				},
				{
					"type": "modifier",
					"id": "e0ef00ad-30d2-494c-8ceb-931ff304cb1f",
					"disabled": true,
					"name": "No Neck",
					"reference": "B61",
					"cost_type": "points",
					"cost": 5,
					"affects": "total",
					"notes": "Neck may not be targeted and cannot be decapitated, choked or strangled"
				},
				{
					"type": "modifier",
					"id": "a4374f61-3843-4e33-b1f4-a2890ee6cba1",
					"disabled": true,
					"name": "No Vitals",
					"reference": "B61",
					"cost_type": "points",
					"cost": 5,
					"affects": "total",
					"notes": "Attacks to the Vitals or Groin are treated as attacks to the Torso"
				},
				{
					"type": "modifier",
					"id": "8d81f217-bc0f-443a-b6cb-281287f84a77",
					"disabled": true,
					"name": "Unliving",
					"reference": "B61",
					"cost_type": "points",
					"cost": 20,
					"affects": "total",
					"notes": "Altered wound modifiers: imp & pi++ are x1, pi+ is x1/2, pi is x1/3, pi- is x1/5"
				}
			],
			"reference": "B60,P52,MA45",
			"calc": {
				"points": 0
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "0b5fae97-dba5-420a-a7f0-ae79fffe3bc7",
			"name": "Innate Attack (Burn)",
			"physical": true,
			"exotic": true,
			"levels": "1",
			"points_per_level": 5,
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "burn",
						"base": "1d"
					},
					"accuracy": "3",
					"range": "10/100",
					"rate_of_fire": "1",
					"recoil": "1",
					"calc": {
						"level": 0,
						"range": "10/100",
						"damage": "1d burn"
					},
					"defaults": [
						{
							"type": "skill",
							"name": "Innate Attack",
							"specialization": "@Attack Type@"
						},
						{
							"type": "skill",
							"name": "Innate Attack",
							"modifier": -2
						},
						{
							"type": "dx",
							"modifier": -4
						}
					]
				}
			],
			"modifiers": [
				{
					"type": "modifier",
					"id": "43590304-7133-40ce-949e-deff1c1b93c2",
					"disabled": true,
					"name": "Cyclic",
					"reference": "B103",
					"cost_type": "percentage",
					"cost": 100,
					"affects": "total",
					"levels": 1,
					"notes": "1 sec"
				},
				{
					"type": "modifier",
					"id": "18dbeeb5-e68c-4ab5-9303-1384370dfef7",
					"disabled": true,
					"name": "Cyclic",
					"reference": "B103",
					"cost_type": "percentage",
					"cost": 50,
					"affects": "total",
					"levels": 1,
					"notes": "10 sec"
				},
				{
					"type": "modifier",
					"id": "c46b9811-1c50-4cf2-b580-4aec5333d604",
					"disabled": true,
					"name": "Cyclic",
					"reference": "B103",
					"cost_type": "percentage",
					"cost": 40,
					"affects": "total",
					"levels": 1,
					"notes": "1 min"
				},
				{
					"type": "modifier",
					"id": "57d3d5e1-95b1-448c-a6bd-c60743f4f180",
					"disabled": true,
					"name": "Cyclic",
					"reference": "B103",
					"cost_type": "percentage",
					"cost": 20,
					"affects": "total",
					"levels": 1,
					"notes": "1 hr"
				},
				{
					"type": "modifier",
					"id": "3d66a8c0-76e0-403f-8bd2-7dc19fc231af",
					"disabled": true,
					"name": "Cyclic",
					"reference": "B103",
					"cost_type": "percentage",
					"cost": 10,
					"affects": "total",
					"levels": 1,
					"notes": "1 day"
				},
				{
					"type": "modifier",
					"id": "1e31e06e-21ac-4f9b-9f53-426ea447a68c",
					"disabled": true,
					"name": "Cyclic",
					"reference": "B103",
					"cost_type": "percentage",
					"cost": 50,
					"affects": "total",
					"levels": 1,
					"notes": "1 sec; Resistible"
				},
				{
					"type": "modifier",
					"id": "5328014e-acb3-478a-b2e1-1523dcffdffb",
					"disabled": true,
					"name": "Cyclic",
					"reference": "B103",
					"cost_type": "percentage",
					"cost": 25,
					"affects": "total",
					"levels": 1,
					"notes": "10 sec; Resistible"
				},
				{
					"type": "modifier",
					"id": "31df85fe-1e9a-4618-bd81-e33d77621215",
					"disabled": true,
					"name": "Cyclic",
					"reference": "B103",
					"cost_type": "percentage",
					"cost": 20,
					"affects": "total",
					"levels": 1,
					"notes": "1 min; Resistible"
				},
				{
					"type": "modifier",
					"id": "f1638ba4-5f91-4e17-af60-e12a9654e1a3",
					"disabled": true,
					"name": "Cyclic",
					"reference": "B103",
					"cost_type": "percentage",
					"cost": 10,
					"affects": "total",
					"levels": 1,
					"notes": "1 hr; Resistible"
				},
				{
					"type": "modifier",
					"id": "381c286a-9e3e-4164-93d6-781e1b4d63dc",
					"disabled": true,
					"name": "Cyclic",
					"reference": "B103",
					"cost_type": "percentage",
					"cost": 5,
					"affects": "total",
					"levels": 1,
					"notes": "1 day; Resistible"
				},
				{
					"type": "modifier",
					"id": "e8312ca8-1d6f-41be-bb51-0f76456a7c62",
					"disabled": true,
					"name": "Contagious",
					"reference": "B103",
					"cost_type": "percentage",
					"cost": 20,
					"affects": "total",
					"notes": "Mildly"
				},
				{
					"type": "modifier",
					"id": "f0179fb0-adfc-49f6-92d0-995f94ae4fef",
					"disabled": true,
					"name": "Contagious",
					"reference": "B103",
					"cost_type": "percentage",
					"cost": 50,
					"affects": "total",
					"notes": "Highly"
				},
				{
					"type": "modifier",
					"id": "90caed7d-c665-4b56-9e99-28736cb070f5",
					"disabled": true,
					"name": "Double Blunt Trauma",
					"reference": "B104",
					"cost_type": "percentage",
					"cost": 20,
					"affects": "total",
					"notes": "1HP per 10 dmg"
				},
				{
					"type": "modifier",
					"id": "6aacb4ba-74f8-43a5-b9e1-a11b10eecdfa",
					"disabled": true,
					"name": "Explosion",
					"reference": "B104",
					"cost_type": "percentage",
					"cost": 50,
					"affects": "total",
					"levels": 1
				},
				{
					"type": "modifier",
					"id": "7372eaee-5713-4055-a571-fdf9b34dbc46",
					"disabled": true,
					"name": "Fragmentation",
					"reference": "B104",
					"cost_type": "percentage",
					"cost": 15,
					"affects": "total",
					"levels": 1
				},
				{
					"type": "modifier",
					"id": "c7f3a30e-b7d8-4d01-8f29-6782d0f2977f",
					"disabled": true,
					"name": "Fragmentation",
					"reference": "B104",
					"cost_type": "percentage",
					"cost": 15,
					"affects": "total",
					"levels": 1,
					"notes": "Hot"
				},
				{
					"type": "modifier",
					"id": "df1d1580-1841-4417-b143-bf070ee5f251",
					"disabled": true,
					"name": "Radiation",
					"reference": "B104",
					"cost_type": "percentage",
					"cost": 100,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "b15ffc01-d8b9-48da-b405-98b88cbca061",
					"disabled": true,
					"name": "Surge",
					"reference": "B104",
					"cost_type": "percentage",
					"cost": 20,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "2648b152-6bcc-4e36-8533-9cb8f26a6bc1",
					"disabled": true,
					"name": "Armor Divisor",
					"reference": "B102",
					"cost_type": "percentage",
					"cost": 50,
					"affects": "total",
					"notes": "2"
				},
				{
					"type": "modifier",
					"id": "cf3d7f8c-8b75-429c-b5e1-210395c1ddee",
					"disabled": true,
					"name": "Armor Divisor",
					"reference": "B102",
					"cost_type": "percentage",
					"cost": 100,
					"affects": "total",
					"notes": "3"
				},
				{
					"type": "modifier",
					"id": "21d302aa-0f56-4746-a9ed-58e4cb618cf3",
					"disabled": true,
					"name": "Armor Divisor",
					"reference": "B102",
					"cost_type": "percentage",
					"cost": 150,
					"affects": "total",
					"notes": "5"
				},
				{
					"type": "modifier",
					"id": "763facd6-8f3d-42ce-95bc-f19a674a0139",
					"disabled": true,
					"name": "Armor Divisor",
					"reference": "B102",
					"cost_type": "percentage",
					"cost": 200,
					"affects": "total",
					"notes": "10"
				},
				{
					"type": "modifier",
					"id": "0452127e-ec5a-4c5d-9ee8-31a62996a2df",
					"disabled": true,
					"name": "Side Effect",
					"reference": "B109",
					"cost_type": "percentage",
					"cost": 0,
					"affects": "total",
					"notes": "@Effect@"
				},
				{
					"type": "modifier",
					"id": "c2b11993-794f-4e80-b41a-f20a571ca811",
					"disabled": true,
					"name": "Symptoms",
					"reference": "B109",
					"cost_type": "percentage",
					"cost": 0,
					"affects": "total",
					"notes": "@Effect@"
				},
				{
					"type": "modifier",
					"id": "13e4f7c7-d467-4d62-9129-2b6fe19b2fee",
					"disabled": true,
					"name": "Armor Divisor",
					"reference": "B110",
					"cost_type": "percentage",
					"cost": -30,
					"affects": "total",
					"notes": "0.5"
				},
				{
					"type": "modifier",
					"id": "b839ff68-70fc-40d4-b406-dd8ebae35a5b",
					"disabled": true,
					"name": "Armor Divisor",
					"reference": "B110",
					"cost_type": "percentage",
					"cost": -50,
					"affects": "total",
					"notes": "0.2"
				},
				{
					"type": "modifier",
					"id": "0346821e-b3b2-4d47-a99b-31af86f6e25e",
					"disabled": true,
					"name": "Armor Divisor",
					"reference": "B110",
					"cost_type": "percentage",
					"cost": -70,
					"affects": "total",
					"notes": "0.1"
				},
				{
					"type": "modifier",
					"id": "1f7d191c-83fd-4cef-8f4b-a0bdcfa0c0b7",
					"disabled": true,
					"name": "No Wounding",
					"reference": "B111",
					"cost_type": "percentage",
					"cost": -50,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "a4343d58-ea1b-4cf3-9d39-215e0f8c7af6",
					"disabled": true,
					"name": "Surge, Arcing",
					"reference": "PSI20",
					"cost_type": "percentage",
					"cost": 100,
					"affects": "total"
				}
			],
			"reference": "B61,P53,MA45",
			"calc": {
				"points": 5
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "4ec66266-3cd8-443d-a155-70419e4c9123",
			"name": "Innate Attack (Corrosion)",
			"physical": true,
			"exotic": true,
			"levels": "1",
			"points_per_level": 10,
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "cor",
						"base": "1d"
					},
					"accuracy": "3",
					"range": "10/100",
					"rate_of_fire": "1",
					"recoil": "1",
					"calc": {
						"level": 0,
						"range": "10/100",
						"damage": "1d cor"
					},
					"defaults": [
						{
							"type": "skill",
							"name": "Innate Attack",
							"specialization": "@Attack Type@"
						},
						{
							"type": "skill",
							"name": "Innate Attack",
							"modifier": -2
						},
						{
							"type": "dx",
							"modifier": -4
						}
					]
				}
			],
			"modifiers": [
				{
					"type": "modifier",
					"id": "34b02ae4-c4d7-493a-b898-3e1ee52561cd",
					"disabled": true,
					"name": "Cyclic",
					"reference": "B103",
					"cost_type": "percentage",
					"cost": 100,
					"affects": "total",
					"levels": 1,
					"notes": "1 sec"
				},
				{
					"type": "modifier",
					"id": "029557b2-743e-4787-abda-eb6406c2cc43",
					"disabled": true,
					"name": "Cyclic",
					"reference": "B103",
					"cost_type": "percentage",
					"cost": 50,
					"affects": "total",
					"levels": 1,
					"notes": "10 sec"
				},
				{
					"type": "modifier",
					"id": "40b27381-27d3-430a-8675-58733c972737",
					"disabled": true,
					"name": "Cyclic",
					"reference": "B103",
					"cost_type": "percentage",
					"cost": 40,
					"affects": "total",
					"levels": 1,
					"notes": "1 min"
				},
				{
					"type": "modifier",
					"id": "5e021902-29bf-4e29-891c-75d9578e6241",
					"disabled": true,
					"name": "Cyclic",
					"reference": "B103",
					"cost_type": "percentage",
					"cost": 20,
					"affects": "total",
					"levels": 1,
					"notes": "1 hr"
				},
				{
					"type": "modifier",
					"id": "19ad9e0e-657c-4f2c-922f-84152ef7f8ff",
					"disabled": true,
					"name": "Cyclic",
					"reference": "B103",
					"cost_type": "percentage",
					"cost": 10,
					"affects": "total",
					"levels": 1,
					"notes": "1 day"
				},
				{
					"type": "modifier",
					"id": "9bfaa345-8ad6-406d-8a1a-cb7b45ecb3fd",
					"disabled": true,
					"name": "Cyclic",
					"reference": "B103",
					"cost_type": "percentage",
					"cost": 50,
					"affects": "total",
					"levels": 1,
					"notes": "1 sec; Resistible"
				},
				{
					"type": "modifier",
					"id": "dd0a5c28-e6bb-4e19-988b-5a7486f41755",
					"disabled": true,
					"name": "Cyclic",
					"reference": "B103",
					"cost_type": "percentage",
					"cost": 25,
					"affects": "total",
					"levels": 1,
					"notes": "10 sec; Resistible"
				},
				{
					"type": "modifier",
					"id": "e26ba6d0-63de-4b92-943b-6571fb41fc59",
					"disabled": true,
					"name": "Cyclic",
					"reference": "B103",
					"cost_type": "percentage",
					"cost": 20,
					"affects": "total",
					"levels": 1,
					"notes": "1 min; Resistible"
				},
				{
					"type": "modifier",
					"id": "fa9780ff-48a1-4438-89fa-42872617f5d9",
					"disabled": true,
					"name": "Cyclic",
					"reference": "B103",
					"cost_type": "percentage",
					"cost": 10,
					"affects": "total",
					"levels": 1,
					"notes": "1 hr; Resistible"
				},
				{
					"type": "modifier",
					"id": "64fdfc94-d3f2-43f9-b86b-0a2665780657",
					"disabled": true,
					"name": "Cyclic",
					"reference": "B103",
					"cost_type": "percentage",
					"cost": 5,
					"affects": "total",
					"levels": 1,
					"notes": "1 day; Resistible"
				},
				{
					"type": "modifier",
					"id": "d6032d78-b3cf-442d-bb5d-8a43cb4f613c",
					"disabled": true,
					"name": "Contagious",
					"reference": "B103",
					"cost_type": "percentage",
					"cost": 20,
					"affects": "total",
					"notes": "Mildly"
				},
				{
					"type": "modifier",
					"id": "2aac704e-7d10-4cce-b8a1-c24f814d6fd2",
					"disabled": true,
					"name": "Contagious",
					"reference": "B103",
					"cost_type": "percentage",
					"cost": 50,
					"affects": "total",
					"notes": "Highly"
				},
				{
					"type": "modifier",
					"id": "ffeb09ca-1d76-4062-8152-faae35fefeda",
					"disabled": true,
					"name": "Double Blunt Trauma",
					"reference": "B104",
					"cost_type": "percentage",
					"cost": 20,
					"affects": "total",
					"notes": "1HP per 10 dmg"
				},
				{
					"type": "modifier",
					"id": "bd75ddac-10ec-4e20-8ddc-1281835b1a50",
					"disabled": true,
					"name": "Explosion",
					"reference": "B104",
					"cost_type": "percentage",
					"cost": 50,
					"affects": "total",
					"levels": 1
				},
				{
					"type": "modifier",
					"id": "9f81b529-d882-4239-b1c7-0791361b5142",
					"disabled": true,
					"name": "Fragmentation",
					"reference": "B104",
					"cost_type": "percentage",
					"cost": 15,
					"affects": "total",
					"levels": 1
				},
				{
					"type": "modifier",
					"id": "51041f19-f85a-4467-b84e-c3abe1b5b211",
					"disabled": true,
					"name": "Fragmentation",
					"reference": "B104",
					"cost_type": "percentage",
					"cost": 15,
					"affects": "total",
					"levels": 1,
					"notes": "Hot"
				},
				{
					"type": "modifier",
					"id": "29049d16-2350-47d4-b108-c95f3217b44d",
					"disabled": true,
					"name": "Surge",
					"reference": "B104",
					"cost_type": "percentage",
					"cost": 20,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "460b526f-c504-4b52-a62e-361547051ddf",
					"disabled": true,
					"name": "Armor Divisor",
					"reference": "B102",
					"cost_type": "percentage",
					"cost": 50,
					"affects": "total",
					"notes": "2"
				},
				{
					"type": "modifier",
					"id": "cede7089-574d-4750-aaca-6d5c08808fe6",
					"disabled": true,
					"name": "Armor Divisor",
					"reference": "B102",
					"cost_type": "percentage",
					"cost": 100,
					"affects": "total",
					"notes": "3"
				},
				{
					"type": "modifier",
					"id": "6f4cd714-0d07-4645-bc0e-f8d953bee6c0",
					"disabled": true,
					"name": "Armor Divisor",
					"reference": "B102",
					"cost_type": "percentage",
					"cost": 150,
					"affects": "total",
					"notes": "5"
				},
				{
					"type": "modifier",
					"id": "968c666b-9311-447d-be51-7b0eae31f9c6",
					"disabled": true,
					"name": "Armor Divisor",
					"reference": "B102",
					"cost_type": "percentage",
					"cost": 200,
					"affects": "total",
					"notes": "10"
				},
				{
					"type": "modifier",
					"id": "69d90b98-0544-415f-9760-484e4aa46cc8",
					"disabled": true,
					"name": "Side Effect",
					"reference": "B109",
					"cost_type": "percentage",
					"cost": 0,
					"affects": "total",
					"notes": "@Effect@"
				},
				{
					"type": "modifier",
					"id": "9cbb1995-259d-4702-8900-4b511ef1f4c0",
					"disabled": true,
					"name": "Symptoms",
					"reference": "B109",
					"cost_type": "percentage",
					"cost": 0,
					"affects": "total",
					"notes": "@Effect@"
				},
				{
					"type": "modifier",
					"id": "96a07db2-e6bf-45ff-8267-127f46e664da",
					"disabled": true,
					"name": "Armor Divisor",
					"reference": "B110",
					"cost_type": "percentage",
					"cost": -30,
					"affects": "total",
					"notes": "0.5"
				},
				{
					"type": "modifier",
					"id": "e7a34a1d-07e8-40ae-b531-26ff504e9054",
					"disabled": true,
					"name": "Armor Divisor",
					"reference": "B110",
					"cost_type": "percentage",
					"cost": -50,
					"affects": "total",
					"notes": "0.2"
				},
				{
					"type": "modifier",
					"id": "24d772e7-1cea-49cc-8297-095778a337b0",
					"disabled": true,
					"name": "Armor Divisor",
					"reference": "B110",
					"cost_type": "percentage",
					"cost": -70,
					"affects": "total",
					"notes": "0.1"
				},
				{
					"type": "modifier",
					"id": "c5cb6a87-1a83-4b9c-912d-7bfa3d2b0846",
					"disabled": true,
					"name": "No Wounding",
					"reference": "B111",
					"cost_type": "percentage",
					"cost": -50,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "ce8addb9-159c-46df-b1af-26da1acdee3e",
					"disabled": true,
					"name": "Incendiary",
					"reference": "B104",
					"cost_type": "percentage",
					"cost": 10,
					"affects": "total"
				}
			],
			"reference": "B61,P53,MA45",
			"calc": {
				"points": 10
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "1c893ad5-bc40-4aef-8625-46862ad7ef08",
			"name": "Innate Attack (Crush)",
			"physical": true,
			"exotic": true,
			"levels": "1",
			"points_per_level": 5,
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "cr",
						"base": "1d"
					},
					"accuracy": "3",
					"range": "10/100",
					"rate_of_fire": "1",
					"recoil": "1",
					"calc": {
						"level": 0,
						"range": "10/100",
						"damage": "1d cr"
					},
					"defaults": [
						{
							"type": "skill",
							"name": "Innate Attack",
							"specialization": "@Attack Type@"
						},
						{
							"type": "skill",
							"name": "Innate Attack",
							"modifier": -2
						},
						{
							"type": "dx",
							"modifier": -4
						}
					]
				}
			],
			"modifiers": [
				{
					"type": "modifier",
					"id": "24bd9282-2346-4e4d-9d1f-10a40c27ed7f",
					"disabled": true,
					"name": "Explosion",
					"reference": "B104",
					"cost_type": "percentage",
					"cost": 50,
					"affects": "total",
					"levels": 1
				},
				{
					"type": "modifier",
					"id": "08658eb0-c97a-4833-b811-853fc5b8f17e",
					"disabled": true,
					"name": "Fragmentation",
					"reference": "B104",
					"cost_type": "percentage",
					"cost": 15,
					"affects": "total",
					"levels": 1
				},
				{
					"type": "modifier",
					"id": "abcb4e28-06b0-4f0d-80ce-eeaec4bb40b9",
					"disabled": true,
					"name": "Fragmentation",
					"reference": "B104",
					"cost_type": "percentage",
					"cost": 15,
					"affects": "total",
					"levels": 1,
					"notes": "Hot"
				},
				{
					"type": "modifier",
					"id": "21cb3b74-7cb6-4816-b62f-b45fe63c3372",
					"disabled": true,
					"name": "Surge",
					"reference": "B104",
					"cost_type": "percentage",
					"cost": 20,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "5ba9c2b7-fc9d-481a-8380-a823288b996d",
					"disabled": true,
					"name": "Armor Divisor",
					"reference": "B102",
					"cost_type": "percentage",
					"cost": 50,
					"affects": "total",
					"notes": "2"
				},
				{
					"type": "modifier",
					"id": "a77f086e-5c4e-4ee1-b8f0-f03f692e1a39",
					"disabled": true,
					"name": "Armor Divisor",
					"reference": "B102",
					"cost_type": "percentage",
					"cost": 100,
					"affects": "total",
					"notes": "3"
				},
				{
					"type": "modifier",
					"id": "bfa27d40-097f-4d57-8ce7-5e6826e8e45e",
					"disabled": true,
					"name": "Armor Divisor",
					"reference": "B102",
					"cost_type": "percentage",
					"cost": 150,
					"affects": "total",
					"notes": "5"
				},
				{
					"type": "modifier",
					"id": "ac58028e-0257-4dd4-af92-3eecef9fb784",
					"disabled": true,
					"name": "Armor Divisor",
					"reference": "B102",
					"cost_type": "percentage",
					"cost": 200,
					"affects": "total",
					"notes": "10"
				},
				{
					"type": "modifier",
					"id": "7c0d227e-dcac-40a1-9b7d-c7e1858194c1",
					"disabled": true,
					"name": "Side Effect",
					"reference": "B109",
					"cost_type": "percentage",
					"cost": 0,
					"affects": "total",
					"notes": "@Effect@"
				},
				{
					"type": "modifier",
					"id": "f528dd3e-bcf0-43de-8c9c-b7b49366b248",
					"disabled": true,
					"name": "Symptoms",
					"reference": "B109",
					"cost_type": "percentage",
					"cost": 0,
					"affects": "total",
					"notes": "@Effect@"
				},
				{
					"type": "modifier",
					"id": "49d2487c-3eac-4776-9d5e-38e51c28a26b",
					"disabled": true,
					"name": "Armor Divisor",
					"reference": "B110",
					"cost_type": "percentage",
					"cost": -30,
					"affects": "total",
					"notes": "0.5"
				},
				{
					"type": "modifier",
					"id": "bfe22a25-1649-40bf-8a3e-0d5293fca27f",
					"disabled": true,
					"name": "Armor Divisor",
					"reference": "B110",
					"cost_type": "percentage",
					"cost": -50,
					"affects": "total",
					"notes": "0.2"
				},
				{
					"type": "modifier",
					"id": "2e2d2eda-7a05-449a-a2ce-68e5c058ac6f",
					"disabled": true,
					"name": "Armor Divisor",
					"reference": "B110",
					"cost_type": "percentage",
					"cost": -70,
					"affects": "total",
					"notes": "0.1"
				},
				{
					"type": "modifier",
					"id": "ab4768bd-98cb-417f-bdcf-f40d78cac1b2",
					"disabled": true,
					"name": "No Blunt Trauma",
					"reference": "B111",
					"cost_type": "percentage",
					"cost": -20,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "78d56d0d-c1cc-4233-9733-2a3180be86d5",
					"disabled": true,
					"name": "No Knockback",
					"reference": "B111",
					"cost_type": "percentage",
					"cost": -10,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "1fd23c30-d01c-4e82-bc27-718742d91dd3",
					"disabled": true,
					"name": "No Wounding",
					"reference": "B111",
					"cost_type": "percentage",
					"cost": -50,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "19bf1802-ce8d-492a-931a-063c36244ebb",
					"disabled": true,
					"name": "Double Knockback",
					"reference": "B104",
					"cost_type": "percentage",
					"cost": 20,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "386b3dcd-65a3-47c1-979e-5ec490e86d5c",
					"disabled": true,
					"name": "Incendiary",
					"reference": "B104",
					"cost_type": "percentage",
					"cost": 10,
					"affects": "total"
				}
			],
			"reference": "B61,P53,MA45",
			"calc": {
				"points": 5
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "e656bb36-03ea-4dc6-bb8a-34e5cbaa0043",
			"name": "Innate Attack (Cut)",
			"physical": true,
			"exotic": true,
			"levels": "1",
			"points_per_level": 7,
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "cut",
						"base": "1d"
					},
					"accuracy": "3",
					"range": "10/100",
					"rate_of_fire": "1",
					"recoil": "1",
					"calc": {
						"level": 0,
						"range": "10/100",
						"damage": "1d cut"
					},
					"defaults": [
						{
							"type": "skill",
							"name": "Innate Attack",
							"specialization": "@Attack Type@"
						},
						{
							"type": "skill",
							"name": "Innate Attack",
							"modifier": -2
						},
						{
							"type": "dx",
							"modifier": -4
						}
					]
				}
			],
			"modifiers": [
				{
					"type": "modifier",
					"id": "738ce48b-a68e-4d05-a438-2933b8e05d7a",
					"disabled": true,
					"name": "Double Blunt Trauma",
					"reference": "B104",
					"cost_type": "percentage",
					"cost": 20,
					"affects": "total",
					"notes": "BT as for Crushing"
				},
				{
					"type": "modifier",
					"id": "38957701-aa97-478a-b954-174048ed5854",
					"disabled": true,
					"name": "Explosion",
					"reference": "B104",
					"cost_type": "percentage",
					"cost": 50,
					"affects": "total",
					"levels": 1
				},
				{
					"type": "modifier",
					"id": "0af1d253-4b2d-4496-bbae-38c629cc3954",
					"disabled": true,
					"name": "Fragmentation",
					"reference": "B104",
					"cost_type": "percentage",
					"cost": 15,
					"affects": "total",
					"levels": 1
				},
				{
					"type": "modifier",
					"id": "8cfe2a20-5cba-4817-a21a-5d622bd9fb94",
					"disabled": true,
					"name": "Fragmentation",
					"reference": "B104",
					"cost_type": "percentage",
					"cost": 15,
					"affects": "total",
					"levels": 1,
					"notes": "Hot"
				},
				{
					"type": "modifier",
					"id": "19ce7db1-e880-4ed3-bbe9-1b6efe784afd",
					"disabled": true,
					"name": "Surge",
					"reference": "B104",
					"cost_type": "percentage",
					"cost": 20,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "9433977d-b685-49a9-b449-b3f71304f219",
					"disabled": true,
					"name": "Armor Divisor",
					"reference": "B102",
					"cost_type": "percentage",
					"cost": 50,
					"affects": "total",
					"notes": "2"
				},
				{
					"type": "modifier",
					"id": "c4d97b3d-5c7a-4016-b249-2032e2681816",
					"disabled": true,
					"name": "Armor Divisor",
					"reference": "B102",
					"cost_type": "percentage",
					"cost": 100,
					"affects": "total",
					"notes": "3"
				},
				{
					"type": "modifier",
					"id": "21abf2f5-59fa-4211-9e47-cda9bcbae75b",
					"disabled": true,
					"name": "Armor Divisor",
					"reference": "B102",
					"cost_type": "percentage",
					"cost": 150,
					"affects": "total",
					"notes": "5"
				},
				{
					"type": "modifier",
					"id": "5423bdd9-1f4a-4035-a09e-cd5cf34f4278",
					"disabled": true,
					"name": "Armor Divisor",
					"reference": "B102",
					"cost_type": "percentage",
					"cost": 200,
					"affects": "total",
					"notes": "10"
				},
				{
					"type": "modifier",
					"id": "16e683bc-68b5-4c12-b836-ac5456a09e48",
					"disabled": true,
					"name": "Side Effect",
					"reference": "B109",
					"cost_type": "percentage",
					"cost": 0,
					"affects": "total",
					"notes": "@Effect@"
				},
				{
					"type": "modifier",
					"id": "9dff2ac8-adca-4c96-bc14-338f5677e168",
					"disabled": true,
					"name": "Symptoms",
					"reference": "B109",
					"cost_type": "percentage",
					"cost": 0,
					"affects": "total",
					"notes": "@Effect@"
				},
				{
					"type": "modifier",
					"id": "a9a09c70-3cb7-4f9c-93fb-6f827ecfa36e",
					"disabled": true,
					"name": "Armor Divisor",
					"reference": "B110",
					"cost_type": "percentage",
					"cost": -30,
					"affects": "total",
					"notes": "0.5"
				},
				{
					"type": "modifier",
					"id": "d17c1e24-90ee-4733-bf6d-4917925e16f7",
					"disabled": true,
					"name": "Armor Divisor",
					"reference": "B110",
					"cost_type": "percentage",
					"cost": -50,
					"affects": "total",
					"notes": "0.2"
				},
				{
					"type": "modifier",
					"id": "92414909-77fa-4e92-b84e-d4bc91e792f7",
					"disabled": true,
					"name": "Armor Divisor",
					"reference": "B110",
					"cost_type": "percentage",
					"cost": -70,
					"affects": "total",
					"notes": "0.1"
				},
				{
					"type": "modifier",
					"id": "6578cf07-1416-45b9-90bd-c6183273721c",
					"disabled": true,
					"name": "No Blunt Trauma",
					"reference": "B111",
					"cost_type": "percentage",
					"cost": -20,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "fa10ede0-3a62-4f0d-9e1b-4950e29643e2",
					"disabled": true,
					"name": "No Knockback",
					"reference": "B111",
					"cost_type": "percentage",
					"cost": -10,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "fcc4d20f-7e3c-40a5-9bb6-72a158a9f651",
					"disabled": true,
					"name": "No Wounding",
					"reference": "B111",
					"cost_type": "percentage",
					"cost": -50,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "fcc87158-db3b-4d41-87ee-83bdf6145a0c",
					"disabled": true,
					"name": "Incendiary",
					"reference": "B104",
					"cost_type": "percentage",
					"cost": 10,
					"affects": "total"
				}
			],
			"reference": "B61,P53,MA45",
			"calc": {
				"points": 7
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "8ee05779-b452-4395-9ea0-46bc64945a9a",
			"name": "Innate Attack (Fatigue)",
			"physical": true,
			"exotic": true,
			"levels": "1",
			"points_per_level": 10,
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "fat",
						"base": "1d"
					},
					"accuracy": "3",
					"range": "10/100",
					"rate_of_fire": "1",
					"recoil": "1",
					"calc": {
						"level": 0,
						"range": "10/100",
						"damage": "1d fat"
					},
					"defaults": [
						{
							"type": "skill",
							"name": "Innate Attack",
							"specialization": "@Attack Type@"
						},
						{
							"type": "skill",
							"name": "Innate Attack",
							"modifier": -2
						},
						{
							"type": "dx",
							"modifier": -4
						}
					]
				}
			],
			"modifiers": [
				{
					"type": "modifier",
					"id": "ae0a8ee3-55d2-479b-8c1c-ec90466311ca",
					"disabled": true,
					"name": "Cyclic",
					"reference": "B103",
					"cost_type": "percentage",
					"cost": 100,
					"affects": "total",
					"levels": 1,
					"notes": "1 sec"
				},
				{
					"type": "modifier",
					"id": "eb46e9ac-757f-40f7-b112-08436159dca2",
					"disabled": true,
					"name": "Cyclic",
					"reference": "B103",
					"cost_type": "percentage",
					"cost": 50,
					"affects": "total",
					"levels": 1,
					"notes": "10 sec"
				},
				{
					"type": "modifier",
					"id": "d96a351a-98c1-4ce6-8213-a802f9b3755f",
					"disabled": true,
					"name": "Cyclic",
					"reference": "B103",
					"cost_type": "percentage",
					"cost": 40,
					"affects": "total",
					"levels": 1,
					"notes": "1 min"
				},
				{
					"type": "modifier",
					"id": "020e9969-8753-45d5-8a1f-abb67b83e246",
					"disabled": true,
					"name": "Cyclic",
					"reference": "B103",
					"cost_type": "percentage",
					"cost": 20,
					"affects": "total",
					"levels": 1,
					"notes": "1 hr"
				},
				{
					"type": "modifier",
					"id": "4e7f6fee-292d-4cf7-96b3-498068737331",
					"disabled": true,
					"name": "Cyclic",
					"reference": "B103",
					"cost_type": "percentage",
					"cost": 10,
					"affects": "total",
					"levels": 1,
					"notes": "1 day"
				},
				{
					"type": "modifier",
					"id": "d9e14aff-1189-400d-9168-aea66fc7db6d",
					"disabled": true,
					"name": "Cyclic",
					"reference": "B103",
					"cost_type": "percentage",
					"cost": 50,
					"affects": "total",
					"levels": 1,
					"notes": "1 sec; Resistible"
				},
				{
					"type": "modifier",
					"id": "22576e31-2f73-4dbc-87be-20e7f2ba2aa9",
					"disabled": true,
					"name": "Cyclic",
					"reference": "B103",
					"cost_type": "percentage",
					"cost": 25,
					"affects": "total",
					"levels": 1,
					"notes": "10 sec; Resistible"
				},
				{
					"type": "modifier",
					"id": "64f214ca-c798-4b01-a63a-44839ca86c0a",
					"disabled": true,
					"name": "Cyclic",
					"reference": "B103",
					"cost_type": "percentage",
					"cost": 20,
					"affects": "total",
					"levels": 1,
					"notes": "1 min; Resistible"
				},
				{
					"type": "modifier",
					"id": "df4d3ce6-75b0-47ab-89a6-23894fe149e2",
					"disabled": true,
					"name": "Cyclic",
					"reference": "B103",
					"cost_type": "percentage",
					"cost": 10,
					"affects": "total",
					"levels": 1,
					"notes": "1 hr; Resistible"
				},
				{
					"type": "modifier",
					"id": "9fc3a313-f43d-430f-a11c-2ec2581fe864",
					"disabled": true,
					"name": "Cyclic",
					"reference": "B103",
					"cost_type": "percentage",
					"cost": 5,
					"affects": "total",
					"levels": 1,
					"notes": "1 day; Resistible"
				},
				{
					"type": "modifier",
					"id": "9a6baf4b-1144-4868-a8ac-50f3acdfe0cf",
					"disabled": true,
					"name": "Contagious",
					"reference": "B103",
					"cost_type": "percentage",
					"cost": 20,
					"affects": "total",
					"notes": "Mildly"
				},
				{
					"type": "modifier",
					"id": "6a7ab408-3fe1-44a1-8b45-1778e71d8ffb",
					"disabled": true,
					"name": "Contagious",
					"reference": "B103",
					"cost_type": "percentage",
					"cost": 50,
					"affects": "total",
					"notes": "Highly"
				},
				{
					"type": "modifier",
					"id": "bdda2cce-21c0-482e-bbdd-a0a45cae0541",
					"disabled": true,
					"name": "Explosion",
					"reference": "B104",
					"cost_type": "percentage",
					"cost": 50,
					"affects": "total",
					"levels": 1
				},
				{
					"type": "modifier",
					"id": "d0432a9d-ee10-4ad9-8ff1-3367443a614c",
					"disabled": true,
					"name": "Fragmentation",
					"reference": "B104",
					"cost_type": "percentage",
					"cost": 15,
					"affects": "total",
					"levels": 1
				},
				{
					"type": "modifier",
					"id": "a7825e5b-96be-4131-a0d4-dcc0bf86f1f0",
					"disabled": true,
					"name": "Fragmentation",
					"reference": "B104",
					"cost_type": "percentage",
					"cost": 15,
					"affects": "total",
					"levels": 1,
					"notes": "Hot"
				},
				{
					"type": "modifier",
					"id": "3fc7940e-ad0a-446a-8a01-51f228ad4e52",
					"disabled": true,
					"name": "Surge",
					"reference": "B104",
					"cost_type": "percentage",
					"cost": 20,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "5c4f165e-3a8b-4183-843d-73c9c88d075d",
					"disabled": true,
					"name": "Armor Divisor",
					"reference": "B102",
					"cost_type": "percentage",
					"cost": 50,
					"affects": "total",
					"notes": "2"
				},
				{
					"type": "modifier",
					"id": "925f5158-f964-4aaa-9bda-2d2d62934010",
					"disabled": true,
					"name": "Armor Divisor",
					"reference": "B102",
					"cost_type": "percentage",
					"cost": 100,
					"affects": "total",
					"notes": "3"
				},
				{
					"type": "modifier",
					"id": "e5ebaf1b-4e22-4199-b379-d1b1789a6977",
					"disabled": true,
					"name": "Armor Divisor",
					"reference": "B102",
					"cost_type": "percentage",
					"cost": 150,
					"affects": "total",
					"notes": "5"
				},
				{
					"type": "modifier",
					"id": "5fc9898a-e2c3-4dc4-a30c-6a35bfa886a8",
					"disabled": true,
					"name": "Armor Divisor",
					"reference": "B102",
					"cost_type": "percentage",
					"cost": 200,
					"affects": "total",
					"notes": "10"
				},
				{
					"type": "modifier",
					"id": "fc63dba9-8f6d-4c0c-90b5-17031e3fd54e",
					"disabled": true,
					"name": "Side Effect",
					"reference": "B109",
					"cost_type": "percentage",
					"cost": 0,
					"affects": "total",
					"notes": "@Effect@"
				},
				{
					"type": "modifier",
					"id": "784939bf-fa59-45a3-b4d9-2a1de0aec967",
					"disabled": true,
					"name": "Symptoms",
					"reference": "B109",
					"cost_type": "percentage",
					"cost": 0,
					"affects": "total",
					"notes": "@Effect@"
				},
				{
					"type": "modifier",
					"id": "d210cd4e-969e-46fa-a32b-dfc4fffad15d",
					"disabled": true,
					"name": "Armor Divisor",
					"reference": "B110",
					"cost_type": "percentage",
					"cost": -30,
					"affects": "total",
					"notes": "0.5"
				},
				{
					"type": "modifier",
					"id": "1da139da-b8c5-4cc7-9ac4-a60ef7112ee7",
					"disabled": true,
					"name": "Armor Divisor",
					"reference": "B110",
					"cost_type": "percentage",
					"cost": -50,
					"affects": "total",
					"notes": "0.2"
				},
				{
					"type": "modifier",
					"id": "c8c583e3-c482-4472-ab17-6f0b62fcd739",
					"disabled": true,
					"name": "Armor Divisor",
					"reference": "B110",
					"cost_type": "percentage",
					"cost": -70,
					"affects": "total",
					"notes": "0.1"
				},
				{
					"type": "modifier",
					"id": "1466eaaa-f94b-40c3-a605-2098483ebed8",
					"disabled": true,
					"name": "No Wounding",
					"reference": "B111",
					"cost_type": "percentage",
					"cost": -50,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "b3010148-178b-4c6f-bcfb-f722af53b665",
					"disabled": true,
					"name": "Hazard: Dehydration",
					"reference": "B104",
					"cost_type": "percentage",
					"cost": 20,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "278c9613-5330-43a8-bb09-a9c319523eb9",
					"disabled": true,
					"name": "Hazard: Drowning",
					"reference": "B104",
					"cost_type": "percentage",
					"cost": 0,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "dac34aa3-076a-4e64-b3fd-439175d47570",
					"disabled": true,
					"name": "Hazard: Freezing",
					"reference": "B104",
					"cost_type": "percentage",
					"cost": 20,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "7a55c984-3ccb-40d0-93d5-38301ba45336",
					"disabled": true,
					"name": "Hazard: Missed Sleep",
					"reference": "B104",
					"cost_type": "percentage",
					"cost": 50,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "5e5bd9e9-2fa8-447b-82cc-f6215a572b66",
					"disabled": true,
					"name": "Hazard: Starvation",
					"reference": "B104",
					"cost_type": "percentage",
					"cost": 40,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "08bdad4d-9465-4086-8d33-c7c028ebc47d",
					"disabled": true,
					"name": "Hazard: Suffocation",
					"reference": "B104",
					"cost_type": "percentage",
					"cost": 0,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "aecdc239-2ede-4c36-80e3-a6fc8bbb06f0",
					"disabled": true,
					"name": "Incendiary",
					"reference": "B104",
					"cost_type": "percentage",
					"cost": 10,
					"affects": "total"
				}
			],
			"reference": "B61,P53,MA45",
			"calc": {
				"points": 10
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "d01bb49d-cf16-49ff-a0a9-729417cb14ee",
			"name": "Innate Attack (Huge Pierce)",
			"physical": true,
			"exotic": true,
			"levels": "1",
			"points_per_level": 8,
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "pi++",
						"base": "1d"
					},
					"accuracy": "3",
					"range": "10/100",
					"rate_of_fire": "1",
					"recoil": "1",
					"calc": {
						"level": 0,
						"range": "10/100",
						"damage": "1d pi++"
					},
					"defaults": [
						{
							"type": "skill",
							"name": "Innate Attack",
							"specialization": "@Attack Type@"
						},
						{
							"type": "skill",
							"name": "Innate Attack",
							"modifier": -2
						},
						{
							"type": "dx",
							"modifier": -4
						}
					]
				}
			],
			"modifiers": [
				{
					"type": "modifier",
					"id": "06cf6384-94bb-4c78-ba3d-529c152a55cb",
					"disabled": true,
					"name": "Double Blunt Trauma",
					"reference": "B104",
					"cost_type": "percentage",
					"cost": 20,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "d2c574be-85a6-4417-ac5b-54def2fd77fc",
					"disabled": true,
					"name": "Explosion",
					"reference": "B104",
					"cost_type": "percentage",
					"cost": 50,
					"affects": "total",
					"levels": 1
				},
				{
					"type": "modifier",
					"id": "aaaa3d59-75bd-47b6-8904-14e4e1271a28",
					"disabled": true,
					"name": "Fragmentation",
					"reference": "B104",
					"cost_type": "percentage",
					"cost": 15,
					"affects": "total",
					"levels": 1
				},
				{
					"type": "modifier",
					"id": "ab08c693-fb99-46a2-82b5-cbd5000605c7",
					"disabled": true,
					"name": "Fragmentation",
					"reference": "B104",
					"cost_type": "percentage",
					"cost": 15,
					"affects": "total",
					"levels": 1,
					"notes": "Hot"
				},
				{
					"type": "modifier",
					"id": "864957a2-d975-40f0-b7c5-939f2950ef05",
					"disabled": true,
					"name": "Surge",
					"reference": "B104",
					"cost_type": "percentage",
					"cost": 20,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "3d2f117a-4a32-4fc4-ad4b-1030e159135b",
					"disabled": true,
					"name": "Armor Divisor",
					"reference": "B102",
					"cost_type": "percentage",
					"cost": 50,
					"affects": "total",
					"notes": "2"
				},
				{
					"type": "modifier",
					"id": "957b78fe-911c-4214-9164-47e8e7609474",
					"disabled": true,
					"name": "Armor Divisor",
					"reference": "B102",
					"cost_type": "percentage",
					"cost": 100,
					"affects": "total",
					"notes": "3"
				},
				{
					"type": "modifier",
					"id": "29099a6c-112d-42cf-88ef-2c6e3fcd66c5",
					"disabled": true,
					"name": "Armor Divisor",
					"reference": "B102",
					"cost_type": "percentage",
					"cost": 150,
					"affects": "total",
					"notes": "5"
				},
				{
					"type": "modifier",
					"id": "1431ee3e-07e7-4111-8771-d75bed4505ff",
					"disabled": true,
					"name": "Armor Divisor",
					"reference": "B102",
					"cost_type": "percentage",
					"cost": 200,
					"affects": "total",
					"notes": "10"
				},
				{
					"type": "modifier",
					"id": "703ed26b-3a3c-4fef-9841-e10cbff8ea8b",
					"disabled": true,
					"name": "Side Effect",
					"reference": "B109",
					"cost_type": "percentage",
					"cost": 0,
					"affects": "total",
					"notes": "@Effect@"
				},
				{
					"type": "modifier",
					"id": "ad955017-2309-4f0f-8ae1-606a25ce0eab",
					"disabled": true,
					"name": "Symptoms",
					"reference": "B109",
					"cost_type": "percentage",
					"cost": 0,
					"affects": "total",
					"notes": "@Effect@"
				},
				{
					"type": "modifier",
					"id": "c16d6486-0589-426b-bbd1-eb776e9e2cab",
					"disabled": true,
					"name": "Armor Divisor",
					"reference": "B110",
					"cost_type": "percentage",
					"cost": -30,
					"affects": "total",
					"notes": "0.5"
				},
				{
					"type": "modifier",
					"id": "341a49c9-8398-4e9e-9938-31caa9cba828",
					"disabled": true,
					"name": "Armor Divisor",
					"reference": "B110",
					"cost_type": "percentage",
					"cost": -50,
					"affects": "total",
					"notes": "0.2"
				},
				{
					"type": "modifier",
					"id": "cd849539-1f54-42b7-8c5d-ac1fab56e42d",
					"disabled": true,
					"name": "Armor Divisor",
					"reference": "B110",
					"cost_type": "percentage",
					"cost": -70,
					"affects": "total",
					"notes": "0.1"
				},
				{
					"type": "modifier",
					"id": "dfe1b1f1-dfb6-4359-bb50-86691e716bac",
					"disabled": true,
					"name": "No Blunt Trauma",
					"reference": "B111",
					"cost_type": "percentage",
					"cost": -20,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "65284573-d528-4567-a467-2b4457fce8a6",
					"disabled": true,
					"name": "No Wounding",
					"reference": "B111",
					"cost_type": "percentage",
					"cost": -50,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "72e89a4e-fd95-436e-b69e-56f956ca3c31",
					"disabled": true,
					"name": "Incendiary",
					"reference": "B104",
					"cost_type": "percentage",
					"cost": 10,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "461b2c52-ea7f-486f-9b6e-6541487b5761",
					"disabled": true,
					"name": "AP Ammo",
					"reference": "PU4:18",
					"cost_type": "percentage",
					"cost": 35,
					"affects": "total"
				}
			],
			"reference": "B62,P53,MA45",
			"calc": {
				"points": 8
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "06660a9d-10c6-4c97-ba3b-2574e97ce305",
			"name": "Innate Attack (Impaling)",
			"physical": true,
			"exotic": true,
			"levels": "1",
			"points_per_level": 8,
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "imp",
						"base": "1d"
					},
					"accuracy": "3",
					"range": "10/100",
					"rate_of_fire": "1",
					"recoil": "1",
					"calc": {
						"level": 0,
						"range": "10/100",
						"damage": "1d imp"
					},
					"defaults": [
						{
							"type": "skill",
							"name": "Innate Attack",
							"specialization": "@Attack Type@"
						},
						{
							"type": "skill",
							"name": "Innate Attack",
							"modifier": -2
						},
						{
							"type": "dx",
							"modifier": -4
						}
					]
				}
			],
			"modifiers": [
				{
					"type": "modifier",
					"id": "908144c3-d779-4959-bf4f-073c0c27c142",
					"disabled": true,
					"name": "Double Blunt Trauma",
					"reference": "B104",
					"cost_type": "percentage",
					"cost": 20,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "a4ed98b1-2f14-4741-8c82-1d6a4c9a450c",
					"disabled": true,
					"name": "Explosion",
					"reference": "B104",
					"cost_type": "percentage",
					"cost": 50,
					"affects": "total",
					"levels": 1
				},
				{
					"type": "modifier",
					"id": "34bbcb52-6e98-42ce-9d45-4917ebea6473",
					"disabled": true,
					"name": "Fragmentation",
					"reference": "B104",
					"cost_type": "percentage",
					"cost": 15,
					"affects": "total",
					"levels": 1
				},
				{
					"type": "modifier",
					"id": "42eb029f-2c01-4730-991e-4df4684f6e2c",
					"disabled": true,
					"name": "Fragmentation",
					"reference": "B104",
					"cost_type": "percentage",
					"cost": 15,
					"affects": "total",
					"levels": 1,
					"notes": "Hot"
				},
				{
					"type": "modifier",
					"id": "e281af48-e8b6-43ca-b3fa-4f18a6771e4b",
					"disabled": true,
					"name": "Surge",
					"reference": "B104",
					"cost_type": "percentage",
					"cost": 20,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "cacd4bc8-a05a-4460-9903-d8d4c36727b2",
					"disabled": true,
					"name": "Armor Divisor",
					"reference": "B102",
					"cost_type": "percentage",
					"cost": 50,
					"affects": "total",
					"notes": "2"
				},
				{
					"type": "modifier",
					"id": "1cb3f3aa-3419-4226-8f9e-21a947b65c67",
					"disabled": true,
					"name": "Armor Divisor",
					"reference": "B102",
					"cost_type": "percentage",
					"cost": 100,
					"affects": "total",
					"notes": "3"
				},
				{
					"type": "modifier",
					"id": "5f3d3c1e-ae59-4a43-9d4d-4adfea13d6c3",
					"disabled": true,
					"name": "Armor Divisor",
					"reference": "B102",
					"cost_type": "percentage",
					"cost": 150,
					"affects": "total",
					"notes": "5"
				},
				{
					"type": "modifier",
					"id": "e6adf6cd-99c7-4396-bb44-bc910b25c9b4",
					"disabled": true,
					"name": "Armor Divisor",
					"reference": "B102",
					"cost_type": "percentage",
					"cost": 200,
					"affects": "total",
					"notes": "10"
				},
				{
					"type": "modifier",
					"id": "1948c4a7-54f8-4edf-a429-5a5dd91260c6",
					"disabled": true,
					"name": "Side Effect",
					"reference": "B109",
					"cost_type": "percentage",
					"cost": 0,
					"affects": "total",
					"notes": "@Effect@"
				},
				{
					"type": "modifier",
					"id": "0db80aef-449d-4bbb-8020-015ca1d5d830",
					"disabled": true,
					"name": "Symptoms",
					"reference": "B109",
					"cost_type": "percentage",
					"cost": 0,
					"affects": "total",
					"notes": "@Effect@"
				},
				{
					"type": "modifier",
					"id": "0d6ce02c-cf69-49a9-9ddc-dcc8228536cc",
					"disabled": true,
					"name": "Armor Divisor",
					"reference": "B110",
					"cost_type": "percentage",
					"cost": -30,
					"affects": "total",
					"notes": "0.5"
				},
				{
					"type": "modifier",
					"id": "8a1aed72-abfb-43f8-b03c-92c4bfdffc3c",
					"disabled": true,
					"name": "Armor Divisor",
					"reference": "B110",
					"cost_type": "percentage",
					"cost": -50,
					"affects": "total",
					"notes": "0.2"
				},
				{
					"type": "modifier",
					"id": "26d5346d-4bdb-4e23-982e-41880a1d9fde",
					"disabled": true,
					"name": "Armor Divisor",
					"reference": "B110",
					"cost_type": "percentage",
					"cost": -70,
					"affects": "total",
					"notes": "0.1"
				},
				{
					"type": "modifier",
					"id": "7697456d-8544-4845-9fce-70a38be83c69",
					"disabled": true,
					"name": "No Blunt Trauma",
					"reference": "B111",
					"cost_type": "percentage",
					"cost": -20,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "0b039e75-48eb-478e-9122-c09761af3f65",
					"disabled": true,
					"name": "No Knockback",
					"reference": "B111",
					"cost_type": "percentage",
					"cost": -10,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "4cdb348e-96ad-4cf8-9ad5-2c3a3bd93f4b",
					"disabled": true,
					"name": "No Wounding",
					"reference": "B111",
					"cost_type": "percentage",
					"cost": -50,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "7be73b7e-8b65-4f67-be14-68a1205e24ed",
					"disabled": true,
					"name": "Incendiary",
					"reference": "B104",
					"cost_type": "percentage",
					"cost": 10,
					"affects": "total"
				}
			],
			"reference": "B61,P53,MA45",
			"calc": {
				"points": 8
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "d5f4f935-ba71-4f59-92ac-f6e5b92be77a",
			"name": "Innate Attack (Large Pierce)",
			"physical": true,
			"exotic": true,
			"levels": "1",
			"points_per_level": 6,
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "pi+",
						"base": "1d"
					},
					"accuracy": "3",
					"range": "10/100",
					"rate_of_fire": "1",
					"recoil": "1",
					"calc": {
						"level": 0,
						"range": "10/100",
						"damage": "1d pi+"
					},
					"defaults": [
						{
							"type": "skill",
							"name": "Innate Attack",
							"specialization": "@Attack Type@"
						},
						{
							"type": "skill",
							"name": "Innate Attack",
							"modifier": -2
						},
						{
							"type": "dx",
							"modifier": -4
						}
					]
				}
			],
			"modifiers": [
				{
					"type": "modifier",
					"id": "23d69d1c-1101-4231-938a-8fa1e67b25fc",
					"disabled": true,
					"name": "Double Blunt Trauma",
					"reference": "B104",
					"cost_type": "percentage",
					"cost": 20,
					"affects": "total",
					"notes": "1HP per 10 dmg"
				},
				{
					"type": "modifier",
					"id": "ffa2b14d-c7ae-42a2-bbd3-5f62788ac9a3",
					"disabled": true,
					"name": "Explosion",
					"reference": "B104",
					"cost_type": "percentage",
					"cost": 50,
					"affects": "total",
					"levels": 1
				},
				{
					"type": "modifier",
					"id": "e1fabcd0-4fd0-47fe-b268-06b4386eb7c3",
					"disabled": true,
					"name": "Fragmentation",
					"reference": "B104",
					"cost_type": "percentage",
					"cost": 15,
					"affects": "total",
					"levels": 1
				},
				{
					"type": "modifier",
					"id": "84156019-59e8-4d41-99ba-b88c9d21b649",
					"disabled": true,
					"name": "Fragmentation",
					"reference": "B104",
					"cost_type": "percentage",
					"cost": 15,
					"affects": "total",
					"levels": 1,
					"notes": "Hot"
				},
				{
					"type": "modifier",
					"id": "d8af325b-07a7-440f-8fc1-85a1dd225c31",
					"disabled": true,
					"name": "Surge",
					"reference": "B104",
					"cost_type": "percentage",
					"cost": 20,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "3fd094ba-37bc-42d1-a69b-56fce9f046cf",
					"disabled": true,
					"name": "Armor Divisor",
					"reference": "B102",
					"cost_type": "percentage",
					"cost": 50,
					"affects": "total",
					"notes": "2"
				},
				{
					"type": "modifier",
					"id": "48d116b0-8ec3-4905-97e0-c56a3e2a19d2",
					"disabled": true,
					"name": "Armor Divisor",
					"reference": "B102",
					"cost_type": "percentage",
					"cost": 100,
					"affects": "total",
					"notes": "3"
				},
				{
					"type": "modifier",
					"id": "f98905d5-cd46-4f1c-9f12-6535c01e9ed9",
					"disabled": true,
					"name": "Armor Divisor",
					"reference": "B102",
					"cost_type": "percentage",
					"cost": 150,
					"affects": "total",
					"notes": "5"
				},
				{
					"type": "modifier",
					"id": "7f5b33eb-f10e-4f51-a22f-1dee6642ef42",
					"disabled": true,
					"name": "Armor Divisor",
					"reference": "B102",
					"cost_type": "percentage",
					"cost": 200,
					"affects": "total",
					"notes": "10"
				},
				{
					"type": "modifier",
					"id": "43ba5b9f-54fd-4bb3-9b3e-f3a3d1a076ff",
					"disabled": true,
					"name": "Side Effect",
					"reference": "B109",
					"cost_type": "percentage",
					"cost": 0,
					"affects": "total",
					"notes": "@Effect@"
				},
				{
					"type": "modifier",
					"id": "682ae763-6c59-447b-b1ca-645ec269e824",
					"disabled": true,
					"name": "Symptoms",
					"reference": "B109",
					"cost_type": "percentage",
					"cost": 0,
					"affects": "total",
					"notes": "@Effect@"
				},
				{
					"type": "modifier",
					"id": "c9cc5518-1f99-4b14-8af9-16fe6a1774d4",
					"disabled": true,
					"name": "Armor Divisor",
					"reference": "B110",
					"cost_type": "percentage",
					"cost": -30,
					"affects": "total",
					"notes": "0.5"
				},
				{
					"type": "modifier",
					"id": "12be80dd-63b9-498d-8b7b-b376f8dd5775",
					"disabled": true,
					"name": "Armor Divisor",
					"reference": "B110",
					"cost_type": "percentage",
					"cost": -50,
					"affects": "total",
					"notes": "0.2"
				},
				{
					"type": "modifier",
					"id": "e4f5b07a-839a-45c2-8b96-a5df36d4a86c",
					"disabled": true,
					"name": "Armor Divisor",
					"reference": "B110",
					"cost_type": "percentage",
					"cost": -70,
					"affects": "total",
					"notes": "0.1"
				},
				{
					"type": "modifier",
					"id": "1a4eda0d-92c7-44f8-8dea-a1de3b1bd93a",
					"disabled": true,
					"name": "No Blunt Trauma",
					"reference": "B111",
					"cost_type": "percentage",
					"cost": -20,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "ec741993-27d5-45ee-853a-f89fa5189ec2",
					"disabled": true,
					"name": "No Wounding",
					"reference": "B111",
					"cost_type": "percentage",
					"cost": -50,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "c2d32a24-c0fa-4ced-a733-30303f385fcc",
					"disabled": true,
					"name": "Incendiary",
					"reference": "B104",
					"cost_type": "percentage",
					"cost": 10,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "a576282d-bcfc-4c9a-8d48-4a80bfdca6d6",
					"disabled": true,
					"name": "AP Ammo",
					"reference": "PU4:18",
					"cost_type": "percentage",
					"cost": 45,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "98f2980e-bcb5-4c6b-8cf6-a9546902c4bb",
					"disabled": true,
					"name": "HP Ammo",
					"reference": "PU4:18",
					"cost_type": "percentage",
					"cost": 20,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "e8c63cf1-f44e-46e2-9c3f-b25e9be048c6",
					"disabled": true,
					"name": "Multi-Ammo",
					"reference": "PU4:18",
					"cost_type": "percentage",
					"cost": 65,
					"affects": "total"
				}
			],
			"reference": "B62,P53,MA45",
			"calc": {
				"points": 6
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "3aa5e91d-509f-4f5e-8d98-2f4c6c87bc53",
			"name": "Innate Attack (Piercing)",
			"physical": true,
			"exotic": true,
			"levels": "1",
			"points_per_level": 5,
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "pi",
						"base": "1d"
					},
					"accuracy": "3",
					"range": "10/100",
					"rate_of_fire": "1",
					"recoil": "1",
					"calc": {
						"level": 0,
						"range": "10/100",
						"damage": "1d pi"
					},
					"defaults": [
						{
							"type": "skill",
							"name": "Innate Attack",
							"specialization": "@Attack Type@"
						},
						{
							"type": "skill",
							"name": "Innate Attack",
							"modifier": -2
						},
						{
							"type": "dx",
							"modifier": -4
						}
					]
				}
			],
			"modifiers": [
				{
					"type": "modifier",
					"id": "59ced55e-ad36-41ab-b283-f3bd8537761c",
					"disabled": true,
					"name": "Double Blunt Trauma",
					"reference": "B104",
					"cost_type": "percentage",
					"cost": 20,
					"affects": "total",
					"notes": "1HP per 10 dmg"
				},
				{
					"type": "modifier",
					"id": "077f7a3a-c6ef-4c65-85c7-c708bad6322b",
					"disabled": true,
					"name": "Explosion",
					"reference": "B104",
					"cost_type": "percentage",
					"cost": 50,
					"affects": "total",
					"levels": 1
				},
				{
					"type": "modifier",
					"id": "0effe4b8-526d-4e3e-93f8-437fb4de1dad",
					"disabled": true,
					"name": "Fragmentation",
					"reference": "B104",
					"cost_type": "percentage",
					"cost": 15,
					"affects": "total",
					"levels": 1
				},
				{
					"type": "modifier",
					"id": "39da3804-2555-415d-a746-aaca56bb84fc",
					"disabled": true,
					"name": "Fragmentation",
					"reference": "B104",
					"cost_type": "percentage",
					"cost": 15,
					"affects": "total",
					"levels": 1,
					"notes": "Hot"
				},
				{
					"type": "modifier",
					"id": "fc60e204-4aae-4aa9-9f16-f5affc4f9b0f",
					"disabled": true,
					"name": "Surge",
					"reference": "B104",
					"cost_type": "percentage",
					"cost": 20,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "dca19758-c235-46da-9863-768a4c000628",
					"disabled": true,
					"name": "Armor Divisor",
					"reference": "B102",
					"cost_type": "percentage",
					"cost": 50,
					"affects": "total",
					"notes": "2"
				},
				{
					"type": "modifier",
					"id": "db697800-dbaa-439d-8331-c5430b3c297e",
					"disabled": true,
					"name": "Armor Divisor",
					"reference": "B102",
					"cost_type": "percentage",
					"cost": 100,
					"affects": "total",
					"notes": "3"
				},
				{
					"type": "modifier",
					"id": "1bd838d6-22e8-4038-ad75-3d2b0cd44cd8",
					"disabled": true,
					"name": "Armor Divisor",
					"reference": "B102",
					"cost_type": "percentage",
					"cost": 150,
					"affects": "total",
					"notes": "5"
				},
				{
					"type": "modifier",
					"id": "336a1d18-4b34-426e-a1b8-591785729128",
					"disabled": true,
					"name": "Armor Divisor",
					"reference": "B102",
					"cost_type": "percentage",
					"cost": 200,
					"affects": "total",
					"notes": "10"
				},
				{
					"type": "modifier",
					"id": "e9d4d5fc-554b-4c29-bf5e-f880e5512d4d",
					"disabled": true,
					"name": "Side Effect",
					"reference": "B109",
					"cost_type": "percentage",
					"cost": 0,
					"affects": "total",
					"notes": "@Effect@"
				},
				{
					"type": "modifier",
					"id": "7394b53b-b6e1-4717-997d-8861a5770bb7",
					"disabled": true,
					"name": "Symptoms",
					"reference": "B109",
					"cost_type": "percentage",
					"cost": 0,
					"affects": "total",
					"notes": "@Effect@"
				},
				{
					"type": "modifier",
					"id": "07615cb1-2b14-493c-ab28-88e8082ace85",
					"disabled": true,
					"name": "Armor Divisor",
					"reference": "B110",
					"cost_type": "percentage",
					"cost": -30,
					"affects": "total",
					"notes": "0.5"
				},
				{
					"type": "modifier",
					"id": "b26bdf2a-8230-4e7e-aff1-5928b62c709a",
					"disabled": true,
					"name": "Armor Divisor",
					"reference": "B110",
					"cost_type": "percentage",
					"cost": -50,
					"affects": "total",
					"notes": "0.2"
				},
				{
					"type": "modifier",
					"id": "ed96db28-1287-4c6e-b1a2-948df78d89b8",
					"disabled": true,
					"name": "Armor Divisor",
					"reference": "B110",
					"cost_type": "percentage",
					"cost": -70,
					"affects": "total",
					"notes": "0.1"
				},
				{
					"type": "modifier",
					"id": "94d851cc-b423-4218-9bb9-813283b3fdde",
					"disabled": true,
					"name": "No Blunt Trauma",
					"reference": "B111",
					"cost_type": "percentage",
					"cost": -20,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "71822e94-6d6c-40f3-b9ff-328d6acd1a5c",
					"disabled": true,
					"name": "No Wounding",
					"reference": "B111",
					"cost_type": "percentage",
					"cost": -50,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "2ddfe21a-8a88-430e-b5ae-517a4c82ef38",
					"disabled": true,
					"name": "Incendiary",
					"reference": "B104",
					"cost_type": "percentage",
					"cost": 10,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "b0a53b8f-e0df-40e2-8b5a-ca54d4e31ad9",
					"disabled": true,
					"name": "AP Ammo",
					"reference": "PU4:18",
					"cost_type": "percentage",
					"cost": 20,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "f1c37091-1d85-4b79-8038-06a97b77246a",
					"disabled": true,
					"name": "HP Ammo",
					"reference": "PU4:18",
					"cost_type": "percentage",
					"cost": 20,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "8ed0841c-4201-4484-9b41-0af6e3730358",
					"disabled": true,
					"name": "Multi-Ammo",
					"reference": "PU4:18",
					"cost_type": "percentage",
					"cost": 40,
					"affects": "total"
				}
			],
			"reference": "B62,P53,MA45",
			"calc": {
				"points": 5
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "065462e2-afc6-4ef3-8414-8a4e0879b8bd",
			"name": "Innate Attack (Small Pierce)",
			"physical": true,
			"exotic": true,
			"levels": "1",
			"points_per_level": 3,
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "pi-",
						"base": "1d"
					},
					"accuracy": "3",
					"range": "10/100",
					"rate_of_fire": "1",
					"recoil": "1",
					"calc": {
						"level": 0,
						"range": "10/100",
						"damage": "1d pi-"
					},
					"defaults": [
						{
							"type": "skill",
							"name": "Innate Attack",
							"specialization": "@Attack Type@"
						},
						{
							"type": "skill",
							"name": "Innate Attack",
							"modifier": -2
						},
						{
							"type": "dx",
							"modifier": -4
						}
					]
				}
			],
			"modifiers": [
				{
					"type": "modifier",
					"id": "b75fb394-b99f-4cb6-9d14-0b3b4e647baa",
					"disabled": true,
					"name": "Double Blunt Trauma",
					"reference": "B104",
					"cost_type": "percentage",
					"cost": 20,
					"affects": "total",
					"notes": "1HP per 10 dmg"
				},
				{
					"type": "modifier",
					"id": "28303fd4-3e93-41a7-b08f-4a4d3006bfbf",
					"disabled": true,
					"name": "Explosion",
					"reference": "B104",
					"cost_type": "percentage",
					"cost": 50,
					"affects": "total",
					"levels": 1
				},
				{
					"type": "modifier",
					"id": "8ffb16f0-dfd9-4832-8302-cce07cee80ad",
					"disabled": true,
					"name": "Fragmentation",
					"reference": "B104",
					"cost_type": "percentage",
					"cost": 15,
					"affects": "total",
					"levels": 1
				},
				{
					"type": "modifier",
					"id": "b89afb25-e638-4b1c-8b8f-e1a41b5a69b9",
					"disabled": true,
					"name": "Fragmentation",
					"reference": "B104",
					"cost_type": "percentage",
					"cost": 15,
					"affects": "total",
					"levels": 1,
					"notes": "Hot"
				},
				{
					"type": "modifier",
					"id": "b5ace5ae-137a-4490-8eba-fcf881bbc3cd",
					"disabled": true,
					"name": "Surge",
					"reference": "B104",
					"cost_type": "percentage",
					"cost": 20,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "aadaf9d8-6b7b-4dbd-95ac-1c4e8a372848",
					"disabled": true,
					"name": "Armor Divisor",
					"reference": "B102",
					"cost_type": "percentage",
					"cost": 50,
					"affects": "total",
					"notes": "2"
				},
				{
					"type": "modifier",
					"id": "963a0ecb-4d42-4b70-b71d-cbe9e39c64b0",
					"disabled": true,
					"name": "Armor Divisor",
					"reference": "B102",
					"cost_type": "percentage",
					"cost": 100,
					"affects": "total",
					"notes": "3"
				},
				{
					"type": "modifier",
					"id": "9721d33f-4094-4ef2-8efb-b0b5b7a62245",
					"disabled": true,
					"name": "Armor Divisor",
					"reference": "B102",
					"cost_type": "percentage",
					"cost": 150,
					"affects": "total",
					"notes": "5"
				},
				{
					"type": "modifier",
					"id": "76f5beab-c2ea-43e7-bacc-df68738e0d5d",
					"disabled": true,
					"name": "Armor Divisor",
					"reference": "B102",
					"cost_type": "percentage",
					"cost": 200,
					"affects": "total",
					"notes": "10"
				},
				{
					"type": "modifier",
					"id": "d2ec4745-3e03-47c8-9d5d-b0dd58f65a16",
					"disabled": true,
					"name": "Side Effect",
					"reference": "B109",
					"cost_type": "percentage",
					"cost": 0,
					"affects": "total",
					"notes": "@Effect@"
				},
				{
					"type": "modifier",
					"id": "319bbf8b-47ad-42a4-befc-277db2e26607",
					"disabled": true,
					"name": "Symptoms",
					"reference": "B109",
					"cost_type": "percentage",
					"cost": 0,
					"affects": "total",
					"notes": "@Effect@"
				},
				{
					"type": "modifier",
					"id": "25811386-bd36-472e-9de6-8fa84fa9e212",
					"disabled": true,
					"name": "Armor Divisor",
					"reference": "B110",
					"cost_type": "percentage",
					"cost": -30,
					"affects": "total",
					"notes": "0.5"
				},
				{
					"type": "modifier",
					"id": "3135a4b1-9954-4eff-9154-0c6ecea31d61",
					"disabled": true,
					"name": "Armor Divisor",
					"reference": "B110",
					"cost_type": "percentage",
					"cost": -50,
					"affects": "total",
					"notes": "0.2"
				},
				{
					"type": "modifier",
					"id": "327afc23-4f33-4fdb-aa8f-9206d69817bb",
					"disabled": true,
					"name": "Armor Divisor",
					"reference": "B110",
					"cost_type": "percentage",
					"cost": -70,
					"affects": "total",
					"notes": "0.1"
				},
				{
					"type": "modifier",
					"id": "a9c4af66-d697-467b-b1c6-acf5f172e4b4",
					"disabled": true,
					"name": "No Blunt Trauma",
					"reference": "B111",
					"cost_type": "percentage",
					"cost": -20,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "1551a029-27ea-4e43-a4de-a5523c7ebe0a",
					"disabled": true,
					"name": "No Wounding",
					"reference": "B111",
					"cost_type": "percentage",
					"cost": -50,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "244a5069-24cc-4300-8eb2-4c9e12c0dc10",
					"disabled": true,
					"name": "Incendiary",
					"reference": "B104",
					"cost_type": "percentage",
					"cost": 10,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "20823eb3-bf0b-4d60-8ad0-a5ebc4350e9b",
					"disabled": true,
					"name": "HP Ammo",
					"reference": "PU4:18",
					"cost_type": "percentage",
					"cost": 40,
					"affects": "total"
				}
			],
			"reference": "B62,P53,MA45",
			"calc": {
				"points": 3
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "fe73010c-ca80-4458-b051-c55d17f32f15",
			"name": "Innate Attack (Toxic)",
			"physical": true,
			"exotic": true,
			"levels": "1",
			"points_per_level": 4,
			"weapons": [
				{
					"type": "ranged_weapon",
					"damage": {
						"type": "tox",
						"base": "1d"
					},
					"accuracy": "3",
					"range": "10/100",
					"rate_of_fire": "1",
					"recoil": "1",
					"calc": {
						"level": 0,
						"range": "10/100",
						"damage": "1d tox"
					},
					"defaults": [
						{
							"type": "skill",
							"name": "Innate Attack",
							"specialization": "@Attack Type@"
						},
						{
							"type": "skill",
							"name": "Innate Attack",
							"modifier": -2
						},
						{
							"type": "dx",
							"modifier": -4
						}
					]
				}
			],
			"modifiers": [
				{
					"type": "modifier",
					"id": "638d7af6-9883-4c0a-a4f4-724e07929871",
					"disabled": true,
					"name": "Cyclic",
					"reference": "B103",
					"cost_type": "percentage",
					"cost": 100,
					"affects": "total",
					"levels": 1,
					"notes": "1 sec"
				},
				{
					"type": "modifier",
					"id": "3557cb2c-f7b5-43d3-9086-61a7574f2aef",
					"disabled": true,
					"name": "Cyclic",
					"reference": "B103",
					"cost_type": "percentage",
					"cost": 50,
					"affects": "total",
					"levels": 1,
					"notes": "10 sec"
				},
				{
					"type": "modifier",
					"id": "374a177a-b5fe-4859-9f1d-baaf76bf73b6",
					"disabled": true,
					"name": "Cyclic",
					"reference": "B103",
					"cost_type": "percentage",
					"cost": 40,
					"affects": "total",
					"levels": 1,
					"notes": "1 min"
				},
				{
					"type": "modifier",
					"id": "6432f1ae-e87e-44ce-bd4d-afbf5506fb2b",
					"disabled": true,
					"name": "Cyclic",
					"reference": "B103",
					"cost_type": "percentage",
					"cost": 20,
					"affects": "total",
					"levels": 1,
					"notes": "1 hr"
				},
				{
					"type": "modifier",
					"id": "b665f341-8ba2-4610-8bf0-ace4a84cd14d",
					"disabled": true,
					"name": "Cyclic",
					"reference": "B103",
					"cost_type": "percentage",
					"cost": 10,
					"affects": "total",
					"levels": 1,
					"notes": "1 day"
				},
				{
					"type": "modifier",
					"id": "432a0fc4-ea46-49db-9772-c90d78313b2f",
					"disabled": true,
					"name": "Cyclic",
					"reference": "B103",
					"cost_type": "percentage",
					"cost": 50,
					"affects": "total",
					"levels": 1,
					"notes": "1 sec; Resistible"
				},
				{
					"type": "modifier",
					"id": "3d5749eb-62e3-4e62-8432-219770f999cc",
					"disabled": true,
					"name": "Cyclic",
					"reference": "B103",
					"cost_type": "percentage",
					"cost": 25,
					"affects": "total",
					"levels": 1,
					"notes": "10 sec; Resistible"
				},
				{
					"type": "modifier",
					"id": "59f3d0df-b12d-4652-8bd9-c71268f9c9bb",
					"disabled": true,
					"name": "Cyclic",
					"reference": "B103",
					"cost_type": "percentage",
					"cost": 20,
					"affects": "total",
					"levels": 1,
					"notes": "1 min; Resistible"
				},
				{
					"type": "modifier",
					"id": "7984f0fd-b883-489f-a0d3-02dcf05227b7",
					"disabled": true,
					"name": "Cyclic",
					"reference": "B103",
					"cost_type": "percentage",
					"cost": 10,
					"affects": "total",
					"levels": 1,
					"notes": "1 hr; Resistible"
				},
				{
					"type": "modifier",
					"id": "b6918f73-02fa-45bc-83fa-b16439a3250b",
					"disabled": true,
					"name": "Cyclic",
					"reference": "B103",
					"cost_type": "percentage",
					"cost": 5,
					"affects": "total",
					"levels": 1,
					"notes": "1 day; Resistible"
				},
				{
					"type": "modifier",
					"id": "ae8b11ba-a459-4a63-9936-90369a649705",
					"disabled": true,
					"name": "Contagious",
					"reference": "B103",
					"cost_type": "percentage",
					"cost": 20,
					"affects": "total",
					"notes": "Mildly"
				},
				{
					"type": "modifier",
					"id": "ce7bc11f-fb0a-4160-a523-76465b42396b",
					"disabled": true,
					"name": "Contagious",
					"reference": "B103",
					"cost_type": "percentage",
					"cost": 50,
					"affects": "total",
					"notes": "Highly"
				},
				{
					"type": "modifier",
					"id": "b8d17d93-35a3-43c4-a172-93980659851c",
					"disabled": true,
					"name": "Double Blunt Trauma",
					"reference": "B104",
					"cost_type": "percentage",
					"cost": 20,
					"affects": "total",
					"notes": "1HP per 10 dmg"
				},
				{
					"type": "modifier",
					"id": "f5aa00ef-dac3-4379-ab0c-ab495034d1a5",
					"disabled": true,
					"name": "Explosion",
					"reference": "B104",
					"cost_type": "percentage",
					"cost": 50,
					"affects": "total",
					"levels": 1
				},
				{
					"type": "modifier",
					"id": "1325d13c-5261-49f7-8ed4-0cc23f190a78",
					"disabled": true,
					"name": "Fragmentation",
					"reference": "B104",
					"cost_type": "percentage",
					"cost": 15,
					"affects": "total",
					"levels": 1
				},
				{
					"type": "modifier",
					"id": "876eb22a-4fda-4e21-ac8d-51ed5d75ffd9",
					"disabled": true,
					"name": "Fragmentation",
					"reference": "B104",
					"cost_type": "percentage",
					"cost": 15,
					"affects": "total",
					"levels": 1,
					"notes": "Hot"
				},
				{
					"type": "modifier",
					"id": "8295b64d-117c-4af0-bdd5-4abda07b3c6d",
					"disabled": true,
					"name": "Radiation",
					"reference": "B104",
					"cost_type": "percentage",
					"cost": 100,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "8bbac961-18e3-404b-a496-263ed0b36e85",
					"disabled": true,
					"name": "Surge",
					"reference": "B104",
					"cost_type": "percentage",
					"cost": 20,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "f5e29054-576c-48d1-9041-76498fbdd263",
					"disabled": true,
					"name": "Armor Divisor",
					"reference": "B102",
					"cost_type": "percentage",
					"cost": 50,
					"affects": "total",
					"notes": "2"
				},
				{
					"type": "modifier",
					"id": "b7a9c8a1-15ea-4dd5-8147-5f8f1989c92f",
					"disabled": true,
					"name": "Armor Divisor",
					"reference": "B102",
					"cost_type": "percentage",
					"cost": 100,
					"affects": "total",
					"notes": "3"
				},
				{
					"type": "modifier",
					"id": "45ab2bd6-13aa-4fc7-bc5e-f96026e27b00",
					"disabled": true,
					"name": "Armor Divisor",
					"reference": "B102",
					"cost_type": "percentage",
					"cost": 150,
					"affects": "total",
					"notes": "5"
				},
				{
					"type": "modifier",
					"id": "65a6d106-0aaf-4cb6-94bd-328d685c9469",
					"disabled": true,
					"name": "Armor Divisor",
					"reference": "B102",
					"cost_type": "percentage",
					"cost": 200,
					"affects": "total",
					"notes": "10"
				},
				{
					"type": "modifier",
					"id": "64f709b8-1f48-4d99-9bab-e0ab35a6fae6",
					"disabled": true,
					"name": "Side Effect",
					"reference": "B109",
					"cost_type": "percentage",
					"cost": 0,
					"affects": "total",
					"notes": "@Effect@"
				},
				{
					"type": "modifier",
					"id": "bd482c46-5a30-4721-ba71-0f8c860ebd11",
					"disabled": true,
					"name": "Symptoms",
					"reference": "B109",
					"cost_type": "percentage",
					"cost": 0,
					"affects": "total",
					"notes": "@Effect@"
				},
				{
					"type": "modifier",
					"id": "770c7cf2-4525-428c-8fdb-4ac85c63b8de",
					"disabled": true,
					"name": "Armor Divisor",
					"reference": "B110",
					"cost_type": "percentage",
					"cost": -30,
					"affects": "total",
					"notes": "0.5"
				},
				{
					"type": "modifier",
					"id": "d7357b09-cf21-4146-8bcf-f146cbbc2a8f",
					"disabled": true,
					"name": "Armor Divisor",
					"reference": "B110",
					"cost_type": "percentage",
					"cost": -50,
					"affects": "total",
					"notes": "0.2"
				},
				{
					"type": "modifier",
					"id": "5125bdb8-3e26-4a16-b72c-e90df4a1c828",
					"disabled": true,
					"name": "Armor Divisor",
					"reference": "B110",
					"cost_type": "percentage",
					"cost": -70,
					"affects": "total",
					"notes": "0.1"
				},
				{
					"type": "modifier",
					"id": "9f935517-5c4e-4305-afbc-2985b560237e",
					"disabled": true,
					"name": "No Wounding",
					"reference": "B111",
					"cost_type": "percentage",
					"cost": -50,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "c6ef375e-4909-47ac-884a-483974c9d75c",
					"disabled": true,
					"name": "Incendiary",
					"reference": "B104",
					"cost_type": "percentage",
					"cost": 10,
					"affects": "total"
				}
			],
			"reference": "B62,P53,MA45",
			"calc": {
				"points": 4
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "4705161a-3234-4d9a-8f07-09130437db98",
			"name": "Innumerate",
			"mental": true,
			"base_points": -5,
			"reference": "B140",
			"calc": {
				"points": -5
			},
			"prereqs": {
				"type": "prereq_list",
				"all": true,
				"prereqs": [
					{
						"type": "skill_prereq",
						"has": false,
						"name": {
							"compare": "contains",
							"qualifier": "physics"
						}
					},
					{
						"type": "skill_prereq",
						"has": false,
						"name": {
							"compare": "contains",
							"qualifier": "mathematics"
						}
					},
					{
						"type": "skill_prereq",
						"has": false,
						"name": {
							"compare": "is",
							"qualifier": "market analysis"
						}
					},
					{
						"type": "skill_prereq",
						"has": false,
						"name": {
							"compare": "is",
							"qualifier": "finance"
						}
					},
					{
						"type": "skill_prereq",
						"has": false,
						"name": {
							"compare": "contains",
							"qualifier": "engineer"
						}
					},
					{
						"type": "skill_prereq",
						"has": false,
						"name": {
							"compare": "is",
							"qualifier": "cryptography"
						}
					},
					{
						"type": "skill_prereq",
						"has": false,
						"name": {
							"compare": "is",
							"qualifier": "astronomy"
						}
					},
					{
						"type": "skill_prereq",
						"has": false,
						"name": {
							"compare": "is",
							"qualifier": "accounting"
						}
					},
					{
						"type": "skill_prereq",
						"has": false,
						"name": {
							"compare": "is",
							"qualifier": "economics"
						}
					},
					{
						"type": "skill_prereq",
						"has": false,
						"name": {
							"compare": "is",
							"qualifier": "computer programming"
						}
					}
				]
			},
			"features": [
				{
					"type": "conditional_modifier",
					"amount": -4,
					"situation": "to rolls to notice you\'ve been cheated by dishonest merchants"
				}
			],
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "9ecab8b4-75a0-40b4-a232-cb529c165769",
			"name": "Insomniac",
			"physical": true,
			"modifiers": [
				{
					"type": "modifier",
					"id": "e47e9c6f-e931-4653-b330-dca69460b277",
					"name": "Mild",
					"reference": "B140",
					"cost_type": "points",
					"cost": -10,
					"affects": "total",
					"notes": "GM secretly rolls 3d for the number of days between episodes"
				},
				{
					"type": "modifier",
					"id": "160153c2-a7b8-49f7-b638-940d2a427f25",
					"disabled": true,
					"name": "Severe",
					"reference": "B140",
					"cost_type": "points",
					"cost": -15,
					"affects": "total",
					"notes": "GM secretly rolls 2d-1 for the number of days between episodes"
				}
			],
			"reference": "B140",
			"calc": {
				"points": -10
			},
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "fe261331-189e-44e5-9f64-65043ba2f83a",
			"name": "Insubstantiality",
			"mental": true,
			"physical": true,
			"exotic": true,
			"base_points": 80,
			"modifiers": [
				{
					"type": "modifier",
					"id": "3fb8878d-5655-445e-9d31-9e33fc0bc493",
					"disabled": true,
					"name": "Affect Substantial",
					"reference": "B63",
					"cost_type": "percentage",
					"cost": 100,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "96e50e39-6ab0-4026-877e-a35ab64a72c3",
					"disabled": true,
					"name": "Can Carry Objects",
					"reference": "B63",
					"cost_type": "percentage",
					"cost": 10,
					"affects": "total",
					"notes": "Up to No Encumbrance"
				},
				{
					"type": "modifier",
					"id": "56ce8ce5-33ca-41e9-a1fe-819d61cce1c5",
					"disabled": true,
					"name": "Can Carry Objects",
					"reference": "B63",
					"cost_type": "percentage",
					"cost": 20,
					"affects": "total",
					"notes": "Up to Light Encumbrance"
				},
				{
					"type": "modifier",
					"id": "ba34ca18-f8d0-4047-8533-24d0bd38937e",
					"disabled": true,
					"name": "Can Carry Objects",
					"reference": "B63",
					"cost_type": "percentage",
					"cost": 50,
					"affects": "total",
					"notes": "Up to Medium Encumbrance"
				},
				{
					"type": "modifier",
					"id": "4de4ab86-aa6e-4e28-a4b6-7dca6dfce411",
					"disabled": true,
					"name": "Can Carry Objects",
					"reference": "B63",
					"cost_type": "percentage",
					"cost": 100,
					"affects": "total",
					"notes": "Up to Heavy Encumbrance"
				},
				{
					"type": "modifier",
					"id": "c8292ed6-c0b3-492b-889e-b313d90d945b",
					"disabled": true,
					"name": "Partial Change",
					"reference": "B63",
					"cost_type": "percentage",
					"cost": 20,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "9e24d3f1-0f0a-456d-9ecb-5a5b86a8be2c",
					"disabled": true,
					"name": "Partial Change",
					"reference": "B63",
					"cost_type": "percentage",
					"cost": 100,
					"affects": "total",
					"notes": "Can turn an item you are carrying substantial without dropping it"
				},
				{
					"type": "modifier",
					"id": "a030dea2-6ace-439d-a795-552b09161162",
					"disabled": true,
					"name": "Always On",
					"reference": "B63",
					"cost_type": "percentage",
					"cost": -50,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "a12dd6b5-6bb0-4472-829f-e87adb9f370a",
					"disabled": true,
					"name": "Usually On",
					"reference": "B63",
					"cost_type": "percentage",
					"cost": -40,
					"affects": "total",
					"notes": "Materialization costs 1 FP per second"
				},
				{
					"type": "modifier",
					"id": "b4e2c8b3-7cd3-46a0-9c71-140d8cb7a8b5",
					"disabled": true,
					"name": "No Vertical Move",
					"reference": "P56",
					"cost_type": "percentage",
					"cost": -10,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "bf4438fc-c350-437f-b39f-b4bfab602bcb",
					"disabled": true,
					"name": "Noisy",
					"reference": "P56",
					"cost_type": "percentage",
					"cost": -5,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "c6e94b71-4fa4-476c-b672-031da159c414",
					"disabled": true,
					"name": "Projection",
					"reference": "P56",
					"cost_type": "percentage",
					"cost": -50,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "77fec951-69aa-44b0-a0cb-a110183fdd95",
					"disabled": true,
					"name": "Reversion",
					"reference": "H16",
					"cost_type": "percentage",
					"cost": 60,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "3e818cad-5823-4984-bb58-8e5be1228c42",
					"disabled": true,
					"name": "Touch",
					"reference": "H16",
					"cost_type": "percentage",
					"cost": 0,
					"affects": "total",
					"notes": "Always On"
				},
				{
					"type": "modifier",
					"id": "c130be05-af3b-4e91-896e-2e1f90e27289",
					"disabled": true,
					"name": "Touch",
					"reference": "H16",
					"cost_type": "percentage",
					"cost": 5,
					"affects": "total",
					"notes": "Switchable"
				},
				{
					"type": "modifier",
					"id": "5ef976cc-1ed0-448c-a7ca-1bd58a7001aa",
					"disabled": true,
					"name": "Difficult Materialization",
					"reference": "H16",
					"cost_type": "percentage",
					"cost": -20,
					"affects": "total",
					"notes": "Mutually exclusive with Usually On."
				},
				{
					"type": "modifier",
					"id": "b365f8c9-e836-4ab0-b6c7-adf848dcf04c",
					"disabled": true,
					"name": "Ectoplasmic Materialization",
					"reference": "H16",
					"cost_type": "percentage",
					"cost": -35,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "25d50ad0-0f0f-4d32-b70a-f5533ac102ea",
					"disabled": true,
					"name": "Ghost Air",
					"reference": "PSI14",
					"cost_type": "percentage",
					"cost": 10,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "c926816f-6a45-4305-b895-a8b57b203481",
					"disabled": true,
					"name": "Substantial Communication",
					"reference": "PSI14",
					"cost_type": "percentage",
					"cost": 40,
					"affects": "total"
				}
			],
			"reference": "B62,P55,PSI14",
			"calc": {
				"points": 80
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "07a0d324-5b26-4092-b96f-2d0541b6397f",
			"name": "Intolerance (@Class, Ethnicity, Nationality, Religion, Sex, or Species@)",
			"mental": true,
			"modifiers": [
				{
					"type": "modifier",
					"id": "0e1c693c-166b-417f-b6aa-1c6e04afbd68",
					"disabled": true,
					"name": "Scope: Common",
					"reference": "B140",
					"cost_type": "points",
					"cost": -5,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "e21c80e8-cdd8-4040-b7a1-33af63210703",
					"disabled": true,
					"name": "Scope: Occasional",
					"reference": "B140",
					"cost_type": "points",
					"cost": -2,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "2655dfad-4f5e-4367-a524-fad35a774654",
					"disabled": true,
					"name": "Scope: Rare",
					"reference": "B140",
					"cost_type": "points",
					"cost": -1,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "522dbb89-3781-4d8b-bf72-a6d24892dce2",
					"disabled": true,
					"name": "Scope: Anyone unlike you",
					"reference": "B140",
					"cost_type": "points",
					"cost": -10,
					"affects": "total"
				}
			],
			"reference": "B140",
			"calc": {
				"points": 0
			},
			"features": [
				{
					"type": "reaction_bonus",
					"amount": -1,
					"situation": "from victims of your intolerance (may be as much as -5, at GM\'s discretion)"
				}
			],
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "2c71cf8a-9c27-4734-9991-fb13571a34cd",
			"name": "Intuition",
			"mental": true,
			"base_points": 15,
			"modifiers": [
				{
					"type": "modifier",
					"id": "e06e6e3c-d4d0-43d5-8c38-b91e8b10d310",
					"disabled": true,
					"name": "Inspired",
					"reference": "P56",
					"cost_type": "percentage",
					"cost": 100,
					"affects": "total"
				}
			],
			"reference": "B63,P56",
			"calc": {
				"points": 15
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "f9016b57-ba56-4ed4-b048-bc8f54f3f4e0",
			"name": "Invertebrate",
			"physical": true,
			"exotic": true,
			"base_points": -20,
			"reference": "B140",
			"calc": {
				"points": -20
			},
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "e207ed37-01f9-4e45-b702-e7a7d0674aa6",
			"name": "Invisibility",
			"mental": true,
			"physical": true,
			"exotic": true,
			"base_points": 40,
			"modifiers": [
				{
					"type": "modifier",
					"id": "850cfdf9-3f6a-4465-93a6-5e4d8b0932c5",
					"disabled": true,
					"name": "Affects Machines",
					"reference": "B63",
					"cost_type": "percentage",
					"cost": 50,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "b2874261-ee61-41f1-b30b-70cea214ea0a",
					"disabled": true,
					"name": "Can Carry Objects",
					"reference": "B63",
					"cost_type": "percentage",
					"cost": 10,
					"affects": "total",
					"notes": "Up to No Encumbrance"
				},
				{
					"type": "modifier",
					"id": "7c5c100f-dbe6-4c95-8ade-2a67f5038baa",
					"disabled": true,
					"name": "Can Carry Objects",
					"reference": "B63",
					"cost_type": "percentage",
					"cost": 20,
					"affects": "total",
					"notes": "Up to Light Encumbrance"
				},
				{
					"type": "modifier",
					"id": "80e2f366-8d67-4d29-866a-fc2d75ee7add",
					"disabled": true,
					"name": "Can Carry Objects",
					"reference": "B63",
					"cost_type": "percentage",
					"cost": 50,
					"affects": "total",
					"notes": "Up to Medium Encumbrance"
				},
				{
					"type": "modifier",
					"id": "86c568c7-be28-4319-acce-b3c9ecf5bb1c",
					"disabled": true,
					"name": "Can Carry Objects",
					"reference": "B63",
					"cost_type": "percentage",
					"cost": 100,
					"affects": "total",
					"notes": "Up to Heavy Encumbrance"
				},
				{
					"type": "modifier",
					"id": "61e6764e-1bc1-4cf7-b693-06c02a17c548",
					"disabled": true,
					"name": "Extended",
					"reference": "B63",
					"cost_type": "percentage",
					"cost": 20,
					"affects": "total",
					"notes": "@Type@"
				},
				{
					"type": "modifier",
					"id": "3dc82a25-e29f-4eb6-bc9b-b1790f6ff37a",
					"disabled": true,
					"name": "Switchable",
					"reference": "B63",
					"cost_type": "percentage",
					"cost": 10,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "091056db-e035-406e-ac01-a34146bc5697",
					"disabled": true,
					"name": "Usually On",
					"reference": "B63",
					"cost_type": "percentage",
					"cost": 5,
					"affects": "total",
					"notes": "Turning visible costs 1 FP per second"
				},
				{
					"type": "modifier",
					"id": "b3cecff4-4ccc-4cd0-b24b-95f18faf0034",
					"disabled": true,
					"name": "Machines Only",
					"reference": "B63",
					"cost_type": "percentage",
					"cost": -50,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "0cd1bbc5-e6b4-4902-9201-47c10c6377c2",
					"disabled": true,
					"name": "Substantial Only",
					"reference": "B63",
					"cost_type": "percentage",
					"cost": -10,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "c96d9a12-23b4-4775-bb56-79028a970bf2",
					"disabled": true,
					"name": "Visible Reflection",
					"reference": "B63",
					"cost_type": "percentage",
					"cost": -10,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "3a5064f1-8046-4458-ad53-993ca9494416",
					"disabled": true,
					"name": "Visible Shadow",
					"reference": "B63",
					"cost_type": "percentage",
					"cost": -10,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "f24d05ed-5bd5-4d9c-ba57-902a29a71b2f",
					"disabled": true,
					"name": "Fringe",
					"reference": "P56",
					"cost_type": "percentage",
					"cost": -10,
					"affects": "total"
				}
			],
			"reference": "B63,P56",
			"calc": {
				"points": 40
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "af0b089c-dc85-4f25-86d4-9c0bb3f226ff",
			"name": "Jealousy",
			"mental": true,
			"base_points": -10,
			"reference": "B140",
			"calc": {
				"points": -10
			},
			"features": [
				{
					"type": "reaction_bonus",
					"amount": -2,
					"situation": "toward those you are jealous of (may be as much as -4, at GM\'s discretion)"
				}
			],
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "f907c109-b0f2-4ebe-a372-cbe5a01b2740",
			"name": "Jumper (@World/Time/Spirit@)",
			"mental": true,
			"supernatural": true,
			"base_points": 100,
			"modifiers": [
				{
					"type": "modifier",
					"id": "4c92ba61-e4c6-4e6b-888b-60f40293f61e",
					"disabled": true,
					"name": "Extra Carrying Capacity",
					"reference": "B64",
					"cost_type": "percentage",
					"cost": 10,
					"affects": "total",
					"notes": "Up to Light Encumbrance"
				},
				{
					"type": "modifier",
					"id": "427f7414-654f-40eb-a7ef-9b26718d5522",
					"disabled": true,
					"name": "Extra Carrying Capacity",
					"reference": "B64",
					"cost_type": "percentage",
					"cost": 20,
					"affects": "total",
					"notes": "Up to Medium Encumbrance"
				},
				{
					"type": "modifier",
					"id": "9994f704-7401-401a-b65f-d8febd653aa0",
					"disabled": true,
					"name": "Extra Carrying Capacity",
					"reference": "B64",
					"cost_type": "percentage",
					"cost": 30,
					"affects": "total",
					"notes": "Up to Heavy Encumbrance"
				},
				{
					"type": "modifier",
					"id": "194b3e79-c636-43d1-a121-c7dedbde00c7",
					"disabled": true,
					"name": "Extra Carrying Capacity",
					"reference": "B64",
					"cost_type": "percentage",
					"cost": 50,
					"affects": "total",
					"notes": "Up to Extra-Heavy Encumbrance"
				},
				{
					"type": "modifier",
					"id": "765d861b-7fe6-4045-bb0b-8a9df7a7ddac",
					"disabled": true,
					"name": "New Worlds",
					"reference": "B64",
					"cost_type": "percentage",
					"cost": 50,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "363182e3-d557-407f-84dd-6e2bbcc694bc",
					"disabled": true,
					"name": "Omni-Jump",
					"reference": "B64",
					"cost_type": "percentage",
					"cost": 10,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "75e741a6-b2a2-405b-99a2-8a122bad96be",
					"disabled": true,
					"name": "Tracking",
					"reference": "B64",
					"cost_type": "percentage",
					"cost": 20,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "0e7f89d5-cf1a-4f88-9f87-64041f49764f",
					"disabled": true,
					"name": "Tunnel",
					"reference": "B64",
					"cost_type": "percentage",
					"cost": 40,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "8625fd7a-88a0-4679-8a56-f9dbdea730e1",
					"disabled": true,
					"name": "Warp Jump",
					"reference": "B64",
					"cost_type": "percentage",
					"cost": 10,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "55703a5e-ad25-4343-a93f-3020886e88f0",
					"disabled": true,
					"name": "Cannot Escort",
					"reference": "B64",
					"cost_type": "percentage",
					"cost": -10,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "93dc5fb2-a8eb-4259-8c63-0706896ceff3",
					"disabled": true,
					"name": "Cannot Follow",
					"reference": "B64",
					"cost_type": "percentage",
					"cost": -20,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "02854737-c130-4235-8dbb-a86588af5ec3",
					"disabled": true,
					"name": "Drift",
					"reference": "B64",
					"cost_type": "percentage",
					"cost": -15,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "62a63074-99bd-47cc-91f1-f2cd1782347f",
					"disabled": true,
					"name": "Limited Jump",
					"reference": "B64",
					"cost_type": "percentage",
					"cost": -10,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "dc028e85-9126-4974-a767-05e344ed2b7d",
					"disabled": true,
					"name": "Maximum Range",
					"reference": "B64",
					"cost_type": "percentage",
					"cost": -10,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "dc435fc9-425a-4730-a07b-43e288e5bd13",
					"disabled": true,
					"name": "Naked",
					"reference": "B65",
					"cost_type": "percentage",
					"cost": -30,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "ffad9f80-d18a-402a-b635-7ce119225fe7",
					"disabled": true,
					"name": "Stunned",
					"reference": "B65",
					"cost_type": "percentage",
					"cost": -10,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "af77fd8f-74d4-429f-a9d3-a915a6652e44",
					"disabled": true,
					"name": "Interplanar",
					"reference": "P57",
					"cost_type": "percentage",
					"cost": 100,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "2254b318-d27e-425e-aef4-10ca824f1c33",
					"disabled": true,
					"name": "Interplanar Only",
					"reference": "P57",
					"cost_type": "percentage",
					"cost": 0,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "5632d333-bc5c-46a1-a1e1-0635b7f5a1c2",
					"disabled": true,
					"name": "Reliable",
					"reference": "P57",
					"cost_type": "percentage",
					"cost": 5,
					"affects": "total",
					"levels": 1
				},
				{
					"type": "modifier",
					"id": "615e82a3-43f2-47b8-a8f1-cdce921bb051",
					"disabled": true,
					"name": "Limited Access",
					"reference": "P57",
					"cost_type": "percentage",
					"cost": 0,
					"affects": "total",
					"notes": "@Worlds@"
				},
				{
					"type": "modifier",
					"id": "2139aa6d-14d2-4d33-8698-acd1cc460705",
					"disabled": true,
					"name": "Projection",
					"reference": "P58",
					"cost_type": "percentage",
					"cost": -50,
					"affects": "total",
					"notes": "Can\'t Affect"
				},
				{
					"type": "modifier",
					"id": "22a4df9e-4ab7-444f-ab69-bdfb9f1d05e0",
					"disabled": true,
					"name": "Projection",
					"reference": "P58",
					"cost_type": "percentage",
					"cost": 0,
					"affects": "total",
					"notes": "Can Affect"
				},
				{
					"type": "modifier",
					"id": "55d50f68-8d5c-4f59-99d0-4b5bdf253e9a",
					"disabled": true,
					"name": "Projection",
					"reference": "P58",
					"cost_type": "percentage",
					"cost": -25,
					"affects": "total",
					"notes": "Physical"
				},
				{
					"type": "modifier",
					"id": "fcaa92c7-91d1-42e2-a269-cf1ad0451d01",
					"disabled": true,
					"name": "Special Movement",
					"reference": "P58",
					"cost_type": "percentage",
					"cost": 0,
					"affects": "total",
					"notes": "@Movement@"
				},
				{
					"type": "modifier",
					"id": "aa67d630-2604-4b56-bdb6-750863bb7e0c",
					"disabled": true,
					"name": "Special Portal",
					"reference": "P58",
					"cost_type": "percentage",
					"cost": 0,
					"affects": "total",
					"notes": "@Portal@"
				},
				{
					"type": "modifier",
					"id": "bd19252b-0597-46c9-bc3c-96e7d8f6d438",
					"disabled": true,
					"name": "Faster Concentration",
					"reference": "PSI15",
					"cost_type": "percentage",
					"cost": 5,
					"affects": "total",
					"levels": 1
				},
				{
					"type": "modifier",
					"id": "257b2814-d81f-4934-bba3-d68afc88ee8c",
					"disabled": true,
					"name": "Improved",
					"reference": "PSI15",
					"cost_type": "percentage",
					"cost": 10,
					"affects": "total"
				}
			],
			"reference": "B64,P57,PSI15",
			"calc": {
				"points": 100
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "c6a1431d-eab3-4392-bf3b-ca4551295135",
			"name": "Killjoy",
			"physical": true,
			"base_points": -15,
			"reference": "B140",
			"calc": {
				"points": -15
			},
			"features": [
				{
					"type": "skill_bonus",
					"amount": -3,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "carousing"
					}
				},
				{
					"type": "skill_bonus",
					"amount": -3,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "contains",
						"qualifier": "connoisseur"
					}
				},
				{
					"type": "skill_bonus",
					"amount": -3,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "erotic art"
					}
				},
				{
					"type": "skill_bonus",
					"amount": -3,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "gambling"
					}
				},
				{
					"type": "reaction_bonus",
					"amount": -1,
					"situation": "(up to -3, at GM\'s discretion) from others in any situation where your lack of appreciation becomes obvious (GM’s decision)"
				}
			],
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "81d4e9b6-70b3-4df3-87ed-5b3ccd04b32e",
			"name": "Kleptomania",
			"mental": true,
			"base_points": -15,
			"cr": 12,
			"reference": "B141",
			"calc": {
				"points": -15
			},
			"notes": "Make a self-control roll whenever you are presented with a chance to steal, at up to -3 if the item is especially interesting to you (not necessarily valuable, unless you are poor or have Greed). If you fail, you must try to steal it. You may keep or sell stolen items, but you may not return or discard them.",
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "2ff30700-1583-439e-b139-90196b3eaba9",
			"name": "Klutz",
			"physical": true,
			"base_points": -5,
			"modifiers": [
				{
					"type": "modifier",
					"id": "83fd64d5-ba88-4ee3-8964-cf4036a017a1",
					"disabled": true,
					"name": "Total",
					"reference": "B141",
					"cost_type": "points",
					"cost": -10,
					"affects": "total"
				}
			],
			"reference": "B141",
			"calc": {
				"points": -5
			},
			"prereqs": {
				"type": "prereq_list",
				"all": true,
				"prereqs": [
					{
						"type": "attribute_prereq",
						"has": true,
						"which": "dx",
						"qualifier": {
							"compare": "at_most",
							"qualifier": 13
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
			"id": "f7d80f66-a36e-42f9-8735-c76281c73754",
			"name": "Lame (Crippled Legs)",
			"physical": true,
			"base_points": -10,
			"reference": "B141",
			"calc": {
				"points": -10
			},
			"features": [
				{
					"type": "conditional_modifier",
					"amount": -3,
					"situation": "to use any skill that requires the use of your legs, including all Melee Weapon and unarmed combat skills (but not ranged combat skills)"
				}
			],
			"notes": "You must reduce your Basic Move to half your Basic Speed (round down)",
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "7e593de2-7e62-4a95-bc01-ba98f97a502b",
			"name": "Lame (Legless)",
			"physical": true,
			"base_points": -30,
			"reference": "B141",
			"calc": {
				"points": -30
			},
			"features": [
				{
					"type": "conditional_modifier",
					"amount": -6,
					"situation": "to use any skill that requires the use of your legs, including all Melee Weapon and unarmed combat skills (but not ranged combat skills)"
				}
			],
			"notes": "You cannot stand, kick, or walk at all and must reduce Basic Move to 0.",
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "9457a14e-e870-4d0f-a2c6-73fa6d862d31",
			"name": "Lame (Missing Legs)",
			"physical": true,
			"base_points": -20,
			"reference": "B141",
			"calc": {
				"points": -20
			},
			"features": [
				{
					"type": "conditional_modifier",
					"amount": -6,
					"situation": "to use any skill that requires the use of your legs, including all Melee Weapon and unarmed combat skills (but not ranged combat skills)"
				}
			],
			"notes": "Using crutches or a peg leg, you can stand up and walk slowly. You must reduce Basic Move to 2.",
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "512fde79-d6fa-4a92-a091-1b6f6007a0c9",
			"name": "Lame (Paraplegic)",
			"physical": true,
			"base_points": -30,
			"reference": "B141",
			"calc": {
				"points": -30
			},
			"features": [
				{
					"type": "conditional_modifier",
					"amount": -6,
					"situation": "to use any skill that requires the use of your legs, including all Melee Weapon and unarmed combat skills (but not ranged combat skills)"
				}
			],
			"notes": "You cannot stand, kick, or walk at all and must reduce Basic Move to 0.",
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "c12f68d8-25e3-40f1-9bdd-57b500268aca",
			"name": "Language Talent",
			"mental": true,
			"base_points": 10,
			"reference": "B65",
			"calc": {
				"points": 10
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "149239c1-aec9-4acc-a5fe-07b64cf6a323",
			"name": "Language: @Language@",
			"mental": true,
			"modifiers": [
				{
					"type": "modifier",
					"id": "ff972d9a-b925-4895-a489-f3d14999074d",
					"disabled": true,
					"name": "Native",
					"reference": "B23",
					"cost_type": "points",
					"cost": -6,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "e9f38c71-c4bd-45ee-a5e2-b47a33029f96",
					"disabled": true,
					"name": "Spoken",
					"reference": "B24",
					"cost_type": "points",
					"cost": 0,
					"affects": "total",
					"notes": "None"
				},
				{
					"type": "modifier",
					"id": "6cd10ab4-c4f9-4764-a47d-0e77d105d862",
					"disabled": true,
					"name": "Spoken",
					"reference": "B24",
					"cost_type": "points",
					"cost": 1,
					"affects": "total",
					"notes": "Broken"
				},
				{
					"type": "modifier",
					"id": "3c7caa3c-055e-4422-ac8e-6a2d632b391c",
					"name": "Spoken",
					"reference": "B24",
					"cost_type": "points",
					"cost": 2,
					"affects": "total",
					"notes": "Accented"
				},
				{
					"type": "modifier",
					"id": "231ba28d-11ce-44e1-8d23-074d40ca57c6",
					"disabled": true,
					"name": "Spoken",
					"reference": "B24",
					"cost_type": "points",
					"cost": 3,
					"affects": "total",
					"notes": "Native"
				},
				{
					"type": "modifier",
					"id": "152ad20b-dc58-4abb-b256-71da14dbb89c",
					"disabled": true,
					"name": "Written",
					"reference": "B24",
					"cost_type": "points",
					"cost": 0,
					"affects": "total",
					"notes": "None"
				},
				{
					"type": "modifier",
					"id": "6304a0d6-80f3-4a5f-b3cc-3ba2ae0c8063",
					"disabled": true,
					"name": "Written",
					"reference": "B24",
					"cost_type": "points",
					"cost": 1,
					"affects": "total",
					"notes": "Broken"
				},
				{
					"type": "modifier",
					"id": "5818ab4a-2c4b-4c3e-a711-c4b6332daaca",
					"name": "Written",
					"reference": "B24",
					"cost_type": "points",
					"cost": 2,
					"affects": "total",
					"notes": "Accented"
				},
				{
					"type": "modifier",
					"id": "1b77515e-5789-49a0-8238-7242900c8c2c",
					"disabled": true,
					"name": "Written",
					"reference": "B24",
					"cost_type": "points",
					"cost": 3,
					"affects": "total",
					"notes": "Native"
				}
			],
			"reference": "B24",
			"calc": {
				"points": 4
			},
			"categories": [
				"Advantage",
				"Language"
			]
		},
		{
			"type": "advantage",
			"id": "cca6a9b5-4067-420d-954d-2c5e08dc0e90",
			"name": "Language: @Language@",
			"mental": true,
			"modifiers": [
				{
					"type": "modifier",
					"id": "6e350dac-03e7-454b-aae0-910e3480d549",
					"disabled": true,
					"name": "Native",
					"reference": "B23",
					"cost_type": "points",
					"cost": -4,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "8b45dbdd-df61-46c2-ac1d-a4512c1b6f87",
					"name": "Spoken",
					"reference": "B24",
					"cost_type": "points",
					"cost": 1,
					"affects": "total",
					"notes": "Accented"
				},
				{
					"type": "modifier",
					"id": "f1b65fd7-b774-4c35-89c8-4bcae8e38203",
					"disabled": true,
					"name": "Spoken",
					"reference": "B24",
					"cost_type": "points",
					"cost": 2,
					"affects": "total",
					"notes": "Native"
				},
				{
					"type": "modifier",
					"id": "4e5950f0-3680-4091-9cbb-ad9a6bdf6e58",
					"name": "Written",
					"reference": "B24",
					"cost_type": "points",
					"cost": 1,
					"affects": "total",
					"notes": "Accented"
				},
				{
					"type": "modifier",
					"id": "5a815059-e937-4dce-b933-c8b9b83c9a3e",
					"disabled": true,
					"name": "Written",
					"reference": "B24",
					"cost_type": "points",
					"cost": 2,
					"affects": "total",
					"notes": "Native"
				}
			],
			"reference": "B24",
			"calc": {
				"points": 2
			},
			"prereqs": {
				"type": "prereq_list",
				"all": true,
				"prereqs": [
					{
						"type": "advantage_prereq",
						"has": true,
						"name": {
							"compare": "is",
							"qualifier": "Language Talent"
						}
					}
				]
			},
			"notes": "With Language Talent",
			"categories": [
				"Advantage",
				"Language"
			]
		},
		{
			"type": "advantage",
			"id": "e1babc4b-5f48-48fc-8124-f4782db00c1c",
			"name": "Large Piercing Striker (@Body Part@)",
			"physical": true,
			"exotic": true,
			"base_points": 6,
			"weapons": [
				{
					"type": "melee_weapon",
					"damage": {
						"type": "pi+",
						"st": "thr",
						"modifier_per_die": 1
					},
					"reach": "C",
					"parry": "0",
					"block": "No",
					"calc": {
						"level": 0,
						"parry": "0",
						"block": "No",
						"damage": "thr (+1 per die) pi+"
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
			"reference": "B88",
			"calc": {
				"points": 6
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "ec9ed4f8-e647-451c-8300-a36ac0c71f86",
			"name": "Laziness",
			"mental": true,
			"base_points": -10,
			"reference": "B142",
			"calc": {
				"points": -10
			},
			"notes": "Your chances of getting a raise or promotion in any job are halved. If you are self-employed, halve your monthly pay.",
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "2d8df8e4-960b-4884-98ed-4cbaee294e68",
			"name": "Lecherousness",
			"mental": true,
			"base_points": -15,
			"cr": 12,
			"reference": "B142",
			"calc": {
				"points": -15
			},
			"notes": "Make a self-control roll whenever you have more than the briefest contact with an appealing member of the sex you find attractive, at -5 if this person is Handsome/Beautiful, or at -10 if Very Handsome/Very Beautiful. If you fail, you must make a “pass” using whatever wiles and skills you can bring to bear.",
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "e6ffbd67-4cdc-4a19-93ff-98a6df26f2aa",
			"name": "Legal Enforcement Powers",
			"social": true,
			"levels": "1",
			"points_per_level": 5,
			"reference": "B65",
			"calc": {
				"points": 5
			},
			"notes": "@Description@",
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "59037a1b-750b-4376-86b6-9b518c7fdb34",
			"name": "Legal Immunity",
			"social": true,
			"modifiers": [
				{
					"type": "modifier",
					"id": "ad77339d-edfa-48d0-b3f2-7c22ea8e8469",
					"disabled": true,
					"name": "UN Observer",
					"reference": "B65",
					"cost_type": "points",
					"cost": 5,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "4b4d2cb4-eb5a-4d00-8951-08f34203c6ac",
					"disabled": true,
					"name": "Petty Diplomat",
					"reference": "B65",
					"cost_type": "points",
					"cost": 15,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "df9f3531-9442-440a-a185-ca308d1e67c9",
					"disabled": true,
					"name": "Diplomatic Immunity",
					"reference": "B65",
					"cost_type": "points",
					"cost": 20,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "4c33aae9-c577-4718-a4dd-b5d2cd18d761",
					"disabled": true,
					"name": "Bard",
					"reference": "B65",
					"cost_type": "points",
					"cost": 10,
					"affects": "total"
				}
			],
			"reference": "B65",
			"calc": {
				"points": 0
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "5867f5cb-1be1-446d-b978-4c552109ceb0",
			"name": "Less Sleep",
			"physical": true,
			"levels": "1",
			"points_per_level": 2,
			"reference": "B65",
			"calc": {
				"points": 2
			},
			"notes": "Require 1 hour/level less sleep for a full night\'s rest (max 4)",
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "d9c80504-4994-4af7-9f83-55949216223b",
			"name": "Lifebane",
			"mental": true,
			"supernatural": true,
			"base_points": -10,
			"reference": "B142",
			"calc": {
				"points": -10
			},
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "d8358203-db58-4001-b34c-4da7ad76f8c3",
			"name": "Lifting ST",
			"physical": true,
			"exotic": true,
			"levels": "1",
			"points_per_level": 3,
			"modifiers": [
				{
					"type": "modifier",
					"id": "cdcc6dd9-be46-44b2-9b2d-9258972a9abb",
					"disabled": true,
					"name": "No Fine Manipulators",
					"reference": "B15",
					"cost_type": "percentage",
					"cost": -40,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "3a979126-6b53-4293-825a-fd4679b99bdf",
					"disabled": true,
					"name": "Size",
					"reference": "B15",
					"cost_type": "percentage",
					"cost": -10,
					"affects": "total",
					"levels": 1
				},
				{
					"type": "modifier",
					"id": "4dee3f9c-cdb5-41b9-9bd9-417234971df0",
					"disabled": true,
					"name": "Super-Effort",
					"reference": "P58",
					"cost_type": "percentage",
					"cost": 400,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "5beca2a9-73aa-4acc-a809-a69d38a0c31c",
					"disabled": true,
					"name": "Know Your Own Strength Variant Price",
					"reference": "PY83:18",
					"cost_type": "points",
					"cost": 4,
					"affects": "levels_only"
				},
				{
					"type": "modifier",
					"id": "e2c9f797-e7e2-4d31-a059-9af1330cfb7c",
					"disabled": true,
					"name": "@Limb@ Grip ST",
					"reference": "MATG28",
					"cost_type": "percentage",
					"cost": -70,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "4a7c2b00-d7ab-4ea6-84a8-1d223584ade1",
					"disabled": true,
					"name": "Bite ST",
					"reference": "MATG28",
					"cost_type": "percentage",
					"cost": -70,
					"affects": "total"
				}
			],
			"reference": "B65,P58",
			"calc": {
				"points": 3
			},
			"features": [
				{
					"type": "attribute_bonus",
					"amount": 1,
					"per_level": true,
					"attribute": "st",
					"limitation": "lifting_only"
				}
			],
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "1974b472-b15a-4bf0-b418-7ae5a47623ae",
			"name": "Light Sleeper",
			"physical": true,
			"base_points": -5,
			"reference": "B142",
			"calc": {
				"points": -5
			},
			"notes": "Whenever you must sleep in an uncomfortable place, or whenever there is more than the slightest noise, you must make a HT roll in order to fall asleep. On a failure, you can try again after one hour, but you will suffer all the usual effects of one hour of missed sleep.",
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "4d2f5d1a-5447-485c-a8bd-482a132b6d2e",
			"name": "Lightning Calculator",
			"mental": true,
			"base_points": 2,
			"modifiers": [
				{
					"type": "modifier",
					"id": "6e674a5c-f7c3-411e-9f19-a0eb4f682c5b",
					"disabled": true,
					"name": "Intuitive Mathematician",
					"reference": "B66",
					"cost_type": "points",
					"cost": 3,
					"affects": "total"
				}
			],
			"reference": "B66",
			"calc": {
				"points": 2
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "3946fdcb-a781-43f7-be39-3818404f094a",
			"name": "Likes @Item@",
			"mental": true,
			"levels": "0",
			"base_points": -1,
			"reference": "B164",
			"calc": {
				"points": -1
			},
			"categories": [
				"Quirk"
			]
		},
		{
			"type": "advantage",
			"id": "c174f7ea-e6df-45c2-a0fd-848b32b0470b",
			"name": "Loner",
			"mental": true,
			"base_points": -5,
			"cr": 12,
			"cr_adj": "reaction_penalty",
			"reference": "B142",
			"calc": {
				"points": -5
			},
			"notes": "Make a self-control roll whenever anyone lingers nearby, watches over your shoulder, etc. If you fail, you lash out at that person just as if you had Bad Temper.",
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "686a228b-a2b9-4320-b0ae-c92a015d9d5d",
			"name": "Long Spines",
			"physical": true,
			"exotic": true,
			"base_points": 3,
			"weapons": [
				{
					"type": "melee_weapon",
					"damage": {
						"type": "imp",
						"base": "1d"
					},
					"usage": "Stab",
					"reach": "C",
					"parry": "No",
					"block": "No",
					"calc": {
						"level": 0,
						"parry": "No",
						"block": "No",
						"damage": "1d imp"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -4
						}
					]
				}
			],
			"reference": "B88",
			"calc": {
				"points": 3
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "b54e28c7-4e28-4c02-88cb-ac1ae819e155",
			"name": "Long Talons",
			"physical": true,
			"base_points": 11,
			"weapons": [
				{
					"type": "melee_weapon",
					"damage": {
						"type": "cut",
						"st": "thr",
						"base": "-1",
						"modifier_per_die": 1
					},
					"usage": "Slash",
					"reach": "C,1",
					"parry": "0",
					"block": "No",
					"calc": {
						"level": 0,
						"parry": "0",
						"block": "No",
						"damage": "thr-1 (+1 per die) cut"
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
						"type": "imp",
						"st": "thr",
						"base": "-1",
						"modifier_per_die": 1
					},
					"usage": "Stab",
					"reach": "C,1",
					"parry": "0",
					"block": "No",
					"calc": {
						"level": 0,
						"parry": "0",
						"block": "No",
						"damage": "thr-1 (+1 per die) imp"
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
				}
			],
			"reference": "B43",
			"calc": {
				"points": 11
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "717b2637-c138-4bee-b3ad-e9f21bc1d32a",
			"name": "Longevity",
			"physical": true,
			"base_points": 2,
			"reference": "B66",
			"calc": {
				"points": 2
			},
			"notes": "You fail aging rolls only on a 17 or 18, or only on an 18 if your modified HT is 17 or better",
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "5886809f-3edb-4916-b6c3-5fd4506bdcce",
			"name": "Low Empathy",
			"mental": true,
			"base_points": -20,
			"reference": "B142",
			"calc": {
				"points": -20
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
							"qualifier": "oblivious"
						}
					},
					{
						"type": "advantage_prereq",
						"has": false,
						"name": {
							"compare": "is",
							"qualifier": "callous"
						}
					},
					{
						"type": "advantage_prereq",
						"has": false,
						"name": {
							"compare": "is",
							"qualifier": "empathy"
						}
					}
				]
			},
			"features": [
				{
					"type": "skill_bonus",
					"amount": -3,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "acting"
					}
				},
				{
					"type": "skill_bonus",
					"amount": -3,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "carousing"
					}
				},
				{
					"type": "skill_bonus",
					"amount": -3,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "criminology"
					}
				},
				{
					"type": "skill_bonus",
					"amount": -3,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "detect lies"
					}
				},
				{
					"type": "skill_bonus",
					"amount": -3,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "diplomacy"
					}
				},
				{
					"type": "skill_bonus",
					"amount": -3,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "enthrallment"
					}
				},
				{
					"type": "skill_bonus",
					"amount": -3,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "fast-talk"
					}
				},
				{
					"type": "skill_bonus",
					"amount": -3,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "interrogation"
					}
				},
				{
					"type": "skill_bonus",
					"amount": -3,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "leadership"
					}
				},
				{
					"type": "skill_bonus",
					"amount": -3,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "merchant"
					}
				},
				{
					"type": "skill_bonus",
					"amount": -3,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "politics"
					}
				},
				{
					"type": "skill_bonus",
					"amount": -3,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "contains",
						"qualifier": "psychology"
					}
				},
				{
					"type": "skill_bonus",
					"amount": -3,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "contains",
						"qualifier": "savoir-faire"
					}
				},
				{
					"type": "skill_bonus",
					"amount": -3,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "sex appeal"
					}
				},
				{
					"type": "skill_bonus",
					"amount": -3,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "sociology"
					}
				},
				{
					"type": "skill_bonus",
					"amount": -3,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "streetwise"
					}
				}
			],
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "526c7704-5563-4822-860f-ada8eb9ee43b",
			"name": "Low Pain Threshold",
			"physical": true,
			"base_points": -10,
			"reference": "B142",
			"calc": {
				"points": -10
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
							"qualifier": "high pain threshold"
						}
					}
				]
			},
			"features": [
				{
					"type": "reaction_bonus",
					"amount": -1,
					"situation": "from \\"macho\\" individuals"
				},
				{
					"type": "conditional_modifier",
					"amount": -4,
					"situation": "to resist knockdown, stunning, and physical torture"
				}
			],
			"notes": "Double the shock from any injury. Whenever you take a wound that does more than 1 HP of damage, you must make a Will roll to avoid crying out.",
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "cfb19938-8ba9-4bb6-b42b-b6d5992de799",
			"name": "Low Self-Image",
			"mental": true,
			"base_points": -10,
			"reference": "B143",
			"calc": {
				"points": -10
			},
			"features": [
				{
					"type": "conditional_modifier",
					"amount": -3,
					"situation": "to all skill rolls whenever you believe that the odds are against you or others expect you to fail (GM’s judgment)"
				}
			],
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "43deafab-dce4-4e71-b42c-40847484dcb8",
			"name": "Low TL",
			"social": true,
			"levels": "1",
			"points_per_level": -5,
			"reference": "B22",
			"calc": {
				"points": -5
			},
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "8a8229a8-02d0-4943-bdff-81099e0b00e9",
			"name": "Luck",
			"mental": true,
			"base_points": 15,
			"modifiers": [
				{
					"type": "modifier",
					"id": "b5f2c667-bec1-442e-9ef9-f051a6c31510",
					"disabled": true,
					"name": "Active",
					"reference": "B66",
					"cost_type": "percentage",
					"cost": -40,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "d9965ee9-527e-4933-95ef-ef8a02ed7683",
					"disabled": true,
					"name": "Aspected",
					"reference": "B66",
					"cost_type": "percentage",
					"cost": -20,
					"affects": "total",
					"notes": "@Aspect@"
				},
				{
					"type": "modifier",
					"id": "67318c7d-d090-4012-a955-0d1a36052c27",
					"disabled": true,
					"name": "Defensive",
					"reference": "B66",
					"cost_type": "percentage",
					"cost": -20,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "4f41a545-c80c-4754-bf3c-93b9662beef2",
					"disabled": true,
					"name": "Wishing",
					"reference": "P59",
					"cost_type": "percentage",
					"cost": 100,
					"affects": "total"
				}
			],
			"reference": "B66,P59",
			"calc": {
				"points": 15
			},
			"notes": "Usable once per hour of play",
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "c5d785d4-3f98-4d31-ad20-7f5a48cd543e",
			"name": "Lunacy",
			"physical": true,
			"base_points": -10,
			"reference": "B143",
			"calc": {
				"points": -10
			},
			"features": [
				{
					"type": "conditional_modifier",
					"amount": -2,
					"situation": "to all Will and self-control rolls during the full moon"
				}
			],
			"notes": "During the full moon, you are extremely emotional and volatile, while on nights of the new moon you are very passive (you temporarily suffer from the Laziness disadvantage, B142). While the moon is waxing, you are focused and pleasant; while it is waning, you are apathetic and a little touchy.",
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "fc1edb7b-7b9e-416f-9cb3-1498ccc2f70a",
			"name": "Magery",
			"mental": true,
			"supernatural": true,
			"levels": "1",
			"base_points": 5,
			"points_per_level": 10,
			"modifiers": [
				{
					"type": "modifier",
					"id": "10b7c609-d742-473c-a229-fd39e10a948f",
					"disabled": true,
					"name": "Dance",
					"cost_type": "percentage",
					"cost": -40,
					"affects": "levels_only"
				},
				{
					"type": "modifier",
					"id": "8cffcc39-a19c-4aa2-8a65-f270534b6ad7",
					"disabled": true,
					"name": "Dark-Aspected",
					"cost_type": "percentage",
					"cost": -50,
					"affects": "levels_only"
				},
				{
					"type": "modifier",
					"id": "9a43b6eb-5fca-4b3b-9475-9c8922652001",
					"disabled": true,
					"name": "Day-Aspected",
					"cost_type": "percentage",
					"cost": -40,
					"affects": "levels_only"
				},
				{
					"type": "modifier",
					"id": "1db3c1d2-12b8-4d9f-aaec-8a1f58f99922",
					"disabled": true,
					"name": "Musical",
					"cost_type": "percentage",
					"cost": -50,
					"affects": "levels_only"
				},
				{
					"type": "modifier",
					"id": "7ef63d35-934c-4046-8b55-22208f7a99b6",
					"disabled": true,
					"name": "Night-Aspected",
					"cost_type": "percentage",
					"cost": -40,
					"affects": "levels_only"
				},
				{
					"type": "modifier",
					"id": "0f92e868-30bd-4a88-8dd7-d1929eb47c0e",
					"disabled": true,
					"name": "One College",
					"cost_type": "percentage",
					"cost": -40,
					"affects": "levels_only",
					"notes": "@College@"
				},
				{
					"type": "modifier",
					"id": "7a67c4c3-2454-43a0-acd4-aac1265bd79a",
					"disabled": true,
					"name": "Solitary",
					"cost_type": "percentage",
					"cost": -40,
					"affects": "levels_only"
				},
				{
					"type": "modifier",
					"id": "162576be-563f-43f2-9bd3-91db2defc569",
					"disabled": true,
					"name": "Song",
					"cost_type": "percentage",
					"cost": -40,
					"affects": "levels_only"
				}
			],
			"reference": "B66",
			"calc": {
				"points": 15
			},
			"features": [
				{
					"type": "spell_bonus",
					"amount": 1,
					"per_level": true,
					"match": "all_colleges"
				},
				{
					"type": "skill_bonus",
					"amount": 1,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "thaumatology"
					}
				}
			],
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "cbfb7864-1f6e-4013-ba6d-22161bbb7894",
			"name": "Magic Resistance",
			"physical": true,
			"levels": "1",
			"points_per_level": 2,
			"modifiers": [
				{
					"type": "modifier",
					"id": "3a0752cf-b3da-4558-bbb7-86f9cd70056b",
					"disabled": true,
					"name": "Improved",
					"reference": "B67",
					"cost_type": "percentage",
					"cost": 150,
					"affects": "total"
				}
			],
			"reference": "B67",
			"calc": {
				"points": 2
			},
			"features": [
				{
					"type": "conditional_modifier",
					"amount": 1,
					"per_level": true,
					"situation": "to resist spells"
				},
				{
					"type": "conditional_modifier",
					"amount": -1,
					"per_level": true,
					"situation": "to skill for others to cast a spell on you"
				}
			],
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "f6fee94c-d459-491c-b905-1c6c0f4d651f",
			"name": "Magic Susceptibility",
			"mental": true,
			"supernatural": true,
			"levels": "1",
			"points_per_level": -3,
			"reference": "B143",
			"calc": {
				"points": -3
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
							"qualifier": "magic resistance"
						}
					}
				]
			},
			"features": [
				{
					"type": "conditional_modifier",
					"amount": 1,
					"per_level": true,
					"situation": "to skill for others to cast a spell on you"
				},
				{
					"type": "conditional_modifier",
					"amount": -1,
					"per_level": true,
					"situation": "to resist spells"
				}
			],
			"notes": "Max of 5 levels",
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "d36d4024-6ace-4fae-9bba-a6178e9c2ded",
			"name": "Maintenance",
			"physical": true,
			"modifiers": [
				{
					"type": "modifier",
					"id": "49e2a3e8-4b89-4320-8d5b-5f76d5f228c1",
					"disabled": true,
					"name": "People Required: 1",
					"reference": "B143",
					"cost_type": "points",
					"cost": -10,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "c04d387c-6d5a-41de-879d-c726ac47af37",
					"disabled": true,
					"name": "People Required: 2",
					"reference": "B143",
					"cost_type": "points",
					"cost": -20,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "4a5d4c3c-3a03-40d7-8f78-02575d1639ac",
					"disabled": true,
					"name": "People Required: 3-5",
					"reference": "B143",
					"cost_type": "points",
					"cost": -30,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "c248b17d-696b-4726-b506-e3b3e18e70dc",
					"disabled": true,
					"name": "People Required: 6-10",
					"reference": "B143",
					"cost_type": "points",
					"cost": -40,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "96bdd103-2120-43e3-be5f-e808f7c1e0f2",
					"disabled": true,
					"name": "People Required: 11-20",
					"reference": "B143",
					"cost_type": "points",
					"cost": -50,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "61d4054e-8878-4a36-9f47-58340522cdfc",
					"disabled": true,
					"name": "People Required: 21-50",
					"reference": "B143",
					"cost_type": "points",
					"cost": -60,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "7b44ba00-4807-428b-a2c7-03c7ba7f2b3e",
					"disabled": true,
					"name": "People Required: 51-100",
					"reference": "B143",
					"cost_type": "points",
					"cost": -70,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "51fbf86b-3370-4c18-8e4e-f2bf5fe1a40e",
					"disabled": true,
					"name": "People Required: 101-200",
					"reference": "B143",
					"cost_type": "points",
					"cost": -80,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "8afaf6fb-2308-49bf-aaf9-34bc94fd87b3",
					"disabled": true,
					"name": "People Required: 201-400",
					"reference": "B143",
					"cost_type": "points",
					"cost": -90,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "9d135e37-533a-419e-aefa-3d42fa715e0e",
					"disabled": true,
					"name": "People Required: 401-800",
					"reference": "B143",
					"cost_type": "points",
					"cost": -100,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "653b6829-15ce-47f8-b661-c771c62b32f6",
					"disabled": true,
					"name": "People Required: 801-1600",
					"reference": "B143",
					"cost_type": "points",
					"cost": -110,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "860ab6ba-af26-4889-9ab1-50e9c5e003b9",
					"disabled": true,
					"name": "People Required: 1601-3200",
					"reference": "B143",
					"cost_type": "points",
					"cost": -120,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "6382c7ab-ab05-4b09-9bee-d77c11d54b34",
					"disabled": true,
					"name": "People Required: 3201-6400",
					"reference": "B143",
					"cost_type": "points",
					"cost": -130,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "ee7c8105-dc66-442b-9720-4ff4c0cd8797",
					"disabled": true,
					"name": "People Required: 6401-12800",
					"reference": "B143",
					"cost_type": "points",
					"cost": -140,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "c362b380-6e7a-415e-9af8-4382a4965a66",
					"disabled": true,
					"name": "People Required: 12801-25600",
					"reference": "B143",
					"cost_type": "points",
					"cost": -150,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "a8d5ce54-be1d-4586-859a-ed84fbd6feb4",
					"disabled": true,
					"name": "Frequency: Monthly",
					"reference": "B143",
					"cost_type": "multiplier",
					"cost": 0.2
				},
				{
					"type": "modifier",
					"id": "74af7baf-cae9-475d-a6a9-754f06c91547",
					"disabled": true,
					"name": "Frequency: Bi-weekly",
					"reference": "B143",
					"cost_type": "multiplier",
					"cost": 0.33333
				},
				{
					"type": "modifier",
					"id": "ef4c0955-3a02-44d8-b691-582d1ea8edf5",
					"disabled": true,
					"name": "Frequency: Weekly",
					"reference": "B143",
					"cost_type": "multiplier",
					"cost": 0.5
				},
				{
					"type": "modifier",
					"id": "4557a790-f842-4908-877c-7e3e15694015",
					"disabled": true,
					"name": "Frequency: Every other day",
					"reference": "B143",
					"cost_type": "multiplier",
					"cost": 0.75
				},
				{
					"type": "modifier",
					"id": "729a3ad1-c77d-4776-99f0-0e65a406c7ec",
					"disabled": true,
					"name": "Frequency: Daily",
					"reference": "B143",
					"cost_type": "multiplier",
					"cost": 1
				},
				{
					"type": "modifier",
					"id": "cd1934ed-528e-4ce2-9791-efc4c66ab1a9",
					"disabled": true,
					"name": "Frequency: Twice daily",
					"reference": "B143",
					"cost_type": "multiplier",
					"cost": 2
				},
				{
					"type": "modifier",
					"id": "be5ddf5e-0dcc-406b-8e80-4a77d6c973c8",
					"disabled": true,
					"name": "Frequency: Three to five times daily",
					"reference": "B143",
					"cost_type": "multiplier",
					"cost": 3
				},
				{
					"type": "modifier",
					"id": "3a5f800e-ac17-4fe5-b656-284d5948d81c",
					"disabled": true,
					"name": "Frequency: Constant",
					"reference": "B143",
					"cost_type": "multiplier",
					"cost": 5
				}
			],
			"reference": "B143",
			"calc": {
				"points": 0
			},
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "797a2cf8-7f53-4524-8dc4-ef15bf67a3db",
			"name": "Mana Damper",
			"mental": true,
			"supernatural": true,
			"levels": "1",
			"points_per_level": 10,
			"modifiers": [
				{
					"type": "modifier",
					"id": "55d7fac4-9728-48d1-bc54-19b1f80dfa97",
					"disabled": true,
					"name": "Area Effect",
					"reference": "B67",
					"cost_type": "percentage",
					"cost": 50,
					"affects": "total",
					"levels": 1
				},
				{
					"type": "modifier",
					"id": "b875d696-4cc9-4dea-93e5-ea6c2e186f4c",
					"disabled": true,
					"name": "Switchable",
					"reference": "B67",
					"cost_type": "percentage",
					"cost": 100,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "eae680ff-59ad-475e-8a4a-ef144c429288",
					"disabled": true,
					"name": "Discriminatory",
					"reference": "P59",
					"cost_type": "percentage",
					"cost": 150,
					"affects": "total"
				}
			],
			"reference": "B67,P59",
			"calc": {
				"points": 10
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "7f481a32-f78b-4155-80cf-0072206f1604",
			"name": "Mana Enhancer",
			"mental": true,
			"supernatural": true,
			"levels": "1",
			"points_per_level": 50,
			"modifiers": [
				{
					"type": "modifier",
					"id": "684399fc-4939-4eec-a16f-79472cf48933",
					"disabled": true,
					"name": "Area Effect",
					"reference": "B68",
					"cost_type": "percentage",
					"cost": 50,
					"affects": "total",
					"levels": 1
				},
				{
					"type": "modifier",
					"id": "ff9b39d5-a401-4a2c-84c3-d695f01f84e5",
					"disabled": true,
					"name": "Switchable",
					"reference": "B68",
					"cost_type": "percentage",
					"cost": 100,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "21c22762-7488-4d7e-991d-97735cf23ea7",
					"disabled": true,
					"name": "Discriminatory",
					"reference": "P59",
					"cost_type": "percentage",
					"cost": 150,
					"affects": "total"
				}
			],
			"reference": "B68,P59",
			"calc": {
				"points": 50
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "8031bfc2-02a5-437b-957e-e95f7893fe8d",
			"name": "Manaphobia (Magic)",
			"mental": true,
			"cr": 12,
			"cr_adj": "action_penalty",
			"modifiers": [
				{
					"type": "modifier",
					"id": "6974db63-36ea-488f-a152-507694a07259",
					"disabled": true,
					"name": "Common",
					"reference": "B150",
					"cost_type": "points",
					"cost": -15,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "a1ee17e2-1d2c-464c-88c8-979fa5ef51e0",
					"disabled": true,
					"name": "Uncommon",
					"reference": "B150",
					"cost_type": "points",
					"cost": -10,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "3e4353a0-d64f-4ec9-83b4-07552a845349",
					"disabled": true,
					"name": "Unknown",
					"reference": "B150",
					"cost_type": "points",
					"cost": -5,
					"affects": "total"
				}
			],
			"reference": "B150",
			"calc": {
				"points": 0
			},
			"notes": "You can never learn to use magic, and you react badly to any user of magic. Make a self-control roll whenever you are in the presence of magic. This roll is at -3 if you are to be the target of friendly magic, and -6 if you are the target of hostile magic. (The magic does not have to be real, if you believe in it!)",
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "1b1a221e-c7ba-4ee2-b4d4-bef2e7453854",
			"name": "Manic-Depressive",
			"mental": true,
			"base_points": -20,
			"reference": "B143",
			"calc": {
				"points": -20
			},
			"notes": "At the beginning of each play session, roll 1d. On 1-3, you are in your manic phase; 4-6 indicates depression. Every five hours of game time thereafter, roll 3d. A 10 or less indicates that you begin a mood swing. Over the next hour, you shift from your current phase to the opposite one. You remain in the new phase for at least five hours, after which you must again roll 3d.",
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "a282e8ab-9cdb-4d80-9c9a-0f127c7e8c3f",
			"name": "Medium",
			"mental": true,
			"supernatural": true,
			"base_points": 10,
			"modifiers": [
				{
					"type": "modifier",
					"id": "92e81cc0-3e51-4652-bc43-c63c1f261123",
					"disabled": true,
					"name": "Manifestation",
					"reference": "P60",
					"cost_type": "percentage",
					"cost": 100,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "f7443dcc-67cf-454b-8dca-623c197d806e",
					"disabled": true,
					"name": "Universal",
					"reference": "P60",
					"cost_type": "percentage",
					"cost": 50,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "3ffc56b5-2f17-4ee2-94ac-6c24086edc13",
					"disabled": true,
					"name": "Visual",
					"reference": "P60",
					"cost_type": "percentage",
					"cost": 50,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "5195d41f-49f0-4151-9303-eac354969591",
					"disabled": true,
					"name": "Specialized",
					"reference": "P60",
					"cost_type": "percentage",
					"cost": -50,
					"affects": "total",
					"notes": "@Class of Spirits@"
				}
			],
			"reference": "B68,P59",
			"calc": {
				"points": 10
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "d150efaf-4c50-4043-8bb8-c957e95333c0",
			"name": "Megalomania",
			"mental": true,
			"base_points": -10,
			"reference": "B144",
			"calc": {
				"points": -10
			},
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "51a1e661-8726-42bd-bf98-5edcfaa0fa20",
			"name": "Metabolism Control",
			"physical": true,
			"levels": "1",
			"points_per_level": 5,
			"modifiers": [
				{
					"type": "modifier",
					"id": "6df318ac-af21-450d-9f8a-8f5e72358ef0",
					"disabled": true,
					"name": "Hibernation",
					"reference": "B68",
					"cost_type": "percentage",
					"cost": -60,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "21609c1c-9b17-4de1-98e5-6b3f241f3260",
					"disabled": true,
					"name": "Maestry",
					"reference": "P60",
					"cost_type": "percentage",
					"cost": 40,
					"affects": "total"
				}
			],
			"reference": "B68,P60",
			"calc": {
				"points": 5
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "a470227d-73e3-4a5d-ba80-55eac5aa79bb",
			"name": "Microscopic Vision",
			"physical": true,
			"exotic": true,
			"levels": "1",
			"points_per_level": 5,
			"reference": "B68,P60",
			"calc": {
				"points": 5
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "1f853f40-c0cd-4382-a568-af9b4a6ab75f",
			"name": "Mild Shyness",
			"mental": true,
			"base_points": -5,
			"reference": "B154",
			"calc": {
				"points": -5
			},
			"features": [
				{
					"type": "skill_bonus",
					"amount": -1,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "Acting"
					}
				},
				{
					"type": "skill_bonus",
					"amount": -1,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "Carousing"
					}
				},
				{
					"type": "skill_bonus",
					"amount": -1,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "Diplomacy"
					}
				},
				{
					"type": "skill_bonus",
					"amount": -1,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "Fast-Talk"
					}
				},
				{
					"type": "skill_bonus",
					"amount": -1,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "Intimidation"
					}
				},
				{
					"type": "skill_bonus",
					"amount": -1,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "Leadership"
					}
				},
				{
					"type": "skill_bonus",
					"amount": -1,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "Merchant"
					}
				},
				{
					"type": "skill_bonus",
					"amount": -1,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "Panhandling"
					}
				},
				{
					"type": "skill_bonus",
					"amount": -1,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "Performance"
					}
				},
				{
					"type": "skill_bonus",
					"amount": -1,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "Politics"
					}
				},
				{
					"type": "skill_bonus",
					"amount": -1,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "Public Speaking"
					}
				},
				{
					"type": "skill_bonus",
					"amount": -1,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "Savoir-Faire"
					}
				},
				{
					"type": "skill_bonus",
					"amount": -1,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "Sex Appeal"
					}
				},
				{
					"type": "skill_bonus",
					"amount": -1,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "Streetwise"
					}
				},
				{
					"type": "skill_bonus",
					"amount": -1,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "Teaching"
					}
				}
			],
			"notes": "You are uneasy with strangers, especially assertive or attractive ones.",
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "de16ec36-8851-4b5c-a0f0-1ae44e8cb9a8",
			"name": "Mimicry",
			"mental": true,
			"exotic": true,
			"base_points": 10,
			"modifiers": [
				{
					"type": "modifier",
					"id": "2f8335bc-0a4e-4501-bdd5-e86ccf6e7911",
					"disabled": true,
					"name": "Voice Library",
					"reference": "P61",
					"cost_type": "percentage",
					"cost": 50,
					"affects": "total"
				}
			],
			"reference": "B68,P60",
			"calc": {
				"points": 10
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "ec56412b-ef19-4d4f-90a8-a4ff4d809557",
			"name": "Mind Control",
			"mental": true,
			"exotic": true,
			"base_points": 50,
			"modifiers": [
				{
					"type": "modifier",
					"id": "42962b87-a3da-43c4-9fc0-39275ab8916c",
					"disabled": true,
					"name": "Conditioning",
					"reference": "B69",
					"cost_type": "percentage",
					"cost": 50,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "94fc2ca5-8936-44f4-a6cc-ecbb2c9f112b",
					"disabled": true,
					"name": "No Memory",
					"reference": "B69",
					"cost_type": "percentage",
					"cost": 10,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "62e4e382-c445-4b83-94eb-5b9b1e304902",
					"disabled": true,
					"name": "Conditioning Only",
					"reference": "B69",
					"cost_type": "percentage",
					"cost": -50,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "7cba0279-e699-4ef8-b006-4865e2a44e88",
					"disabled": true,
					"name": "Puppet",
					"reference": "B69",
					"cost_type": "percentage",
					"cost": -40,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "8188d7f8-0005-4e64-af28-b1585182864f",
					"disabled": true,
					"name": "Independent",
					"reference": "P61",
					"cost_type": "percentage",
					"cost": 70,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "2f103a1c-ec3b-4a23-910c-15f374eea24f",
					"disabled": true,
					"name": "Emotion Control",
					"reference": "P61",
					"cost_type": "percentage",
					"cost": -50,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "91b1efac-5d7a-47b3-ba9e-fb9c93ad52a6",
					"disabled": true,
					"name": "One Emotion Only",
					"reference": "H17",
					"cost_type": "percentage",
					"cost": -80,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "d0c7e4af-b025-4c43-b780-cb733ea468f9",
					"disabled": true,
					"name": "Suggestion",
					"reference": "P61",
					"cost_type": "percentage",
					"cost": -40,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "e531a4f0-a091-4c7e-9c42-6ec89de317aa",
					"disabled": true,
					"name": "Rationalization",
					"reference": "PSI15",
					"cost_type": "percentage",
					"cost": 20,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "60f687b0-79bd-4217-97b7-0e618ace7dec",
					"disabled": true,
					"name": "Slow and Sure",
					"reference": "PSI15",
					"cost_type": "percentage",
					"cost": 80,
					"affects": "total",
					"notes": "1 hour"
				},
				{
					"type": "modifier",
					"id": "30167781-f206-45ae-a138-d06d9bfdac35",
					"disabled": true,
					"name": "Slow and Sure Only",
					"reference": "PSI15",
					"cost_type": "percentage",
					"cost": 40,
					"affects": "total",
					"notes": "1 hour"
				},
				{
					"type": "modifier",
					"id": "9d9d9bd5-7bb8-4d67-ae52-e992dedd2e7f",
					"disabled": true,
					"name": "Slow and Sure",
					"reference": "PSI15",
					"cost_type": "percentage",
					"cost": 110,
					"affects": "total",
					"notes": "10 minutes"
				},
				{
					"type": "modifier",
					"id": "5cd58b61-4176-49e3-a2af-d7305651adad",
					"disabled": true,
					"name": "Slow and Sure Only",
					"reference": "PSI15",
					"cost_type": "percentage",
					"cost": 70,
					"affects": "total",
					"notes": "10 minutes"
				},
				{
					"type": "modifier",
					"id": "483d7784-edd7-46dc-8782-e88f326fcccb",
					"disabled": true,
					"name": "Slow and Sure",
					"reference": "PSI15",
					"cost_type": "percentage",
					"cost": 155,
					"affects": "total",
					"notes": "10 seconds"
				},
				{
					"type": "modifier",
					"id": "688f28d3-ce7b-4db2-99d8-b301b1e25c99",
					"disabled": true,
					"name": "Slow and Sure Only",
					"reference": "PSI15",
					"cost_type": "percentage",
					"cost": 115,
					"affects": "total",
					"notes": "10 seconds"
				},
				{
					"type": "modifier",
					"id": "3efbb25f-6854-4fcb-926c-0b5ec0b09d60",
					"disabled": true,
					"name": "Mind Tricks",
					"reference": "PSI15",
					"cost_type": "percentage",
					"cost": -30,
					"affects": "total"
				}
			],
			"reference": "B68,P61,PSI15",
			"calc": {
				"points": 50
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "cbe22ca2-ef72-41bd-b652-b9f47024aad2",
			"name": "Mind Probe",
			"mental": true,
			"exotic": true,
			"base_points": 20,
			"modifiers": [
				{
					"type": "modifier",
					"id": "0a60fd8f-dc58-4d06-8985-cc85b9930de7",
					"disabled": true,
					"name": "Cybernetic",
					"reference": "B69",
					"cost_type": "percentage",
					"cost": 50,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "dacc5442-7141-4c23-8c3d-08ba2ba36d43",
					"disabled": true,
					"name": "Sensory",
					"reference": "B69",
					"cost_type": "percentage",
					"cost": 20,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "acdcee8b-f0fb-4afb-a9e1-c95cb1909d9e",
					"disabled": true,
					"name": "Universal",
					"reference": "B69",
					"cost_type": "percentage",
					"cost": 50,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "8a1f7b94-5a04-4bd1-bc2e-66f6f262d771",
					"disabled": true,
					"name": "Cybernetic Only",
					"reference": "B70",
					"cost_type": "percentage",
					"cost": -50,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "8195d0bf-4f66-4f89-bd36-d113de82154a",
					"disabled": true,
					"name": "Racial",
					"reference": "B70",
					"cost_type": "percentage",
					"cost": -20,
					"affects": "total",
					"notes": "@Race@"
				},
				{
					"type": "modifier",
					"id": "8a6686a4-ecb6-4db0-b5bf-05e801601858",
					"disabled": true,
					"name": "Sensory Only",
					"reference": "B70",
					"cost_type": "percentage",
					"cost": -20,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "bdb28765-a650-4f65-a127-77af6e82a507",
					"disabled": true,
					"name": "Telecommunication",
					"reference": "B70",
					"cost_type": "percentage",
					"cost": -20,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "6b3a406d-06a0-4b5e-af9b-822e727b8415",
					"disabled": true,
					"name": "Invasive",
					"reference": "P62",
					"cost_type": "percentage",
					"cost": 75,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "11346c82-b76c-4dab-982b-d7f8f1b41431",
					"disabled": true,
					"name": "Memory Bank",
					"reference": "P62",
					"cost_type": "percentage",
					"cost": 100,
					"affects": "total",
					"notes": "IQ snapshots"
				},
				{
					"type": "modifier",
					"id": "a9f4de88-3b02-4444-9615-79a8e95eaaee",
					"disabled": true,
					"name": "Memory Bank",
					"reference": "P62",
					"cost_type": "percentage",
					"cost": 150,
					"affects": "total",
					"notes": "Unlimited snapshots"
				}
			],
			"reference": "B69,P61",
			"calc": {
				"points": 20
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "4fbc2f97-78f7-4d43-acb5-0a908d6e746d",
			"name": "Mind Reading",
			"mental": true,
			"exotic": true,
			"base_points": 30,
			"modifiers": [
				{
					"type": "modifier",
					"id": "de9d3f00-fd2f-49b1-a0e4-f0815ad5b6d0",
					"disabled": true,
					"name": "Cybernetic",
					"reference": "B69",
					"cost_type": "percentage",
					"cost": 50,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "5ef59ff5-b025-4a0c-94a5-da82ec290da1",
					"disabled": true,
					"name": "Sensory",
					"reference": "B69",
					"cost_type": "percentage",
					"cost": 20,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "f4b533c0-0b27-4362-a8f2-068a17b79f17",
					"disabled": true,
					"name": "Universal",
					"reference": "B69",
					"cost_type": "percentage",
					"cost": 50,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "6ca9fd0d-75d2-49dc-8c15-b17594763a11",
					"disabled": true,
					"name": "Cybernetic Only",
					"reference": "B70",
					"cost_type": "percentage",
					"cost": -50,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "2c124d03-5242-4ec2-a071-9c04e87a1d74",
					"disabled": true,
					"name": "Racial",
					"reference": "B70",
					"cost_type": "percentage",
					"cost": -20,
					"affects": "total",
					"notes": "@Race@"
				},
				{
					"type": "modifier",
					"id": "7dd6bb05-b792-44aa-8bd6-c540c2da3c31",
					"disabled": true,
					"name": "Sensory Only",
					"reference": "B70",
					"cost_type": "percentage",
					"cost": -20,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "7e4564aa-4666-49e4-a486-e9201c9b5c78",
					"disabled": true,
					"name": "Telecommunication",
					"reference": "B70",
					"cost_type": "percentage",
					"cost": -20,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "2353714f-7ce5-400c-bf66-ef60ae3ce27b",
					"disabled": true,
					"name": "Multiple Contacts",
					"reference": "P62",
					"cost_type": "percentage",
					"cost": 50,
					"affects": "total"
				}
			],
			"reference": "B69,P61",
			"calc": {
				"points": 30
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "c48eefc9-6d98-456d-8042-ebba7cb3829b",
			"name": "Mind Shield",
			"mental": true,
			"exotic": true,
			"levels": "1",
			"points_per_level": 4,
			"modifiers": [
				{
					"type": "modifier",
					"id": "dd9fef32-ad5e-4eae-959e-aee8bed2dd88",
					"disabled": true,
					"name": "Cybernetic",
					"reference": "B70",
					"cost_type": "percentage",
					"cost": -50,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "3bf539b7-0582-452b-b95e-8e4dab045633",
					"disabled": true,
					"name": "Limited",
					"reference": "P62",
					"cost_type": "percentage",
					"cost": -50,
					"affects": "total",
					"notes": "@Source@"
				},
				{
					"type": "modifier",
					"id": "efbfd8b5-20e8-43ed-992a-497b3c2eaa6c",
					"disabled": true,
					"name": "Limited",
					"reference": "P62",
					"cost_type": "percentage",
					"cost": -75,
					"affects": "total",
					"notes": "@Power/College/Focus@"
				},
				{
					"type": "modifier",
					"id": "4963a2c0-2cc2-42bb-9e58-39b3fbf9e826",
					"disabled": true,
					"name": "Lockdown",
					"reference": "PSI15",
					"cost_type": "percentage",
					"cost": 100,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "3297318e-df16-4063-a39d-f72b211912e8",
					"disabled": true,
					"name": "Profiling",
					"reference": "PSI15",
					"cost_type": "percentage",
					"cost": 10,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "8e822e5d-3a37-4058-b60e-a62ed23b8933",
					"disabled": true,
					"name": "Reflection",
					"reference": "PSI15",
					"cost_type": "percentage",
					"cost": 100,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "4c252b32-b393-4c65-9a93-9c6c4c2b111b",
					"disabled": true,
					"name": "Active",
					"reference": "PSI15",
					"cost_type": "percentage",
					"cost": -25,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "322cbf32-bde8-45ec-a13a-a30cdbda33c6",
					"disabled": true,
					"name": "Always On",
					"reference": "PSI15",
					"cost_type": "percentage",
					"cost": -10,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "a2c3d551-859e-447b-8c1e-1bf80109d537",
					"disabled": true,
					"name": "Feedback",
					"reference": "PSI15",
					"cost_type": "percentage",
					"cost": -25,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "c7756601-83de-4e4a-8fc1-f9026bbfee9f",
					"disabled": true,
					"name": "Feedback",
					"reference": "PSI15",
					"cost_type": "percentage",
					"cost": -50,
					"affects": "total",
					"notes": "With Always On"
				}
			],
			"reference": "B70,P62,PSI15",
			"calc": {
				"points": 4
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "579d6790-931e-40cd-8598-ed2032c4d7e6",
			"name": "Mindlink",
			"mental": true,
			"supernatural": true,
			"modifiers": [
				{
					"type": "modifier",
					"id": "dff30149-efee-4160-9221-03d4b106b1e8",
					"disabled": true,
					"name": "Single person",
					"reference": "B70",
					"cost_type": "points",
					"cost": 5,
					"affects": "total",
					"notes": "@Who@"
				},
				{
					"type": "modifier",
					"id": "1a19d749-a305-47c1-914d-d21f22bab5ba",
					"disabled": true,
					"name": "2-9 people",
					"reference": "B70",
					"cost_type": "points",
					"cost": 10,
					"affects": "total",
					"notes": "@Who@"
				},
				{
					"type": "modifier",
					"id": "dbca4924-8974-469d-aca0-81b9cab55a2c",
					"disabled": true,
					"name": "10-99 people",
					"reference": "B70",
					"cost_type": "points",
					"cost": 20,
					"affects": "total",
					"notes": "@Who@"
				},
				{
					"type": "modifier",
					"id": "a1bb70e7-370a-4b30-b513-e509fb52ad95",
					"disabled": true,
					"name": "100-999 people",
					"reference": "B70",
					"cost_type": "points",
					"cost": 30,
					"affects": "total",
					"notes": "@Who@"
				},
				{
					"type": "modifier",
					"id": "fb094fb6-5aab-4cba-81c4-c65056b6e5c5",
					"disabled": true,
					"name": "1000-9999 people",
					"reference": "B70",
					"cost_type": "points",
					"cost": 40,
					"affects": "total",
					"notes": "@Who@"
				},
				{
					"type": "modifier",
					"id": "18dac92f-93b3-4cc3-b48c-10264684adb9",
					"disabled": true,
					"name": "10000-99999 people",
					"reference": "B70",
					"cost_type": "points",
					"cost": 50,
					"affects": "total",
					"notes": "@Who@"
				},
				{
					"type": "modifier",
					"id": "51eeff8f-40fd-423a-86a0-80ff842266ee",
					"disabled": true,
					"name": "Broadcast",
					"reference": "B91",
					"cost_type": "percentage",
					"cost": 50,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "4b064240-8396-420b-8c8a-0480711a36b2",
					"disabled": true,
					"name": "Cybernetic",
					"reference": "B69",
					"cost_type": "percentage",
					"cost": 50,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "c02c7425-27af-42e0-a31d-4fa6149eb4ac",
					"disabled": true,
					"name": "Sensory",
					"reference": "B69",
					"cost_type": "percentage",
					"cost": 20,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "a05bcdc6-860d-4438-965b-fd5a2c8cd011",
					"disabled": true,
					"name": "Universal",
					"reference": "B69",
					"cost_type": "percentage",
					"cost": 50,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "c598736f-5fa3-474b-a5d0-4c2ed65a6ab4",
					"disabled": true,
					"name": "Video",
					"reference": "B91",
					"cost_type": "percentage",
					"cost": 40,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "7183e0e0-0a7e-4634-a4e0-e2df044a69cb",
					"disabled": true,
					"name": "Cybernetic Only",
					"reference": "B70",
					"cost_type": "percentage",
					"cost": -50,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "13daade8-fcb7-4f96-af20-55a0f8349de9",
					"disabled": true,
					"name": "Racial",
					"reference": "B70",
					"cost_type": "percentage",
					"cost": -20,
					"affects": "total",
					"notes": "@Race@"
				},
				{
					"type": "modifier",
					"id": "e4b432ce-1476-406d-b08a-8aafb58940ea",
					"disabled": true,
					"name": "Sensory Only",
					"reference": "B70",
					"cost_type": "percentage",
					"cost": -20,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "2807cc0e-6edc-4534-ac61-9f64ce32fdc6",
					"disabled": true,
					"name": "Telecommunication",
					"reference": "B70",
					"cost_type": "percentage",
					"cost": -20,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "ca8dd6c7-d355-4ef0-9340-8139540f1438",
					"disabled": true,
					"name": "Vague",
					"reference": "B91",
					"cost_type": "percentage",
					"cost": -50,
					"affects": "total"
				}
			],
			"reference": "B70",
			"calc": {
				"points": 0
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "6bf50471-43ac-411b-88a2-248029fd9472",
			"name": "Minor Addiction",
			"mental": true,
			"levels": "0",
			"base_points": -1,
			"reference": "B164",
			"calc": {
				"points": -1
			},
			"notes": "@Substance@",
			"categories": [
				"Quirk"
			]
		},
		{
			"type": "advantage",
			"id": "d98c24f4-cb3e-478f-abe4-63e467aef33b",
			"name": "Minor Handicap (@Body Part@)",
			"physical": true,
			"levels": "0",
			"base_points": -1,
			"reference": "B165",
			"calc": {
				"points": -1
			},
			"features": [
				{
					"type": "conditional_modifier",
					"amount": -1,
					"situation": "to attribute, skill, or reaction rolls, as appropriate, in situations where Minor Handicap (@Body Part@) would logically interfere"
				}
			],
			"categories": [
				"Quirk"
			]
		},
		{
			"type": "advantage",
			"id": "83db6733-8724-4d49-b0ff-57ad539e386f",
			"name": "Miserliness",
			"mental": true,
			"base_points": -10,
			"cr": 12,
			"reference": "B144",
			"calc": {
				"points": -10
			},
			"notes": "Make a self-control roll any time you are called on to spend money. If the expenditure is large, this roll may be at -5 or worse (GM’s decision). If you fail, you refuse to spend the money.",
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "72959b62-f262-4aba-bfbc-6ef2877a592f",
			"name": "Missing Digit",
			"physical": true,
			"modifiers": [
				{
					"type": "modifier",
					"id": "d4aa8f0a-c1dc-4812-a2c3-c5827047064a",
					"disabled": true,
					"name": "Finger",
					"reference": "B144",
					"cost_type": "points",
					"cost": -2,
					"affects": "total",
					"notes": "Gives -1 DX with that hand (only)"
				},
				{
					"type": "modifier",
					"id": "54a77926-a06a-4221-ab40-0304129fc714",
					"disabled": true,
					"name": "Thumb",
					"reference": "B144",
					"cost_type": "points",
					"cost": -5,
					"affects": "total",
					"notes": "Gives -5 DX with that hand (only)"
				}
			],
			"reference": "B144",
			"calc": {
				"points": 0
			},
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "4ac8db10-9190-4597-a0ee-199d7794587f",
			"name": "Mistaken Identity",
			"physical": true,
			"base_points": -5,
			"reference": "B21",
			"calc": {
				"points": -5
			},
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "711c409e-a761-4150-8fbe-545115992803",
			"name": "Modular Abilities (Chip Slots)",
			"mental": true,
			"exotic": true,
			"levels": "1",
			"base_points": 5,
			"points_per_level": 3,
			"modifiers": [
				{
					"type": "modifier",
					"id": "81731930-54d9-4696-8db6-0409a13ea611",
					"disabled": true,
					"name": "Physical",
					"reference": "B71",
					"cost_type": "percentage",
					"cost": 100,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "5d246944-8c7f-41fb-9786-021b1cdde8c3",
					"disabled": true,
					"name": "Physical Only",
					"reference": "B71",
					"cost_type": "percentage",
					"cost": 100,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "18de6a45-6166-4ed7-bdc2-e94ec599a30d",
					"disabled": true,
					"name": "Spells Only",
					"reference": "B71",
					"cost_type": "percentage",
					"cost": -20,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "a1d93cb7-f5f4-4067-9912-eded69d666c4",
					"disabled": true,
					"name": "Virtual",
					"reference": "B71",
					"cost_type": "percentage",
					"cost": -50,
					"affects": "total",
					"notes": "@Realm@"
				},
				{
					"type": "modifier",
					"id": "44afec7f-dcd1-4869-b594-9ec81a5070b4",
					"disabled": true,
					"name": "Social Only",
					"reference": "P63",
					"cost_type": "percentage",
					"cost": 0,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "fdd89f04-60f3-4865-ac0c-4fde9a7054e5",
					"disabled": true,
					"name": "Social",
					"reference": "P63",
					"cost_type": "percentage",
					"cost": 50,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "f723fcfc-b1a6-480b-b84d-971d6a25742f",
					"disabled": true,
					"name": "Focus-Limited (@Very versatile focus@)",
					"reference": "P63",
					"cost_type": "percentage",
					"cost": -5,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "4a7968b8-374e-41e0-912b-2ab7bc9a9768",
					"disabled": true,
					"name": "Focus-Limited (@Any ordinary variety of matter or energy@)",
					"reference": "P63",
					"cost_type": "percentage",
					"cost": -10,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "ccf26a7a-cf68-4a49-bb13-3abd6955dd9d",
					"disabled": true,
					"name": "Focus-Limited (@Specialized focus@)",
					"reference": "P63",
					"cost_type": "percentage",
					"cost": -15,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "c4321c45-767e-428c-977e-480003d5c0e5",
					"disabled": true,
					"name": "Trait-Limited (@Subset of traits@)",
					"reference": "P64",
					"cost_type": "percentage",
					"cost": 0,
					"affects": "total",
					"notes": "Set cost manually"
				}
			],
			"reference": "B71,P62",
			"calc": {
				"points": 8
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "09b0315b-9577-49f2-9ed6-a8e3b7d78f1f",
			"name": "Modular Abilities (Computer Brain)",
			"mental": true,
			"exotic": true,
			"levels": "1",
			"base_points": 6,
			"points_per_level": 4,
			"modifiers": [
				{
					"type": "modifier",
					"id": "4dc5da45-70ac-4676-82d1-62a30c6e6b02",
					"disabled": true,
					"name": "Physical",
					"reference": "B71",
					"cost_type": "percentage",
					"cost": 100,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "d46db073-a754-4b17-b62b-60aad60baa12",
					"disabled": true,
					"name": "Physical Only",
					"reference": "B71",
					"cost_type": "percentage",
					"cost": 100,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "05aaae82-ec28-479e-b260-e9a775c80bf4",
					"disabled": true,
					"name": "Spells Only",
					"reference": "B71",
					"cost_type": "percentage",
					"cost": -20,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "13d7e959-8578-4d06-b2aa-62f172ab4081",
					"disabled": true,
					"name": "Virtual",
					"reference": "B71",
					"cost_type": "percentage",
					"cost": -50,
					"affects": "total",
					"notes": "@Realm@"
				},
				{
					"type": "modifier",
					"id": "f14caaf7-9c1b-4c19-b012-5ba6a8aa1405",
					"disabled": true,
					"name": "Social Only",
					"reference": "P63",
					"cost_type": "percentage",
					"cost": 0,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "e1bb5037-1806-47c3-8dc9-cae4bf064669",
					"disabled": true,
					"name": "Social",
					"reference": "P63",
					"cost_type": "percentage",
					"cost": 50,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "3bc2969c-ca90-4281-bdbd-9a24acd2d6e8",
					"disabled": true,
					"name": "Focus-Limited (@Very versatile focus@)",
					"reference": "P63",
					"cost_type": "percentage",
					"cost": -5,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "ffb1741d-267c-40ef-ad17-d2700f44f6af",
					"disabled": true,
					"name": "Focus-Limited (@Any ordinary variety of matter or energy@)",
					"reference": "P63",
					"cost_type": "percentage",
					"cost": -10,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "1dbdb893-2506-4a9f-a4dd-31209f5565f4",
					"disabled": true,
					"name": "Focus-Limited (@Specialized focus@)",
					"reference": "P63",
					"cost_type": "percentage",
					"cost": -15,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "f1c170ef-d5f2-4f2e-a7b2-c2c7f833f3d1",
					"disabled": true,
					"name": "Trait-Limited (@Subset of traits@)",
					"reference": "P64",
					"cost_type": "percentage",
					"cost": 0,
					"affects": "total",
					"notes": "Set cost manually"
				}
			],
			"reference": "B71,P62",
			"calc": {
				"points": 10
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "e3ed1e65-811e-4ff3-8035-6ed6199b921d",
			"name": "Modular Abilities (Cosmic Power)",
			"physical": true,
			"exotic": true,
			"levels": "1",
			"points_per_level": 10,
			"modifiers": [
				{
					"type": "modifier",
					"id": "f757a250-2f35-4f30-bb96-6e589488393d",
					"disabled": true,
					"name": "Physical Only",
					"reference": "B71",
					"cost_type": "percentage",
					"cost": 50,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "ced42412-bc6f-4d84-9bfb-6e446e68df65",
					"disabled": true,
					"name": "Physical",
					"reference": "B71",
					"cost_type": "percentage",
					"cost": 100,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "d1bf4afa-31f7-4692-ab3e-d98415c0ee40",
					"disabled": true,
					"name": "Spells Only",
					"reference": "B71",
					"cost_type": "percentage",
					"cost": -20,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "5dcd5c5a-170d-408a-b064-d187b212588d",
					"disabled": true,
					"name": "Virtual",
					"reference": "B71",
					"cost_type": "percentage",
					"cost": -50,
					"affects": "total",
					"notes": "@Realm@"
				},
				{
					"type": "modifier",
					"id": "9a0a4d35-42bc-408a-b5fd-9ba50f83b1b3",
					"disabled": true,
					"name": "Social Only",
					"reference": "P63",
					"cost_type": "percentage",
					"cost": 0,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "67f23b67-f7fb-43d2-a1d5-e974102e60ce",
					"disabled": true,
					"name": "Social",
					"reference": "P63",
					"cost_type": "percentage",
					"cost": 50,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "a9f9b8c5-4922-4b1c-9203-4189746ac093",
					"disabled": true,
					"name": "Focus-Limited (@Very versatile focus@)",
					"reference": "P63",
					"cost_type": "percentage",
					"cost": -5,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "351ee5bb-81a7-4a88-ac79-4c4a1f4b8d0e",
					"disabled": true,
					"name": "Focus-Limited (@Any ordinary variety of matter or energy@)",
					"reference": "P63",
					"cost_type": "percentage",
					"cost": -10,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "4b7d80c5-eff2-471a-96f4-23e8d75c6afd",
					"disabled": true,
					"name": "Focus-Limited (@Specialized focus@)",
					"reference": "P63",
					"cost_type": "percentage",
					"cost": -15,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "51853524-ab5f-4821-ba12-1f604beed848",
					"disabled": true,
					"name": "Trait-Limited (@Subset of traits@)",
					"reference": "P64",
					"cost_type": "percentage",
					"cost": 0,
					"affects": "total",
					"notes": "Set cost manually"
				}
			],
			"reference": "B71,P62",
			"calc": {
				"points": 10
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "9806555d-b5ba-49ce-ba96-33c7c0fdf3b0",
			"name": "Modular Abilities (Super-Memorization)",
			"mental": true,
			"exotic": true,
			"levels": "1",
			"base_points": 5,
			"points_per_level": 3,
			"modifiers": [
				{
					"type": "modifier",
					"id": "ec37c7fa-ae90-4988-88c2-7c5649946fa4",
					"disabled": true,
					"name": "Spells Only",
					"reference": "B71",
					"cost_type": "percentage",
					"cost": -20,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "910a3a99-f36c-43bb-ba70-ba04df414dc2",
					"disabled": true,
					"name": "Physical",
					"reference": "B71",
					"cost_type": "percentage",
					"cost": 100,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "cc306036-66cf-4e12-ab17-423b26370304",
					"disabled": true,
					"name": "Physical Only",
					"reference": "B71",
					"cost_type": "percentage",
					"cost": 100,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "fb15a03b-7600-4294-9820-c4789280a88e",
					"disabled": true,
					"name": "Virtual",
					"reference": "B71",
					"cost_type": "percentage",
					"cost": -50,
					"affects": "total",
					"notes": "@Realm@"
				},
				{
					"type": "modifier",
					"id": "dca2e513-ac23-44cc-bb64-124382c743d1",
					"disabled": true,
					"name": "Social Only",
					"reference": "P63",
					"cost_type": "percentage",
					"cost": 0,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "26156d1d-ab8f-4e9b-93c3-1bf64c85e9af",
					"disabled": true,
					"name": "Social",
					"reference": "P63",
					"cost_type": "percentage",
					"cost": 50,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "763ea500-24dd-4b3b-b653-fb12b6069301",
					"disabled": true,
					"name": "Focus-Limited (@Very versatile focus@)",
					"reference": "P63",
					"cost_type": "percentage",
					"cost": -5,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "52e92e78-46bd-487d-8baa-539ad9419b6e",
					"disabled": true,
					"name": "Focus-Limited (@Any ordinary variety of matter or energy@)",
					"reference": "P63",
					"cost_type": "percentage",
					"cost": -10,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "b169a37a-0afa-41f2-8812-ee5c3f98a85f",
					"disabled": true,
					"name": "Focus-Limited (@Specialized focus@)",
					"reference": "P63",
					"cost_type": "percentage",
					"cost": -15,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "6d41662c-e079-4c9f-bf8a-4dec028b7425",
					"disabled": true,
					"name": "Trait-Limited (@Subset of traits@)",
					"reference": "P64",
					"cost_type": "percentage",
					"cost": 0,
					"affects": "total",
					"notes": "Set cost manually"
				}
			],
			"reference": "B71,P62",
			"calc": {
				"points": 8
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "a0b90ba0-57fd-43f2-821a-e8fc4e197d87",
			"name": "Morph",
			"physical": true,
			"exotic": true,
			"levels": "1",
			"base_points": 100,
			"points_per_level": 1,
			"modifiers": [
				{
					"type": "modifier",
					"id": "256abf35-ba9e-4bfb-adf9-9b1160eb1681",
					"disabled": true,
					"name": "Unlimited",
					"reference": "B85",
					"cost_type": "percentage",
					"cost": 50,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "15e8ea5b-a4ce-4f72-b443-4b5745ddf08e",
					"disabled": true,
					"name": "Cosmetic",
					"reference": "B85",
					"cost_type": "percentage",
					"cost": -50,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "df2d9420-a499-4a4c-87ab-27b9bcd7e159",
					"disabled": true,
					"name": "Retains Shape",
					"reference": "B85",
					"cost_type": "percentage",
					"cost": -20,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "4f84495c-1628-4c9f-9ad8-08c7fd0d3ce9",
					"disabled": true,
					"name": "Mass Conservation",
					"reference": "B85",
					"cost_type": "percentage",
					"cost": -20,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "50c07901-2485-4733-bfd4-7c8c99d374e7",
					"disabled": true,
					"name": "Active Change",
					"reference": "P75",
					"cost_type": "percentage",
					"cost": 20,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "d921b98c-4a39-4164-a8de-8ee05d4d1f80",
					"disabled": true,
					"name": "Improvised Forms",
					"reference": "P75",
					"cost_type": "percentage",
					"cost": 100,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "9edb757f-a8ad-4489-a730-cc19ddfb8327",
					"disabled": true,
					"name": "Cosmic (For Improvised Forms)",
					"reference": "P75",
					"cost_type": "percentage",
					"cost": 50,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "79cadbb2-9a8a-4063-8aff-6213b733f3c0",
					"disabled": true,
					"name": "No Memorization Required",
					"reference": "P75",
					"cost_type": "percentage",
					"cost": 50,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "20988bb7-8846-4d1e-a497-c66d5796678c",
					"disabled": true,
					"name": "Cannot Memorize Forms",
					"reference": "P75",
					"cost_type": "percentage",
					"cost": -50,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "f0241224-4e6a-4ebf-8a97-b87e00a168c9",
					"disabled": true,
					"name": "Flawed",
					"reference": "P75",
					"cost_type": "percentage",
					"cost": -10,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "73d30418-6a28-4302-8699-2a0d6c205d63",
					"disabled": true,
					"name": "Unliving Forms Only",
					"reference": "P75",
					"cost_type": "percentage",
					"cost": 0,
					"affects": "total"
				}
			],
			"reference": "B84",
			"calc": {
				"points": 101
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "e56ec21e-3b8a-4ecf-b320-52a4add3ffaf",
			"name": "Motion Sickness",
			"physical": true,
			"base_points": -10,
			"reference": "B144",
			"calc": {
				"points": -10
			},
			"prereqs": {
				"type": "prereq_list",
				"all": true,
				"prereqs": [
					{
						"type": "skill_prereq",
						"has": false,
						"name": {
							"compare": "is",
							"qualifier": "submariner"
						}
					},
					{
						"type": "skill_prereq",
						"has": false,
						"name": {
							"compare": "is",
							"qualifier": "submarine"
						}
					},
					{
						"type": "skill_prereq",
						"has": false,
						"name": {
							"compare": "is",
							"qualifier": "spacer"
						}
					},
					{
						"type": "skill_prereq",
						"has": false,
						"name": {
							"compare": "is",
							"qualifier": "shiphandling"
						}
					},
					{
						"type": "skill_prereq",
						"has": false,
						"name": {
							"compare": "is",
							"qualifier": "seamanship"
						}
					},
					{
						"type": "skill_prereq",
						"has": false,
						"name": {
							"compare": "contains",
							"qualifier": "crewman"
						}
					},
					{
						"type": "skill_prereq",
						"has": false,
						"name": {
							"compare": "is",
							"qualifier": "boating"
						}
					},
					{
						"type": "skill_prereq",
						"has": false,
						"name": {
							"compare": "is",
							"qualifier": "airshipman"
						}
					},
					{
						"type": "skill_prereq",
						"has": false,
						"name": {
							"compare": "contains",
							"qualifier": "driving"
						}
					},
					{
						"type": "skill_prereq",
						"has": false,
						"name": {
							"compare": "contains",
							"qualifier": "piloting"
						}
					}
				]
			},
			"notes": "You may never learn any vehicle-operation skill. You must roll vs. HT as soon as you are aboard a moving vehicle. On a failure, you vomit and are at -5 on all DX, IQ, and skill rolls for the rest of the journey. On a success, you are merely miserably queasy and at -2 on DX, IQ, and skill rolls. Roll daily on long journeys.",
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "03adb5b9-476f-43bb-bf6c-78bfe473a8f9",
			"name": "Multimillionaire",
			"social": true,
			"levels": "1",
			"base_points": 50,
			"points_per_level": 25,
			"reference": "B25",
			"calc": {
				"points": 75
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
							"qualifier": "filthy rich"
						}
					}
				]
			},
			"notes": "Starting wealth is 100x10^level normal",
			"categories": [
				"Advantage",
				"Wealth"
			]
		},
		{
			"type": "advantage",
			"id": "a8382919-d43f-4891-823d-35bb5fca60dc",
			"name": "Mundane Background",
			"mental": true,
			"base_points": -10,
			"reference": "B144",
			"calc": {
				"points": -10
			},
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "348d7427-9bad-4c6e-9cb7-93172befd909",
			"name": "Mysophobia (Dirt)",
			"mental": true,
			"base_points": -10,
			"cr": 12,
			"cr_adj": "action_penalty",
			"reference": "B149",
			"calc": {
				"points": -10
			},
			"notes": "You are deathly afraid of infection, or just of dirt and filth. Make a self-control roll when you must do something that might get you dirty. Roll at -5 to eat any unaccustomed food. You should act as “finicky” as possible.",
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "a7932fac-d0f6-4df5-b796-01d69e9d3154",
			"name": "Necrophobia (Death)",
			"mental": true,
			"base_points": -10,
			"cr": 12,
			"cr_adj": "action_penalty",
			"reference": "B149",
			"calc": {
				"points": -10
			},
			"notes": "You are terrified by the idea of death. Make a self-control roll in the presence of any dead body (animals don’t count, but portions of human bodies do). Roll at -4 if the body is that of someone you know, or -6 if the body is unnaturally animated in some way. A ghost (or apparent ghost) also requires a roll at -6.",
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "ca077a52-42ad-435e-8c78-536bcbff073b",
			"name": "Nervous Stomach",
			"physical": true,
			"base_points": -1,
			"reference": "B165",
			"calc": {
				"points": -1
			},
			"features": [
				{
					"type": "conditional_modifier",
					"amount": -3,
					"situation": "to HT rolls to avoid illness brought on by rich or spicy food, strong drink, etc."
				}
			],
			"categories": [
				"Quirk"
			]
		},
		{
			"type": "advantage",
			"id": "8eb51e7e-03dc-4d65-867c-01ad9db81869",
			"name": "Neurological Disorder (Crippling)",
			"physical": true,
			"base_points": -55,
			"reference": "B144",
			"calc": {
				"points": -55
			},
			"features": [
				{
					"type": "skill_bonus",
					"amount": -6,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "artist"
					}
				},
				{
					"type": "skill_bonus",
					"amount": -6,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "jeweler"
					}
				},
				{
					"type": "skill_bonus",
					"amount": -6,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "knot-tying"
					}
				},
				{
					"type": "skill_bonus",
					"amount": -6,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "leatherworking"
					}
				},
				{
					"type": "skill_bonus",
					"amount": -6,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "lockpicking"
					}
				},
				{
					"type": "skill_bonus",
					"amount": -6,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "pickpocket"
					}
				},
				{
					"type": "skill_bonus",
					"amount": -6,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "sewing"
					}
				},
				{
					"type": "skill_bonus",
					"amount": -6,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "sleight of hand"
					}
				},
				{
					"type": "skill_bonus",
					"amount": -6,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "surgery"
					}
				},
				{
					"type": "skill_bonus",
					"amount": -6,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "acting"
					}
				},
				{
					"type": "skill_bonus",
					"amount": -6,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "leadership"
					}
				},
				{
					"type": "skill_bonus",
					"amount": -6,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "performance"
					}
				},
				{
					"type": "skill_bonus",
					"amount": -6,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "public speaking"
					}
				},
				{
					"type": "skill_bonus",
					"amount": -6,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "sex appeal"
					}
				}
			],
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "356d8503-9ca3-47d1-883a-453b5286408b",
			"name": "Neurological Disorder (Mild)",
			"physical": true,
			"base_points": -15,
			"reference": "B144",
			"calc": {
				"points": -15
			},
			"features": [
				{
					"type": "skill_bonus",
					"amount": -2,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "artist"
					}
				},
				{
					"type": "skill_bonus",
					"amount": -2,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "jeweler"
					}
				},
				{
					"type": "skill_bonus",
					"amount": -2,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "knot-tying"
					}
				},
				{
					"type": "skill_bonus",
					"amount": -2,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "leatherworking"
					}
				},
				{
					"type": "skill_bonus",
					"amount": -2,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "lockpicking"
					}
				},
				{
					"type": "skill_bonus",
					"amount": -2,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "pickpocket"
					}
				},
				{
					"type": "skill_bonus",
					"amount": -2,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "sewing"
					}
				},
				{
					"type": "skill_bonus",
					"amount": -2,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "sleight of hand"
					}
				},
				{
					"type": "skill_bonus",
					"amount": -2,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "surgery"
					}
				},
				{
					"type": "skill_bonus",
					"amount": -2,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "acting"
					}
				},
				{
					"type": "skill_bonus",
					"amount": -2,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "leadership"
					}
				},
				{
					"type": "skill_bonus",
					"amount": -2,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "performance"
					}
				},
				{
					"type": "skill_bonus",
					"amount": -2,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "pubic speaking"
					}
				},
				{
					"type": "skill_bonus",
					"amount": -2,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "sex appeal"
					}
				}
			],
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "fae61d3a-5da3-4b4e-b9eb-edeb36461a50",
			"name": "Neurological Disorder (Severe)",
			"physical": true,
			"base_points": -35,
			"reference": "B144",
			"calc": {
				"points": -35
			},
			"features": [
				{
					"type": "skill_bonus",
					"amount": -4,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "artist"
					}
				},
				{
					"type": "skill_bonus",
					"amount": -4,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "jeweler"
					}
				},
				{
					"type": "skill_bonus",
					"amount": -4,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "knot-tying"
					}
				},
				{
					"type": "skill_bonus",
					"amount": -4,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "leatherworking"
					}
				},
				{
					"type": "skill_bonus",
					"amount": -4,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "lockpicking"
					}
				},
				{
					"type": "skill_bonus",
					"amount": -4,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "pickpocket"
					}
				},
				{
					"type": "skill_bonus",
					"amount": -4,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "sewing"
					}
				},
				{
					"type": "skill_bonus",
					"amount": -4,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "sleight of hand"
					}
				},
				{
					"type": "skill_bonus",
					"amount": -4,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "surgery"
					}
				},
				{
					"type": "skill_bonus",
					"amount": -4,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "acting"
					}
				},
				{
					"type": "skill_bonus",
					"amount": -4,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "leadership"
					}
				},
				{
					"type": "skill_bonus",
					"amount": -4,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "performance"
					}
				},
				{
					"type": "skill_bonus",
					"amount": -4,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "pubic speaking"
					}
				},
				{
					"type": "skill_bonus",
					"amount": -4,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "sex appeal"
					}
				}
			],
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "e6f16f65-4eb1-4a4f-b1e2-5321ccab232b",
			"name": "Neutered",
			"physical": true,
			"base_points": -1,
			"reference": "B165",
			"calc": {
				"points": -1
			},
			"notes": "Immune to seduction",
			"categories": [
				"Quirk"
			]
		},
		{
			"type": "advantage",
			"id": "458f7edb-7179-4c14-8a5c-dcd28499a0e2",
			"name": "Neutralize (Psi)",
			"mental": true,
			"exotic": true,
			"base_points": 50,
			"modifiers": [
				{
					"type": "modifier",
					"id": "f23d4f0a-390e-4b3f-af06-32bc23ecec16",
					"disabled": true,
					"name": "Power Theft",
					"reference": "B71",
					"cost_type": "percentage",
					"cost": 200,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "0f238efc-5a16-4eab-bca7-5923dca89e95",
					"disabled": true,
					"name": "One Power",
					"reference": "B71",
					"cost_type": "percentage",
					"cost": -50,
					"affects": "total",
					"notes": "@Power@"
				},
				{
					"type": "modifier",
					"id": "cb41b551-d283-458b-b672-42b0b9676a96",
					"disabled": true,
					"name": "Power Theft",
					"reference": "P97",
					"cost_type": "percentage",
					"cost": 300,
					"affects": "total",
					"notes": "Point Total"
				},
				{
					"type": "modifier",
					"id": "7108c762-6e61-4876-aa0a-626b81baf3a5",
					"disabled": true,
					"name": "Precise",
					"reference": "P97",
					"cost_type": "percentage",
					"cost": 20,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "6052c843-45ff-4b61-88e0-230dacce5ee6",
					"disabled": true,
					"name": "Derange",
					"reference": "P97",
					"cost_type": "percentage",
					"cost": -20,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "c5ecdab5-75ad-47d8-914f-a25cfd1ad68f",
					"disabled": true,
					"name": "One Ability",
					"reference": "P97",
					"cost_type": "percentage",
					"cost": -80,
					"affects": "total",
					"notes": "@Ability@ in @Power@"
				},
				{
					"type": "modifier",
					"id": "83ef8bf5-009f-4d99-a20a-d875697e379a",
					"disabled": true,
					"name": "Derangable",
					"reference": "PSI16",
					"cost_type": "percentage",
					"cost": 10,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "48eb5da9-3d8b-4449-a379-6e0d9891444e",
					"disabled": true,
					"name": "Power Theft, Weak",
					"reference": "PSI16",
					"cost_type": "percentage",
					"cost": 100,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "8beaf9a0-9cee-4b77-bacb-e47c1afa0f4c",
					"disabled": true,
					"name": "Interruption",
					"reference": "PSI16",
					"cost_type": "percentage",
					"cost": -50,
					"affects": "total"
				}
			],
			"reference": "B71",
			"calc": {
				"points": 50
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "e0258742-e9cc-4e54-991f-d72289346d13",
			"name": "Nictitating Membrane",
			"physical": true,
			"exotic": true,
			"levels": "1",
			"points_per_level": 1,
			"reference": "B71",
			"calc": {
				"points": 1
			},
			"features": [
				{
					"type": "dr_bonus",
					"amount": 1,
					"per_level": true,
					"location": "eye"
				}
			],
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "11771827-9503-4723-b360-0419b36f5230",
			"name": "Night Blindness",
			"physical": true,
			"base_points": -10,
			"reference": "B144",
			"calc": {
				"points": -10
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
							"qualifier": "dark vision"
						}
					},
					{
						"type": "advantage_prereq",
						"has": false,
						"name": {
							"compare": "is",
							"qualifier": "night vision"
						}
					}
				]
			},
			"notes": "If the vision or combat penalty for poor lighting is between -1 and -4 for most people, your penalty is the worse of double the usual penalty or -3. If the usual penalty is -5 or worse, you function as though you were completely blind. If you have Acute Vision, it only applies in situations with no darkness penalty.",
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "707e522a-2fd6-412e-ac81-b44721b44de6",
			"name": "Night Vision",
			"physical": true,
			"levels": "1",
			"points_per_level": 1,
			"reference": "B71,P87",
			"calc": {
				"points": 1
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "a1703adf-db1b-4b76-9671-dca396565847",
			"name": "Nightmares",
			"mental": true,
			"base_points": -5,
			"cr": 12,
			"reference": "B144",
			"calc": {
				"points": -5
			},
			"notes": "Make a self-control roll each morning upon awakening. If you fail, you suffered nightmares; this costs you 1 FP that you can only recover through sleep. On a roll of 17 or 18, you are left shaking, and are at -1 to all skill and Perception rolls for the entire day.",
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "1abd58bd-d131-44a3-a2d5-7a7ba1ad4e97",
			"name": "No Depth Perception",
			"physical": true,
			"base_points": -15,
			"reference": "B144",
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
							"qualifier": "one eye"
						}
					}
				]
			},
			"features": [
				{
					"type": "conditional_modifier",
					"amount": -1,
					"situation": "to DX in combat and on any task involving hand-eye coordination"
				},
				{
					"type": "conditional_modifier",
					"amount": -3,
					"situation": "on ranged attacks (unless you Aim first) and on rolls to operate any vehicle faster than a horse and buggy"
				}
			],
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "68f5a69d-72ef-4012-978d-80363b1fdb94",
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
			"id": "b3878ca3-efd0-4c61-977b-0a63aaaadf68",
			"name": "No Hangover",
			"physical": true,
			"base_points": 1,
			"reference": "B101",
			"calc": {
				"points": 1
			},
			"categories": [
				"Perk"
			]
		},
		{
			"type": "advantage",
			"id": "8d19ef6a-ed87-40e4-ade0-735f6a166f52",
			"name": "No Legs (Aerial)",
			"physical": true,
			"exotic": true,
			"reference": "B145",
			"calc": {
				"points": 0
			},
			"prereqs": {
				"type": "prereq_list",
				"all": true,
				"prereqs": [
					{
						"type": "advantage_prereq",
						"has": true,
						"name": {
							"compare": "is",
							"qualifier": "flight"
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
			"id": "cb6e6d92-4839-48dc-829d-ae99ecd18eb6",
			"name": "No Legs (Aquatic)",
			"physical": true,
			"exotic": true,
			"modifiers": [
				{
					"type": "modifier",
					"id": "5f030d3c-8167-4c45-a086-b64a3a6c476e",
					"disabled": true,
					"name": "Can\'t dive",
					"reference": "B145",
					"cost_type": "points",
					"cost": -5,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "2ae0c860-ff99-4eff-9167-a5fca83d598b",
					"disabled": true,
					"name": "Can\'t armor @Fins/Masts/Sails/Paddles@",
					"reference": "B145",
					"cost_type": "points",
					"cost": -5,
					"affects": "total"
				}
			],
			"reference": "B145",
			"calc": {
				"points": 0
			},
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "f0aa8a9e-f9cc-41b7-a956-49e538952688",
			"name": "No Legs (Bounces)",
			"physical": true,
			"exotic": true,
			"reference": "B145",
			"calc": {
				"points": 0
			},
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "05397dba-3a42-49b2-b03e-46bd6c9df7a2",
			"name": "No Legs (Rolls)",
			"physical": true,
			"exotic": true,
			"reference": "B145",
			"calc": {
				"points": 0
			},
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "8eafea2a-2849-4f6a-a146-afa39033e26f",
			"name": "No Legs (Semi-Aquatic)",
			"physical": true,
			"exotic": true,
			"reference": "B145",
			"calc": {
				"points": 0
			},
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "1df242ab-6d8f-4e2d-97d7-d445086b7594",
			"name": "No Legs (Sessile)",
			"physical": true,
			"exotic": true,
			"base_points": -50,
			"reference": "B145",
			"calc": {
				"points": -50
			},
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "d7ef6b38-9264-4fab-889a-cd5221975c6b",
			"name": "No Legs (Slithers)",
			"physical": true,
			"exotic": true,
			"reference": "B145",
			"calc": {
				"points": 0
			},
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "dbc8fcd8-e471-4d89-aaed-92388d5ca3aa",
			"name": "No Legs (Tracked)",
			"physical": true,
			"exotic": true,
			"base_points": -20,
			"reference": "B145",
			"calc": {
				"points": -20
			},
			"notes": "@Number of Treads@ treads",
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "03a8c61e-5e17-4eca-9628-84e48fb65f34",
			"name": "No Legs (Wheeled)",
			"physical": true,
			"exotic": true,
			"base_points": -20,
			"reference": "B145",
			"calc": {
				"points": -20
			},
			"notes": "@Number of Wheels@ wheels",
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "74c5e98f-a70c-4847-863e-2bb80a3c7aab",
			"name": "No Manipulators",
			"physical": true,
			"base_points": -50,
			"reference": "B145",
			"calc": {
				"points": -50
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
			"id": "003287fb-bff5-4928-b1c7-384247b620f6",
			"name": "No Peripheral Vision",
			"physical": true,
			"base_points": -15,
			"reference": "B151",
			"calc": {
				"points": -15
			},
			"notes": "Your arc of vision is a 120° wedge to the front. On a map, your “left” and “right” hexes become “back” hexes – that is, you have three “back” hexes, and get no defense against attacks originating from these hexes!",
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "10e3f617-1fe3-4a97-9e57-a4540dfd5970",
			"name": "No Sense of Humor",
			"physical": true,
			"base_points": -10,
			"reference": "B146",
			"calc": {
				"points": -10
			},
			"features": [
				{
					"type": "reaction_bonus",
					"amount": -2,
					"situation": "from others in any situation where No Sense of Humor becomes evident"
				}
			],
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "8965a33c-b057-46e3-abb2-5e5e1b6862ed",
			"name": "No Sense of Smell/Taste",
			"physical": true,
			"base_points": -5,
			"reference": "B146",
			"calc": {
				"points": -5
			},
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "03268c8f-2169-4713-8843-3e27a3745ace",
			"name": "Nocturnal",
			"physical": true,
			"exotic": true,
			"base_points": -20,
			"modifiers": [
				{
					"type": "modifier",
					"id": "17779d0e-b107-4e43-b6b9-9d799eba06d8",
					"disabled": true,
					"name": "Permanent Paralysis",
					"reference": "B146",
					"cost_type": "percentage",
					"cost": 100,
					"affects": "total"
				}
			],
			"reference": "B146",
			"calc": {
				"points": -20
			},
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "08b3b862-9899-48f7-b09d-60df5a75016a",
			"name": "Noisy",
			"physical": true,
			"levels": "1",
			"points_per_level": -2,
			"reference": "B146",
			"calc": {
				"points": -2
			},
			"features": [
				{
					"type": "skill_bonus",
					"amount": -2,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "stealth"
					}
				}
			],
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "f2ce36bd-a3de-4e36-a7dc-fa112db046cb",
			"name": "Non-Iconographic",
			"mental": true,
			"base_points": -10,
			"reference": "B146",
			"calc": {
				"points": -10
			},
			"prereqs": {
				"type": "prereq_list",
				"all": true,
				"prereqs": [
					{
						"type": "skill_prereq",
						"has": false,
						"name": {
							"compare": "is",
							"qualifier": "symbol drawing"
						}
					},
					{
						"type": "skill_prereq",
						"has": false,
						"name": {
							"compare": "is",
							"qualifier": "heraldry"
						}
					},
					{
						"type": "skill_prereq",
						"has": false,
						"name": {
							"compare": "is",
							"qualifier": "cartography"
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
			"id": "4777b2a9-979d-4cca-b9ca-cbe9aa6b5d33",
			"name": "Nosy",
			"mental": true,
			"base_points": -1,
			"reference": "B164",
			"calc": {
				"points": -1
			},
			"categories": [
				"Quirk"
			]
		},
		{
			"type": "advantage",
			"id": "3f790223-b8b2-4070-8400-ca375fb88dbe",
			"name": "Numb",
			"physical": true,
			"base_points": -20,
			"reference": "B146",
			"calc": {
				"points": -20
			},
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "8128ae9b-c10c-4fcc-9dae-4feb559351c8",
			"name": "Oblivious",
			"mental": true,
			"base_points": -5,
			"reference": "B146",
			"calc": {
				"points": -5
			},
			"features": [
				{
					"type": "skill_bonus",
					"amount": -1,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "diplomacy"
					}
				},
				{
					"type": "skill_bonus",
					"amount": -1,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "fast-talk"
					}
				},
				{
					"type": "skill_bonus",
					"amount": -1,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "intimidation"
					}
				},
				{
					"type": "skill_bonus",
					"amount": -1,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "starts_with",
						"qualifier": "savoir-faire"
					}
				},
				{
					"type": "skill_bonus",
					"amount": -1,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "sex appeal"
					}
				},
				{
					"type": "skill_bonus",
					"amount": -1,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "streetwise"
					}
				},
				{
					"type": "reaction_bonus",
					"amount": -1,
					"situation": "to resist Influence skills: Diplomacy, Fast-Talk, Intimidation, Savoir-Faire, Sex Appeal, and Streetwise"
				}
			],
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "15cb67fd-4d54-44ae-926d-fea39149d0ea",
			"name": "Obscure (@Sense@)",
			"physical": true,
			"exotic": true,
			"levels": "1",
			"points_per_level": 2,
			"modifiers": [
				{
					"type": "modifier",
					"id": "6bcd1d67-4bec-45c5-8e53-afcf2af34415",
					"disabled": true,
					"name": "Defensive",
					"reference": "B72",
					"cost_type": "percentage",
					"cost": 50,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "2cc1e79d-54bb-4e39-9b05-a6ec10b60b94",
					"disabled": true,
					"name": "Extended",
					"reference": "B72",
					"cost_type": "percentage",
					"cost": 20,
					"affects": "total",
					"notes": "@Sense@"
				},
				{
					"type": "modifier",
					"id": "d1ae6617-1d6b-47e6-a392-826bd1eeea0d",
					"disabled": true,
					"name": "Ranged",
					"reference": "B72",
					"cost_type": "percentage",
					"cost": 50,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "a7936ef4-b7e5-4d81-9efb-37d49050530c",
					"disabled": true,
					"name": "Stealthy",
					"reference": "B72",
					"cost_type": "percentage",
					"cost": 100,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "2fa9a36c-0cb6-4e3c-ba52-47f404f91cb1",
					"disabled": true,
					"name": "Always On",
					"reference": "B72",
					"cost_type": "percentage",
					"cost": -50,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "7779354f-7658-4c57-8861-eb03382a92f7",
					"disabled": true,
					"name": "Limited",
					"reference": "P65",
					"cost_type": "percentage",
					"cost": -20,
					"affects": "total",
					"notes": "@Source@"
				},
				{
					"type": "modifier",
					"id": "e2eea33e-e7d3-46af-b926-5f6dd0e066f5",
					"disabled": true,
					"name": "Limited",
					"reference": "P65",
					"cost_type": "percentage",
					"cost": -40,
					"affects": "total",
					"notes": "@Power@"
				},
				{
					"type": "modifier",
					"id": "a367fc81-3857-46e0-ae56-eaf3d4769c97",
					"disabled": true,
					"name": "Anti-Targeting",
					"reference": "PSI16",
					"cost_type": "percentage",
					"cost": -20,
					"affects": "total"
				}
			],
			"reference": "B72,P64,PSI16",
			"calc": {
				"points": 2
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "26085661-514d-4a2d-8846-e1a24b1cc715",
			"name": "Obsession",
			"mental": true,
			"levels": "0",
			"base_points": -1,
			"reference": "B164",
			"calc": {
				"points": -1
			},
			"notes": "@Subject@",
			"categories": [
				"Quirk"
			]
		},
		{
			"type": "advantage",
			"id": "302b6def-9f0f-48e7-83d4-e58221f952b3",
			"name": "Obsession",
			"mental": true,
			"cr": 12,
			"modifiers": [
				{
					"type": "modifier",
					"id": "aadc441c-1423-4e59-a5ee-9a628b843420",
					"disabled": true,
					"name": "Short term",
					"reference": "B146",
					"cost_type": "points",
					"cost": -5,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "31e5b8b9-f9ba-44e3-8afd-e6b285be3b93",
					"disabled": true,
					"name": "Long term",
					"reference": "B146",
					"cost_type": "points",
					"cost": -10,
					"affects": "total"
				}
			],
			"reference": "B146",
			"calc": {
				"points": 0
			},
			"notes": "@Goal@; Make a self-control roll whenever it would be wise to deviate from your goal. If you fail, you continue to pursue your Obsession, regardless of the consequences.",
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "43958930-d022-45ae-a8e3-ae164a2ad129",
			"name": "Odious Personal Habit",
			"physical": true,
			"modifiers": [
				{
					"type": "modifier",
					"id": "3d982038-f3cc-476f-8f1a-1221f87c1ec8",
					"disabled": true,
					"name": "-1 Reaction",
					"reference": "B22",
					"cost_type": "points",
					"cost": -5,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "9dd7b646-b563-4eb1-ac3b-6672412868c1",
					"disabled": true,
					"name": "-2 Reaction",
					"reference": "B22",
					"cost_type": "points",
					"cost": -10,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "5ed445b6-67ea-4f24-af06-50d80a1d0d94",
					"disabled": true,
					"name": "-3 Reaction",
					"reference": "B22",
					"cost_type": "points",
					"cost": -15,
					"affects": "total"
				}
			],
			"reference": "B22",
			"calc": {
				"points": 0
			},
			"notes": "@Habit@",
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "38d0c011-b055-44f6-ab8e-befc480f146f",
			"name": "On the Edge",
			"mental": true,
			"base_points": -15,
			"cr": 12,
			"reference": "B146",
			"calc": {
				"points": -15
			},
			"features": [
				{
					"type": "reaction_bonus",
					"amount": -2,
					"situation": "from others if they witness your On the Edge behavior, unless it is someone who values bravery over self-preservation (GM’s decision), who will react at +2 instead"
				}
			],
			"notes": "Make a self-control roll whenever you face a life-threatening situation: piloting a burning vehicle, staring down an entire street gang while armed only with a toothbrush, etc. If you fail, you may not back down from the challenge – but you may roll again after every success roll or reaction roll relating to the situation. In combat, make a self-control roll every time you take your turn. If you fail, you must make an All-Out attack or engage in some other kind of near-insane, suicidal behavior.",
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "c9df754d-7002-4516-bf49-52ed2f1950b6",
			"name": "One Arm",
			"physical": true,
			"base_points": -20,
			"reference": "B147",
			"calc": {
				"points": -20
			},
			"features": [
				{
					"type": "conditional_modifier",
					"amount": -4,
					"situation": "on tasks that are possible with one arm but that are usually executed with two"
				}
			],
			"notes": "You cannot use two-handed weapons, wield two weapons at once (or a weapon and a shield), or perform any task that requires two arms",
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "7121b5b0-8b77-401b-88b4-6f6108538f49",
			"name": "One Eye",
			"physical": true,
			"base_points": -15,
			"reference": "B147",
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
							"qualifier": "No Depth Perception"
						}
					}
				]
			},
			"features": [
				{
					"type": "conditional_modifier",
					"amount": -1,
					"situation": "to DX in combat and on any task involving hand-eye coordination"
				},
				{
					"type": "conditional_modifier",
					"amount": -3,
					"situation": "on ranged attacks (unless you Aim first) and on rolls to operate any vehicle faster than a horse and buggy"
				}
			],
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "6bd3bf15-6a6e-4764-950a-e717d1540fc2",
			"name": "One Hand",
			"physical": true,
			"base_points": -15,
			"reference": "B147",
			"calc": {
				"points": -15
			},
			"features": [
				{
					"type": "conditional_modifier",
					"amount": -4,
					"situation": "on tasks that are possible with one arm but that are usually executed with two"
				}
			],
			"notes": "You cannot use two-handed weapons, wield two weapons at once (or a weapon and a shield), or perform any task that requires two arms",
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "aa9c8454-cea6-4654-ba2b-67b856b88480",
			"name": "Oracle",
			"mental": true,
			"supernatural": true,
			"base_points": 15,
			"modifiers": [
				{
					"type": "modifier",
					"id": "a4f7fa0a-c2c7-4267-83da-30dd4620e58f",
					"disabled": true,
					"name": "Inspired",
					"reference": "P65",
					"cost_type": "percentage",
					"cost": 100,
					"affects": "total"
				}
			],
			"reference": "B72,P65",
			"calc": {
				"points": 15
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "5e6823d9-f372-4b29-ab16-aea1323df21d",
			"name": "Overconfidence",
			"mental": true,
			"base_points": -5,
			"cr": 12,
			"reference": "B148",
			"calc": {
				"points": -5
			},
			"features": [
				{
					"type": "reaction_bonus",
					"amount": 2,
					"situation": "from young or naive individuals who believe you are as good as you say you are"
				},
				{
					"type": "reaction_bonus",
					"amount": -2,
					"situation": "from experienced NPCs"
				}
			],
			"notes": "You must make a self-control roll any time the GM feels you show an unreasonable degree of caution. If you fail, you must go ahead as though you were able to handle the situation!",
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "c676ef90-8151-4d77-bb0e-82582bed24c2",
			"name": "Overweight",
			"physical": true,
			"base_points": -1,
			"reference": "B19",
			"calc": {
				"points": -1
			},
			"features": [
				{
					"type": "skill_bonus",
					"amount": -1,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "disguise"
					}
				},
				{
					"type": "skill_bonus",
					"amount": -1,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "shadowing"
					}
				},
				{
					"type": "skill_bonus",
					"amount": 1,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "swimming"
					}
				},
				{
					"type": "conditional_modifier",
					"amount": 1,
					"situation": "to ST vs. knockback"
				}
			],
			"categories": [
				"Quirk"
			]
		},
		{
			"type": "advantage",
			"id": "02b0051f-766c-4320-bcb4-b67092d53002",
			"name": "Pacifism: Cannot Harm Innocents",
			"mental": true,
			"base_points": -10,
			"modifiers": [
				{
					"type": "modifier",
					"id": "74354ea8-96ba-4eee-9027-9f746e9bd941",
					"disabled": true,
					"name": "Species-Specific",
					"reference": "UT32",
					"cost_type": "percentage",
					"cost": -80,
					"affects": "total"
				}
			],
			"reference": "B148",
			"calc": {
				"points": -10
			},
			"notes": "You may fight – you may even start fights – but you may only use deadly force on a foe that is attempting to do you serious harm. Capture is not “serious harm” unless you are already under penalty of death or have a Code of Honor that would require suicide if captured. You never intentionally do anything that causes, or even threatens to cause, injury to the uninvolved – particularly if they are “ordinary folks.”",
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "3ffb9cc5-3a0c-4eb5-a906-938ef1cb8ccc",
			"name": "Pacifism: Cannot Kill",
			"mental": true,
			"base_points": -15,
			"modifiers": [
				{
					"type": "modifier",
					"id": "90acca03-6b28-4979-a04f-b2f75d4d1fa9",
					"disabled": true,
					"name": "Species-Specific",
					"reference": "UT32",
					"cost_type": "percentage",
					"cost": -80,
					"affects": "total"
				}
			],
			"reference": "B148",
			"calc": {
				"points": -15
			},
			"notes": "You may fight – you may even start fights – but you may never do anything that seems likely to kill another. This includes abandoning a wounded foe to die “on his own”! You must do your best to keep your companions from killing, too. If you do kill someone (or feel responsible for a death), you immediately suffer a nervous breakdown. Roll 3d and be totally morose and useless for that many days. During this time, you must make a Will roll to offer any sort of violence toward anyone, for any reason.",
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "ced7cf08-a7d9-479e-8f05-3b8ae579e9f7",
			"name": "Pacifism: Reluctant Killer",
			"mental": true,
			"base_points": -5,
			"modifiers": [
				{
					"type": "modifier",
					"id": "6d3031de-32e5-4203-a9ad-f1ff23f723fd",
					"disabled": true,
					"name": "Species-Specific",
					"reference": "UT32",
					"cost_type": "percentage",
					"cost": -80,
					"affects": "total"
				}
			],
			"reference": "B148",
			"calc": {
				"points": -5
			},
			"notes": "You are psychologically unprepared to kill people. Whenever you make a deadly attack (e.g., with a knife or a gun) against an obvious person whose face is visible to you, you are at -4 to hit and may not Aim. If you cannot see the foe’s face (due to a mask, darkness, or distance, or because you attacked from behind), the penalty is only -2, save in close combat. You have no penalty to attack a vehicle (even an occupied one), an opponent you do not believe is a person (including things with Horrific or Monstrous appearance), or a target you can’t actually see (e.g., a set of map coordinates or a blip on a radar screen). If you kill a recognizable person, the effect on you is the same as for Pacifism: Cannot Kill. You have no problem with your allies killing; you may even supply ammo, loaded weapons, and encouragement! You just can’t do the killing yourself.",
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "b70003ce-071b-48a3-bfc4-41513d9ba055",
			"name": "Pacifism: Self-Defense Only",
			"mental": true,
			"base_points": -15,
			"modifiers": [
				{
					"type": "modifier",
					"id": "49522b66-fa2d-4daa-8672-487ba857cc9f",
					"disabled": true,
					"name": "Species-Specific",
					"reference": "UT32",
					"cost_type": "percentage",
					"cost": -80,
					"affects": "total"
				}
			],
			"reference": "B148",
			"calc": {
				"points": -15
			},
			"notes": "You only fight to defend yourself or those in your care, using only as much force as necessary (no pre-emptive strikes allowed!). You must do your best to discourage others from starting fights.",
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "b65dc36e-e0c4-4f54-a345-7bdd7d552e1d",
			"name": "Pacifism: Total Nonviolence",
			"mental": true,
			"base_points": -30,
			"modifiers": [
				{
					"type": "modifier",
					"id": "d80be636-1a32-4d36-af97-04d6e459d119",
					"disabled": true,
					"name": "Species-Specific",
					"reference": "UT32",
					"cost_type": "percentage",
					"cost": -80,
					"affects": "total"
				}
			],
			"reference": "B148",
			"calc": {
				"points": -30
			},
			"notes": "You will not lift a hand against another intelligent creature, for any reason. You must do your nonviolent best to discourage violent behavior in others, too. You are free to defend yourself against attacks by animals, mosquitoes, etc.",
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "c809cc8e-4a52-47f7-9ce8-bfdc26356632",
			"name": "Parabolic Hearing",
			"physical": true,
			"exotic": true,
			"levels": "1",
			"points_per_level": 4,
			"reference": "B72,P51",
			"calc": {
				"points": 4
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "77833cfb-8790-41d4-b8e2-4505890bfd3e",
			"name": "Paranoia",
			"mental": true,
			"base_points": -10,
			"reference": "B148",
			"calc": {
				"points": -10
			},
			"features": [
				{
					"type": "reaction_bonus",
					"amount": -2,
					"situation": "from others"
				},
				{
					"type": "reaction_bonus",
					"amount": -4,
					"situation": "toward any stranger and any “legitimate” reaction penalty (e.g., for an unfriendly race or nationality) is doubled"
				}
			],
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "e704c50a-9871-4866-8b7c-4fa02b41137f",
			"name": "Patron",
			"social": true,
			"modifiers": [
				{
					"type": "modifier",
					"id": "a99a5858-0f56-4ed0-a102-552eaa6e7222",
					"disabled": true,
					"name": "@Who: Individual with 150% of PC\'s starting points@",
					"reference": "B72",
					"cost_type": "points",
					"cost": 10,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "3977cc18-2515-4793-b8ed-43a82995ad06",
					"disabled": true,
					"name": "@Who: Organization with assets of at least 1000 times starting wealth@",
					"reference": "B72",
					"cost_type": "points",
					"cost": 10,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "fa59fc21-5707-4d97-8097-03b209d46258",
					"disabled": true,
					"name": "@Who: Individual with twice the PC\'s starting points@",
					"reference": "B72",
					"cost_type": "points",
					"cost": 15,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "631b147d-c585-4679-a67b-dbe8a8838cbb",
					"disabled": true,
					"name": "@Who: Organization with assets of at least 10000 times starting wealth@",
					"reference": "B72",
					"cost_type": "points",
					"cost": 15,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "75a7a34b-aed4-4108-aa6e-cf969a596f58",
					"disabled": true,
					"name": "@Who: An ultra-powerful individual@",
					"reference": "B72",
					"cost_type": "points",
					"cost": 20,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "4b13c656-a481-4cad-95ef-8c63c8865d50",
					"disabled": true,
					"name": "@Who: Organization with assets of at least 100000 times starting wealth@",
					"reference": "B72",
					"cost_type": "points",
					"cost": 20,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "2e82bc75-004f-411b-a855-b704cfb309a8",
					"disabled": true,
					"name": "@Who: Organization with assets of at least 1000000 times starting wealth@",
					"reference": "B72",
					"cost_type": "points",
					"cost": 25,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "3c15a25d-0b50-410d-8705-11564f7a24aa",
					"disabled": true,
					"name": "@Who: A national government or giant multi-national organization@",
					"reference": "B72",
					"cost_type": "points",
					"cost": 30,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "10d9944d-56b8-46ea-8694-cbe04aa7dc0c",
					"disabled": true,
					"name": "@Who: A diety@",
					"reference": "B72",
					"cost_type": "points",
					"cost": 30,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "30392472-005f-44e7-9c99-5a271fcb5c10",
					"disabled": true,
					"name": "Appears almost all the time",
					"reference": "B36",
					"cost_type": "multiplier",
					"cost": 3,
					"notes": "15-"
				},
				{
					"type": "modifier",
					"id": "814513c5-05a2-4d17-9ad3-5a12b3c4bdbf",
					"disabled": true,
					"name": "Appears quite often",
					"reference": "B36",
					"cost_type": "multiplier",
					"cost": 2,
					"notes": "12-"
				},
				{
					"type": "modifier",
					"id": "c97dea86-2b16-41a0-915b-732c4ecc5d83",
					"disabled": true,
					"name": "Appears fairly often",
					"reference": "B36",
					"cost_type": "multiplier",
					"cost": 1,
					"notes": "9-"
				},
				{
					"type": "modifier",
					"id": "cef0a8ca-d869-4d16-9a50-9f4c747186c3",
					"disabled": true,
					"name": "Appears quite rarely",
					"reference": "B36",
					"cost_type": "multiplier",
					"cost": 0.5,
					"notes": "6-"
				},
				{
					"type": "modifier",
					"id": "346c02a6-cab5-454e-8165-d9f5af7bec08",
					"disabled": true,
					"name": "Equipment",
					"reference": "B73",
					"cost_type": "percentage",
					"cost": 50,
					"affects": "total",
					"notes": "@Equipment worth no more than average starting wealth@"
				},
				{
					"type": "modifier",
					"id": "21776a80-4536-42a8-9fc3-7836b35cf7ba",
					"disabled": true,
					"name": "Equipment",
					"reference": "B73",
					"cost_type": "percentage",
					"cost": 100,
					"affects": "total",
					"notes": "@Equipment worth more than average starting wealth@"
				},
				{
					"type": "modifier",
					"id": "47dfac97-0be2-4289-8ce0-b45086ab2fa0",
					"disabled": true,
					"name": "Highly Accessible",
					"reference": "B73",
					"cost_type": "percentage",
					"cost": 50,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "0418d3c9-a14a-48f2-b2c4-96e006e28a8a",
					"disabled": true,
					"name": "Special Abilities",
					"reference": "B73",
					"cost_type": "percentage",
					"cost": 50,
					"affects": "total",
					"notes": "@Extensive social or political power@"
				},
				{
					"type": "modifier",
					"id": "b5bee4e8-6e53-4ec7-abfa-39d0528dcb6e",
					"disabled": true,
					"name": "Special Abilities",
					"reference": "B73",
					"cost_type": "percentage",
					"cost": 100,
					"affects": "total",
					"notes": "@Magical powers in a non-magical world, higher TL equipment, grants special powers or is supernatural@"
				},
				{
					"type": "modifier",
					"id": "86cbe17d-48c8-4a7c-9c5a-e757c577624c",
					"disabled": true,
					"name": "Minimal Interventions",
					"reference": "B73",
					"cost_type": "percentage",
					"cost": -50,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "c19e83c9-f38b-4fcd-8553-b491d225fb01",
					"disabled": true,
					"name": "Secret",
					"reference": "B73",
					"cost_type": "percentage",
					"cost": -50,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "7ff57b40-e9c5-4a86-9c30-a4852b855c0c",
					"disabled": true,
					"name": "Unwilling",
					"reference": "B74",
					"cost_type": "percentage",
					"cost": -50,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "689c3ef0-a5b1-46fd-9659-69b5569f6016",
					"disabled": true,
					"name": "Favor",
					"reference": "B55",
					"cost_type": "multiplier",
					"cost": 0.2
				}
			],
			"reference": "B72,P65",
			"calc": {
				"points": 0
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "32cb81b3-1c8f-4ed7-81f3-7748d3544a6c",
			"name": "Payload (@Load@)",
			"physical": true,
			"exotic": true,
			"levels": "1",
			"points_per_level": 1,
			"modifiers": [
				{
					"type": "modifier",
					"id": "334523f8-f59a-45fb-8c40-3cfab2763f0d",
					"disabled": true,
					"name": "Exposed",
					"reference": "B74",
					"cost_type": "percentage",
					"cost": -50,
					"affects": "total"
				}
			],
			"reference": "B74",
			"calc": {
				"points": 1
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "181fcef6-d652-4eba-a034-9d938833a7b3",
			"name": "Penetrating Vision",
			"physical": true,
			"levels": "1",
			"points_per_level": 10,
			"modifiers": [
				{
					"type": "modifier",
					"id": "8b85d7da-fbd2-4659-83a6-2cfaa960d277",
					"disabled": true,
					"name": "Blockable",
					"reference": "B74",
					"cost_type": "percentage",
					"cost": -30,
					"affects": "total",
					"notes": "@Common substance: Plastic, Stone, Wood, etc.@"
				},
				{
					"type": "modifier",
					"id": "a8c5f6b0-351d-447c-b422-568d19baba06",
					"disabled": true,
					"name": "Blockable",
					"reference": "B74",
					"cost_type": "percentage",
					"cost": -20,
					"affects": "total",
					"notes": "@Less common substance: Brick, Asphalt, etc.@"
				},
				{
					"type": "modifier",
					"id": "174973b1-9ce4-4482-982f-92d20d8cf4c6",
					"disabled": true,
					"name": "Blockable",
					"reference": "B74",
					"cost_type": "percentage",
					"cost": -10,
					"affects": "total",
					"notes": "@One specific material: Lead, etc.@"
				},
				{
					"type": "modifier",
					"id": "62138e57-e4c7-4782-9a43-29e6b63c200d",
					"disabled": true,
					"name": "Specific",
					"reference": "B74",
					"cost_type": "percentage",
					"cost": -40,
					"affects": "total",
					"notes": "@Common substance: Brick, Metal, Wood, etc.@"
				},
				{
					"type": "modifier",
					"id": "c1ef7011-5b7f-4183-8deb-28a5bf6b474e",
					"disabled": true,
					"name": "Specific",
					"reference": "B74",
					"cost_type": "percentage",
					"cost": -60,
					"affects": "total",
					"notes": "@Uncommon substance: ice, adobe, etc.@"
				},
				{
					"type": "modifier",
					"id": "fb449234-cff6-4fe4-8866-3d9f0f2a996c",
					"disabled": true,
					"name": "Specific",
					"reference": "B74",
					"cost_type": "percentage",
					"cost": -80,
					"affects": "total",
					"notes": "@Absurd substance: chocolate, silk, etc.@"
				}
			],
			"reference": "B74,P66",
			"calc": {
				"points": 10
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "0d765966-559c-4364-b9e3-b0ba30c9963e",
			"name": "Penetrating Voice",
			"physical": true,
			"base_points": 1,
			"reference": "B101",
			"calc": {
				"points": 1
			},
			"features": [
				{
					"type": "conditional_modifier",
					"amount": 3,
					"situation": "to others\' Hearing roll in siturations where you want to be heard over noise"
				}
			],
			"categories": [
				"Perk"
			]
		},
		{
			"type": "advantage",
			"id": "2c7f43b2-9b76-43c5-a861-231737951d89",
			"name": "Perfect Balance",
			"physical": true,
			"base_points": 15,
			"reference": "B74",
			"calc": {
				"points": 15
			},
			"features": [
				{
					"type": "skill_bonus",
					"amount": 1,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "starts_with",
						"qualifier": "piloting"
					}
				},
				{
					"type": "skill_bonus",
					"amount": 1,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "acrobatics"
					}
				},
				{
					"type": "skill_bonus",
					"amount": 1,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "climbing"
					}
				}
			],
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "8dadd2f3-cc2c-4980-a376-cc91d00b743a",
			"name": "Peripheral Vision",
			"physical": true,
			"base_points": 15,
			"modifiers": [
				{
					"type": "modifier",
					"id": "dbd1dea0-de15-436d-b93e-de0f3e92eb85",
					"disabled": true,
					"name": "Easy to Hit",
					"reference": "B75",
					"cost_type": "percentage",
					"cost": -20,
					"affects": "total",
					"notes": "Others can target your eyes at only -6 to hit"
				}
			],
			"reference": "B74,P87",
			"calc": {
				"points": 15
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "4d799546-4391-4c60-a941-79b33fa2c05f",
			"name": "Permeation",
			"physical": true,
			"exotic": true,
			"modifiers": [
				{
					"type": "modifier",
					"id": "ee878672-5769-4c53-af3c-2b647479e9c7",
					"disabled": true,
					"name": "@Very Common Substance: Earth, Metal, Stone, Wood, etc.@",
					"reference": "B75",
					"cost_type": "points",
					"cost": 40,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "2533f0ba-5783-4714-a984-8aa52a12b136",
					"disabled": true,
					"name": "@Common Substance: Concrete, Plastic, Steel, etc.@",
					"reference": "B75",
					"cost_type": "points",
					"cost": 20,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "5c4d13be-a4d0-4d26-8970-28d9476272e9",
					"disabled": true,
					"name": "@Occasional Substance: Glass, Ice, Sand, Aluminum, Copper, etc.@",
					"reference": "B75",
					"cost_type": "points",
					"cost": 10,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "3492697f-80d1-458c-9958-9604ea9786d6",
					"disabled": true,
					"name": "@Rare Substance: Bone, Flesh, Paper, etc.@",
					"reference": "B75",
					"cost_type": "points",
					"cost": 5,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "625988b9-4b5e-4085-883c-53946c7d9cf6",
					"disabled": true,
					"name": "Can Carry Objects",
					"reference": "B75",
					"cost_type": "percentage",
					"cost": 10,
					"affects": "total",
					"notes": "Up to No Encumbrance"
				},
				{
					"type": "modifier",
					"id": "01a538b0-6ce3-481b-aa4c-c8a96b9be3cb",
					"disabled": true,
					"name": "Can Carry Objects",
					"reference": "B75",
					"cost_type": "percentage",
					"cost": 20,
					"affects": "total",
					"notes": "Up to Light Encumbrance"
				},
				{
					"type": "modifier",
					"id": "c5ca03e2-87f9-4227-b7a4-7644cfd4f74d",
					"disabled": true,
					"name": "Can Carry Objects",
					"reference": "B75",
					"cost_type": "percentage",
					"cost": 50,
					"affects": "total",
					"notes": "Up to Medium Encumbrance"
				},
				{
					"type": "modifier",
					"id": "806b5723-7d75-4be9-b91b-94d055761b5d",
					"disabled": true,
					"name": "Can Carry Objects",
					"reference": "B75",
					"cost_type": "percentage",
					"cost": 100,
					"affects": "total",
					"notes": "Up to Heavy Encumbrance"
				},
				{
					"type": "modifier",
					"id": "01016c9a-c8e8-4c7f-a6e8-ebe67cab2a7a",
					"disabled": true,
					"name": "Tunnel",
					"reference": "B75",
					"cost_type": "percentage",
					"cost": 40,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "e1ba2b46-7079-4422-829f-b460b707592f",
					"disabled": true,
					"name": "Extended",
					"reference": "P66",
					"cost_type": "percentage",
					"cost": 20,
					"affects": "total",
					"notes": "@Related Class@"
				},
				{
					"type": "modifier",
					"id": "f78d0e8e-b4f9-4e2b-aeee-d399b0a37858",
					"disabled": true,
					"name": "Meld",
					"reference": "P66",
					"cost_type": "percentage",
					"cost": 150,
					"affects": "total",
					"levels": 1
				}
			],
			"reference": "B75,P66",
			"calc": {
				"points": 0
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "4d0d8de5-3546-44a1-9d8f-568e35f209f3",
			"name": "Personality Change",
			"mental": true,
			"levels": "0",
			"base_points": -1,
			"reference": "B164",
			"calc": {
				"points": -1
			},
			"notes": "@Circumstance@",
			"categories": [
				"Quirk"
			]
		},
		{
			"type": "advantage",
			"id": "b61938dd-4a19-46b5-b4e9-fd76a686af6f",
			"name": "Phantom Voices",
			"mental": true,
			"modifiers": [
				{
					"type": "modifier",
					"id": "85595218-ed59-4518-b385-63200fa3c180",
					"disabled": true,
					"name": "Annoying",
					"reference": "B148",
					"cost_type": "points",
					"cost": -5,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "51a559da-f81e-4db3-bb31-d217ba5f9977",
					"disabled": true,
					"name": "Disturbing",
					"reference": "B148",
					"cost_type": "points",
					"cost": -10,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "caa5211a-762d-4e8e-83c6-38880726ed58",
					"disabled": true,
					"name": "Diabolical",
					"reference": "B148",
					"cost_type": "points",
					"cost": -15,
					"affects": "total"
				}
			],
			"reference": "B148",
			"calc": {
				"points": 0
			},
			"notes": "In any situation that the GM feels is stressful, he may roll 3d. On a 6 or less, you hear voices. The GM will always roll whenever you miss a Fright Check or make the roll exactly, and whenever you fail a self-control roll for another stress-related disadvantage.",
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "55c67084-6bd6-433c-b144-371b2ca7fd96",
			"name": "Piercing Striker (@Body Part@)",
			"physical": true,
			"exotic": true,
			"base_points": 5,
			"weapons": [
				{
					"type": "melee_weapon",
					"damage": {
						"type": "pi",
						"st": "thr",
						"modifier_per_die": 1
					},
					"reach": "C",
					"parry": "0",
					"block": "No",
					"calc": {
						"level": 0,
						"parry": "0",
						"block": "No",
						"damage": "thr (+1 per die) pi"
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
			"reference": "B88",
			"calc": {
				"points": 5
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "11c4808e-6cff-4167-a1a2-3691efcdd78f",
			"name": "Pitiable",
			"physical": true,
			"social": true,
			"base_points": 5,
			"reference": "B22",
			"calc": {
				"points": 5
			},
			"features": [
				{
					"type": "reaction_bonus",
					"amount": 3,
					"situation": "from those who consider you to be in a position of helplessness, weakness, or need (which never includes those with the Callous disadvantage)"
				}
			],
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "9ebb8cb3-997c-4c8b-8d8b-07eb0b14da8a",
			"name": "Plant Empathy",
			"mental": true,
			"base_points": 5,
			"modifiers": [
				{
					"type": "modifier",
					"id": "f8324b06-889c-4087-9027-14c216ad9995",
					"disabled": true,
					"name": "Remote",
					"reference": "P48",
					"cost_type": "percentage",
					"cost": 50,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "989e6863-9863-4c25-b903-f10fa6feed56",
					"disabled": true,
					"name": "Specialized",
					"reference": "P77",
					"cost_type": "percentage",
					"cost": -40,
					"affects": "total",
					"notes": "All terrestrial plants"
				},
				{
					"type": "modifier",
					"id": "80b48f0f-ff9c-47be-babd-90ee61b4f007",
					"disabled": true,
					"name": "Specialized",
					"reference": "P77",
					"cost_type": "percentage",
					"cost": -40,
					"affects": "total",
					"notes": "All aquatic plants"
				},
				{
					"type": "modifier",
					"id": "0a2dc49c-7f1a-4d5f-bae0-49869798146e",
					"disabled": true,
					"name": "Specialized",
					"reference": "P77",
					"cost_type": "percentage",
					"cost": -50,
					"affects": "total",
					"notes": "@Large Subset: Herbs, Trees@"
				},
				{
					"type": "modifier",
					"id": "8bf0092b-9895-4e29-8d23-7cceb777d543",
					"disabled": true,
					"name": "Specialized",
					"reference": "P77",
					"cost_type": "percentage",
					"cost": -60,
					"affects": "total",
					"notes": "@Small Subset: Evergreens, Medicinals@"
				}
			],
			"reference": "B75,P48",
			"calc": {
				"points": 5
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "abc7e0b8-bd12-4828-ad7b-16f3ecff5bb5",
			"name": "Poor",
			"social": true,
			"base_points": -15,
			"reference": "B25",
			"calc": {
				"points": -15
			},
			"notes": "Starting wealth is 1/5 normal",
			"categories": [
				"Disadvantage",
				"Wealth"
			]
		},
		{
			"type": "advantage",
			"id": "29978871-5441-48be-a873-72235a06820b",
			"name": "Possession",
			"mental": true,
			"exotic": true,
			"base_points": 100,
			"modifiers": [
				{
					"type": "modifier",
					"id": "21df3e01-0fd6-4f59-b5fe-6e69feb77d9f",
					"disabled": true,
					"name": "Assimilation",
					"reference": "B76",
					"cost_type": "percentage",
					"cost": 10,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "1e7c9f39-b4af-48a0-a05c-3cdc8f963391",
					"disabled": true,
					"name": "Chronic",
					"reference": "B76",
					"cost_type": "percentage",
					"cost": 20,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "be36fc05-f19c-47fe-a433-954f35d7f958",
					"disabled": true,
					"name": "Mind Swap",
					"reference": "B76",
					"cost_type": "percentage",
					"cost": 10,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "ac22def0-fae3-4e64-a18e-9ce80f54f1b8",
					"disabled": true,
					"name": "Telecontrol",
					"reference": "B76",
					"cost_type": "percentage",
					"cost": 50,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "a274c115-54bd-44ad-a986-2e8d7aae4f05",
					"disabled": true,
					"name": "Digital",
					"reference": "B76",
					"cost_type": "percentage",
					"cost": -40,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "d1663208-b92b-4f4d-8c06-6ff7a80701df",
					"disabled": true,
					"name": "Magical",
					"reference": "B76",
					"cost_type": "percentage",
					"cost": -10,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "118295f8-6132-48f2-a452-3adae7c2bfc4",
					"disabled": true,
					"name": "Mindlink Required",
					"reference": "B76",
					"cost_type": "percentage",
					"cost": -40,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "6f4af423-240d-4bef-b6ea-a3073c619ed7",
					"disabled": true,
					"name": "No Memory Access",
					"reference": "B76",
					"cost_type": "percentage",
					"cost": -10,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "cd27546b-2ea4-42d6-a29d-bf153d5426b1",
					"disabled": true,
					"name": "Parasitic",
					"reference": "B76",
					"cost_type": "percentage",
					"cost": -60,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "21b47cbc-d853-4262-a811-98c5a1952c43",
					"disabled": true,
					"name": "Puppet Only",
					"reference": "B76",
					"cost_type": "percentage",
					"cost": -30,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "34ccfd21-4b1c-44cd-9aff-f95c4f5fbb14",
					"disabled": true,
					"name": "Spiritual",
					"reference": "B76",
					"cost_type": "percentage",
					"cost": -20,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "31baaa95-7a65-4280-be12-44eeac656f92",
					"disabled": true,
					"name": "Full Memory Access",
					"reference": "P67",
					"cost_type": "percentage",
					"cost": 10,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "99ddbdbb-522b-49f4-af5b-39f830b7e0dd",
					"disabled": true,
					"name": "Telecontrol 2",
					"reference": "P67",
					"cost_type": "percentage",
					"cost": 100,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "010fefba-be0f-40b4-b663-f17c3376b690",
					"disabled": true,
					"name": "Specialized",
					"reference": "P67",
					"cost_type": "percentage",
					"cost": -10,
					"affects": "total",
					"notes": "@Basis: Carbon Based@"
				},
				{
					"type": "modifier",
					"id": "b2b4ab75-2433-44a0-9074-4700e3c0cb19",
					"disabled": true,
					"name": "Specialized",
					"reference": "P67",
					"cost_type": "percentage",
					"cost": -20,
					"affects": "total",
					"notes": "@Planet of Origin: Terran@"
				},
				{
					"type": "modifier",
					"id": "04677030-80b7-401c-801d-c49333702074",
					"disabled": true,
					"name": "Specialized",
					"reference": "P67",
					"cost_type": "percentage",
					"cost": -25,
					"affects": "total",
					"notes": "@Kingdom: Animalia@"
				},
				{
					"type": "modifier",
					"id": "222fd22d-ba69-4b2b-bed3-73823bae23ec",
					"disabled": true,
					"name": "Specialized",
					"reference": "P67",
					"cost_type": "percentage",
					"cost": -30,
					"affects": "total",
					"notes": "@Class: Mammalia@"
				},
				{
					"type": "modifier",
					"id": "4e4ca72d-00c6-405d-9a77-ef06d6bebf16",
					"disabled": true,
					"name": "Specialized",
					"reference": "P67",
					"cost_type": "percentage",
					"cost": -40,
					"affects": "total",
					"notes": "@Species: Canis Lupus@"
				},
				{
					"type": "modifier",
					"id": "b6a6b5e9-7f18-4724-bb63-b5829658848f",
					"disabled": true,
					"name": "Specialized",
					"cost_type": "percentage",
					"cost": -35,
					"affects": "total",
					"notes": "@Family: Canidae@"
				},
				{
					"type": "modifier",
					"id": "540361a0-4d05-4b53-af8d-9108995b7814",
					"disabled": true,
					"name": "Poor Control",
					"reference": "PSI16",
					"cost_type": "percentage",
					"cost": -5,
					"affects": "total",
					"levels": 1
				},
				{
					"type": "modifier",
					"id": "47d9a263-9d44-4890-9991-75868b4426b5",
					"disabled": true,
					"name": "Poor Control",
					"reference": "PSI16",
					"cost_type": "percentage",
					"cost": -10,
					"affects": "total",
					"levels": 1,
					"notes": "40 Hour Practice"
				},
				{
					"type": "modifier",
					"id": "40eb887e-586b-4e53-9457-c8e534e220f1",
					"disabled": true,
					"name": "Poor Control, Permanent",
					"reference": "PSI16",
					"cost_type": "percentage",
					"cost": -15,
					"affects": "total",
					"levels": 1
				}
			],
			"reference": "B75,P67,PSI16",
			"calc": {
				"points": 100
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "d32cbfce-3995-4c4c-982c-4c06bdd2841f",
			"name": "Post-Combat Shakes",
			"mental": true,
			"base_points": -5,
			"cr": 12,
			"reference": "B150",
			"calc": {
				"points": -5
			},
			"notes": "Make a self-control roll at the end of any battle. If you fail, roll 3d, add the amount by which you failed your self-control roll, and look up the result on the Fright Check Table.",
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "40b6ad86-3a5f-4e8d-ab63-cffc0bd01421",
			"name": "Power Investiture",
			"mental": true,
			"supernatural": true,
			"levels": "1",
			"points_per_level": 10,
			"reference": "B77",
			"calc": {
				"points": 10
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "b79a5368-1164-4819-b351-e3446d3402a4",
			"name": "Precognition",
			"mental": true,
			"supernatural": true,
			"base_points": 25,
			"modifiers": [
				{
					"type": "modifier",
					"id": "89d82798-1d5b-42e4-bc8b-7fd5b94d5cc2",
					"disabled": true,
					"name": "Can\'t See Own Death",
					"reference": "B77",
					"cost_type": "percentage",
					"cost": -60,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "89e18824-fb84-4940-9cfd-3db3debac4ba",
					"disabled": true,
					"name": "One Event",
					"reference": "B77",
					"cost_type": "percentage",
					"cost": -40,
					"affects": "total",
					"notes": "@Event Type@"
				},
				{
					"type": "modifier",
					"id": "30ba3ae1-d30e-46b1-842e-fa5fe5d55973",
					"disabled": true,
					"name": "Directed",
					"reference": "P68",
					"cost_type": "percentage",
					"cost": 100,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "0efb47f3-b9a5-453b-9751-16b0d0163eb3",
					"disabled": true,
					"name": "Active Only",
					"reference": "P69",
					"cost_type": "percentage",
					"cost": -60,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "d89bd1d9-35d0-4f89-9aa2-4978ca33321e",
					"disabled": true,
					"name": "Passive Only",
					"reference": "P69",
					"cost_type": "percentage",
					"cost": -20,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "62031691-48e2-44b1-984a-968d734802a6",
					"disabled": true,
					"name": "Dreaming",
					"reference": "PSI16",
					"cost_type": "percentage",
					"cost": -70,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "39802f82-5c97-46ad-afae-20b7389a3af5",
					"disabled": true,
					"name": "Dreaming",
					"reference": "PSI16",
					"cost_type": "percentage",
					"cost": -20,
					"affects": "total",
					"notes": "Combined with Active Only or Can\'t See Own Death"
				}
			],
			"reference": "B77,P68,PSI16",
			"calc": {
				"points": 25
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "1841e37c-29ce-4f00-a490-710c765ed238",
			"name": "Pressure Support",
			"physical": true,
			"exotic": true,
			"levels": "1",
			"points_per_level": 5,
			"reference": "B77",
			"calc": {
				"points": 5
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "a8333415-6d5a-4edc-8fb7-a4895833c3c5",
			"name": "Protected Sense (@Sense@)",
			"physical": true,
			"exotic": true,
			"base_points": 5,
			"reference": "B78,P69",
			"calc": {
				"points": 5
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "e198c354-6759-4095-b76e-a2e7d770620d",
			"name": "Proud",
			"mental": true,
			"base_points": -1,
			"reference": "B164",
			"calc": {
				"points": -1
			},
			"features": [
				{
					"type": "reaction_bonus",
					"amount": -1,
					"situation": "to orders, insults, or social slights"
				}
			],
			"categories": [
				"Quirk"
			]
		},
		{
			"type": "advantage",
			"id": "697aaab1-f48e-42d1-83b3-9a3f58622c63",
			"name": "Psionophobia (Psionics, Common)",
			"mental": true,
			"base_points": -15,
			"cr": 12,
			"cr_adj": "action_penalty",
			"reference": "B150",
			"calc": {
				"points": -15
			},
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "3db1984c-2c7e-4097-b6e0-56d8c9959a50",
			"name": "Psionophobia (Psionics, Uncommon)",
			"mental": true,
			"base_points": -10,
			"cr": 12,
			"cr_adj": "action_penalty",
			"reference": "B150",
			"calc": {
				"points": -10
			},
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "ef1d2fb4-4f4b-4fb6-a149-98f067da0f20",
			"name": "Psionophobia (Psionics, Unknown)",
			"mental": true,
			"base_points": -5,
			"cr": 12,
			"cr_adj": "action_penalty",
			"reference": "B150",
			"calc": {
				"points": -5
			},
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "7ca747be-a43a-407f-87b8-54703707b28b",
			"name": "Psychometry",
			"mental": true,
			"supernatural": true,
			"base_points": 20,
			"modifiers": [
				{
					"type": "modifier",
					"id": "e3278872-6529-4965-8428-4032de637991",
					"disabled": true,
					"name": "Directed",
					"reference": "P69",
					"cost_type": "percentage",
					"cost": 50,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "a1552a4b-adbc-407c-b5d1-844549297eb3",
					"disabled": true,
					"name": "Immersive",
					"reference": "P69",
					"cost_type": "percentage",
					"cost": 100,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "9c790e8f-f454-40fc-952e-9d60bd3db249",
					"disabled": true,
					"name": "Sensitive",
					"reference": "P69",
					"cost_type": "percentage",
					"cost": 30,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "971b4330-f474-41db-b57a-14bf5cedc9ce",
					"disabled": true,
					"name": "Active Only",
					"reference": "P69",
					"cost_type": "percentage",
					"cost": -20,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "d6bc5af9-0522-448d-a7b6-150e4b2b08e8",
					"disabled": true,
					"name": "Hypersensory",
					"reference": "P69",
					"cost_type": "percentage",
					"cost": -50,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "ad511870-1290-414e-a207-e349415d5283",
					"disabled": true,
					"name": "Mundane",
					"reference": "P69",
					"cost_type": "percentage",
					"cost": -30,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "ffce01da-85c0-4870-95fe-5affd4bd7b2f",
					"disabled": true,
					"name": "Passive Only",
					"reference": "P69",
					"cost_type": "percentage",
					"cost": -60,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "b06d4ed3-e9f1-44f8-8cd8-d05c199df2de",
					"disabled": true,
					"name": "Visions",
					"reference": "PSI17",
					"cost_type": "percentage",
					"cost": 50,
					"affects": "total"
				}
			],
			"reference": "B78,P69,PSI17",
			"calc": {
				"points": 20
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "7a1c929e-eabb-4a4d-9571-7e34925db11c",
			"name": "Puppet (@Ally Group@)",
			"mental": true,
			"exotic": true,
			"base_points": 10,
			"reference": "B78",
			"calc": {
				"points": 10
			},
			"prereqs": {
				"type": "prereq_list",
				"all": true,
				"prereqs": [
					{
						"type": "advantage_prereq",
						"has": true,
						"name": {
							"compare": "is",
							"qualifier": "possession"
						}
					},
					{
						"type": "prereq_list",
						"all": false,
						"prereqs": [
							{
								"type": "advantage_prereq",
								"has": true,
								"name": {
									"compare": "contains",
									"qualifier": "ally"
								}
							},
							{
								"type": "advantage_prereq",
								"has": true,
								"name": {
									"compare": "contains",
									"qualifier": "dependant"
								}
							}
						]
					}
				]
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "f3b7d2b4-406d-4907-9a33-ac115b247e00",
			"name": "Puppet (@Ally or Dependent@)",
			"mental": true,
			"exotic": true,
			"base_points": 5,
			"reference": "B78",
			"calc": {
				"points": 5
			},
			"prereqs": {
				"type": "prereq_list",
				"all": true,
				"prereqs": [
					{
						"type": "prereq_list",
						"all": false,
						"prereqs": [
							{
								"type": "advantage_prereq",
								"has": true,
								"name": {
									"compare": "contains",
									"qualifier": "dependant"
								}
							},
							{
								"type": "advantage_prereq",
								"has": true,
								"name": {
									"compare": "contains",
									"qualifier": "ally"
								}
							}
						]
					},
					{
						"type": "advantage_prereq",
						"has": true,
						"name": {
							"compare": "is",
							"qualifier": "possession"
						}
					}
				]
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "c5d96a85-b000-4d52-b879-44dc004dd46a",
			"name": "Pyromania",
			"mental": true,
			"base_points": -5,
			"cr": 12,
			"reference": "B150",
			"calc": {
				"points": -5
			},
			"notes": "Make a self-control roll whenever you have an opportunity to set a fire",
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "6a5038f2-5373-4f1f-bdd9-c4f56add9911",
			"name": "Pyrophobia (Fire)",
			"mental": true,
			"base_points": -5,
			"cr": 12,
			"cr_adj": "action_penalty",
			"reference": "B150",
			"calc": {
				"points": -5
			},
			"notes": "Even a burning cigarette bothers you if it comes within five yards.",
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "264875f8-9136-4f49-afae-9c69ba062cbe",
			"name": "Quadriplegic",
			"physical": true,
			"base_points": -80,
			"reference": "B150",
			"calc": {
				"points": -80
			},
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "7e03c4ec-69ad-4470-b7c3-66807e160356",
			"name": "Racial Memory",
			"mental": true,
			"exotic": true,
			"modifiers": [
				{
					"type": "modifier",
					"id": "64a9b0df-882e-46f7-84c9-cc0816f9deb7",
					"disabled": true,
					"name": "Passive",
					"reference": "B78",
					"cost_type": "points",
					"cost": 15,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "bf910aea-fc7e-4f49-a6ca-dd62db6e946b",
					"disabled": true,
					"name": "Active",
					"reference": "B78",
					"cost_type": "points",
					"cost": 40,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "6f8c98b9-041c-435f-a29f-dc59d88fdd8d",
					"disabled": true,
					"name": "Immersive",
					"reference": "P70",
					"cost_type": "percentage",
					"cost": 50,
					"affects": "total"
				}
			],
			"reference": "B78,P70",
			"calc": {
				"points": 0
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "66480aa1-c7b4-4180-83ab-ea636a639f5a",
			"name": "Racial Skill Bonus - @Skill without a specialization@",
			"mental": true,
			"exotic": true,
			"levels": "1",
			"points_per_level": 2,
			"reference": "BX452",
			"calc": {
				"points": 2
			},
			"features": [
				{
					"type": "skill_bonus",
					"amount": 1,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "@Skill without a specialization@"
					}
				}
			],
			"categories": [
				"Advantage",
				"Talent"
			]
		},
		{
			"type": "advantage",
			"id": "214bf890-2c2b-4020-847f-23795c22c4c4",
			"name": "Racial Skill Bonus - @Skill@ (@Specialization@)",
			"mental": true,
			"exotic": true,
			"levels": "1",
			"points_per_level": 2,
			"reference": "BX452",
			"calc": {
				"points": 2
			},
			"features": [
				{
					"type": "skill_bonus",
					"amount": 1,
					"per_level": true,
					"selection_type": "skills_with_name",
					"specialization": {
						"compare": "is",
						"qualifier": "@Specialization@"
					},
					"name": {
						"compare": "is",
						"qualifier": "@Skill@"
					}
				}
			],
			"categories": [
				"Advantage",
				"Talent"
			]
		},
		{
			"type": "advantage",
			"id": "e64aa62e-ba67-4c8c-9bff-6ecb805941b0",
			"name": "Radiation Tolerance",
			"physical": true,
			"exotic": true,
			"modifiers": [
				{
					"type": "modifier",
					"id": "3f086c87-8181-45db-92bb-09d2b29cef50",
					"disabled": true,
					"name": "Extended",
					"reference": "P70",
					"cost_type": "percentage",
					"cost": 30,
					"affects": "total",
					"notes": "@Type@"
				},
				{
					"type": "modifier",
					"id": "6893af4a-f742-4b8a-96cf-5d87b14d2068",
					"disabled": true,
					"name": "PF: 2",
					"reference": "B79",
					"cost_type": "points",
					"cost": 5,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "dc15778d-8fcd-48b8-9ff3-fc756cdf0564",
					"disabled": true,
					"name": "PF: 5",
					"reference": "B79",
					"cost_type": "points",
					"cost": 10,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "4f53c5f0-110a-4b42-a0c1-e9a57638b068",
					"disabled": true,
					"name": "PF: 10",
					"reference": "B79",
					"cost_type": "points",
					"cost": 15,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "f7555939-05f9-4db6-9cf5-3609280dae1a",
					"disabled": true,
					"name": "PF: 20",
					"reference": "B79",
					"cost_type": "points",
					"cost": 20,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "9cc75b9a-9b9c-4c60-9723-bbe5a6f3c0b4",
					"disabled": true,
					"name": "PF: 50",
					"reference": "B79",
					"cost_type": "points",
					"cost": 25,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "92b9e41b-4d22-424d-afec-9214b88a6f04",
					"disabled": true,
					"name": "PF: 100",
					"reference": "B79",
					"cost_type": "points",
					"cost": 30,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "707e607a-6022-445c-a4f6-cd1d83e6558b",
					"disabled": true,
					"name": "PF: 200",
					"reference": "B79",
					"cost_type": "points",
					"cost": 35,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "936d083d-81bd-47db-972c-10fdd4a4cddd",
					"disabled": true,
					"name": "PF: 500",
					"reference": "B79",
					"cost_type": "points",
					"cost": 40,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "24a98871-b997-42cf-9231-cbba88354d84",
					"disabled": true,
					"name": "PF: 1000",
					"reference": "B79",
					"cost_type": "points",
					"cost": 45,
					"affects": "total"
				}
			],
			"reference": "B79,P70",
			"calc": {
				"points": 0
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "219e541c-fd67-46bd-b9a9-109c8688993a",
			"name": "Rapid Healing",
			"physical": true,
			"base_points": 5,
			"reference": "B79",
			"calc": {
				"points": 5
			},
			"prereqs": {
				"type": "prereq_list",
				"all": true,
				"prereqs": [
					{
						"type": "attribute_prereq",
						"has": true,
						"which": "ht",
						"qualifier": {
							"compare": "at_least",
							"qualifier": 10
						}
					}
				]
			},
			"features": [
				{
					"type": "conditional_modifier",
					"amount": 5,
					"situation": "to your effective HT whenever you roll to recover lost HP or to see if you can get over a crippling injury"
				}
			],
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "ef7a4da6-3681-4c04-a81f-8218345c74f9",
			"name": "Rapier Wit",
			"mental": true,
			"base_points": 5,
			"modifiers": [
				{
					"type": "modifier",
					"id": "616e216a-3f22-40f8-aa0c-a3d997844516",
					"disabled": true,
					"name": "Words of Power",
					"reference": "P70",
					"cost_type": "percentage",
					"cost": 100,
					"affects": "total"
				}
			],
			"reference": "B79,P70",
			"calc": {
				"points": 5
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "97dd3cc0-66de-4b07-9b10-0ffbe5528126",
			"name": "Reawakened",
			"mental": true,
			"supernatural": true,
			"base_points": 10,
			"reference": "B80",
			"calc": {
				"points": 10
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "fef0847f-778b-424b-af24-9ac92644d056",
			"name": "Recovery",
			"physical": true,
			"exotic": true,
			"base_points": 10,
			"reference": "B80",
			"calc": {
				"points": 10
			},
			"notes": "When determining the length of time you remain unconscious for any reason, divide all times by 60",
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "6e249eba-ac3d-44df-a769-8e8aa262c86e",
			"name": "Reduced Consumption",
			"physical": true,
			"levels": "1",
			"points_per_level": 2,
			"modifiers": [
				{
					"type": "modifier",
					"id": "8a5b8ff8-bb6c-4a8a-9c8a-8377d5b58181",
					"disabled": true,
					"name": "Cast-Iron Stomach",
					"reference": "B80",
					"cost_type": "percentage",
					"cost": -50,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "bda6eb10-fc3f-4a90-9b65-60a4f7ddb243",
					"disabled": true,
					"name": "Food Only",
					"reference": "B80",
					"cost_type": "percentage",
					"cost": -50,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "5be2f3a6-a4ed-4a7d-9636-4636187aa5bb",
					"disabled": true,
					"name": "Water Only",
					"reference": "B80",
					"cost_type": "percentage",
					"cost": -50,
					"affects": "total"
				}
			],
			"reference": "B80",
			"calc": {
				"points": 2
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "1e48f2df-072f-41dc-94f8-d0fcd37180f4",
			"name": "Regeneration",
			"physical": true,
			"exotic": true,
			"modifiers": [
				{
					"type": "modifier",
					"id": "679b4e8c-615d-4bcd-8792-01aa83bf843c",
					"disabled": true,
					"name": "Slow",
					"reference": "B80",
					"cost_type": "points",
					"cost": 10,
					"affects": "total",
					"notes": "You recover 1 HP per 12 hours"
				},
				{
					"type": "modifier",
					"id": "0d95f094-ba55-48df-84c6-ba18b2b59b27",
					"disabled": true,
					"name": "Regular",
					"reference": "B80",
					"cost_type": "points",
					"cost": 25,
					"affects": "total",
					"notes": "You recover 1 HP per hour"
				},
				{
					"type": "modifier",
					"id": "706afc1f-dee5-429b-9c08-3401e9537b2d",
					"disabled": true,
					"name": "Fast",
					"reference": "B80",
					"cost_type": "points",
					"cost": 50,
					"affects": "total",
					"notes": "You recover 1 HP per minute"
				},
				{
					"type": "modifier",
					"id": "f1fabc95-9cb5-4611-8b76-4f2f1d3efd9f",
					"disabled": true,
					"name": "Very Fast",
					"reference": "B80",
					"cost_type": "points",
					"cost": 100,
					"affects": "total",
					"notes": "You recover 1 HP per second"
				},
				{
					"type": "modifier",
					"id": "4657d8e0-daed-4cce-a739-d1d06c8f66c3",
					"disabled": true,
					"name": "Extreme",
					"reference": "B80",
					"cost_type": "points",
					"cost": 150,
					"affects": "total",
					"notes": "You recover 10 HP per second"
				},
				{
					"type": "modifier",
					"id": "17196b06-be79-4b05-89e7-9c145693047e",
					"disabled": true,
					"name": "Heals Radiation",
					"reference": "B80",
					"cost_type": "percentage",
					"cost": 40,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "8bf62ac5-c37d-42d9-a667-550c5c5e87d7",
					"disabled": true,
					"name": "Radiation Only",
					"reference": "B80",
					"cost_type": "percentage",
					"cost": -60,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "500e47ab-6217-46f6-b0e4-5ff2bb692053",
					"disabled": true,
					"name": "Fatigue Recovery",
					"reference": "P70",
					"cost_type": "percentage",
					"cost": 100,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "6ed9a8bb-4489-4295-b23c-614ee1d93788",
					"disabled": true,
					"name": "Fatigue Only",
					"reference": "P70",
					"cost_type": "percentage",
					"cost": 0,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "9675db97-63b6-45ec-8531-d246b65166f7",
					"disabled": true,
					"name": "Limited: @Advantage@ Only",
					"reference": "P70",
					"cost_type": "percentage",
					"cost": -40,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "cebafd90-ce76-48e7-8a52-2887dde3681c",
					"disabled": true,
					"name": "Bane",
					"reference": "H18",
					"cost_type": "percentage",
					"cost": -50,
					"affects": "total",
					"notes": "@Common or Very Common@"
				},
				{
					"type": "modifier",
					"id": "c7e1964f-1438-43ca-a764-f7086ee12f18",
					"disabled": true,
					"name": "Bane",
					"reference": "H18",
					"cost_type": "percentage",
					"cost": -30,
					"affects": "total",
					"notes": "@Occasional@"
				},
				{
					"type": "modifier",
					"id": "fb57ae78-df55-492a-8581-efdc4983e02f",
					"disabled": true,
					"name": "Bane",
					"reference": "H18",
					"cost_type": "percentage",
					"cost": -10,
					"affects": "total",
					"notes": "@Rare@"
				}
			],
			"reference": "B80,P70,MA47",
			"calc": {
				"points": 0
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "27611254-b4ad-42b7-90e2-43394bb52e0c",
			"name": "Regrowth",
			"physical": true,
			"exotic": true,
			"base_points": 40,
			"modifiers": [
				{
					"type": "modifier",
					"id": "5e29c19d-47d4-4631-8a9c-ab6bb389f686",
					"disabled": true,
					"name": "Minor",
					"reference": "B80",
					"cost_type": "percentage",
					"cost": -50,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "2922d877-0738-4e29-b38d-7edd22af22da",
					"disabled": true,
					"name": "Doubling",
					"reference": "P71",
					"cost_type": "percentage",
					"cost": 25,
					"affects": "total",
					"notes": "@Body Part@ Only"
				},
				{
					"type": "modifier",
					"id": "fc148c19-5d2c-4ac4-a983-43c94001d474",
					"disabled": true,
					"name": "Doubling",
					"reference": "P71",
					"cost_type": "percentage",
					"cost": 50,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "a3ce04ba-352d-4f2b-82a9-289bf478cbee",
					"disabled": true,
					"name": "Reattachment",
					"reference": "P71",
					"cost_type": "percentage",
					"cost": 50,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "8c51b639-c5e6-4e3c-aaf7-f4c497bd27fd",
					"disabled": true,
					"name": "Bane",
					"reference": "P71",
					"cost_type": "percentage",
					"cost": -10,
					"affects": "total",
					"notes": "@Rare@"
				},
				{
					"type": "modifier",
					"id": "85c0fa9e-5c30-48cd-a8d0-afc06a973a56",
					"disabled": true,
					"name": "Bane",
					"reference": "P71",
					"cost_type": "percentage",
					"cost": -30,
					"affects": "total",
					"notes": "@Occasional@"
				},
				{
					"type": "modifier",
					"id": "1310b788-8021-404c-91da-dc4ca28fe140",
					"disabled": true,
					"name": "Bane",
					"reference": "P71",
					"cost_type": "percentage",
					"cost": -50,
					"affects": "total",
					"notes": "@Common or Very Common@"
				},
				{
					"type": "modifier",
					"id": "a21f72eb-78d3-4c5b-9521-37830933b400",
					"disabled": true,
					"name": "Reattachment Only",
					"reference": "P71",
					"cost_type": "percentage",
					"cost": -50,
					"affects": "total"
				}
			],
			"reference": "B80,P71",
			"calc": {
				"points": 40
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "2f4d5aa7-c1e7-435d-90e1-774df08eb2ef",
			"name": "Reprogrammable",
			"mental": true,
			"exotic": true,
			"base_points": -10,
			"reference": "B150",
			"calc": {
				"points": -10
			},
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "bb686b77-de17-499e-b91f-a13b63368211",
			"name": "Reputation",
			"social": true,
			"levels": "1",
			"points_per_level": -5,
			"modifiers": [
				{
					"type": "modifier",
					"id": "4ab6e069-8e13-4a45-82bd-e07fbebf17a7",
					"disabled": true,
					"name": "People Affected",
					"reference": "B27",
					"cost_type": "multiplier",
					"cost": 1,
					"notes": "Almost everyone"
				},
				{
					"type": "modifier",
					"id": "cd068eef-48af-4246-b1f4-c634f7c24a85",
					"disabled": true,
					"name": "People Affected",
					"reference": "B27",
					"cost_type": "multiplier",
					"cost": 0.67,
					"notes": "Almost everyone except @large class of people@"
				},
				{
					"type": "modifier",
					"id": "d65bc4bc-7b2c-448f-bac1-09f70431fb57",
					"disabled": true,
					"name": "People Affected",
					"reference": "B27",
					"cost_type": "multiplier",
					"cost": 0.5,
					"notes": "@Large class of people@"
				},
				{
					"type": "modifier",
					"id": "8ecfba87-4088-4469-baa7-9c83d0be8f02",
					"disabled": true,
					"name": "People Affected",
					"reference": "B27",
					"cost_type": "multiplier",
					"cost": 0.33,
					"notes": "@Small class of people@"
				},
				{
					"type": "modifier",
					"id": "cea05dc0-0766-4fd4-a469-9a45972f922c",
					"disabled": true,
					"name": "Recognized all the time",
					"reference": "B28",
					"cost_type": "multiplier",
					"cost": 1
				},
				{
					"type": "modifier",
					"id": "2d07e305-cee0-4c7f-90de-5977987209cf",
					"disabled": true,
					"name": "Recognized sometimes",
					"reference": "B28",
					"cost_type": "multiplier",
					"cost": 0.5,
					"notes": "10-"
				},
				{
					"type": "modifier",
					"id": "9c247890-4512-431a-8f0e-3a033bc21284",
					"disabled": true,
					"name": "Recognized occasionally",
					"reference": "B28",
					"cost_type": "multiplier",
					"cost": 0.33,
					"notes": "7-"
				}
			],
			"reference": "B26,MA54",
			"calc": {
				"points": -5
			},
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "3c155ebc-3a17-4a33-abec-c8392e2dbe95",
			"round_down": true,
			"name": "Reputation",
			"social": true,
			"levels": "1",
			"points_per_level": 5,
			"modifiers": [
				{
					"type": "modifier",
					"id": "38aa3113-4709-485c-be35-ba35d96192fd",
					"disabled": true,
					"name": "People Affected",
					"reference": "B27",
					"cost_type": "multiplier",
					"cost": 1,
					"notes": "Almost everyone"
				},
				{
					"type": "modifier",
					"id": "39082380-367d-4319-9daf-854976f45562",
					"disabled": true,
					"name": "People Affected",
					"reference": "B27",
					"cost_type": "multiplier",
					"cost": 0.67,
					"notes": "Almost everyone except @large class of people@"
				},
				{
					"type": "modifier",
					"id": "b43f0211-b5bf-4271-b6cc-acd6483af8d2",
					"disabled": true,
					"name": "People Affected",
					"reference": "B27",
					"cost_type": "multiplier",
					"cost": 0.5,
					"notes": "@Large class of people@"
				},
				{
					"type": "modifier",
					"id": "ca59a34a-2467-417f-9764-46e7617201a2",
					"disabled": true,
					"name": "People Affected",
					"reference": "B27",
					"cost_type": "multiplier",
					"cost": 0.33,
					"notes": "@Small class of people@"
				},
				{
					"type": "modifier",
					"id": "bf87af2b-67fd-43ca-b53d-22911e628cfe",
					"disabled": true,
					"name": "Recognized all the time",
					"reference": "B28",
					"cost_type": "multiplier",
					"cost": 1
				},
				{
					"type": "modifier",
					"id": "a0d8d318-d895-4cd6-9412-3b4839438dbe",
					"disabled": true,
					"name": "Recognized sometimes",
					"reference": "B28",
					"cost_type": "multiplier",
					"cost": 0.5,
					"notes": "10-"
				},
				{
					"type": "modifier",
					"id": "c32da9c0-87ba-4504-b87d-7ae275bec1ce",
					"disabled": true,
					"name": "Recognized occasionally",
					"reference": "B28",
					"cost_type": "multiplier",
					"cost": 0.33,
					"notes": "7-"
				}
			],
			"reference": "B26,MA54",
			"calc": {
				"points": 5
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "280069c1-ac2d-42bb-a933-0f9cdee48ad8",
			"round_down": true,
			"name": "Resistant",
			"physical": true,
			"modifiers": [
				{
					"type": "modifier",
					"id": "67a26bb4-d44b-4078-bdd1-3de5d4e7fe37",
					"disabled": true,
					"name": "@Very Common: Metabolic Hazards, etc.@",
					"reference": "B80",
					"cost_type": "points",
					"cost": 30,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "9d0a156e-6a47-450a-a695-59920f642b44",
					"disabled": true,
					"name": "@Common: Poison, Sickness, etc.@",
					"reference": "B81",
					"cost_type": "points",
					"cost": 15,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "df4e4548-5978-43a5-ba38-1acbaead9779",
					"disabled": true,
					"name": "@Occasional: Disease, Ingested Poison, etc.@",
					"reference": "B81",
					"cost_type": "points",
					"cost": 10,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "95a83382-1840-4824-b116-e378c6f814b8",
					"disabled": true,
					"name": "@Rare: Acceleration, Altitude Sickness, Bends, Seasickness, Space Sickness, Nanomachines, etc.@",
					"reference": "B81",
					"cost_type": "points",
					"cost": 5,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "568d217b-f340-4966-a69f-b4813e9cac82",
					"disabled": true,
					"name": "Immunity",
					"reference": "B81",
					"cost_type": "multiplier",
					"cost": 1
				},
				{
					"type": "modifier",
					"id": "0ce07da1-0712-4465-98c5-fb7e9975d462",
					"disabled": true,
					"name": "+8 to all HT rolls to resist",
					"reference": "B81",
					"cost_type": "multiplier",
					"cost": 0.5
				},
				{
					"type": "modifier",
					"id": "b7b5b83b-6225-4feb-83ee-52cb72533224",
					"disabled": true,
					"name": "+3 to all HT rolls to resist",
					"reference": "B81",
					"cost_type": "multiplier",
					"cost": 0.33
				}
			],
			"reference": "B81,P71,MA47",
			"calc": {
				"points": 0
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "bd58ef16-3d57-4fbe-8671-d79380209165",
			"name": "Responsive",
			"mental": true,
			"base_points": -1,
			"reference": "B164",
			"calc": {
				"points": -1
			},
			"categories": [
				"Quirk"
			]
		},
		{
			"type": "advantage",
			"id": "9cba08c8-63ed-4b0c-9183-3c7de0a59ce2",
			"name": "Restricted Diet (@Food@)",
			"physical": true,
			"modifiers": [
				{
					"type": "modifier",
					"id": "0dae0fad-abcc-4e90-a149-326bea6573a8",
					"disabled": true,
					"name": "Substitution",
					"reference": "B151",
					"cost_type": "percentage",
					"cost": -50,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "1cc9a927-6c9b-402c-bd43-9fe3454103aa",
					"disabled": true,
					"name": "Very Common",
					"reference": "B151",
					"cost_type": "points",
					"cost": -10,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "7ee9ad59-a4f4-4310-ad24-cbd4d90047c7",
					"disabled": true,
					"name": "Common",
					"reference": "B151",
					"cost_type": "points",
					"cost": -20,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "0d16b1d2-ff4b-40d7-a015-5b3a71fbbd1a",
					"disabled": true,
					"name": "Occasional",
					"reference": "B151",
					"cost_type": "points",
					"cost": -30,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "2b764a44-21bf-4285-83d6-a2443b93fe36",
					"disabled": true,
					"name": "Rare",
					"reference": "B151",
					"cost_type": "points",
					"cost": -40,
					"affects": "total"
				}
			],
			"reference": "B151",
			"calc": {
				"points": 0
			},
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "ffa18ee4-2eca-4638-b023-5d8fecc3fb67",
			"name": "Revulsion (@Common substance@)",
			"physical": true,
			"supernatural": true,
			"base_points": -10,
			"reference": "B151",
			"calc": {
				"points": -10
			},
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "65f7bf8a-ec1d-462e-a3ed-4f27f4549fa1",
			"name": "Revulsion (@Occasional substance@)",
			"physical": true,
			"supernatural": true,
			"base_points": -5,
			"reference": "B151",
			"calc": {
				"points": -5
			},
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "18dbe994-cb0f-4b99-bf56-3a12a34e323a",
			"name": "Revulsion (@Very Common substance@)",
			"physical": true,
			"supernatural": true,
			"base_points": -15,
			"reference": "B151",
			"calc": {
				"points": -15
			},
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "a7d015f8-288b-484f-a994-0ce4e99685d1",
			"name": "Ridiculous Luck",
			"mental": true,
			"base_points": 60,
			"modifiers": [
				{
					"type": "modifier",
					"id": "357dada4-0a36-4bce-8f1e-227ed666303a",
					"disabled": true,
					"name": "Active",
					"reference": "B66",
					"cost_type": "percentage",
					"cost": -40,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "ffdba32c-f767-4162-a5c4-a877ade68f95",
					"disabled": true,
					"name": "Aspected",
					"reference": "B66",
					"cost_type": "percentage",
					"cost": -20,
					"affects": "total",
					"notes": "@Aspect@"
				},
				{
					"type": "modifier",
					"id": "3b190f6e-39f8-4d83-a7ba-49b21a062b78",
					"disabled": true,
					"name": "Defensive",
					"reference": "B66",
					"cost_type": "percentage",
					"cost": -20,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "c81d2722-4c48-4669-8774-710afcc387e1",
					"disabled": true,
					"name": "Wishing",
					"reference": "P59",
					"cost_type": "percentage",
					"cost": 100,
					"affects": "total"
				}
			],
			"reference": "B66",
			"calc": {
				"points": 60
			},
			"notes": "Usable once per 10 minutes of play",
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "7eb2c128-fb70-4ba2-b811-920b8f6cd394",
			"name": "Ritual Magery",
			"mental": true,
			"supernatural": true,
			"levels": "1",
			"base_points": 5,
			"points_per_level": 10,
			"modifiers": [
				{
					"type": "modifier",
					"id": "c68415a9-45d1-46fb-8f0f-6edb11c77ff6",
					"disabled": true,
					"name": "Dance",
					"cost_type": "percentage",
					"cost": -40,
					"affects": "levels_only"
				},
				{
					"type": "modifier",
					"id": "f151ee39-e427-4d37-810e-d4f332b69405",
					"disabled": true,
					"name": "Dark-Aspected",
					"cost_type": "percentage",
					"cost": -50,
					"affects": "levels_only"
				},
				{
					"type": "modifier",
					"id": "b391ce81-ecb1-4bb5-8a76-17654ea96a3a",
					"disabled": true,
					"name": "Day-Aspected",
					"cost_type": "percentage",
					"cost": -40,
					"affects": "levels_only"
				},
				{
					"type": "modifier",
					"id": "b65098b9-542f-4074-a84c-cb91b491c685",
					"disabled": true,
					"name": "Musical",
					"cost_type": "percentage",
					"cost": -50,
					"affects": "levels_only"
				},
				{
					"type": "modifier",
					"id": "8e0c6667-35ec-443d-ab58-2744547934a2",
					"disabled": true,
					"name": "Night-Aspected",
					"cost_type": "percentage",
					"cost": -40,
					"affects": "levels_only"
				},
				{
					"type": "modifier",
					"id": "33aee417-5f27-43ed-9e74-96f6f2ddb2fc",
					"disabled": true,
					"name": "One College",
					"cost_type": "percentage",
					"cost": -40,
					"affects": "levels_only",
					"notes": "@College@"
				},
				{
					"type": "modifier",
					"id": "ab51bbd4-d383-4f72-a9c0-2ad5064a177b",
					"disabled": true,
					"name": "Solitary",
					"cost_type": "percentage",
					"cost": -40,
					"affects": "levels_only"
				},
				{
					"type": "modifier",
					"id": "edf1d838-59d8-4946-b094-0a471d9e8318",
					"disabled": true,
					"name": "Song",
					"cost_type": "percentage",
					"cost": -40,
					"affects": "levels_only"
				}
			],
			"reference": "B66",
			"calc": {
				"points": 15
			},
			"features": [
				{
					"type": "skill_bonus",
					"amount": 1,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "thaumatology"
					}
				},
				{
					"type": "skill_bonus",
					"amount": 1,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "ritual magic"
					}
				}
			],
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "df032bee-e6c8-413f-8c4a-09d5b69ab597",
			"name": "Sadism",
			"mental": true,
			"base_points": -15,
			"cr": 12,
			"reference": "B152",
			"calc": {
				"points": -15
			},
			"features": [
				{
					"type": "reaction_bonus",
					"amount": -3,
					"situation": "from those who become aware of your Sadism unless they are from a culture that holds life in little esteem"
				}
			],
			"notes": "Make a self-control roll whenever you have an opportunity to indulge your desires and know you shouldn’t (e.g., because the prisoner is one who should be released unharmed). If you fail, you cannot restrain yourself.",
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "c1d41554-992c-47c9-a909-d365005435cc",
			"name": "Sanitized Metabolism",
			"physical": true,
			"base_points": 1,
			"reference": "B101",
			"calc": {
				"points": 1
			},
			"features": [
				{
					"type": "reaction_bonus",
					"amount": 1,
					"situation": "from others in close confines"
				},
				{
					"type": "conditional_modifier",
					"amount": -1,
					"situation": "to attempts to track you by scent"
				}
			],
			"categories": [
				"Perk"
			]
		},
		{
			"type": "advantage",
			"id": "92afb6f8-df48-4c67-bc0c-15ba9e01214d",
			"name": "Scanning Sense",
			"physical": true,
			"exotic": true,
			"modifiers": [
				{
					"type": "modifier",
					"id": "c7dba5eb-8244-4eb9-aa96-6783d79bbe64",
					"disabled": true,
					"name": "Imaging Radar",
					"reference": "B81",
					"cost_type": "points",
					"cost": 20,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "e2dd29a9-4d6e-4b74-b537-8cfe40da3119",
					"disabled": true,
					"name": "Radar",
					"reference": "B81",
					"cost_type": "points",
					"cost": 20,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "2cb439b4-4dc7-492c-a25b-f10d4e393344",
					"disabled": true,
					"name": "Ladar",
					"reference": "B81",
					"cost_type": "points",
					"cost": 20,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "5ed6db33-a659-4ac6-b424-bb965f6a7188",
					"disabled": true,
					"name": "Para-Radar",
					"reference": "B81",
					"cost_type": "points",
					"cost": 40,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "058a1327-6232-4ed7-95a8-6e62d9f7dabb",
					"disabled": true,
					"name": "Sonar",
					"reference": "B81",
					"cost_type": "points",
					"cost": 20,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "dda9d4fd-592b-4892-bcf0-ea489ea86c2a",
					"disabled": true,
					"name": "Extended Arc",
					"reference": "B82",
					"cost_type": "percentage",
					"cost": 75,
					"affects": "total",
					"notes": "240°"
				},
				{
					"type": "modifier",
					"id": "838bb94a-27dc-4389-a8e3-158552e67017",
					"disabled": true,
					"name": "Extended Arc",
					"reference": "B82",
					"cost_type": "percentage",
					"cost": 125,
					"affects": "total",
					"notes": "360°"
				},
				{
					"type": "modifier",
					"id": "6a5b14bb-73a6-4e2e-b4b8-a6bccec0c45c",
					"disabled": true,
					"name": "Low-Probability Intercept",
					"reference": "B82",
					"cost_type": "percentage",
					"cost": 10,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "5fbf1d78-3879-472b-a545-17e0ade3d2e5",
					"disabled": true,
					"name": "Multi-Mode",
					"reference": "B82",
					"cost_type": "percentage",
					"cost": 50,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "4f8579bd-0ab1-44c4-80ab-a2d5cc4d9580",
					"disabled": true,
					"name": "Penetrating",
					"reference": "B82",
					"cost_type": "percentage",
					"cost": 50,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "2329cb1e-0795-4323-9203-2c168a41fbbd",
					"disabled": true,
					"name": "Targeting",
					"reference": "B82",
					"cost_type": "percentage",
					"cost": 20,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "809869d1-7eed-4e7a-8ef8-ca61905a0230",
					"disabled": true,
					"name": "Targeting Only",
					"reference": "B82",
					"cost_type": "percentage",
					"cost": -40,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "c78e13f9-4693-4332-a2c3-b3c1fc807f8a",
					"disabled": true,
					"name": "Active IR",
					"reference": "P72",
					"cost_type": "points",
					"cost": 20,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "1bd50a99-a493-40ad-aef2-3f543756a618",
					"disabled": true,
					"name": "T-Ray Vision",
					"reference": "P72",
					"cost_type": "points",
					"cost": 25,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "301f86f9-f08f-4db4-898f-e33ee1857676",
					"disabled": true,
					"name": "Bio-Scan",
					"reference": "P72",
					"cost_type": "percentage",
					"cost": 50,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "e998e9d8-938f-4032-8721-7640eef7f9a5",
					"disabled": true,
					"name": "No Intercept",
					"reference": "P72",
					"cost_type": "percentage",
					"cost": 50,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "e3a94283-9719-44a9-9976-e8903211a304",
					"disabled": true,
					"name": "Scanner",
					"reference": "P72",
					"cost_type": "percentage",
					"cost": 50,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "94fb7267-fd38-4d4f-9ee9-219a5b079d80",
					"disabled": true,
					"name": "Field Sense",
					"reference": "SU27",
					"cost_type": "points",
					"cost": 10,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "4a19b241-43e4-4855-8dd0-893666259f41",
					"disabled": true,
					"name": "Extra-Sensory Awareness",
					"reference": "PSI17",
					"cost_type": "points",
					"cost": 20,
					"affects": "total"
				}
			],
			"reference": "B81,P72,PSI17",
			"calc": {
				"points": 0
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "5767618e-0afa-4e7b-99e9-b59cebd35b9d",
			"name": "Scotophobia (Darkness)",
			"mental": true,
			"base_points": -15,
			"cr": 12,
			"cr_adj": "action_penalty",
			"reference": "B149",
			"calc": {
				"points": -15
			},
			"notes": "A common fear, but crippling. You should avoid being underground if possible; if something happens to your flashlight or torch, you might well lose your mind before you can relight it.",
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "88abe2fd-873f-4ced-aa3f-3028dd456885",
			"name": "Sealed",
			"physical": true,
			"exotic": true,
			"base_points": 15,
			"reference": "B82",
			"calc": {
				"points": 15
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "f087a591-3962-4470-add8-bb1581d6eadf",
			"name": "Secret (@Secret@)",
			"social": true,
			"modifiers": [
				{
					"type": "modifier",
					"id": "be0d3c20-c61c-49f3-ba2e-5a2b43109748",
					"disabled": true,
					"name": "Serious Embarrassment",
					"reference": "B152",
					"cost_type": "points",
					"cost": -5,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "0fc56f73-1aad-419e-b07f-c7ca028b725a",
					"disabled": true,
					"name": "Utter Rejection",
					"reference": "B152",
					"cost_type": "points",
					"cost": -10,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "00e88f4b-24f3-47c5-bdea-d27113d1a077",
					"disabled": true,
					"name": "Imprisonment",
					"reference": "B152",
					"cost_type": "points",
					"cost": -20,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "d1bbcbc7-5028-453c-8728-1b004334b66a",
					"disabled": true,
					"name": "Possible Death",
					"reference": "B152",
					"cost_type": "points",
					"cost": -30,
					"affects": "total"
				}
			],
			"reference": "B152",
			"calc": {
				"points": 0
			},
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "489c26ac-2ed4-437a-b65e-73f6c7c0d026",
			"name": "Secret Identity (@Secret ID@)",
			"social": true,
			"modifiers": [
				{
					"type": "modifier",
					"id": "e1aa472c-86ac-43af-9eb2-86c481c850ee",
					"disabled": true,
					"name": "Serious Embarrassment",
					"reference": "B152",
					"cost_type": "points",
					"cost": -5,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "821b90e4-2501-464e-bd87-01b6656e6a44",
					"disabled": true,
					"name": "Utter Rejection",
					"reference": "B152",
					"cost_type": "points",
					"cost": -10,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "0291e2c0-1f0f-447a-a7a0-821c3a5e9b3a",
					"disabled": true,
					"name": "Imprisonment",
					"reference": "B152",
					"cost_type": "points",
					"cost": -20,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "f78a22ac-0fd0-4115-898d-e9121551ef6d",
					"disabled": true,
					"name": "Possible Death",
					"reference": "B152",
					"cost_type": "points",
					"cost": -30,
					"affects": "total"
				}
			],
			"reference": "B152",
			"calc": {
				"points": 0
			},
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "6e8f6faa-202d-4f8f-a8b5-fe1feb188efe",
			"name": "Security Clearance",
			"social": true,
			"modifiers": [
				{
					"type": "modifier",
					"id": "372e880a-c28c-4a3a-a3d9-0958a32e88cf",
					"disabled": true,
					"name": "Narrow Clearance on a \\"Need to Know\\" Basis",
					"reference": "B82",
					"cost_type": "points",
					"cost": 5,
					"affects": "total",
					"notes": "@What@"
				},
				{
					"type": "modifier",
					"id": "371151ba-96e4-4927-bcbc-fd9e20b16a6c",
					"disabled": true,
					"name": "Narrow Clearance with Free Access",
					"reference": "B82",
					"cost_type": "points",
					"cost": 10,
					"affects": "total",
					"notes": "@What@"
				},
				{
					"type": "modifier",
					"id": "921014e9-98e0-4f0b-a125-6b3d836d7760",
					"disabled": true,
					"name": "Broad Clearance on a \\"Need to Know\\" Basis",
					"reference": "B82",
					"cost_type": "points",
					"cost": 10,
					"affects": "total",
					"notes": "@What@"
				},
				{
					"type": "modifier",
					"id": "63b54b2b-2fb8-456c-843c-a51b45f1debe",
					"disabled": true,
					"name": "Broad Clearance with Free Access",
					"reference": "B82",
					"cost_type": "points",
					"cost": 15,
					"affects": "total",
					"notes": "@What@"
				},
				{
					"type": "modifier",
					"id": "8fbd1958-c022-4940-b17f-ba241f2a787e",
					"disabled": true,
					"name": "Minor Importance",
					"reference": "B83",
					"cost_type": "multiplier",
					"cost": 0.5
				}
			],
			"reference": "B82",
			"calc": {
				"points": 0
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "3cbb84e2-521b-40c6-ac25-ded6a24bb8af",
			"name": "See Invisible",
			"physical": true,
			"exotic": true,
			"base_points": 15,
			"modifiers": [
				{
					"type": "modifier",
					"id": "5fb0e7a3-7b99-4f08-9cfc-11d24f9db3d8",
					"disabled": true,
					"name": "True Sight",
					"reference": "P73",
					"cost_type": "percentage",
					"cost": 50,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "1c268114-1e16-4684-aa9a-2be8a7b2b04a",
					"disabled": true,
					"name": "Partially Exclusive",
					"reference": "PSI17",
					"cost_type": "percentage",
					"cost": -20,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "6b0b56e0-f5bd-4ee3-941a-69ff6a0fed34",
					"disabled": true,
					"name": "Completely Exclusive",
					"reference": "PSI17",
					"cost_type": "percentage",
					"cost": -50,
					"affects": "total"
				}
			],
			"reference": "B83,P72,PSI17",
			"calc": {
				"points": 15
			},
			"notes": "@Type@",
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "ea89c806-df56-4165-80f5-bb2ae21c8536",
			"name": "Self-Destruct",
			"physical": true,
			"exotic": true,
			"base_points": -10,
			"reference": "B153",
			"calc": {
				"points": -10
			},
			"prereqs": {
				"type": "prereq_list",
				"all": true,
				"prereqs": [
					{
						"type": "advantage_prereq",
						"has": false,
						"name": {
							"compare": "starts_with",
							"qualifier": "terminally ill"
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
			"id": "da92009b-b829-4bfb-b0d4-eb38d528dfe1",
			"name": "Selfish",
			"mental": true,
			"base_points": -5,
			"cr": 12,
			"reference": "B153",
			"calc": {
				"points": -5
			},
			"features": [
				{
					"type": "reaction_bonus",
					"amount": -3,
					"situation": "from others when your Selfishness surfaces"
				}
			],
			"notes": "Make a self-control roll whenever you experience a clear social slight or “snub.” On a failure, you lash out at the offending party just as if you had Bad Temper.",
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "2241b57a-5ca1-4bbe-b8e2-a5e963e1645d",
			"name": "Selfless",
			"mental": true,
			"base_points": -5,
			"cr": 12,
			"reference": "B153",
			"calc": {
				"points": -5
			},
			"notes": "You must make a self-control roll to put your needs – even survival – before those of someone else.",
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "3afda3c1-dad7-4907-ab78-545555012cd9",
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
			"id": "a31d3c41-54dc-4bdb-8743-976a1b5cbeb9",
			"name": "Sense of Duty",
			"mental": true,
			"modifiers": [
				{
					"type": "modifier",
					"id": "de47158b-455d-4448-8055-86065b81d6d1",
					"disabled": true,
					"name": "Friends and Companions",
					"reference": "B153",
					"cost_type": "points",
					"cost": -5,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "8fde1c7b-7271-4b9b-9032-8551dde325a8",
					"disabled": true,
					"name": "@Small Group@",
					"reference": "B153",
					"cost_type": "points",
					"cost": -5,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "89ec98d8-237b-4ab6-82e5-f9767592c065",
					"disabled": true,
					"name": "@Individual@",
					"reference": "B153",
					"cost_type": "points",
					"cost": -2,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "0daad494-07fe-4b61-a1fe-ab5e198b6411",
					"disabled": true,
					"name": "@Large Group@",
					"reference": "B153",
					"cost_type": "points",
					"cost": -10,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "103f5c35-d3d6-4f0f-9336-447062d5c050",
					"disabled": true,
					"name": "@Entire Race@",
					"reference": "B153",
					"cost_type": "points",
					"cost": -15,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "721ee069-0e87-46c8-9638-0f2dee3142e6",
					"disabled": true,
					"name": "Every Living Being",
					"reference": "B153",
					"cost_type": "points",
					"cost": -20,
					"affects": "total"
				}
			],
			"reference": "B153",
			"calc": {
				"points": 0
			},
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "72bb29e2-2332-4265-b99f-0bd48e545024",
			"name": "Sensitive Touch",
			"physical": true,
			"exotic": true,
			"base_points": 10,
			"modifiers": [
				{
					"type": "modifier",
					"id": "1dc649fb-4321-463a-892e-14a976284242",
					"disabled": true,
					"name": "Stethoscopic",
					"reference": "P73",
					"cost_type": "percentage",
					"cost": 50,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "e7cc3245-24f4-40b0-8d41-d39a4ffa6af0",
					"disabled": true,
					"name": "Ultra-Fine",
					"reference": "P73",
					"cost_type": "percentage",
					"cost": 30,
					"affects": "total"
				}
			],
			"reference": "B83,P73",
			"calc": {
				"points": 10
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "91b6527c-dcfa-4913-9426-a39cf799d029",
			"name": "Serendipity",
			"mental": true,
			"levels": "1",
			"points_per_level": 15,
			"modifiers": [
				{
					"type": "modifier",
					"id": "4a1bbef4-bb03-4ee8-92db-a6f3f7247f11",
					"disabled": true,
					"name": "Wishing",
					"reference": "P73",
					"cost_type": "percentage",
					"cost": 100,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "bd5d2a65-3f20-4b1f-909c-022e17874983",
					"disabled": true,
					"name": "Wishing",
					"reference": "P73",
					"cost_type": "percentage",
					"cost": 0,
					"affects": "total",
					"notes": "For others only"
				}
			],
			"reference": "B83,P73",
			"calc": {
				"points": 15
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "30a7c514-7874-4213-b846-fabe416ba25a",
			"name": "Severe Shyness",
			"mental": true,
			"base_points": -10,
			"reference": "B154",
			"calc": {
				"points": -10
			},
			"features": [
				{
					"type": "skill_bonus",
					"amount": -2,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "Acting"
					}
				},
				{
					"type": "skill_bonus",
					"amount": -2,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "Carousing"
					}
				},
				{
					"type": "skill_bonus",
					"amount": -2,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "Diplomacy"
					}
				},
				{
					"type": "skill_bonus",
					"amount": -2,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "Fast-Talk"
					}
				},
				{
					"type": "skill_bonus",
					"amount": -2,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "Intimidation"
					}
				},
				{
					"type": "skill_bonus",
					"amount": -2,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "Leadership"
					}
				},
				{
					"type": "skill_bonus",
					"amount": -2,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "Merchant"
					}
				},
				{
					"type": "skill_bonus",
					"amount": -2,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "Panhandling"
					}
				},
				{
					"type": "skill_bonus",
					"amount": -2,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "Performance"
					}
				},
				{
					"type": "skill_bonus",
					"amount": -2,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "Politics"
					}
				},
				{
					"type": "skill_bonus",
					"amount": -2,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "Public Speaking"
					}
				},
				{
					"type": "skill_bonus",
					"amount": -2,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "Savoir-Faire"
					}
				},
				{
					"type": "skill_bonus",
					"amount": -2,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "Sex Appeal"
					}
				},
				{
					"type": "skill_bonus",
					"amount": -2,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "Streetwise"
					}
				},
				{
					"type": "skill_bonus",
					"amount": -2,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "Teaching"
					}
				}
			],
			"notes": "You are very uncomfortable around strangers, and tend to be quiet even among friends.",
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "9440775d-c1ab-41e0-89c4-2e5ddd3842bf",
			"name": "Sexless",
			"physical": true,
			"base_points": -1,
			"reference": "B165",
			"calc": {
				"points": -1
			},
			"categories": [
				"Quirk"
			]
		},
		{
			"type": "advantage",
			"id": "7175f88a-4aac-497e-ac58-1f39beebfb7e",
			"name": "Shadow Form",
			"physical": true,
			"exotic": true,
			"base_points": 50,
			"modifiers": [
				{
					"type": "modifier",
					"id": "f89922cb-e9f2-408f-acc6-53c8ee7af312",
					"disabled": true,
					"name": "Can Carry Objects",
					"reference": "B83",
					"cost_type": "percentage",
					"cost": 10,
					"affects": "total",
					"notes": "Up to No Encumbrance"
				},
				{
					"type": "modifier",
					"id": "696d8c57-64c0-4fe3-a170-d13cda2d08e2",
					"disabled": true,
					"name": "Can Carry Objects",
					"reference": "B83",
					"cost_type": "percentage",
					"cost": 20,
					"affects": "total",
					"notes": "Up to Light Encumbrance"
				},
				{
					"type": "modifier",
					"id": "f618c3fc-1473-4ccf-82bd-4f26c0622212",
					"disabled": true,
					"name": "Can Carry Objects",
					"reference": "B83",
					"cost_type": "percentage",
					"cost": 50,
					"affects": "total",
					"notes": "Up to Medium Encumbrance"
				},
				{
					"type": "modifier",
					"id": "30a0ffff-34f8-4255-975f-388f64c8fc2a",
					"disabled": true,
					"name": "Can Carry Objects",
					"reference": "B83",
					"cost_type": "percentage",
					"cost": 100,
					"affects": "total",
					"notes": "Up to Heavy Encumbrance"
				},
				{
					"type": "modifier",
					"id": "561e4617-d83f-4653-96b7-9ac325d38b9d",
					"disabled": true,
					"name": "3-D Movement",
					"reference": "P74",
					"cost_type": "percentage",
					"cost": 20,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "6f2f0502-568f-4bc9-8458-15e23aa52daa",
					"disabled": true,
					"name": "Light Insensitive",
					"reference": "P74",
					"cost_type": "percentage",
					"cost": 20,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "3d3f20fc-013d-4714-aadb-146f9b59e2a8",
					"disabled": true,
					"name": "Finite Thickness",
					"reference": "P74",
					"cost_type": "percentage",
					"cost": -50,
					"affects": "total"
				}
			],
			"reference": "B83,P73",
			"calc": {
				"points": 50
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "c29f80c0-cbce-43bc-8f94-dd5141b34ded",
			"name": "Shadow Form (Can\'t Turn Off)",
			"physical": true,
			"exotic": true,
			"base_points": -20,
			"reference": "B153",
			"calc": {
				"points": -20
			},
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "7877ba77-8b70-42e9-9ed8-2622084f19bc",
			"name": "Shapeshifting",
			"physical": true,
			"exotic": true,
			"modifiers": [
				{
					"type": "modifier",
					"id": "5b953ddf-d67c-4329-9762-7ee75222a52a",
					"disabled": true,
					"name": "Cannot Memorize Forms",
					"reference": "H18",
					"cost_type": "percentage",
					"cost": -50,
					"affects": "total",
					"notes": "Only for Morph."
				},
				{
					"type": "modifier",
					"id": "94d538a0-2bac-4299-abc2-3d00058b14c4",
					"disabled": true,
					"name": "Flawed",
					"reference": "H18",
					"cost_type": "percentage",
					"cost": -10,
					"affects": "total",
					"notes": "Only for Morph. Flawed is mutually incompatible with Cosmetic."
				},
				{
					"type": "modifier",
					"id": "710b37ae-e35b-4968-945a-3f201bb92bd5",
					"disabled": true,
					"name": "Needs Sample",
					"reference": "H18",
					"cost_type": "percentage",
					"cost": -5,
					"affects": "total",
					"notes": "Only for Morph. You must touch the target."
				},
				{
					"type": "modifier",
					"id": "907486d0-2e49-4634-821e-ac6ba23a02a5",
					"disabled": true,
					"name": "Needs Sample",
					"reference": "H18",
					"cost_type": "percentage",
					"cost": -15,
					"affects": "total",
					"notes": "Only for Morph. You must obtain a drop of blood, hair sample, etc. from the target."
				},
				{
					"type": "modifier",
					"id": "58e2b239-bdb1-4777-8b7f-5ad1fdf1fa58",
					"disabled": true,
					"name": "Needs Sample",
					"reference": "H18",
					"cost_type": "percentage",
					"cost": -50,
					"affects": "total",
					"notes": "Only for Morph. You must eat the entire target."
				},
				{
					"type": "modifier",
					"id": "4c75c32d-5f1a-4f9c-8a53-e85bf4cf3840",
					"disabled": true,
					"name": "Projected Form",
					"reference": "H19",
					"cost_type": "percentage",
					"cost": -50,
					"affects": "total",
					"notes": " Only for Alternate Form."
				},
				{
					"type": "modifier",
					"id": "dc42676a-4baf-4e5d-a3fa-dd604bdca9b0",
					"disabled": true,
					"name": "Skinbound",
					"reference": "H19",
					"cost_type": "percentage",
					"cost": 0,
					"affects": "total",
					"notes": "Only for Alternate Form."
				}
			],
			"reference": "B83,P74",
			"calc": {
				"points": 0
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "adc31fa2-7771-4242-ad70-b40435a721a1",
			"name": "Sharp Beak",
			"physical": true,
			"exotic": true,
			"base_points": 1,
			"weapons": [
				{
					"type": "melee_weapon",
					"damage": {
						"type": "pi+",
						"st": "thr",
						"base": "-1"
					},
					"usage": "Peck",
					"reach": "C",
					"parry": "No",
					"block": "No",
					"calc": {
						"level": 0,
						"parry": "No",
						"block": "No",
						"damage": "thr-1 pi+"
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
			"modifiers": [
				{
					"type": "modifier",
					"id": "bd3971dd-9552-493f-9d82-bd79bace3494",
					"disabled": true,
					"name": "Provided by Vampiric Bite",
					"reference": "B96",
					"cost_type": "points",
					"cost": -1,
					"affects": "total"
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
			"id": "c2e4bb63-e140-480f-92fc-37cfd8efa449",
			"name": "Sharp Claws",
			"physical": true,
			"base_points": 5,
			"weapons": [
				{
					"type": "melee_weapon",
					"damage": {
						"type": "cut",
						"st": "thr",
						"base": "-1"
					},
					"usage": "Slash",
					"reach": "C",
					"parry": "0",
					"block": "No",
					"calc": {
						"level": 0,
						"parry": "0",
						"block": "No",
						"damage": "thr-1 cut"
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
						"type": "cut",
						"st": "thr"
					},
					"usage": "Kick",
					"reach": "C,1",
					"parry": "No",
					"block": "No",
					"calc": {
						"level": 0,
						"parry": "No",
						"block": "No",
						"damage": "thr cut"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Karate",
							"modifier": -2
						},
						{
							"type": "skill",
							"name": "Brawling",
							"modifier": -2
						}
					]
				}
			],
			"reference": "B42",
			"calc": {
				"points": 5
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "6dacf382-cf72-4a64-8653-f61130548f96",
			"name": "Sharp Teeth",
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
						"level": 0,
						"parry": "No",
						"block": "No",
						"damage": "thr-1 cut"
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
			"modifiers": [
				{
					"type": "modifier",
					"id": "c32922a5-c187-48a9-8109-61776dc618f1",
					"disabled": true,
					"name": "Provided by Vampiric Bite",
					"reference": "B96",
					"cost_type": "points",
					"cost": -1,
					"affects": "total"
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
			"id": "7f2cf801-52ba-459d-bd9a-9f9f84972c00",
			"name": "Short Attention Span",
			"mental": true,
			"base_points": -10,
			"cr": 12,
			"reference": "B153",
			"calc": {
				"points": -10
			},
			"notes": "Make a self-control roll whenever you must maintain interest in something for an extended period of time, or whenever a distraction is offered. If you fail, you automatically fail at the task at hand.",
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "b29d4127-0d2b-4669-9c69-6090ebd496a8",
			"name": "Short Lifespan",
			"physical": true,
			"exotic": true,
			"levels": "1",
			"points_per_level": -10,
			"reference": "B154",
			"calc": {
				"points": -10
			},
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "dd076ae3-c441-4147-bf74-63e3cdeeff65",
			"name": "Short Spines",
			"physical": true,
			"exotic": true,
			"base_points": 1,
			"weapons": [
				{
					"type": "melee_weapon",
					"damage": {
						"type": "imp",
						"base": "1d-2"
					},
					"usage": "Stab",
					"reach": "C",
					"parry": "No",
					"block": "No",
					"calc": {
						"level": 0,
						"parry": "No",
						"block": "No",
						"damage": "1d-2 imp"
					},
					"defaults": [
						{
							"type": "dx",
							"modifier": -4
						}
					]
				}
			],
			"reference": "B88",
			"calc": {
				"points": 1
			},
			"categories": [
				"Perk"
			]
		},
		{
			"type": "advantage",
			"id": "275102bd-b770-48a7-97f5-3612111e62d6",
			"name": "Shrinking",
			"physical": true,
			"exotic": true,
			"levels": "1",
			"points_per_level": 5,
			"modifiers": [
				{
					"type": "modifier",
					"id": "8644ca84-5255-4d7d-b1dd-6b99443f6625",
					"disabled": true,
					"name": "Affects Others",
					"reference": "B85",
					"cost_type": "percentage",
					"cost": 50,
					"affects": "total",
					"notes": "One other person"
				},
				{
					"type": "modifier",
					"id": "55fd4079-f99e-41c4-a703-75f8fe2ade97",
					"disabled": true,
					"name": "Affects Others",
					"reference": "B85",
					"cost_type": "percentage",
					"cost": 100,
					"affects": "total",
					"notes": "Two other people"
				},
				{
					"type": "modifier",
					"id": "c35e4de5-3651-47ff-9f03-170b52c038f6",
					"disabled": true,
					"name": "Affects Others",
					"reference": "B85",
					"cost_type": "percentage",
					"cost": 150,
					"affects": "total",
					"notes": "Three other people"
				},
				{
					"type": "modifier",
					"id": "d1af33cf-f670-45bf-b688-b7d25cbfd906",
					"disabled": true,
					"name": "Affects Others",
					"reference": "B85",
					"cost_type": "percentage",
					"cost": 200,
					"affects": "total",
					"notes": "Four other people"
				},
				{
					"type": "modifier",
					"id": "78391470-ba6b-472f-a2ee-14342f0bf36f",
					"disabled": true,
					"name": "Can Carry Objects",
					"reference": "B85",
					"cost_type": "percentage",
					"cost": 10,
					"affects": "total",
					"notes": "Up to No Encumbrance"
				},
				{
					"type": "modifier",
					"id": "a1b244f0-a48a-4318-bd00-bf48f8fb7f92",
					"disabled": true,
					"name": "Can Carry Objects",
					"reference": "B85",
					"cost_type": "percentage",
					"cost": 20,
					"affects": "total",
					"notes": "Up to Light Encumbrance"
				},
				{
					"type": "modifier",
					"id": "a4c0ed23-a0a5-4a05-bb72-e0fa8080610e",
					"disabled": true,
					"name": "Can Carry Objects",
					"reference": "B85",
					"cost_type": "percentage",
					"cost": 50,
					"affects": "total",
					"notes": "Up to Medium Encumbrance"
				},
				{
					"type": "modifier",
					"id": "56b0cb5d-9fd8-4b77-a854-463240700b3f",
					"disabled": true,
					"name": "Can Carry Objects",
					"reference": "B85",
					"cost_type": "percentage",
					"cost": 100,
					"affects": "total",
					"notes": "Up to Heavy Encumbrance"
				},
				{
					"type": "modifier",
					"id": "a093a0c7-aaa1-4732-9b64-81509e78d5a4",
					"disabled": true,
					"name": "Full Damage",
					"reference": "B85",
					"cost_type": "percentage",
					"cost": 100,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "cdf30765-916b-4e1b-a90a-1cc7a54d7ab0",
					"disabled": true,
					"name": "Full DR",
					"reference": "B85",
					"cost_type": "percentage",
					"cost": 30,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "a3d3ed7f-03e6-4c29-97cd-905bb0c33775",
					"disabled": true,
					"name": "Full HP",
					"reference": "B85",
					"cost_type": "percentage",
					"cost": 30,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "2c230728-fe51-4fa2-b730-d0cf14de67ff",
					"disabled": true,
					"name": "Full Move",
					"reference": "B85",
					"cost_type": "percentage",
					"cost": 30,
					"affects": "total"
				}
			],
			"reference": "B85,P75",
			"calc": {
				"points": 5
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "ea789936-aa67-4aa6-980e-fde17e7c55dc",
			"name": "Shtick",
			"mental": true,
			"physical": true,
			"base_points": 1,
			"reference": "B101,HT250,MA51",
			"calc": {
				"points": 1
			},
			"categories": [
				"Perk"
			]
		},
		{
			"type": "advantage",
			"id": "99f4cf70-4085-4bef-919e-21fca3556f6d",
			"name": "Sign Language: @Language@",
			"mental": true,
			"physical": true,
			"modifiers": [
				{
					"type": "modifier",
					"id": "55d3fdf3-6876-46d3-9949-6085f1ad0166",
					"disabled": true,
					"name": "Native",
					"reference": "B23",
					"cost_type": "points",
					"cost": -3,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "f7eebe15-fc49-434d-bbff-1b866c06c119",
					"disabled": true,
					"name": "Signed",
					"reference": "B24",
					"cost_type": "points",
					"cost": 1,
					"affects": "total",
					"notes": "Broken"
				},
				{
					"type": "modifier",
					"id": "95318fe3-2482-4449-92ce-4c2cd1df5f9c",
					"disabled": true,
					"name": "Signed",
					"reference": "B24",
					"cost_type": "points",
					"cost": 2,
					"affects": "total",
					"notes": "Accented"
				},
				{
					"type": "modifier",
					"id": "af2e049f-7a03-4214-9585-bfe18f97a478",
					"disabled": true,
					"name": "Signed",
					"reference": "B24",
					"cost_type": "points",
					"cost": 3,
					"affects": "total",
					"notes": "Native"
				}
			],
			"reference": "B25",
			"calc": {
				"points": 0
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
							"qualifier": "Language Talent"
						}
					}
				]
			},
			"categories": [
				"Advantage",
				"Language"
			]
		},
		{
			"type": "advantage",
			"id": "8c9459ba-9083-4a62-ac79-79bd59583922",
			"name": "Sign Language: @Language@",
			"mental": true,
			"physical": true,
			"modifiers": [
				{
					"type": "modifier",
					"id": "6cc2663a-a8a5-4f78-8c36-647c86308f0f",
					"disabled": true,
					"name": "Native",
					"reference": "B23",
					"cost_type": "points",
					"cost": -2,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "92e5b5d9-f0d2-46c3-99e8-2166caa1534f",
					"disabled": true,
					"name": "Signed",
					"reference": "B24",
					"cost_type": "points",
					"cost": 1,
					"affects": "total",
					"notes": "Accented"
				},
				{
					"type": "modifier",
					"id": "36b811cd-dae7-4fca-860a-5df3dadfe1bf",
					"disabled": true,
					"name": "Signed",
					"reference": "B24",
					"cost_type": "points",
					"cost": 2,
					"affects": "total",
					"notes": "Native"
				}
			],
			"reference": "B25",
			"calc": {
				"points": 0
			},
			"prereqs": {
				"type": "prereq_list",
				"all": true,
				"prereqs": [
					{
						"type": "advantage_prereq",
						"has": true,
						"name": {
							"compare": "is",
							"qualifier": "Language Talent"
						}
					}
				]
			},
			"notes": "With Language Talent",
			"categories": [
				"Advantage",
				"Language"
			]
		},
		{
			"type": "advantage",
			"id": "f3cb9481-120b-48d0-a4b6-17209c8efdb5",
			"name": "Signature Gear",
			"social": true,
			"levels": "1",
			"points_per_level": 1,
			"reference": "B85",
			"calc": {
				"points": 1
			},
			"notes": "For equipment normally bought with money, each point gives goods worth up to 50% of the average campaign starting wealth (but never cash).",
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "6e667d81-dd52-4850-8ec0-021a9299adab",
			"name": "Silence",
			"physical": true,
			"exotic": true,
			"levels": "1",
			"points_per_level": 5,
			"modifiers": [
				{
					"type": "modifier",
					"id": "11a92b4d-003f-4dd9-97e3-9af9e0f75206",
					"disabled": true,
					"name": "Dynamic",
					"reference": "P76",
					"cost_type": "percentage",
					"cost": 40,
					"affects": "total"
				}
			],
			"reference": "B85,P76",
			"calc": {
				"points": 5
			},
			"features": [
				{
					"type": "conditional_modifier",
					"amount": 2,
					"per_level": true,
					"situation": "to Stealth when you are perfectly motionless"
				},
				{
					"type": "conditional_modifier",
					"amount": 1,
					"per_level": true,
					"situation": "to Stealth if moving (even in armor, etc.)"
				}
			],
			"notes": "Bonuses help only when hearing is the only sense that can be used to detect you.",
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "6e4cb440-84a4-481a-ae1a-467743192710",
			"name": "Single-Minded",
			"mental": true,
			"base_points": 5,
			"reference": "B85",
			"calc": {
				"points": 5
			},
			"features": [
				{
					"type": "conditional_modifier",
					"amount": 3,
					"situation": "to rolls for any lengthy mental task you concentrate on to the exclusion of other activities, if the GM feels such focus would be beneficial"
				},
				{
					"type": "conditional_modifier",
					"amount": -5,
					"situation": "to all rolls to notice interruptions while obsessed with a task"
				}
			],
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "0e4d6789-73ea-4084-9b99-e813844ab8c8",
			"name": "Skinny",
			"physical": true,
			"base_points": -5,
			"reference": "B18",
			"calc": {
				"points": -5
			},
			"prereqs": {
				"type": "prereq_list",
				"all": true,
				"prereqs": [
					{
						"type": "attribute_prereq",
						"has": true,
						"which": "ht",
						"qualifier": {
							"compare": "at_most",
							"qualifier": 14
						}
					}
				]
			},
			"features": [
				{
					"type": "skill_bonus",
					"amount": -2,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "disguise"
					}
				},
				{
					"type": "skill_bonus",
					"amount": -2,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "shadowing"
					}
				},
				{
					"type": "conditional_modifier",
					"amount": -2,
					"situation": "to ST vs. knockback"
				}
			],
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "8133a37e-4997-4724-a7df-aba3c92b06c4",
			"name": "Slave Mentality",
			"physical": true,
			"base_points": -40,
			"reference": "B154",
			"calc": {
				"points": -40
			},
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "dbe3133b-c2d8-4293-a5ed-5cfaebeb8d6c",
			"name": "Sleepwalker",
			"mental": true,
			"base_points": -5,
			"cr": 12,
			"reference": "B154",
			"calc": {
				"points": -5
			},
			"notes": "If sleepwalking would matter during an adventure, the GM will make a self-control roll for you whenever you go to sleep. If you fail, you sleepwalk sometime during the night. You wake up after walking for 1d minutes, or if someone awakens you.",
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "a2eecc1b-7d8f-4aa8-bbd2-801750fbb021",
			"name": "Sleepy",
			"physical": true,
			"exotic": true,
			"modifiers": [
				{
					"type": "modifier",
					"id": "2fa70365-917b-4f62-9ce4-eadc0e682e9e",
					"disabled": true,
					"name": "1/2 time",
					"reference": "B154",
					"cost_type": "points",
					"cost": -8,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "5e4d53cd-724d-4655-9ed5-4a60de8f569b",
					"disabled": true,
					"name": "2/3 time",
					"reference": "B154",
					"cost_type": "points",
					"cost": -16,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "9c1e019f-ce74-4ddd-94ed-6e46025cd115",
					"disabled": true,
					"name": "3/4 time",
					"reference": "B154",
					"cost_type": "points",
					"cost": -20,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "e34f26b4-a63f-4ce6-886b-f2f323a7a23c",
					"disabled": true,
					"name": "7/8 time",
					"reference": "B154",
					"cost_type": "points",
					"cost": -26,
					"affects": "total"
				}
			],
			"reference": "B154",
			"calc": {
				"points": 0
			},
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "7b23ffd8-a873-40ae-a031-e80a4dc7ac28",
			"name": "Slippery",
			"physical": true,
			"exotic": true,
			"levels": "1",
			"points_per_level": 2,
			"modifiers": [
				{
					"type": "modifier",
					"id": "15deca80-e8c8-44d2-a939-c0ad73a6e500",
					"disabled": true,
					"name": "Affects Others Only",
					"reference": "MATG29",
					"cost_type": "percentage",
					"cost": 100,
					"affects": "total"
				}
			],
			"reference": "B85",
			"calc": {
				"points": 2
			},
			"features": [
				{
					"type": "skill_bonus",
					"amount": 1,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "escape"
					}
				}
			],
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "1ffa6e02-b871-47f5-a410-39fe07e457e7",
			"name": "Slow Eater",
			"physical": true,
			"exotic": true,
			"base_points": -10,
			"reference": "B155",
			"calc": {
				"points": -10
			},
			"notes": "Each meal takes about two hours, as opposed to about ½ hour for most humans. This reduces the time available for study, long tasks, and travel on foot by 4½ hours per day.",
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "31855f76-6545-405d-9b02-de3770a5489b",
			"name": "Slow Healing",
			"physical": true,
			"levels": "1",
			"points_per_level": -5,
			"reference": "B155",
			"calc": {
				"points": -5
			},
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "fd464306-73b6-4f20-9033-77b6d739cb8c",
			"name": "Slow Riser",
			"physical": true,
			"base_points": -5,
			"reference": "B155",
			"calc": {
				"points": -5
			},
			"features": [
				{
					"type": "conditional_modifier",
					"amount": -2,
					"situation": "on all self-control rolls one hour after you awaken from any sleep longer than a one-hour nap"
				},
				{
					"type": "conditional_modifier",
					"amount": -1,
					"situation": "to IQ and IQ-based skills one hour after you awaken from any sleep longer than a one-hour nap"
				},
				{
					"type": "conditional_modifier",
					"amount": -1,
					"situation": "additional penalty whenever the GM assesses attribute penalties for missed sleep"
				}
			],
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "6e546cc9-a792-4440-9c87-fbf58bc43aca",
			"name": "Snatcher",
			"mental": true,
			"supernatural": true,
			"base_points": 80,
			"modifiers": [
				{
					"type": "modifier",
					"id": "fdfb0982-371a-48d4-b74e-1cecd03b120f",
					"disabled": true,
					"name": "Permanent",
					"reference": "B86",
					"cost_type": "percentage",
					"cost": 300,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "373e0a81-7cfa-47fb-aff8-c7fbf68f2355",
					"disabled": true,
					"name": "Less Weight",
					"reference": "B86",
					"cost_type": "percentage",
					"cost": -5,
					"affects": "total",
					"notes": "3 lbs"
				},
				{
					"type": "modifier",
					"id": "888a06c0-2d1a-4def-b46c-2c9cb66e3ba8",
					"disabled": true,
					"name": "Less Weight",
					"reference": "B86",
					"cost_type": "percentage",
					"cost": -10,
					"affects": "total",
					"notes": "2 lbs"
				},
				{
					"type": "modifier",
					"id": "3c8a39b7-eee0-4a53-ab2c-322ad8fc10d8",
					"disabled": true,
					"name": "Less Weight",
					"reference": "B86",
					"cost_type": "percentage",
					"cost": -15,
					"affects": "total",
					"notes": "1 lb"
				},
				{
					"type": "modifier",
					"id": "4513ab20-6f95-4f35-8c27-15beccfd5c83",
					"disabled": true,
					"name": "Less Weight",
					"reference": "B86",
					"cost_type": "percentage",
					"cost": -25,
					"affects": "total",
					"notes": "4 oz"
				},
				{
					"type": "modifier",
					"id": "01bd5010-ce06-49d6-8463-2221332f6c0b",
					"disabled": true,
					"name": "Less Weight",
					"reference": "B86",
					"cost_type": "percentage",
					"cost": -30,
					"affects": "total",
					"notes": "1 oz"
				},
				{
					"type": "modifier",
					"id": "6e20ebc1-a4b0-4227-a688-afdd4bb647f1",
					"disabled": true,
					"name": "Specialized",
					"reference": "B86",
					"cost_type": "percentage",
					"cost": -5,
					"affects": "total",
					"notes": "Only metal"
				},
				{
					"type": "modifier",
					"id": "aaf8b044-802f-4efd-8a6e-5e9ff2615f71",
					"disabled": true,
					"name": "Specialized",
					"reference": "B86",
					"cost_type": "percentage",
					"cost": -10,
					"affects": "total",
					"notes": "Only money"
				},
				{
					"type": "modifier",
					"id": "fdcbe24d-9fd5-4871-b558-70a7d66fbde9",
					"disabled": true,
					"name": "Specialized",
					"reference": "B86",
					"cost_type": "percentage",
					"cost": -10,
					"affects": "total",
					"notes": "Only weapons"
				},
				{
					"type": "modifier",
					"id": "a8b14bd6-7c32-455a-9334-64d05e1fe654",
					"disabled": true,
					"name": "Specialized",
					"reference": "B86",
					"cost_type": "percentage",
					"cost": -20,
					"affects": "total",
					"notes": "Only information"
				},
				{
					"type": "modifier",
					"id": "9d6bef72-0126-4b22-9622-8edee6c6fbf8",
					"disabled": true,
					"name": "Specialized",
					"reference": "B86",
					"cost_type": "percentage",
					"cost": -20,
					"affects": "total",
					"notes": "No metal"
				},
				{
					"type": "modifier",
					"id": "57e88062-0a2f-4bd4-b861-035691558bbc",
					"disabled": true,
					"name": "Specialized",
					"reference": "B86",
					"cost_type": "percentage",
					"cost": -25,
					"affects": "total",
					"notes": "Only @Color@ things"
				},
				{
					"type": "modifier",
					"id": "5efa086a-5114-43a1-a49b-8b152aadd434",
					"disabled": true,
					"name": "Stunning",
					"reference": "B86",
					"cost_type": "percentage",
					"cost": -10,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "c59bf3b9-91ac-4bc4-88f3-9cde19949989",
					"disabled": true,
					"name": "Unpredictable",
					"reference": "B86",
					"cost_type": "percentage",
					"cost": -25,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "71669d27-1fde-4ba3-acae-341ba4de5f07",
					"disabled": true,
					"name": "Creation",
					"reference": "P76",
					"cost_type": "percentage",
					"cost": 100,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "7201456e-e66f-4748-a890-7d0172d7f944",
					"disabled": true,
					"name": "Large Items",
					"reference": "P76",
					"cost_type": "percentage",
					"cost": 50,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "00ad6df9-f6dc-4627-b393-d748d69d3b22",
					"disabled": true,
					"name": "More Weight",
					"reference": "P77",
					"cost_type": "percentage",
					"cost": 5,
					"affects": "total",
					"levels": 1
				},
				{
					"type": "modifier",
					"id": "089ce4cc-b3a6-443d-b99f-22b53b2628db",
					"disabled": true,
					"name": "Recall",
					"reference": "P77",
					"cost_type": "percentage",
					"cost": -25,
					"affects": "total"
				}
			],
			"reference": "B86,P76",
			"calc": {
				"points": 80
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "c8cfa243-4cf0-4dab-b7ae-a6230ca0a481",
			"name": "Social Chameleon",
			"mental": true,
			"base_points": 5,
			"reference": "B86",
			"calc": {
				"points": 5
			},
			"features": [
				{
					"type": "reaction_bonus",
					"amount": 1,
					"situation": "from those who demand respect in situations where there would be no penalties due to differences in Rank or Status"
				}
			],
			"notes": "Exempt from reaction penalties due to differences in Rank or Status",
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "ff642b96-33bc-4ab0-9c5d-83dbe2a98e5e",
			"name": "Social Disease",
			"physical": true,
			"base_points": -5,
			"reference": "B155",
			"calc": {
				"points": -5
			},
			"features": [
				{
					"type": "reaction_bonus",
					"amount": -1,
					"situation": "from those who know about your Social Disease"
				}
			],
			"notes": "Those who know about it automatically resist your seduction attempts",
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "2afecd97-5753-48dd-b4b2-b27cbd61007f",
			"name": "Social Regard",
			"social": true,
			"levels": "1",
			"points_per_level": 5,
			"reference": "B87",
			"calc": {
				"points": 5
			},
			"features": [
				{
					"type": "reaction_bonus",
					"amount": 1,
					"per_level": true,
					"situation": "from those who hold you in high regard for being a @Reason@, in a @Type: Feared, Respected or Venerated@ way."
				}
			],
			"notes": "@Type: Feared, Respected or Venerated@: @Reason@",
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "f1896377-28f3-4629-9bd8-fe4d5b9331ea",
			"name": "Social Stigma (Criminal Record)",
			"social": true,
			"base_points": -5,
			"reference": "B155",
			"calc": {
				"points": -5
			},
			"features": [
				{
					"type": "reaction_bonus",
					"amount": -1,
					"situation": "from non-criminals who learn of your Criminal Record. Police, judges, vigilantes, and other law-and-order types react at -2"
				}
			],
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "aa9fa559-3d34-486f-b1ed-7cdca3c7835b",
			"name": "Social Stigma (Disowned, Non-heir)",
			"social": true,
			"base_points": -5,
			"reference": "B155",
			"calc": {
				"points": -5
			},
			"features": [
				{
					"type": "reaction_bonus",
					"amount": -1,
					"situation": "from others"
				}
			],
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "e581e220-11ad-4b13-a923-5a5eee933c76",
			"name": "Social Stigma (Disowned, Outcast)",
			"social": true,
			"base_points": -10,
			"reference": "B155",
			"calc": {
				"points": -10
			},
			"features": [
				{
					"type": "reaction_bonus",
					"amount": -2,
					"situation": "from others"
				}
			],
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "4b772dbc-f45c-4a12-b716-5436feec1f37",
			"name": "Social Stigma (Excommunicated)",
			"social": true,
			"base_points": -5,
			"reference": "B155",
			"calc": {
				"points": -5
			},
			"features": [
				{
					"type": "reaction_bonus",
					"amount": -3,
					"situation": "from others"
				}
			],
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "2fbaeba3-a427-40de-9eca-3523a6dae1dd",
			"name": "Social Stigma (Excommunicated)",
			"social": true,
			"base_points": -10,
			"reference": "B155",
			"calc": {
				"points": -10
			},
			"features": [
				{
					"type": "reaction_bonus",
					"amount": -3,
					"situation": "from others"
				}
			],
			"notes": "Bad aura",
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "356e0b8c-fb82-45cd-b544-a094354d3327",
			"name": "Social Stigma (Ignorant; @Skill@)",
			"social": true,
			"base_points": -5,
			"reference": "B155",
			"calc": {
				"points": -5
			},
			"features": [
				{
					"type": "skill_bonus",
					"amount": -1,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "@Skill@"
					}
				},
				{
					"type": "reaction_bonus",
					"amount": -1,
					"situation": "from others"
				}
			],
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "64c6bcb3-4ab1-457d-8848-51efa5944498",
			"name": "Social Stigma (Minor)",
			"social": true,
			"base_points": -5,
			"reference": "B155",
			"calc": {
				"points": -5
			},
			"features": [
				{
					"type": "reaction_bonus",
					"amount": -2,
					"situation": "from others whenever you try to deal with them as an adult; they might like you, but they do not fully respect you"
				}
			],
			"notes": "You are underage by your culture’s standards. You must buy off this trait when you reach “legal age” (usually 18) for your time and place.",
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "1bf8c968-8f91-401a-8990-0eb6938acc38",
			"name": "Social Stigma (Minority Group)",
			"social": true,
			"base_points": -10,
			"reference": "B155",
			"calc": {
				"points": -10
			},
			"features": [
				{
					"type": "reaction_bonus",
					"amount": -2,
					"situation": "from others except your own kind"
				},
				{
					"type": "reaction_bonus",
					"amount": 2,
					"situation": "from others of your own kind in an area, profession, or situation where your minority is especially rare"
				}
			],
			"notes": "You are a member of a minority that the dominant culture around you regards as “barbarians” or “inferior.”",
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "0918e383-4d09-42af-9b2e-2525642b7227",
			"name": "Social Stigma (Monster)",
			"social": true,
			"base_points": -15,
			"reference": "B155",
			"calc": {
				"points": -15
			},
			"features": [
				{
					"type": "skill_bonus",
					"amount": 1,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "intimidation"
					}
				},
				{
					"type": "reaction_bonus",
					"amount": -3,
					"situation": "from others"
				}
			],
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "b19efc32-c2b4-45e0-9a82-e281145ccb60",
			"name": "Social Stigma (Second-Class Citizen)",
			"social": true,
			"base_points": -5,
			"reference": "B155",
			"calc": {
				"points": -5
			},
			"features": [
				{
					"type": "reaction_bonus",
					"amount": -1,
					"situation": "from others except those of your own kind"
				}
			],
			"notes": "You belong to a group that receives fewer rights and privileges than “full citizens.”",
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "e85306ae-149b-4d2c-a9b2-c5c3cbce6ba6",
			"name": "Social Stigma (Subjugated)",
			"social": true,
			"base_points": -20,
			"reference": "B155",
			"calc": {
				"points": -20
			},
			"features": [
				{
					"type": "reaction_bonus",
					"amount": -1,
					"situation": "from others"
				}
			],
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "618badd4-f8dd-454b-86f9-3ed12af9cbe7",
			"name": "Social Stigma (Uneducated)",
			"social": true,
			"base_points": -5,
			"reference": "B156",
			"calc": {
				"points": -5
			},
			"features": [
				{
					"type": "reaction_bonus",
					"amount": -1,
					"situation": "from others"
				}
			],
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "30f0c502-8849-4920-9053-19d4ccdb32ec",
			"name": "Social Stigma (Valuable Property)",
			"social": true,
			"base_points": -10,
			"reference": "B156",
			"calc": {
				"points": -10
			},
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "1e76f7ee-56f3-4011-b895-a3006512c97c",
			"name": "Space Sickness",
			"physical": true,
			"base_points": -10,
			"reference": "B156",
			"calc": {
				"points": -10
			},
			"prereqs": {
				"type": "prereq_list",
				"all": true,
				"prereqs": [
					{
						"type": "skill_prereq",
						"has": false,
						"name": {
							"compare": "is",
							"qualifier": "free fall"
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
			"id": "7809f9af-d914-4415-837e-5cddd8cfa826",
			"name": "Speak Underwater",
			"physical": true,
			"exotic": true,
			"base_points": 5,
			"modifiers": [
				{
					"type": "modifier",
					"id": "bcf083e0-e89c-4272-9e6d-9eff408c4d40",
					"disabled": true,
					"name": "Interface Crossing",
					"reference": "B87",
					"cost_type": "percentage",
					"cost": 50,
					"affects": "total"
				}
			],
			"reference": "B87,P78",
			"calc": {
				"points": 5
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "5e65e898-aa9a-4311-a3ad-9ef9c6a06bbe",
			"name": "Speak With Animals",
			"mental": true,
			"exotic": true,
			"base_points": 25,
			"modifiers": [
				{
					"type": "modifier",
					"id": "e9737ceb-63df-4e90-8f46-8a2e2461e45a",
					"disabled": true,
					"name": "Specialized",
					"reference": "B87",
					"cost_type": "percentage",
					"cost": -40,
					"affects": "total",
					"notes": "All aquatic animals"
				},
				{
					"type": "modifier",
					"id": "8bf5cc09-38bb-4683-9c19-9ec5f4e0560c",
					"disabled": true,
					"name": "Specialized",
					"reference": "B87",
					"cost_type": "percentage",
					"cost": -40,
					"affects": "total",
					"notes": "All land animals"
				},
				{
					"type": "modifier",
					"id": "ba3a8f45-ae28-4eeb-80fa-7350a2866078",
					"disabled": true,
					"name": "Specialized",
					"reference": "B87",
					"cost_type": "percentage",
					"cost": -50,
					"affects": "total",
					"notes": "@One class: Mammals, Birds, etc.@"
				},
				{
					"type": "modifier",
					"id": "41a5adf0-9be0-407f-b343-ef5827900337",
					"disabled": true,
					"name": "Specialized",
					"reference": "B87",
					"cost_type": "percentage",
					"cost": -60,
					"affects": "total",
					"notes": "@One family: Felines, Parrots, etc.@"
				},
				{
					"type": "modifier",
					"id": "021acdb3-1308-4a3b-b585-c5128d72650c",
					"disabled": true,
					"name": "Specialized",
					"reference": "B87",
					"cost_type": "percentage",
					"cost": -80,
					"affects": "total",
					"notes": "@One species: House Cats, Macaws, etc.@"
				},
				{
					"type": "modifier",
					"id": "95f53d3a-7363-4ee7-bb49-2a98cdbec3b3",
					"disabled": true,
					"name": "Sapience",
					"reference": "P77",
					"cost_type": "percentage",
					"cost": 40,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "3c027d72-8415-47d2-bfbc-f5237b9d096c",
					"disabled": true,
					"name": "Universal",
					"reference": "P77",
					"cost_type": "percentage",
					"cost": 20,
					"affects": "total"
				}
			],
			"reference": "B87,P77",
			"calc": {
				"points": 25
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "1575bc92-513b-4b86-ade9-e08eb50e5241",
			"name": "Speak With Plants",
			"mental": true,
			"exotic": true,
			"base_points": 15,
			"modifiers": [
				{
					"type": "modifier",
					"id": "bdb8d929-9f53-4f63-947e-d84b6a7d4b61",
					"disabled": true,
					"name": "Specialized",
					"reference": "P77",
					"cost_type": "percentage",
					"cost": -40,
					"affects": "total",
					"notes": "All terrestrial plants"
				},
				{
					"type": "modifier",
					"id": "9c5e75a8-3bac-454e-b4a4-194202b444ae",
					"disabled": true,
					"name": "Specialized",
					"reference": "P77",
					"cost_type": "percentage",
					"cost": -40,
					"affects": "total",
					"notes": "All aquatic plants"
				},
				{
					"type": "modifier",
					"id": "8dc28b59-556c-41f3-9835-828e5e57f275",
					"disabled": true,
					"name": "Specialized",
					"reference": "P77",
					"cost_type": "percentage",
					"cost": -50,
					"affects": "total",
					"notes": "@Large Subset: Herbs, Trees@"
				},
				{
					"type": "modifier",
					"id": "b76b0e1c-feed-4012-ace8-6c5ed905dcee",
					"disabled": true,
					"name": "Specialized",
					"reference": "P77",
					"cost_type": "percentage",
					"cost": -60,
					"affects": "total",
					"notes": "@Small Subset: Evergreens, Medicinals@"
				},
				{
					"type": "modifier",
					"id": "f0faa9bf-7a6f-42fe-a7d0-90ff596d88ae",
					"disabled": true,
					"name": "Sapience",
					"reference": "P77",
					"cost_type": "percentage",
					"cost": 40,
					"affects": "total"
				}
			],
			"reference": "B87,P77",
			"calc": {
				"points": 15
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "191ed358-c327-4215-b73b-9cd385016522",
			"name": "Special Rapport (@Person@)",
			"mental": true,
			"supernatural": true,
			"base_points": 5,
			"modifiers": [
				{
					"type": "modifier",
					"id": "939e21a9-ef55-4c86-b8ba-0a3ae93a8a3f",
					"disabled": true,
					"name": "One Way",
					"reference": "P77",
					"cost_type": "percentage",
					"cost": 20,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "c6e6ee61-2734-4c2f-9fa1-28126e75b5db",
					"disabled": true,
					"name": "Transferable",
					"reference": "P78",
					"cost_type": "percentage",
					"cost": 100,
					"affects": "total",
					"notes": "Own Race"
				},
				{
					"type": "modifier",
					"id": "2eb10fcc-9a70-45df-a824-059dd09da2b6",
					"disabled": true,
					"name": "Transferable",
					"reference": "P78",
					"cost_type": "percentage",
					"cost": 150,
					"affects": "total",
					"notes": "Living Being"
				},
				{
					"type": "modifier",
					"id": "f4d867ea-d8f6-4b79-afc6-a6d4d2911795",
					"disabled": true,
					"name": "Transferable",
					"reference": "P78",
					"cost_type": "percentage",
					"cost": 150,
					"affects": "total",
					"notes": "Digital Minds"
				},
				{
					"type": "modifier",
					"id": "cccd9ecc-6dc6-4334-adc0-6bc1a735fd78",
					"disabled": true,
					"name": "Transferable",
					"reference": "P78",
					"cost_type": "percentage",
					"cost": 250,
					"affects": "total",
					"notes": "Any Sapient mind"
				},
				{
					"type": "modifier",
					"id": "c62d8e59-d81c-46c2-9520-a52f2fdbd6a5",
					"disabled": true,
					"name": "Must be Willing or Helpless",
					"reference": "P78",
					"cost_type": "percentage",
					"cost": -50,
					"affects": "total"
				}
			],
			"reference": "B88,P77",
			"calc": {
				"points": 5
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "a3140b0c-11c4-4b7b-9298-4850a36a25fd",
			"name": "Spirit Empathy",
			"mental": true,
			"supernatural": true,
			"base_points": 10,
			"modifiers": [
				{
					"type": "modifier",
					"id": "110046ca-f474-4b43-877e-bd18510acdab",
					"disabled": true,
					"name": "Specialized",
					"reference": "B87",
					"cost_type": "percentage",
					"cost": -50,
					"affects": "total",
					"notes": "@Type: Angels, Demons, Elementals, Faerie, Ghosts, etc.@"
				},
				{
					"type": "modifier",
					"id": "05a618e6-ef79-49a6-9009-b2d3e13a12bb",
					"disabled": true,
					"name": "Remote",
					"reference": "P48",
					"cost_type": "percentage",
					"cost": 50,
					"affects": "total"
				}
			],
			"reference": "B88,P48",
			"calc": {
				"points": 10
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "dde7e7dd-1d54-4287-b53e-6e5d6b6514ce",
			"name": "Split Personality",
			"mental": true,
			"base_points": -15,
			"cr": 12,
			"reference": "B156",
			"calc": {
				"points": -15
			},
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "b0d9e890-89f9-4b2e-b6a8-9ae7674bb764",
			"name": "Squeamish",
			"physical": true,
			"base_points": -10,
			"cr": 12,
			"reference": "B156",
			"calc": {
				"points": -10
			},
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "42078efc-c236-4342-9915-0035ad820445",
			"name": "Staid",
			"mental": true,
			"base_points": -1,
			"reference": "B164",
			"calc": {
				"points": -1
			},
			"categories": [
				"Quirk"
			]
		},
		{
			"type": "advantage",
			"id": "8cd14308-70e6-47e4-a78e-8456144d1127",
			"name": "Static (Psi)",
			"mental": true,
			"supernatural": true,
			"base_points": 30,
			"modifiers": [
				{
					"type": "modifier",
					"id": "b379c313-ea26-4a29-9f15-ebe7a238b1f5",
					"disabled": true,
					"name": "Area Effect",
					"reference": "B78",
					"cost_type": "percentage",
					"cost": 50,
					"affects": "total",
					"levels": 1
				},
				{
					"type": "modifier",
					"id": "85ba3cfa-aeb4-4fc3-bd24-6e58999d7858",
					"disabled": true,
					"name": "Switchable",
					"reference": "B78",
					"cost_type": "percentage",
					"cost": 100,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "d31efa11-84ad-47e3-883c-15476886e29d",
					"disabled": true,
					"name": "Resistible",
					"reference": "B78",
					"cost_type": "percentage",
					"cost": -50,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "81557fda-960c-4567-8b62-92c171f7b45f",
					"disabled": true,
					"name": "Discriminatory",
					"reference": "P98",
					"cost_type": "percentage",
					"cost": 150,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "20149ce7-11c0-409d-821f-1b3f8459ce9c",
					"disabled": true,
					"name": "Tiring",
					"reference": "PSI17",
					"cost_type": "percentage",
					"cost": 50,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "e0f69c1b-bf56-4294-b9ef-9103e7117645",
					"disabled": true,
					"name": "One Power",
					"reference": "PSI17",
					"cost_type": "percentage",
					"cost": -50,
					"affects": "total"
				}
			],
			"reference": "B78",
			"calc": {
				"points": 30
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "528254ea-5457-4090-979b-b06583bb2f76",
			"name": "Status",
			"social": true,
			"levels": "1",
			"points_per_level": 5,
			"reference": "B28",
			"calc": {
				"points": 5
			},
			"notes": "@Description@",
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "9bbb06dc-5928-4edf-b987-4ec0f7c2f500",
			"name": "Status (@Description@)",
			"social": true,
			"levels": "1",
			"points_per_level": -5,
			"reference": "B28",
			"calc": {
				"points": -5
			},
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "7cc28a08-7a6f-46a1-beb1-cd964038cde1",
			"name": "Stress Atavism",
			"mental": true,
			"exotic": true,
			"cr": 12,
			"modifiers": [
				{
					"type": "modifier",
					"id": "e362d0ce-f960-4eab-afc0-fc3588b08af7",
					"disabled": true,
					"name": "Mild",
					"reference": "B156",
					"cost_type": "points",
					"cost": -10,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "5eae0794-f504-41c2-96f1-7242bc3a9365",
					"disabled": true,
					"name": "Moderate",
					"reference": "B156",
					"cost_type": "points",
					"cost": -15,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "a88b2d9d-6064-49f0-8bd9-618de8de899f",
					"disabled": true,
					"name": "Severe",
					"reference": "B156",
					"cost_type": "points",
					"cost": -20,
					"affects": "total"
				}
			],
			"reference": "B156",
			"calc": {
				"points": 0
			},
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "a8795ad1-14bd-4610-afe0-2f62d68fd1e1",
			"name": "Stretching",
			"physical": true,
			"exotic": true,
			"levels": "1",
			"points_per_level": 6,
			"modifiers": [
				{
					"type": "modifier",
					"id": "1a06c2d5-8b1d-4815-b713-51d1d55e0414",
					"disabled": true,
					"name": "Force Extension",
					"reference": "P78",
					"cost_type": "percentage",
					"cost": 50,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "6bc7a4f9-033d-414e-83ab-6513da3fc645",
					"disabled": true,
					"name": "Limited",
					"reference": "P78",
					"cost_type": "percentage",
					"cost": -20,
					"affects": "total",
					"notes": "Arms Only"
				},
				{
					"type": "modifier",
					"id": "986342a8-f631-4ca8-af0a-b671fd5c9777",
					"disabled": true,
					"name": "Limited",
					"reference": "P78",
					"cost_type": "percentage",
					"cost": -20,
					"affects": "total",
					"notes": "Legs Only"
				},
				{
					"type": "modifier",
					"id": "8ee7ebf3-d0bd-4022-9d59-c3faf7be4fe2",
					"disabled": true,
					"name": "Limited",
					"reference": "P78",
					"cost_type": "percentage",
					"cost": -40,
					"affects": "total",
					"notes": "@Single Limb@"
				},
				{
					"type": "modifier",
					"id": "94190876-a895-47db-93f5-bd6276cbb127",
					"disabled": true,
					"name": "Limited",
					"reference": "P78",
					"cost_type": "percentage",
					"cost": -50,
					"affects": "total",
					"notes": "Neck Only"
				}
			],
			"reference": "B88,P78",
			"calc": {
				"points": 6
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "a96c1700-5295-407d-9b67-2410f9143bcc",
			"name": "Striking ST",
			"physical": true,
			"exotic": true,
			"levels": "1",
			"points_per_level": 5,
			"modifiers": [
				{
					"type": "modifier",
					"id": "9b8e80e8-e2b2-459f-ab27-d96a9aa1e1ca",
					"disabled": true,
					"name": "No Fine Manipulators",
					"cost_type": "percentage",
					"cost": -40,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "32892d90-82df-401d-bddc-d39a12d0f8b7",
					"disabled": true,
					"name": "Size",
					"cost_type": "percentage",
					"cost": -10,
					"affects": "total",
					"levels": 1
				},
				{
					"type": "modifier",
					"id": "eaabe509-f453-401a-89c1-4830111d0544",
					"disabled": true,
					"name": "Super Effort",
					"reference": "SU24",
					"cost_type": "percentage",
					"cost": 400,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "f35b516b-28d2-4935-8caa-e9f85f5310e0",
					"disabled": true,
					"name": "One Attack Only",
					"reference": "P79",
					"cost_type": "percentage",
					"cost": -60,
					"affects": "total",
					"notes": "@Attack@"
				},
				{
					"type": "modifier",
					"id": "4c469f7d-a2fc-45fa-9b19-a51985d575cd",
					"disabled": true,
					"name": "Know Your Own Strength Pricing Variant",
					"reference": "PY83:18",
					"cost_type": "points",
					"cost": -4,
					"affects": "levels_only"
				}
			],
			"reference": "B88,P78",
			"calc": {
				"points": 5
			},
			"features": [
				{
					"type": "attribute_bonus",
					"amount": 1,
					"per_level": true,
					"attribute": "st",
					"limitation": "striking_only"
				}
			],
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "6b0e1aa1-6b78-420f-91b2-e9dd09838c69",
			"name": "Struggling",
			"social": true,
			"base_points": -10,
			"reference": "B25",
			"calc": {
				"points": -10
			},
			"notes": "Starting wealth is ½ normal",
			"categories": [
				"Disadvantage",
				"Wealth"
			]
		},
		{
			"type": "advantage",
			"id": "5452dcb5-90b1-424d-bab5-51ca5830fede",
			"name": "Stubbornness",
			"mental": true,
			"base_points": -5,
			"reference": "B157",
			"calc": {
				"points": -5
			},
			"features": [
				{
					"type": "reaction_bonus",
					"amount": -1,
					"situation": "from others"
				}
			],
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "8d41e51d-dd22-4d5c-ae37-56e3cd7d46ce",
			"name": "Stuttering",
			"physical": true,
			"base_points": -10,
			"reference": "B157",
			"calc": {
				"points": -10
			},
			"features": [
				{
					"type": "skill_bonus",
					"amount": -2,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "diplomacy"
					}
				},
				{
					"type": "skill_bonus",
					"amount": -2,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "fast-talk"
					}
				},
				{
					"type": "skill_bonus",
					"amount": -2,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "performance"
					}
				},
				{
					"type": "skill_bonus",
					"amount": -2,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "public speaking"
					}
				},
				{
					"type": "skill_bonus",
					"amount": -2,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "sex appeal"
					}
				},
				{
					"type": "skill_bonus",
					"amount": -2,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "singing"
					}
				},
				{
					"type": "reaction_bonus",
					"amount": -2,
					"situation": "from others where conversation is required"
				}
			],
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "56ffc361-b1c5-4442-b17f-b2b5dd7e239d",
			"name": "Subsonic Hearing",
			"physical": true,
			"exotic": true,
			"base_points": 5,
			"modifiers": [
				{
					"type": "modifier",
					"id": "825589c6-d714-451d-8082-f22457cd3293",
					"disabled": true,
					"name": "No normal hearing",
					"reference": "B89",
					"cost_type": "points",
					"cost": -5,
					"affects": "total"
				}
			],
			"reference": "B89,P51",
			"calc": {
				"points": 5
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "682f88e7-c192-439b-9bc7-abff6a05cf96",
			"name": "Subsonic Speech",
			"physical": true,
			"exotic": true,
			"base_points": 10,
			"modifiers": [
				{
					"type": "modifier",
					"id": "e88a4e16-0be6-4fa1-b6e4-0a8b6ca96a76",
					"disabled": true,
					"name": "No normal speech",
					"reference": "B89",
					"cost_type": "points",
					"cost": -10,
					"affects": "total"
				}
			],
			"reference": "B89,P78",
			"calc": {
				"points": 10
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "4ced01f9-3bcc-4c2c-a00f-990b139e3ff6",
			"name": "Super Climbing",
			"physical": true,
			"exotic": true,
			"levels": "1",
			"points_per_level": 3,
			"modifiers": [
				{
					"type": "modifier",
					"id": "7e0fd7ce-7c34-408e-90e7-a3632553461e",
					"disabled": true,
					"name": "Specific",
					"reference": "P79",
					"cost_type": "percentage",
					"cost": -40,
					"affects": "total",
					"notes": "@Common Surface@"
				},
				{
					"type": "modifier",
					"id": "d88d193f-94b8-4c69-88d6-19af00fe2f82",
					"disabled": true,
					"name": "Specific",
					"reference": "P79",
					"cost_type": "percentage",
					"cost": -50,
					"affects": "total",
					"notes": "Ferrous Metals"
				},
				{
					"type": "modifier",
					"id": "984da8f9-abdd-4768-95b0-68312533952c",
					"disabled": true,
					"name": "Specific",
					"reference": "P79",
					"cost_type": "percentage",
					"cost": -60,
					"affects": "total",
					"notes": "@Uncommon Surface@"
				},
				{
					"type": "modifier",
					"id": "d213be08-9dc4-4a06-ab78-6875c8d8e8ff",
					"disabled": true,
					"name": "Requires Low Gravity",
					"reference": "P79",
					"cost_type": "percentage",
					"cost": 0,
					"affects": "total",
					"notes": "@Threshold@"
				}
			],
			"reference": "B89,P79",
			"calc": {
				"points": 3
			},
			"notes": "Climbing Move: @New Climbing Move@",
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "36751b7a-4fb8-4678-857c-eaa420c4e627",
			"name": "Super Jump",
			"physical": true,
			"exotic": true,
			"levels": "1",
			"points_per_level": 10,
			"modifiers": [
				{
					"type": "modifier",
					"id": "ead7e9ec-99a6-4bcb-b7c6-504d401821a6",
					"disabled": true,
					"name": "Bouncing",
					"reference": "P80",
					"cost_type": "percentage",
					"cost": 50,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "97e171bf-2a5e-4c48-9cbf-7a1edd8b124a",
					"disabled": true,
					"name": "Maneuverable",
					"reference": "P80",
					"cost_type": "percentage",
					"cost": 50,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "726f1e2d-e9b4-42a8-b605-5acf7fd6da67",
					"disabled": true,
					"name": "Full Power Only",
					"reference": "P80",
					"cost_type": "percentage",
					"cost": -10,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "7b091e20-99db-4bdf-93bc-4c14408ce5fe",
					"disabled": true,
					"name": "Horizontal Only",
					"reference": "P80",
					"cost_type": "percentage",
					"cost": -25,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "43e11c5f-c581-4792-be2b-704d38fe1d55",
					"disabled": true,
					"name": "Lighter Than Air",
					"reference": "P80",
					"cost_type": "percentage",
					"cost": -10,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "893c6a82-132d-42cf-8de6-f6c0f2a54857",
					"disabled": true,
					"name": "Planetary",
					"reference": "P80",
					"cost_type": "percentage",
					"cost": -5,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "0d253161-4efe-45f0-8a97-2e6c49a5be70",
					"disabled": true,
					"name": "Projectile",
					"reference": "P80",
					"cost_type": "percentage",
					"cost": -20,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "bdc30b4f-cace-4319-952a-797ca970cf1e",
					"disabled": true,
					"name": "Vertical Only",
					"reference": "P80",
					"cost_type": "percentage",
					"cost": -25,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "b83d1b61-aebf-4572-a945-1a7a37b33b35",
					"disabled": true,
					"name": "Bouncing Only",
					"reference": "SU28",
					"cost_type": "percentage",
					"cost": -50,
					"affects": "total"
				}
			],
			"reference": "B89,P79",
			"calc": {
				"points": 10
			},
			"notes": "@New Move and Jump Stats@",
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "5201cb24-ea82-4d64-9526-b948b8bc997f",
			"name": "Super Luck",
			"mental": true,
			"supernatural": true,
			"base_points": 100,
			"modifiers": [
				{
					"type": "modifier",
					"id": "cd82200f-d338-467f-ac24-9c5c55e60ab3",
					"disabled": true,
					"name": "Aspected",
					"reference": "B66",
					"cost_type": "percentage",
					"cost": -20,
					"affects": "total",
					"notes": "@Aspect@"
				},
				{
					"type": "modifier",
					"id": "1ad3a5f1-de4a-4ead-959a-67e43fb3ad8c",
					"disabled": true,
					"name": "Defensive",
					"reference": "B66",
					"cost_type": "percentage",
					"cost": -20,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "0232b3ec-5c92-4310-a7c5-b98e771d8f7a",
					"disabled": true,
					"name": "Wishing",
					"reference": "P80",
					"cost_type": "percentage",
					"cost": 100,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "7cbdd67d-57df-4bd0-a99d-5b5d4cd86ba8",
					"disabled": true,
					"name": "Alter Reality",
					"reference": "P80",
					"cost_type": "percentage",
					"cost": 75,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "dc7477c9-5bb0-4860-89c8-2ffb977b8591",
					"disabled": true,
					"name": "Wishing",
					"reference": "P80",
					"cost_type": "percentage",
					"cost": 0,
					"affects": "total",
					"notes": "Aid Others Only"
				}
			],
			"reference": "B89,P80",
			"calc": {
				"points": 100
			},
			"notes": "Dictate one die roll once per hour of play",
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "eadcaee4-4ba3-4e1a-83e3-013170d31513",
			"name": "Supernatural Durability",
			"physical": true,
			"supernatural": true,
			"base_points": 150,
			"reference": "B89",
			"calc": {
				"points": 150
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "5d569ecb-0a08-4df6-a232-37e184cb9ace",
			"name": "Supernatural Features",
			"physical": true,
			"supernatural": true,
			"modifiers": [
				{
					"type": "modifier",
					"id": "f02a7bf6-5532-414d-9483-dc3b1cc67ae0",
					"disabled": true,
					"name": "No Body Heat",
					"reference": "B157",
					"cost_type": "points",
					"cost": -5,
					"affects": "total",
					"features": [
						{
							"type": "reaction_bonus",
							"amount": -1,
							"situation": "from those who touch you, shake your hand, kiss you, etc."
						}
					],
					"notes": "Gives +1 on all rolls to deduce your secret"
				},
				{
					"type": "modifier",
					"id": "5caa6b40-89b4-41cb-8a62-3dac3f0205cd",
					"disabled": true,
					"name": "No Body Heat",
					"reference": "B157",
					"cost_type": "points",
					"cost": -1,
					"affects": "total",
					"features": [
						{
							"type": "reaction_bonus",
							"amount": -1,
							"situation": "from those who touch you, shake your hand, kiss you, etc."
						}
					],
					"notes": "Can gain warmth temporarily, such as after feeding for a vampire. Gives +1 on all rolls to deduce your secret"
				},
				{
					"type": "modifier",
					"id": "24945a3e-1474-4b0d-bf32-abce1fda0de7",
					"disabled": true,
					"name": "No Reflection",
					"reference": "B157",
					"cost_type": "points",
					"cost": -10,
					"affects": "total",
					"features": [
						{
							"type": "reaction_bonus",
							"amount": -2,
							"situation": "from others who notice you have no reflection"
						}
					],
					"notes": "Gives +2 on all rolls to deduce your secret"
				},
				{
					"type": "modifier",
					"id": "b69dbe30-2cdc-43a5-8ca8-e132e1c2911c",
					"disabled": true,
					"name": "No Shadow",
					"reference": "B157",
					"cost_type": "points",
					"cost": -10,
					"affects": "total",
					"features": [
						{
							"type": "reaction_bonus",
							"amount": -2,
							"situation": "from others that notice you have no shadow"
						}
					],
					"notes": "Gives +2 on all rolls to deduce your secret"
				},
				{
					"type": "modifier",
					"id": "d284e250-2492-436a-b84e-871830a229fe",
					"disabled": true,
					"name": "Pallor",
					"reference": "B157",
					"cost_type": "points",
					"cost": -10,
					"affects": "total",
					"features": [
						{
							"type": "reaction_bonus",
							"amount": -2,
							"situation": "from others who can see you without makeup in good light"
						}
					],
					"notes": "Gives +2 on all rolls to deduce your secret"
				},
				{
					"type": "modifier",
					"id": "8b22e51f-c756-4499-b8aa-0ed15d437701",
					"disabled": true,
					"name": "Pallor",
					"reference": "B157",
					"cost_type": "points",
					"cost": -5,
					"affects": "total",
					"features": [
						{
							"type": "reaction_bonus",
							"amount": -2,
							"situation": "from others who can see you without makeup in good light"
						}
					],
					"notes": "Can gain the flush of life temporarily, such as after feeding for a vampire. Gives +2 on all rolls to deduce your secret"
				}
			],
			"reference": "B157",
			"calc": {
				"points": 0
			},
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "d4c5f716-4bda-4c15-9242-fa0393d7161e",
			"name": "Supersensitive",
			"mental": true,
			"supernatural": true,
			"base_points": -15,
			"reference": "B158",
			"calc": {
				"points": -15
			},
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "0eb5a5ad-37ab-433f-a789-9b3ede5fe0fb",
			"name": "Susceptible (@Substance@)",
			"physical": true,
			"levels": "1",
			"points_per_level": -1,
			"modifiers": [
				{
					"type": "modifier",
					"id": "b29bca39-a35f-4a25-940e-03ceebc52f7d",
					"disabled": true,
					"name": "Occasional",
					"reference": "B158",
					"cost_type": "multiplier",
					"cost": 1
				},
				{
					"type": "modifier",
					"id": "aa8429af-7ed4-4884-a308-4fe456e73238",
					"disabled": true,
					"name": "Common",
					"reference": "B158",
					"cost_type": "multiplier",
					"cost": 2
				},
				{
					"type": "modifier",
					"id": "8201d299-dc2b-4538-9224-6d9f84ad70fa",
					"disabled": true,
					"name": "Very Common",
					"reference": "B158",
					"cost_type": "multiplier",
					"cost": 4
				}
			],
			"reference": "B158",
			"calc": {
				"points": -1
			},
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "7e6a4db4-0f48-4519-b6cb-6efd581f22b1",
			"name": "Talent (@Large@)",
			"mental": true,
			"levels": "1",
			"points_per_level": 15,
			"modifiers": [
				{
					"type": "modifier",
					"id": "9fb3b0d7-ef2b-4940-a4c2-f4daa3ea6423",
					"disabled": true,
					"name": "Alternate Benefit",
					"cost_type": "percentage",
					"cost": 0,
					"affects": "total",
					"notes": "@Alternate Benefit@"
				},
				{
					"type": "modifier",
					"id": "36279689-309f-4872-b8af-002781763710",
					"disabled": true,
					"name": "Alternative Cost",
					"cost_type": "points",
					"cost": 0,
					"affects": "levels_only"
				}
			],
			"reference": "B89",
			"calc": {
				"points": 15
			},
			"features": [
				{
					"type": "skill_bonus",
					"amount": 1,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "@skill01@"
					}
				},
				{
					"type": "skill_bonus",
					"amount": 1,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "@skill02@"
					}
				},
				{
					"type": "skill_bonus",
					"amount": 1,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "@skill03@"
					}
				},
				{
					"type": "skill_bonus",
					"amount": 1,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "@skill04@"
					}
				},
				{
					"type": "skill_bonus",
					"amount": 1,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "@skill05@"
					}
				},
				{
					"type": "skill_bonus",
					"amount": 1,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "@skill06@"
					}
				},
				{
					"type": "skill_bonus",
					"amount": 1,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "@skill07@"
					}
				},
				{
					"type": "skill_bonus",
					"amount": 1,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "@skill08@"
					}
				},
				{
					"type": "skill_bonus",
					"amount": 1,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "@skill09@"
					}
				},
				{
					"type": "skill_bonus",
					"amount": 1,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "@skill10@"
					}
				},
				{
					"type": "skill_bonus",
					"amount": 1,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "@skill11@"
					}
				},
				{
					"type": "skill_bonus",
					"amount": 1,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "@skill12@"
					}
				},
				{
					"type": "skill_bonus",
					"amount": 1,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "@skill13@"
					}
				},
				{
					"type": "skill_bonus",
					"amount": 1,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "@skill14@"
					}
				},
				{
					"type": "skill_bonus",
					"amount": 1,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "@skill15@"
					}
				},
				{
					"type": "skill_bonus",
					"amount": 1,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "@skill16@"
					}
				},
				{
					"type": "skill_bonus",
					"amount": 1,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "@skill17@"
					}
				},
				{
					"type": "reaction_bonus",
					"amount": 1,
					"per_level": true,
					"situation": "@reaction bonus situation@"
				}
			],
			"categories": [
				"Advantage",
				"Talent"
			]
		},
		{
			"type": "advantage",
			"id": "8b988009-8bb6-41d4-a06c-32ef9d7083be",
			"name": "Talent (@Medium@)",
			"mental": true,
			"levels": "1",
			"points_per_level": 10,
			"modifiers": [
				{
					"type": "modifier",
					"id": "190a8e07-518d-4571-bce8-707bdee6e956",
					"disabled": true,
					"name": "Alternate Benefit",
					"cost_type": "percentage",
					"cost": 0,
					"affects": "total",
					"notes": "@Alternate Benefit@"
				},
				{
					"type": "modifier",
					"id": "45a9ce16-d103-41ce-8291-40ac1b0ac334",
					"disabled": true,
					"name": "Alternative Cost",
					"cost_type": "points",
					"cost": 0,
					"affects": "levels_only"
				}
			],
			"reference": "B89",
			"calc": {
				"points": 10
			},
			"features": [
				{
					"type": "skill_bonus",
					"amount": 1,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "@skill01@"
					}
				},
				{
					"type": "skill_bonus",
					"amount": 1,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "@skill02@"
					}
				},
				{
					"type": "skill_bonus",
					"amount": 1,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "@skill03@"
					}
				},
				{
					"type": "skill_bonus",
					"amount": 1,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "@skill04@"
					}
				},
				{
					"type": "skill_bonus",
					"amount": 1,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "@skill05@"
					}
				},
				{
					"type": "skill_bonus",
					"amount": 1,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "@skill06@"
					}
				},
				{
					"type": "skill_bonus",
					"amount": 1,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "@skill07@"
					}
				},
				{
					"type": "skill_bonus",
					"amount": 1,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "@skill08@"
					}
				},
				{
					"type": "skill_bonus",
					"amount": 1,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "@skill09@"
					}
				},
				{
					"type": "skill_bonus",
					"amount": 1,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "@skill10@"
					}
				},
				{
					"type": "skill_bonus",
					"amount": 1,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "@skill11@"
					}
				},
				{
					"type": "skill_bonus",
					"amount": 1,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "@skill12@"
					}
				},
				{
					"type": "reaction_bonus",
					"amount": 1,
					"per_level": true,
					"situation": "@reaction bonus situation@"
				}
			],
			"categories": [
				"Advantage",
				"Talent"
			]
		},
		{
			"type": "advantage",
			"id": "2e87ffa5-fa3b-4af6-b094-3783f40f14e7",
			"name": "Talent (@Small@)",
			"mental": true,
			"levels": "1",
			"points_per_level": 5,
			"modifiers": [
				{
					"type": "modifier",
					"id": "c6ea8bca-069a-4cf8-83ed-947d27add466",
					"disabled": true,
					"name": "Alternate Benefit",
					"cost_type": "percentage",
					"cost": 0,
					"affects": "total",
					"notes": "@Alternate Benefit@"
				},
				{
					"type": "modifier",
					"id": "1cdcb9fd-d3bb-41c7-bb49-3eb770056e9d",
					"disabled": true,
					"name": "Alternative Cost",
					"cost_type": "points",
					"cost": 0,
					"affects": "levels_only"
				}
			],
			"reference": "B89",
			"calc": {
				"points": 5
			},
			"features": [
				{
					"type": "skill_bonus",
					"amount": 1,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "@skill1@"
					}
				},
				{
					"type": "skill_bonus",
					"amount": 1,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "@skill2@"
					}
				},
				{
					"type": "skill_bonus",
					"amount": 1,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "@skill3@"
					}
				},
				{
					"type": "skill_bonus",
					"amount": 1,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "@skill4@"
					}
				},
				{
					"type": "skill_bonus",
					"amount": 1,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "@skill5@"
					}
				},
				{
					"type": "skill_bonus",
					"amount": 1,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "@skill6@"
					}
				},
				{
					"type": "reaction_bonus",
					"amount": 1,
					"per_level": true,
					"situation": "@reaction bonus situation@"
				}
			],
			"categories": [
				"Advantage",
				"Talent"
			]
		},
		{
			"type": "advantage",
			"id": "50e325bd-fe14-44cb-b0a5-210dbc0c03ea",
			"name": "Talent (Animal Friend)",
			"mental": true,
			"levels": "1",
			"points_per_level": 5,
			"modifiers": [
				{
					"type": "modifier",
					"id": "4b4afac9-cefe-44ba-9b5d-4985cfaa26f1",
					"disabled": true,
					"name": "Alternative Cost",
					"cost_type": "points",
					"cost": 1,
					"affects": "levels_only"
				}
			],
			"reference": "B90,PU3:6",
			"calc": {
				"points": 5
			},
			"features": [
				{
					"type": "skill_bonus",
					"amount": 1,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "contains",
						"qualifier": "animal handling"
					}
				},
				{
					"type": "skill_bonus",
					"amount": 1,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "falconry"
					}
				},
				{
					"type": "skill_bonus",
					"amount": 1,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "contains",
						"qualifier": "packing"
					}
				},
				{
					"type": "skill_bonus",
					"amount": 1,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "contains",
						"qualifier": "riding"
					}
				},
				{
					"type": "skill_bonus",
					"amount": 1,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "contains",
						"qualifier": "teamster"
					}
				},
				{
					"type": "skill_bonus",
					"amount": 1,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "contains",
						"qualifier": "veterinary"
					}
				},
				{
					"type": "reaction_bonus",
					"amount": 1,
					"per_level": true,
					"situation": "from ordinary animals"
				}
			],
			"categories": [
				"Advantage",
				"Talent"
			]
		},
		{
			"type": "advantage",
			"id": "b08962b3-5c25-41f6-899e-209b374bd9e3",
			"name": "Talent (Artificer)",
			"mental": true,
			"levels": "1",
			"points_per_level": 10,
			"reference": "B90",
			"calc": {
				"points": 10
			},
			"features": [
				{
					"type": "skill_bonus",
					"amount": 1,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "armoury"
					}
				},
				{
					"type": "skill_bonus",
					"amount": 1,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "Carpentry"
					}
				},
				{
					"type": "skill_bonus",
					"amount": 1,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "Electrician"
					}
				},
				{
					"type": "skill_bonus",
					"amount": 1,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "Electronics Repair"
					}
				},
				{
					"type": "skill_bonus",
					"amount": 1,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "Engineer"
					}
				},
				{
					"type": "skill_bonus",
					"amount": 1,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "Machinist"
					}
				},
				{
					"type": "skill_bonus",
					"amount": 1,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "Masonry"
					}
				},
				{
					"type": "skill_bonus",
					"amount": 1,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "Mechanic"
					}
				},
				{
					"type": "skill_bonus",
					"amount": 1,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "Smith"
					}
				},
				{
					"type": "reaction_bonus",
					"amount": 1,
					"per_level": true,
					"situation": "from any employer"
				}
			],
			"categories": [
				"Advantage",
				"Talent"
			]
		},
		{
			"type": "advantage",
			"id": "6e4e2676-6071-4cb0-93b6-2ce842e8f40c",
			"name": "Talent (Business Acumen)",
			"mental": true,
			"levels": "1",
			"points_per_level": 10,
			"reference": "B90",
			"calc": {
				"points": 10
			},
			"features": [
				{
					"type": "skill_bonus",
					"amount": 1,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "Accounting"
					}
				},
				{
					"type": "skill_bonus",
					"amount": 1,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "Administration"
					}
				},
				{
					"type": "skill_bonus",
					"amount": 1,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "Economics"
					}
				},
				{
					"type": "skill_bonus",
					"amount": 1,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "Finance"
					}
				},
				{
					"type": "skill_bonus",
					"amount": 1,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "Gambling"
					}
				},
				{
					"type": "skill_bonus",
					"amount": 1,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "Market Analysis"
					}
				},
				{
					"type": "skill_bonus",
					"amount": 1,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "Merchant"
					}
				},
				{
					"type": "skill_bonus",
					"amount": 1,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "Propaganda"
					}
				},
				{
					"type": "reaction_bonus",
					"amount": 1,
					"per_level": true,
					"situation": "from business partners"
				}
			],
			"categories": [
				"Advantage",
				"Talent"
			]
		},
		{
			"type": "advantage",
			"id": "62c37972-950b-45a7-83de-01642c4934e3",
			"name": "Talent (Gifted Artist)",
			"mental": true,
			"levels": "1",
			"points_per_level": 5,
			"reference": "B90,PU3:10",
			"calc": {
				"points": 5
			},
			"features": [
				{
					"type": "skill_bonus",
					"amount": 1,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "Artist"
					}
				},
				{
					"type": "skill_bonus",
					"amount": 1,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "Jeweler"
					}
				},
				{
					"type": "skill_bonus",
					"amount": 1,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "Leatherworking"
					}
				},
				{
					"type": "skill_bonus",
					"amount": 1,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "Photography"
					}
				},
				{
					"type": "skill_bonus",
					"amount": 1,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "Sewing"
					}
				},
				{
					"type": "reaction_bonus",
					"amount": 1,
					"per_level": true,
					"situation": "from buyers and critics"
				}
			],
			"categories": [
				"Advantage",
				"Talent"
			]
		},
		{
			"type": "advantage",
			"id": "a6316f3d-b56b-4678-99af-a6efa218b981",
			"name": "Talent (Green Thumb)",
			"mental": true,
			"levels": "1",
			"points_per_level": 5,
			"modifiers": [
				{
					"type": "modifier",
					"id": "71eef281-0b19-4867-b6f5-953f8c767cc4",
					"disabled": true,
					"name": "Alternate Benefit",
					"cost_type": "percentage",
					"cost": 0,
					"affects": "total",
					"notes": "Bonus to rolls to survive made by plants in your care."
				}
			],
			"reference": "B90,PU3:11",
			"calc": {
				"points": 5
			},
			"features": [
				{
					"type": "skill_bonus",
					"amount": 1,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "Biology"
					}
				},
				{
					"type": "skill_bonus",
					"amount": 1,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "Farming"
					}
				},
				{
					"type": "skill_bonus",
					"amount": 1,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "Gardening"
					}
				},
				{
					"type": "skill_bonus",
					"amount": 1,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "Herb Lore"
					}
				},
				{
					"type": "skill_bonus",
					"amount": 1,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "Naturalist"
					}
				},
				{
					"type": "reaction_bonus",
					"amount": 1,
					"per_level": true,
					"situation": "from gardeners and sentient plants"
				}
			],
			"categories": [
				"Advantage",
				"Talent"
			]
		},
		{
			"type": "advantage",
			"id": "68bb2472-bf1c-4b8e-bfde-9e9ec4bfdac4",
			"name": "Talent (Healer)",
			"mental": true,
			"levels": "1",
			"points_per_level": 10,
			"modifiers": [
				{
					"type": "modifier",
					"id": "41a45799-45da-4588-9714-368b1bfaf62a",
					"disabled": true,
					"name": "Alternate Benefit",
					"cost_type": "percentage",
					"cost": 0,
					"affects": "total",
					"notes": "Bonus to HT rolls for a specific patient and condition if treated full time."
				},
				{
					"type": "modifier",
					"id": "14c31fe3-3767-46f6-8957-756c5c63edf5",
					"disabled": true,
					"name": "Alternative Cost",
					"cost_type": "points",
					"cost": -1,
					"affects": "levels_only"
				}
			],
			"reference": "B90,PU3:11",
			"calc": {
				"points": 10
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
							"qualifier": "Talent (Healer)"
						},
						"level": {
							"compare": "at_least",
							"qualifier": 1
						},
						"notes": {
							"compare": "contains",
							"qualifier": "Modern"
						}
					}
				]
			},
			"features": [
				{
					"type": "skill_bonus",
					"amount": 1,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "Diagnosis"
					}
				},
				{
					"type": "skill_bonus",
					"amount": 1,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "Esoteric Medicine"
					}
				},
				{
					"type": "skill_bonus",
					"amount": 1,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "First Aid"
					}
				},
				{
					"type": "skill_bonus",
					"amount": 1,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "Pharmacy"
					}
				},
				{
					"type": "skill_bonus",
					"amount": 1,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "Physician"
					}
				},
				{
					"type": "skill_bonus",
					"amount": 1,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "Physiology"
					}
				},
				{
					"type": "skill_bonus",
					"amount": 1,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "Psychology"
					}
				},
				{
					"type": "skill_bonus",
					"amount": 1,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "Surgery"
					}
				},
				{
					"type": "skill_bonus",
					"amount": 1,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "Veterinary"
					}
				},
				{
					"type": "skill_bonus",
					"amount": 1,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is"
					}
				},
				{
					"type": "skill_bonus",
					"amount": 1,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is"
					}
				},
				{
					"type": "skill_bonus",
					"amount": 1,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is"
					}
				},
				{
					"type": "reaction_bonus",
					"amount": 1,
					"per_level": true,
					"situation": "from patients"
				}
			],
			"categories": [
				"Advantage",
				"Talent"
			]
		},
		{
			"type": "advantage",
			"id": "1a802d35-0ae7-45c8-af9b-c30492ba4680",
			"name": "Talent (Healer)",
			"mental": true,
			"levels": "1",
			"points_per_level": 10,
			"modifiers": [
				{
					"type": "modifier",
					"id": "8a7f420e-72c4-4cbc-b6a1-e9672b7202c8",
					"disabled": true,
					"name": "Alternate Benefit",
					"cost_type": "percentage",
					"cost": 0,
					"affects": "total",
					"notes": "Bonus to HT rolls for a specific patient and condition if treated full time."
				},
				{
					"type": "modifier",
					"id": "660cd855-3088-4e77-bee9-15654cf1e514",
					"disabled": true,
					"name": "Alternative Cost",
					"cost_type": "points",
					"cost": 1,
					"affects": "levels_only"
				}
			],
			"reference": "B90,PU3:11",
			"calc": {
				"points": 10
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
							"qualifier": "Talent (Healer)"
						},
						"level": {
							"compare": "at_least",
							"qualifier": 1
						},
						"notes": {
							"compare": "does_not_contain",
							"qualifier": "Modern"
						}
					}
				]
			},
			"features": [
				{
					"type": "skill_bonus",
					"amount": 1,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "Diagnosis"
					}
				},
				{
					"type": "skill_bonus",
					"amount": 1,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "Esoteric Medicine"
					}
				},
				{
					"type": "skill_bonus",
					"amount": 1,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "First Aid"
					}
				},
				{
					"type": "skill_bonus",
					"amount": 1,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "Pharmacy"
					}
				},
				{
					"type": "skill_bonus",
					"amount": 1,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "Physician"
					}
				},
				{
					"type": "skill_bonus",
					"amount": 1,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "Physiology"
					}
				},
				{
					"type": "skill_bonus",
					"amount": 1,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "Psychology"
					}
				},
				{
					"type": "skill_bonus",
					"amount": 1,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "Surgery"
					}
				},
				{
					"type": "skill_bonus",
					"amount": 1,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "Veterinary"
					}
				},
				{
					"type": "skill_bonus",
					"amount": 1,
					"per_level": true,
					"selection_type": "skills_with_name",
					"specialization": {
						"compare": "is",
						"qualifier": "Medical"
					},
					"name": {
						"compare": "is",
						"qualifier": "Electronics Operation"
					}
				},
				{
					"type": "skill_bonus",
					"amount": 1,
					"per_level": true,
					"selection_type": "skills_with_name",
					"specialization": {
						"compare": "is",
						"qualifier": "Epidemiology"
					},
					"name": {
						"compare": "is",
						"qualifier": "Expert Skill"
					}
				},
				{
					"type": "reaction_bonus",
					"amount": 1,
					"per_level": true,
					"situation": "from patients"
				}
			],
			"notes": "Modern",
			"categories": [
				"Advantage",
				"Talent"
			]
		},
		{
			"type": "advantage",
			"id": "08a5f297-123b-42fa-97df-12f7ce934665",
			"name": "Talent (Mathematical Ability)",
			"mental": true,
			"levels": "1",
			"points_per_level": 10,
			"modifiers": [
				{
					"type": "modifier",
					"id": "057f8673-2216-4f21-a752-a300a6883620",
					"disabled": true,
					"name": "Alternate Benefit",
					"cost_type": "percentage",
					"cost": 0,
					"affects": "total",
					"notes": "Bonus to resist deception involving numbers"
				},
				{
					"type": "modifier",
					"id": "b2a013b0-2273-4c91-8dfa-50a3b5fa2715",
					"disabled": true,
					"name": "Alternative Cost",
					"cost_type": "points",
					"cost": -2,
					"affects": "levels_only"
				}
			],
			"reference": "B90,PU3:12",
			"calc": {
				"points": 10
			},
			"features": [
				{
					"type": "skill_bonus",
					"amount": 1,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "Accounting"
					}
				},
				{
					"type": "skill_bonus",
					"amount": 1,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "Astronomy"
					}
				},
				{
					"type": "skill_bonus",
					"amount": 1,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "Cryptography"
					}
				},
				{
					"type": "skill_bonus",
					"amount": 1,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "Engineer"
					}
				},
				{
					"type": "skill_bonus",
					"amount": 1,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "Finance"
					}
				},
				{
					"type": "skill_bonus",
					"amount": 1,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "Market Analysis"
					}
				},
				{
					"type": "skill_bonus",
					"amount": 1,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "Mathematics"
					}
				},
				{
					"type": "skill_bonus",
					"amount": 1,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "Physics"
					}
				},
				{
					"type": "reaction_bonus",
					"amount": 1,
					"per_level": true,
					"situation": "from engineers and scientists"
				}
			],
			"categories": [
				"Advantage",
				"Talent"
			]
		},
		{
			"type": "advantage",
			"id": "117ab337-efb2-4c7a-9652-7ab0baeea7f1",
			"name": "Talent (Musical Ability)",
			"mental": true,
			"levels": "1",
			"points_per_level": 5,
			"reference": "B90,PU3:13",
			"calc": {
				"points": 5
			},
			"features": [
				{
					"type": "skill_bonus",
					"amount": 1,
					"per_level": true,
					"selection_type": "skills_with_name",
					"specialization": {
						"compare": "is",
						"qualifier": "Conducting"
					},
					"name": {
						"compare": "is",
						"qualifier": "Group Performance"
					}
				},
				{
					"type": "skill_bonus",
					"amount": 1,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "Musical Composition"
					}
				},
				{
					"type": "skill_bonus",
					"amount": 1,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "Musical Influence"
					}
				},
				{
					"type": "skill_bonus",
					"amount": 1,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "Musical Instrument"
					}
				},
				{
					"type": "skill_bonus",
					"amount": 1,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "Singing"
					}
				},
				{
					"type": "reaction_bonus",
					"amount": 1,
					"per_level": true,
					"situation": "from audiences and critics"
				}
			],
			"categories": [
				"Advantage",
				"Talent"
			]
		},
		{
			"type": "advantage",
			"id": "3b3fddf6-222b-4389-9460-8d2f4a70bb01",
			"name": "Talent (Outdoorsman)",
			"mental": true,
			"levels": "1",
			"points_per_level": 10,
			"modifiers": [
				{
					"type": "modifier",
					"id": "254be33f-2141-4378-b967-c5d751c27942",
					"disabled": true,
					"name": "Alternate Benefit",
					"cost_type": "percentage",
					"cost": 0,
					"affects": "total",
					"notes": "Bonus to HT rolls to avoid harm from failure of covered skills"
				},
				{
					"type": "modifier",
					"id": "2d095bbd-0918-4dfc-975e-de2ff3901fb2",
					"disabled": true,
					"name": "Alternative Cost",
					"cost_type": "points",
					"cost": -3,
					"affects": "levels_only"
				}
			],
			"reference": "B90,PU3:14",
			"calc": {
				"points": 10
			},
			"features": [
				{
					"type": "skill_bonus",
					"amount": 1,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "Camouflage"
					}
				},
				{
					"type": "skill_bonus",
					"amount": 1,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "Fishing"
					}
				},
				{
					"type": "skill_bonus",
					"amount": 1,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "Mimicry"
					}
				},
				{
					"type": "skill_bonus",
					"amount": 1,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "Naturalist"
					}
				},
				{
					"type": "skill_bonus",
					"amount": 1,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "Navigation"
					}
				},
				{
					"type": "skill_bonus",
					"amount": 1,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "Survival"
					}
				},
				{
					"type": "skill_bonus",
					"amount": 1,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "Tracking"
					}
				},
				{
					"type": "reaction_bonus",
					"amount": 1,
					"per_level": true,
					"situation": "from explorers and nature lovers"
				}
			],
			"categories": [
				"Advantage",
				"Talent"
			]
		},
		{
			"type": "advantage",
			"id": "b11df077-4692-4016-9f47-b97653f64efc",
			"name": "Talent (Smooth Operator)",
			"mental": true,
			"levels": "1",
			"points_per_level": 15,
			"modifiers": [
				{
					"type": "modifier",
					"id": "673ac6d5-88a0-46ff-9c61-a92a5908fd6d",
					"disabled": true,
					"name": "Alternate Benefit",
					"cost_type": "percentage",
					"cost": 0,
					"affects": "total",
					"notes": "Bonus to resist covered skills"
				},
				{
					"type": "modifier",
					"id": "d7bc77f2-e124-4076-a8c1-e9845d9583c0",
					"disabled": true,
					"name": "Alternative Cost",
					"cost_type": "points",
					"cost": -2,
					"affects": "levels_only"
				}
			],
			"reference": "B90,PU3:15",
			"calc": {
				"points": 15
			},
			"features": [
				{
					"type": "skill_bonus",
					"amount": 1,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "Acting"
					}
				},
				{
					"type": "skill_bonus",
					"amount": 1,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "Carousing"
					}
				},
				{
					"type": "skill_bonus",
					"amount": 1,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "Detect Lies"
					}
				},
				{
					"type": "skill_bonus",
					"amount": 1,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "Diplomacy"
					}
				},
				{
					"type": "skill_bonus",
					"amount": 1,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "Fast-Talk"
					}
				},
				{
					"type": "skill_bonus",
					"amount": 1,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "Intimidation"
					}
				},
				{
					"type": "skill_bonus",
					"amount": 1,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "Leadership"
					}
				},
				{
					"type": "skill_bonus",
					"amount": 1,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "Panhandling"
					}
				},
				{
					"type": "skill_bonus",
					"amount": 1,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "Politics"
					}
				},
				{
					"type": "skill_bonus",
					"amount": 1,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "Public Speaking"
					}
				},
				{
					"type": "skill_bonus",
					"amount": 1,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "Savoir-Faire"
					}
				},
				{
					"type": "skill_bonus",
					"amount": 1,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "Sex Appeal"
					}
				},
				{
					"type": "skill_bonus",
					"amount": 1,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "Streetwise"
					}
				},
				{
					"type": "skill_bonus",
					"amount": 1,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is"
					}
				},
				{
					"type": "skill_bonus",
					"amount": 1,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is"
					}
				},
				{
					"type": "skill_bonus",
					"amount": 1,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is"
					}
				},
				{
					"type": "skill_bonus",
					"amount": 1,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is"
					}
				},
				{
					"type": "reaction_bonus",
					"amount": 1,
					"per_level": true,
					"situation": "from con artists, politicians, salesmen, etc. – but only if you aren’t trying to manipulate them."
				}
			],
			"categories": [
				"Advantage",
				"Talent"
			]
		},
		{
			"type": "advantage",
			"id": "2a5f5d00-4ac0-436b-92aa-ea6cefae704e",
			"name": "Talons",
			"physical": true,
			"base_points": 8,
			"weapons": [
				{
					"type": "melee_weapon",
					"damage": {
						"type": "cut",
						"st": "thr",
						"base": "-1"
					},
					"usage": "Slash",
					"reach": "C",
					"parry": "0",
					"block": "No",
					"calc": {
						"level": 0,
						"parry": "0",
						"block": "No",
						"damage": "thr-1 cut"
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
						"type": "imp",
						"st": "thr",
						"base": "-1"
					},
					"usage": "Stab",
					"reach": "C",
					"parry": "0",
					"block": "No",
					"calc": {
						"level": 0,
						"parry": "0",
						"block": "No",
						"damage": "thr-1 imp"
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
				}
			],
			"reference": "B43",
			"calc": {
				"points": 8
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "53be2c8a-7bff-4652-8e63-6a3509c51ee6",
			"name": "Technophobia/TL4- (Machinery)",
			"mental": true,
			"base_points": -5,
			"cr": 12,
			"cr_adj": "action_penalty",
			"reference": "B150",
			"calc": {
				"points": -5
			},
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "e1ead73f-96a1-450d-b3b0-1a3b2e93047f",
			"name": "Technophobia/TL5+ (Machinery)",
			"mental": true,
			"base_points": -15,
			"cr": 12,
			"cr_adj": "action_penalty",
			"reference": "B150",
			"calc": {
				"points": -15
			},
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "3436b7ea-835a-46d6-8c21-e59580624adb",
			"name": "Telecommunication",
			"mental": true,
			"physical": true,
			"exotic": true,
			"modifiers": [
				{
					"type": "modifier",
					"id": "907a171c-0524-4b66-a528-ea3de53ebc77",
					"disabled": true,
					"name": "Infrared Communication",
					"reference": "B91",
					"cost_type": "points",
					"cost": 10,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "fe87b471-a595-407d-861d-9cedf839d5ba",
					"disabled": true,
					"name": "Laser Communication",
					"reference": "B91",
					"cost_type": "points",
					"cost": 15,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "1ce7cf23-966a-4233-908d-9998fb1723ec",
					"disabled": true,
					"name": "Radio",
					"reference": "B91",
					"cost_type": "points",
					"cost": 10,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "3bb4f552-2f5f-4d04-a382-aefd6e0d0d8d",
					"disabled": true,
					"name": "Telesend",
					"reference": "B91",
					"cost_type": "points",
					"cost": 30,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "8dfb3cc3-5eaf-44d1-af2d-82c681b6cc6c",
					"disabled": true,
					"name": "Broadcast",
					"reference": "B91",
					"cost_type": "percentage",
					"cost": 50,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "8bd06112-302f-40b9-9c81-cf05367f8427",
					"disabled": true,
					"name": "Short Wave",
					"reference": "B91",
					"cost_type": "percentage",
					"cost": 50,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "31dc35a5-b5be-4ea3-a1f6-9d3614d3291c",
					"disabled": true,
					"name": "Universal",
					"reference": "B91",
					"cost_type": "percentage",
					"cost": 50,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "89ba8d02-bab8-4e80-9c5e-e8528d296414",
					"disabled": true,
					"name": "Video",
					"reference": "B91",
					"cost_type": "percentage",
					"cost": 40,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "215e5a1a-ac21-4676-9e7e-66bf441ce8c8",
					"disabled": true,
					"name": "Racial",
					"reference": "B91",
					"cost_type": "percentage",
					"cost": -20,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "d7f2bdef-fbb0-4adc-b9b7-4fd7fcd9d0f6",
					"disabled": true,
					"name": "Receive Only",
					"reference": "B91",
					"cost_type": "percentage",
					"cost": -50,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "8f6884d2-48e7-477c-a1c4-9671a3f35de1",
					"disabled": true,
					"name": "Send Only",
					"reference": "B91",
					"cost_type": "percentage",
					"cost": -50,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "4a422848-3ff6-4cbd-b9cc-dbf461c698c6",
					"disabled": true,
					"name": "Vague",
					"reference": "B91",
					"cost_type": "percentage",
					"cost": -50,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "0be44163-089b-4f6c-8ccc-fc346aeb0a09",
					"disabled": true,
					"name": "Directional Sound",
					"reference": "P81",
					"cost_type": "points",
					"cost": 5,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "a4b519a7-f3b6-4548-ab36-84f4fa6323ee",
					"disabled": true,
					"name": "Gravity Ripple",
					"reference": "P81",
					"cost_type": "points",
					"cost": 20,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "f62ac5a6-3ed4-4f87-99da-726ffb8a0aca",
					"disabled": true,
					"name": "Neutrino",
					"reference": "P81",
					"cost_type": "points",
					"cost": 25,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "c9e96f67-4858-4f1d-8e2e-f7e1e788aacd",
					"disabled": true,
					"name": "Sonar",
					"reference": "P81",
					"cost_type": "points",
					"cost": 10,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "c1e662c3-c012-45ce-9ed6-7ce4687f7fa2",
					"disabled": true,
					"name": "Burst",
					"reference": "P81",
					"cost_type": "percentage",
					"cost": 30,
					"affects": "total",
					"levels": 1
				},
				{
					"type": "modifier",
					"id": "bb038cbb-b180-4f34-8302-188b5bd0821d",
					"disabled": true,
					"name": "FTL",
					"reference": "P82",
					"cost_type": "percentage",
					"cost": 120,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "a0c1ec34-080a-42d8-8112-05a963182009",
					"disabled": true,
					"name": "Secure",
					"reference": "P82",
					"cost_type": "percentage",
					"cost": 20,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "d5d966e0-13f5-479c-a140-838583741247",
					"disabled": true,
					"name": "Sensie",
					"reference": "P82",
					"cost_type": "percentage",
					"cost": 80,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "afbf6331-6597-4b69-ae8d-a5581b34bfc2",
					"disabled": true,
					"name": "Cable Jack",
					"reference": "UT31",
					"cost_type": "points",
					"cost": 5,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "59a27a6f-8680-4ecb-9f94-cfc47aa63b6d",
					"disabled": true,
					"name": "Full Communion",
					"reference": "PSI17",
					"cost_type": "percentage",
					"cost": 20,
					"affects": "total"
				}
			],
			"reference": "B91,P81,PSI17",
			"calc": {
				"points": 0
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "4afd2227-a32b-4793-9d52-d663b9e6c9f9",
			"name": "Telekinesis",
			"mental": true,
			"physical": true,
			"exotic": true,
			"levels": "1",
			"points_per_level": 5,
			"modifiers": [
				{
					"type": "modifier",
					"id": "6d281c1f-ca56-43dd-9734-591b48f08744",
					"disabled": true,
					"name": "Magnetic",
					"reference": "B92",
					"cost_type": "percentage",
					"cost": -50,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "97474c63-06d8-4717-b179-2bd107758824",
					"disabled": true,
					"name": "Visible",
					"reference": "B92",
					"cost_type": "percentage",
					"cost": -20,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "11a7bba7-baf8-4835-a67d-46c392316fb5",
					"disabled": true,
					"name": "Super-Effort",
					"reference": "P83",
					"cost_type": "percentage",
					"cost": 400,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "e6805eca-433e-4408-9b51-13aace6a88b3",
					"disabled": true,
					"name": "Animation",
					"reference": "P83",
					"cost_type": "percentage",
					"cost": -20,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "a417a683-b402-4058-a78d-b434346e1822",
					"disabled": true,
					"name": "Animation",
					"reference": "P83",
					"cost_type": "percentage",
					"cost": -30,
					"affects": "total",
					"notes": "No Flight"
				},
				{
					"type": "modifier",
					"id": "39b817b4-ca56-497c-be33-cc73174bf2f4",
					"disabled": true,
					"name": "Attraction",
					"reference": "P83",
					"cost_type": "percentage",
					"cost": -60,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "0ae6636c-b2e0-4f23-9feb-1b5b1370c92b",
					"disabled": true,
					"name": "Repulsion",
					"reference": "P83",
					"cost_type": "percentage",
					"cost": -60,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "e756748b-56eb-47ce-8e52-eb0481a9fd4a",
					"disabled": true,
					"name": "Attraction/Repulsion",
					"reference": "P83",
					"cost_type": "percentage",
					"cost": -30,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "c5a8559a-bbc3-4400-a536-011c46901f60",
					"disabled": true,
					"name": "Lift Only",
					"reference": "P83",
					"cost_type": "percentage",
					"cost": -20,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "ab83527b-20aa-4225-b1fa-47309e2db47b",
					"disabled": true,
					"name": "Move Only",
					"reference": "P83",
					"cost_type": "percentage",
					"cost": -40,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "254bf84d-9a87-41ed-84ab-56b8c0da8ab3",
					"disabled": true,
					"name": "Animate Life-forms",
					"reference": "SU28",
					"cost_type": "percentage",
					"cost": 100,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "1b43e53d-8a27-482a-90c6-12f2136e3a49",
					"disabled": true,
					"name": "Animate Life-forms",
					"reference": "SU28",
					"cost_type": "percentage",
					"cost": 20,
					"affects": "total",
					"notes": "Partial"
				},
				{
					"type": "modifier",
					"id": "bb3d931c-8313-4cd1-a088-13152b251365",
					"disabled": true,
					"name": "Super-Damage",
					"reference": "SU29",
					"cost_type": "percentage",
					"cost": 900,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "0876d021-77e9-4f59-8b92-143d8ba17570",
					"disabled": true,
					"name": "Cannot Affect Self",
					"reference": "PSI17",
					"cost_type": "percentage",
					"cost": -20,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "98183659-66a0-4aea-a58c-95e748329343",
					"disabled": true,
					"name": "Cannot Punch",
					"reference": "PSI17",
					"cost_type": "percentage",
					"cost": -10,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "34ca2d7f-6ce0-4dcd-aa87-de6f31199832",
					"disabled": true,
					"name": "Enveloping",
					"reference": "MATG28",
					"cost_type": "percentage",
					"cost": 60,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "62805152-63f8-48c1-a84e-2e58953bf6c2",
					"disabled": true,
					"name": "Grappling Only",
					"reference": "MATG28",
					"cost_type": "percentage",
					"cost": -30,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "8b273afc-e46a-446f-aa8f-506575678a8a",
					"disabled": true,
					"name": "Restraint Only",
					"reference": "MATG28",
					"cost_type": "percentage",
					"cost": -45,
					"affects": "total"
				}
			],
			"reference": "B92,P82,PSI17",
			"calc": {
				"points": 5
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "884c89de-7f03-401b-b7fa-a7ab9f1948e6",
			"name": "Telescopic Vision",
			"physical": true,
			"levels": "1",
			"points_per_level": 5,
			"modifiers": [
				{
					"type": "modifier",
					"id": "6d5e608b-f93b-4aa4-87cb-abc74d6795a2",
					"disabled": true,
					"name": "No Targeting",
					"reference": "B92",
					"cost_type": "percentage",
					"cost": -60,
					"affects": "total"
				}
			],
			"reference": "B92,P87",
			"calc": {
				"points": 5
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "0c53f556-d677-41ad-9fdb-1d395dfe6cb7",
			"name": "Temperature Control",
			"mental": true,
			"physical": true,
			"exotic": true,
			"levels": "1",
			"points_per_level": 5,
			"modifiers": [
				{
					"type": "modifier",
					"id": "4041ffa7-2ed5-4152-a73e-153b8037d8a4",
					"disabled": true,
					"name": "Cold",
					"reference": "B92",
					"cost_type": "percentage",
					"cost": -50,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "cfe3d1b5-3c69-4a53-9c2a-703ecc2c7e53",
					"disabled": true,
					"name": "Heat",
					"reference": "B92",
					"cost_type": "percentage",
					"cost": -50,
					"affects": "total"
				}
			],
			"reference": "B92,P83",
			"calc": {
				"points": 5
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "45415e7e-fb62-44e0-83eb-c32528e8edfc",
			"name": "Temperature Tolerance",
			"physical": true,
			"levels": "1",
			"points_per_level": 1,
			"reference": "B93",
			"calc": {
				"points": 1
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "fdda35a6-7f43-4295-af8a-9cfbedf51e05",
			"name": "Temporal Inertia",
			"mental": true,
			"supernatural": true,
			"base_points": 15,
			"reference": "B93",
			"calc": {
				"points": 15
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "e6704198-6dad-411f-8468-5f41242fa13c",
			"name": "Tenure",
			"social": true,
			"base_points": 5,
			"reference": "B93",
			"calc": {
				"points": 5
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "fe80755b-54bf-414d-8544-651327af543f",
			"name": "Teratophobia (Monsters)",
			"mental": true,
			"base_points": -15,
			"cr": 12,
			"cr_adj": "action_penalty",
			"reference": "B150",
			"calc": {
				"points": -15
			},
			"notes": "Any “unnatural” creature sets off this fear. You have -1 to -4 on the self-control roll if the monster seems very large or dangerous, or if there are a lot of them. Note that the definition of “monster” depends on experience. An American Indian would consider an elephant monstrous, while an African pygmy would not!",
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "f8d66899-61ca-4381-b018-f7406bebe250",
			"name": "Terminally Ill",
			"physical": true,
			"modifiers": [
				{
					"type": "modifier",
					"id": "1eceab5a-5a82-474e-8e0a-5b4a8f1d2cf5",
					"disabled": true,
					"name": "2 years to live",
					"reference": "B158",
					"cost_type": "points",
					"cost": -50,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "af57269d-38ac-46a5-b4fe-7c3913fc8a50",
					"disabled": true,
					"name": "1 year to live",
					"reference": "B158",
					"cost_type": "points",
					"cost": -75,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "e2fe6041-a1ce-4a17-9df9-9188aa04ea23",
					"disabled": true,
					"name": "1 month to live",
					"reference": "B158",
					"cost_type": "points",
					"cost": -100,
					"affects": "total"
				}
			],
			"reference": "B158",
			"calc": {
				"points": 0
			},
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "dea749c0-60ca-4c35-8f24-2de6ed323cd5",
			"name": "Terrain Adaptation (@Terrain Type@)",
			"physical": true,
			"exotic": true,
			"base_points": 5,
			"modifiers": [
				{
					"type": "modifier",
					"id": "43bd114a-7400-46c5-a4bb-b847d8451804",
					"disabled": true,
					"name": "Unstable on solid ground",
					"reference": "B93",
					"cost_type": "points",
					"cost": -5,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "2d052e7c-7d82-40f6-ae57-c81ea78e09ab",
					"disabled": true,
					"name": "Active",
					"reference": "P84",
					"cost_type": "percentage",
					"cost": 300,
					"affects": "total"
				}
			],
			"reference": "B93,P83",
			"calc": {
				"points": 5
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "44ed0aa9-28fe-409a-a0e2-a13acf4f89f1",
			"name": "Terror",
			"mental": true,
			"supernatural": true,
			"levels": "1",
			"base_points": 30,
			"points_per_level": 10,
			"modifiers": [
				{
					"type": "modifier",
					"id": "5557b770-20b0-439e-981b-d9d79841166f",
					"disabled": true,
					"name": "Always On",
					"reference": "B93",
					"cost_type": "percentage",
					"cost": -20,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "c92f6e66-f1cc-41e1-8585-6f528b7ce1c3",
					"disabled": true,
					"name": "Active",
					"reference": "P84",
					"cost_type": "percentage",
					"cost": 0,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "2f042b70-8e3c-44c2-8534-145ad0b4b58b",
					"disabled": true,
					"name": "Presence",
					"reference": "P84",
					"cost_type": "percentage",
					"cost": 25,
					"affects": "total"
				}
			],
			"reference": "B93,P84",
			"calc": {
				"points": 40
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "450949e8-65f1-4647-901a-8516b1f7cb9e",
			"name": "Thalassophobia (Oceans)",
			"mental": true,
			"base_points": -10,
			"cr": 12,
			"cr_adj": "action_penalty",
			"reference": "B150",
			"calc": {
				"points": -10
			},
			"notes": "You are afraid of any large body of water. Ocean travel, or even air travel over the ocean, is basically impossible for you, and encounters with aquatic monsters are also upsetting.",
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "aaa2c247-e0bf-471b-9454-e7eecd6b1137",
			"name": "Timesickness",
			"physical": true,
			"base_points": -10,
			"reference": "B158",
			"calc": {
				"points": -10
			},
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "8f874289-a512-431b-be13-f33edea4e8c7",
			"name": "Trademark",
			"mental": true,
			"levels": "0",
			"base_points": -1,
			"reference": "B164",
			"calc": {
				"points": -1
			},
			"notes": "@Description@",
			"categories": [
				"Quirk"
			]
		},
		{
			"type": "advantage",
			"id": "7b98575f-4ffd-4435-adde-a132937aab8a",
			"name": "Trademark (@Complex@)",
			"mental": true,
			"base_points": -10,
			"reference": "B159",
			"calc": {
				"points": -10
			},
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "1686974a-4290-4217-b3a0-a6feb8089a9e",
			"name": "Trademark (@Elaborate@)",
			"mental": true,
			"base_points": -15,
			"reference": "B159",
			"calc": {
				"points": -15
			},
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "5b00b159-456e-4277-a35a-89c59c7d1e1d",
			"name": "Trademark (@Simple@)",
			"mental": true,
			"base_points": -5,
			"reference": "B159",
			"calc": {
				"points": -5
			},
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "ee019fcf-4db1-48cd-ba04-03fa94357702",
			"name": "Trained by a Master",
			"mental": true,
			"base_points": 30,
			"modifiers": [
				{
					"type": "modifier",
					"id": "73e69b8e-41f1-4ccf-b67f-8434034dfdb9",
					"disabled": true,
					"name": "Unarmed only",
					"cost_type": "percentage",
					"cost": -40,
					"affects": "total"
				}
			],
			"reference": "B93,MA48",
			"calc": {
				"points": 30
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "f0840890-38b3-48e6-8059-83d2ac0ab1b2",
			"name": "Trickster",
			"mental": true,
			"base_points": -15,
			"cr": 12,
			"reference": "B159",
			"calc": {
				"points": -15
			},
			"notes": "Make a self-control roll each day. If you fail, you must try to trick a dangerous subject: a skilled warrior, a dangerous monster, a whole group of reasonably competent opponents, etc. If you resist, you get a cumulative -1 per day to your self-control roll until you finally fail a roll!",
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "ee2f1e8f-f0e5-42e7-a857-53126a7438bc",
			"name": "Triskaidekaphobia (Number 13)",
			"mental": true,
			"base_points": -5,
			"cr": 12,
			"cr_adj": "action_penalty",
			"reference": "B150",
			"calc": {
				"points": -5
			},
			"notes": "You must make a self-control roll whenever you have to deal with the number 13. Roll at -5 if Friday the 13th is involved!",
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "5c4c20a4-b3c0-4f7d-aaa5-8d2d8bfb4405",
			"name": "True Faith",
			"mental": true,
			"supernatural": true,
			"base_points": 15,
			"modifiers": [
				{
					"type": "modifier",
					"id": "ca3afde0-4e16-4370-96b4-06f654841cb6",
					"disabled": true,
					"name": "Chosen",
					"reference": "P84",
					"cost_type": "percentage",
					"cost": 0,
					"affects": "total",
					"notes": "@Deity@"
				},
				{
					"type": "modifier",
					"id": "32701344-c513-4fdb-9337-c3261e231622",
					"disabled": true,
					"name": "Turning",
					"reference": "P84",
					"cost_type": "percentage",
					"cost": 65,
					"affects": "total"
				}
			],
			"reference": "B94,P84",
			"calc": {
				"points": 15
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "d985b682-25d7-4656-b8e5-d249d7c74add",
			"name": "Truthfulness",
			"mental": true,
			"base_points": -5,
			"cr": 12,
			"reference": "B159",
			"calc": {
				"points": -5
			},
			"features": [
				{
					"type": "skill_bonus",
					"amount": -5,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "fast talk"
					}
				}
			],
			"notes": "Make a self-control roll whenever you must keep silent about an uncomfortable truth (lying by omission). Roll at -5 if you actually have to tell a falsehood! If you fail, you blurt out the truth, or stumble so much that your lie is obvious.",
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "17e61cee-8dc4-458e-8921-091151d79f7f",
			"name": "Tunnel Vision",
			"physical": true,
			"base_points": -30,
			"reference": "B151",
			"calc": {
				"points": -30
			},
			"notes": "Your arc of vision is a 60° wedge to the front. On a map, your only “front” hex is the one directly ahead of you. The hexes to either side of this are “side” hexes: you are at -2 to defend against attacks from these hexes, and can only attack into those hexes with a Wild Swing. Everything else is a “back” hex and get no defense against attacks originating from these hexes!",
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "3d6a5886-3f8d-4791-a534-49cabbfe01d1",
			"name": "Tunneling (@Tunnel Move@)",
			"physical": true,
			"exotic": true,
			"levels": "1",
			"base_points": 30,
			"points_per_level": 5,
			"modifiers": [
				{
					"type": "modifier",
					"id": "c3853e67-58a3-4e2d-ad28-f4124fd87190",
					"disabled": true,
					"name": "Hands Free",
					"reference": "P86",
					"cost_type": "percentage",
					"cost": 20,
					"affects": "total"
				}
			],
			"reference": "B94,P85",
			"calc": {
				"points": 35
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "7f09780d-cf2e-4bbf-a298-955c2db1d87d",
			"name": "Ultrahearing",
			"physical": true,
			"exotic": true,
			"base_points": 5,
			"modifiers": [
				{
					"type": "modifier",
					"id": "3c71b0e5-430a-40cb-b636-ef24cdaeb2d7",
					"disabled": true,
					"name": "No normal hearing",
					"reference": "B94",
					"cost_type": "points",
					"cost": -5,
					"affects": "total"
				}
			],
			"reference": "B94,P51",
			"calc": {
				"points": 5
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "3c9a0dc8-a613-4393-926d-1a852dca573e",
			"name": "Ultrasonic Speech",
			"physical": true,
			"exotic": true,
			"base_points": 10,
			"modifiers": [
				{
					"type": "modifier",
					"id": "71cccfc7-736f-4346-b965-0edb9f302588",
					"disabled": true,
					"name": "No normal speech",
					"reference": "B94",
					"cost_type": "points",
					"cost": -10,
					"affects": "total"
				}
			],
			"reference": "B94,P78",
			"calc": {
				"points": 10
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "9eefee22-5376-4c67-b859-08270edc4a1f",
			"name": "Ultravision",
			"physical": true,
			"exotic": true,
			"base_points": 10,
			"modifiers": [
				{
					"type": "modifier",
					"id": "bcb7231c-671a-4fbb-97e2-dcc35515efd9",
					"disabled": true,
					"name": "No normal vision",
					"reference": "B94",
					"cost_type": "points",
					"cost": -10,
					"affects": "total"
				}
			],
			"reference": "B94,P87",
			"calc": {
				"points": 10
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "b6a3549e-9846-4804-a154-333ca65db098",
			"name": "Unaging",
			"physical": true,
			"exotic": true,
			"base_points": 15,
			"modifiers": [
				{
					"type": "modifier",
					"id": "7256aee3-3226-4e14-9c10-87232eece484",
					"disabled": true,
					"name": "Age Control",
					"reference": "B95",
					"cost_type": "percentage",
					"cost": 20,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "52f9365a-db53-4cc5-b156-1ec8665eae7a",
					"disabled": true,
					"name": "IQ Only",
					"reference": "RSWL24",
					"cost_type": "percentage",
					"cost": -75,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "90df7bd0-b7ce-4c69-ac5c-21e572284d8e",
					"disabled": true,
					"name": "Halt Aging, Weekly",
					"reference": "PSI18",
					"cost_type": "percentage",
					"cost": 80,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "717fa4d5-0e90-44fb-80bd-56f14201dae5",
					"disabled": true,
					"name": "Halt Aging, Monthly",
					"reference": "PSI18",
					"cost_type": "percentage",
					"cost": 100,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "f5973722-4956-4ba8-93cf-eb9240a0df1a",
					"disabled": true,
					"name": "Halt Aging, Yearly",
					"reference": "PSI18",
					"cost_type": "percentage",
					"cost": 130,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "419c44cc-71fd-4290-a008-99a1ec699e9e",
					"disabled": true,
					"name": "Life Extension",
					"reference": "PSI18",
					"cost_type": "percentage",
					"cost": -30,
					"affects": "total"
				}
			],
			"reference": "B95,PSI18",
			"calc": {
				"points": 15
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "ef5e65d3-97d2-4740-b8b6-7e1d276ed80c",
			"name": "Uncongenial",
			"mental": true,
			"base_points": -1,
			"reference": "B164",
			"calc": {
				"points": -1
			},
			"categories": [
				"Quirk"
			]
		},
		{
			"type": "advantage",
			"id": "fc67fbbc-cc02-4b89-8c06-fda830bece7a",
			"name": "Uncontrollable Appetite (@Craving@)",
			"mental": true,
			"supernatural": true,
			"base_points": -15,
			"cr": 12,
			"reference": "B159",
			"calc": {
				"points": -15
			},
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "94dc8d8d-b641-4e44-8483-c7a7cb7025d3",
			"name": "Unfazeable",
			"mental": true,
			"base_points": 15,
			"modifiers": [
				{
					"type": "modifier",
					"id": "afc741f6-01f8-48bc-936d-37d51b5cdd0e",
					"disabled": true,
					"name": "Familiar Horrors",
					"reference": "H20",
					"cost_type": "percentage",
					"cost": -50,
					"affects": "total"
				}
			],
			"reference": "B95",
			"calc": {
				"points": 15
			},
			"notes": "Exempt from fright checks. Reaction modifiers do not affect you.",
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "4246ef0a-1e5c-4b50-880c-3d864045a8cd",
			"name": "Unfit",
			"physical": true,
			"base_points": -5,
			"reference": "B160",
			"calc": {
				"points": -5
			},
			"features": [
				{
					"type": "conditional_modifier",
					"amount": -1,
					"situation": "to all HT rolls to remain conscious, avoid death, resist disease or poison, etc"
				}
			],
			"notes": "You lose FP at twice the normal rate",
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "ffbd60d0-0129-4dcb-aa26-61ccec0090e9",
			"name": "Unhealing (Partial)",
			"physical": true,
			"exotic": true,
			"base_points": -20,
			"reference": "B160",
			"calc": {
				"points": -20
			},
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "eaed264f-b27f-4782-a1d7-9cdadac807eb",
			"name": "Unhealing (Total)",
			"physical": true,
			"exotic": true,
			"base_points": -30,
			"reference": "B160",
			"calc": {
				"points": -30
			},
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "16989e33-3158-4242-9e04-5df2e962ee88",
			"name": "Unique",
			"mental": true,
			"supernatural": true,
			"base_points": -5,
			"reference": "B160",
			"calc": {
				"points": -5
			},
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "b85a7363-e124-409d-a1cf-1c036f0b661e",
			"name": "Universal Digestion",
			"physical": true,
			"base_points": 5,
			"modifiers": [
				{
					"type": "modifier",
					"id": "388a7c5c-9401-434e-9b00-2a1ae1345182",
					"disabled": true,
					"name": "Matter Eater",
					"reference": "P86",
					"cost_type": "percentage",
					"cost": 300,
					"affects": "total"
				}
			],
			"reference": "B95,P86",
			"calc": {
				"points": 5
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "3a07a25b-345f-45b7-9b98-cbf987f303cf",
			"name": "Unkillable",
			"physical": true,
			"exotic": true,
			"levels": "1",
			"points_per_level": 50,
			"modifiers": [
				{
					"type": "modifier",
					"id": "e5aad42d-1a27-4e56-bd3f-4255b63ad53e",
					"disabled": true,
					"name": "Achilles\' Heel",
					"reference": "B95",
					"cost_type": "percentage",
					"cost": -10,
					"affects": "total",
					"notes": "@Rare Achilles\' Heel@"
				},
				{
					"type": "modifier",
					"id": "77b68bdf-dc79-426c-bf60-d1088e2b8995",
					"disabled": true,
					"name": "Achilles\' Heel",
					"reference": "B95",
					"cost_type": "percentage",
					"cost": -30,
					"affects": "total",
					"notes": "@Occasional Achilles\' Heel@"
				},
				{
					"type": "modifier",
					"id": "29f555f1-c8d7-4784-89b0-f5ccceb7913b",
					"disabled": true,
					"name": "Achilles\' Heel",
					"reference": "B95",
					"cost_type": "percentage",
					"cost": -50,
					"affects": "total",
					"notes": "@Common Achilles\' Heel@"
				},
				{
					"type": "modifier",
					"id": "b4fc30cb-8cb2-4cfd-bf5f-dfcb979ad7a6",
					"disabled": true,
					"name": "Hindrance",
					"reference": "B95",
					"cost_type": "percentage",
					"cost": -5,
					"affects": "total",
					"notes": "@Rare Hindrance@"
				},
				{
					"type": "modifier",
					"id": "c66343ea-a4b9-4d67-8d8e-e98c08620c59",
					"disabled": true,
					"name": "Hindrance",
					"reference": "B95",
					"cost_type": "percentage",
					"cost": -15,
					"affects": "total",
					"notes": "@Occasional Hindrance@"
				},
				{
					"type": "modifier",
					"id": "b049e100-2717-4553-a305-32e27cdee805",
					"disabled": true,
					"name": "Hindrance",
					"reference": "B95",
					"cost_type": "percentage",
					"cost": -25,
					"affects": "total",
					"notes": "@Common Hindrance@"
				},
				{
					"type": "modifier",
					"id": "030e5b64-945c-4ade-9371-1877a9e5af38",
					"disabled": true,
					"name": "Reincarnation",
					"reference": "B95",
					"cost_type": "percentage",
					"cost": -20,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "07dcd8be-b172-4db7-a2c1-dc87c5d6cf78",
					"disabled": true,
					"name": "Trigger",
					"reference": "B95",
					"cost_type": "percentage",
					"cost": -25,
					"affects": "total",
					"notes": "@Rare Trigger@"
				},
				{
					"type": "modifier",
					"id": "e4d66c0e-a416-4d03-91d0-4636246c4e68",
					"disabled": true,
					"name": "Trigger",
					"reference": "B95",
					"cost_type": "percentage",
					"cost": -15,
					"affects": "total",
					"notes": "@Occasional Trigger@"
				},
				{
					"type": "modifier",
					"id": "9214eafb-595a-4f94-bd9f-8becb48fc2d9",
					"disabled": true,
					"name": "Trigger",
					"reference": "B95",
					"cost_type": "percentage",
					"cost": -5,
					"affects": "total",
					"notes": "@Common Trigger@"
				}
			],
			"reference": "B95",
			"calc": {
				"points": 50
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "8403b2c8-c654-4ef3-a219-c249fd72fcd3",
			"name": "Unluckiness",
			"mental": true,
			"base_points": -10,
			"reference": "B160",
			"calc": {
				"points": -10
			},
			"notes": "Once per play session, the GM will arbitrarily and maliciously make something go wrong for you.",
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "f04cfe61-c5c9-49d0-bc56-2e51f46b3d5e",
			"name": "Unnatural Features (@Description@)",
			"physical": true,
			"levels": "1",
			"points_per_level": -1,
			"reference": "B22",
			"calc": {
				"points": -1
			},
			"features": [
				{
					"type": "skill_bonus",
					"amount": -1,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "disguise"
					}
				},
				{
					"type": "skill_bonus",
					"amount": -1,
					"per_level": true,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "shadowing"
					}
				}
			],
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "6829ea2e-b704-4c86-a6eb-293046f36b53",
			"name": "Unusual Background",
			"mental": true,
			"reference": "B96",
			"calc": {
				"points": 0
			},
			"notes": "@Description@",
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "81151f68-6965-4aa4-ba09-f2cf026e2f12",
			"name": "Unusual Biochemistry",
			"physical": true,
			"base_points": -5,
			"reference": "B160",
			"calc": {
				"points": -5
			},
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "4cb64fe3-4692-41f8-aa63-811ef65143fb",
			"name": "Vacuum Support",
			"physical": true,
			"exotic": true,
			"base_points": 5,
			"reference": "B96",
			"calc": {
				"points": 5
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "801fb576-188c-4563-b07a-de39f220273a",
			"name": "Vampiric Bite",
			"physical": true,
			"exotic": true,
			"levels": "0",
			"base_points": 30,
			"points_per_level": 5,
			"reference": "B96",
			"calc": {
				"points": 30
			},
			"notes": "Drains 1 HP + 1/level per second. For every 3 HP stolen, you heal 1 HP or 1 FP (your choice). Also lets you bite in combat without feeding. Add Teeth (Sharp Teeth) or Teeth (Sharp Beak) – your choice for free.",
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "12b0ae2c-cb69-435a-b609-bfb8e80b6a5b",
			"name": "Versatile",
			"mental": true,
			"base_points": 5,
			"reference": "B96",
			"calc": {
				"points": 5
			},
			"features": [
				{
					"type": "conditional_modifier",
					"amount": 1,
					"situation": "on any task that requires creativity or invention, including most rolls against Artist skill and all Engineer rolls for new inventions"
				}
			],
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "05863de2-1328-4e43-970c-4819acf20690",
			"name": "Very Blessed",
			"mental": true,
			"supernatural": true,
			"base_points": 20,
			"reference": "B40",
			"calc": {
				"points": 20
			},
			"features": [
				{
					"type": "reaction_bonus",
					"amount": 2,
					"situation": "from followers of your diety"
				},
				{
					"type": "conditional_modifier",
					"amount": 5,
					"situation": "to interpret visions"
				}
			],
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "120798a3-772c-4f9f-b307-f960341e657c",
			"name": "Very Fat",
			"physical": true,
			"base_points": -5,
			"reference": "B19",
			"calc": {
				"points": -5
			},
			"prereqs": {
				"type": "prereq_list",
				"all": true,
				"prereqs": [
					{
						"type": "attribute_prereq",
						"has": true,
						"which": "ht",
						"qualifier": {
							"compare": "at_most",
							"qualifier": 13
						}
					}
				]
			},
			"features": [
				{
					"type": "skill_bonus",
					"amount": -3,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "disguise"
					}
				},
				{
					"type": "skill_bonus",
					"amount": -3,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "shadowing"
					}
				},
				{
					"type": "skill_bonus",
					"amount": 5,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "swimming"
					}
				},
				{
					"type": "conditional_modifier",
					"amount": 3,
					"situation": "to ST vs knockback"
				}
			],
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "47bf0965-9955-40e2-ba36-b52de2542178",
			"name": "Very Fit",
			"physical": true,
			"base_points": 15,
			"reference": "B55",
			"calc": {
				"points": 15
			},
			"features": [
				{
					"type": "conditional_modifier",
					"amount": 2,
					"situation": "to all HT rolls to stay conscious, avoid death, resist disease, resist poison"
				}
			],
			"notes": "Recover FP at twice the normal rate; lose FP at half the normal rate (in both cases, not FP spent for spells or psi powers)",
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "82a2b756-32fa-48ef-809d-35b0e81991b0",
			"name": "Very Rapid Healing",
			"physical": true,
			"base_points": 15,
			"reference": "B79",
			"calc": {
				"points": 15
			},
			"prereqs": {
				"type": "prereq_list",
				"all": true,
				"prereqs": [
					{
						"type": "attribute_prereq",
						"has": true,
						"which": "ht",
						"qualifier": {
							"compare": "at_least",
							"qualifier": 12
						}
					}
				]
			},
			"features": [
				{
					"type": "conditional_modifier",
					"amount": 5,
					"situation": "to effective HT when rolling to recover lost HP or to see if you can get over a crippling injury"
				}
			],
			"notes": "When you roll to recover lost HP, a successful HT roll means you heal 2 HP, not 1",
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "6966e2da-7bda-4aa4-a890-8d19b770af17",
			"name": "Very Unfit",
			"physical": true,
			"base_points": -15,
			"reference": "B160",
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
							"compare": "contains",
							"qualifier": "resistant"
						}
					}
				]
			},
			"features": [
				{
					"type": "conditional_modifier",
					"amount": -2,
					"situation": "-2 to all HT rolls to remain conscious, avoid death, resist disease or poison, etc."
				}
			],
			"notes": "You lose FP at twice the normal rate and recover FP at only half the normal rate",
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "bc9a7d9a-9ef3-4589-a2d6-f09f07f0c056",
			"name": "Very Wealthy",
			"social": true,
			"base_points": 30,
			"reference": "B25",
			"calc": {
				"points": 30
			},
			"notes": "Starting wealth is 20x normal",
			"categories": [
				"Advantage",
				"Wealth"
			]
		},
		{
			"type": "advantage",
			"id": "b0dc08f6-9cf5-4b08-b437-a3a928b0deb1",
			"name": "Vibration Sense",
			"physical": true,
			"exotic": true,
			"base_points": 10,
			"modifiers": [
				{
					"type": "modifier",
					"id": "37bbadbe-fb98-47a1-8916-8f97d4396149",
					"disabled": true,
					"name": "Universal",
					"reference": "B96",
					"cost_type": "percentage",
					"cost": 50,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "53aa8a14-a002-4113-985f-bab448ebbc27",
					"disabled": true,
					"name": "Sense of Perception",
					"reference": "P86",
					"cost_type": "percentage",
					"cost": 100,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "5c27538d-541d-420f-9833-563d6a839724",
					"disabled": true,
					"name": "Targeting",
					"reference": "P86",
					"cost_type": "percentage",
					"cost": 20,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "134bf0cb-7f3e-44f2-9b66-67a66f24f6f5",
					"name": "@Air or Water@",
					"cost_type": "percentage",
					"cost": 0,
					"affects": "total"
				}
			],
			"reference": "B96,P86",
			"calc": {
				"points": 10
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "db388b7e-3062-4d13-92d9-9a9a70ec4f6c",
			"name": "Visualization",
			"mental": true,
			"supernatural": true,
			"base_points": 10,
			"modifiers": [
				{
					"type": "modifier",
					"id": "11cfb558-09e6-4f68-ba6f-231e6f17ccd3",
					"disabled": true,
					"name": "Blessing",
					"reference": "P87",
					"cost_type": "percentage",
					"cost": 100,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "5f466600-f7d1-487a-9b2c-d4f3184cfa3d",
					"disabled": true,
					"name": "Blessing",
					"reference": "P87",
					"cost_type": "percentage",
					"cost": 0,
					"affects": "total",
					"notes": "Others Only"
				},
				{
					"type": "modifier",
					"id": "e8977719-ecbe-41dc-9ed1-eba732c8ef75",
					"disabled": true,
					"name": "Cursing",
					"reference": "P87",
					"cost_type": "percentage",
					"cost": 100,
					"affects": "total"
				}
			],
			"reference": "B96,P87",
			"calc": {
				"points": 10
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "82d0a957-dfa6-46f7-a3a8-f0f64c8a0600",
			"name": "Voice",
			"physical": true,
			"base_points": 10,
			"reference": "B97",
			"calc": {
				"points": 10
			},
			"features": [
				{
					"type": "skill_bonus",
					"amount": 2,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "diplomacy"
					}
				},
				{
					"type": "skill_bonus",
					"amount": 2,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "fast-talk"
					}
				},
				{
					"type": "skill_bonus",
					"amount": 2,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "starts_with",
						"qualifier": "mimicry"
					}
				},
				{
					"type": "skill_bonus",
					"amount": 2,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "performance"
					}
				},
				{
					"type": "skill_bonus",
					"amount": 2,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "politics"
					}
				},
				{
					"type": "skill_bonus",
					"amount": 2,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "public speaking"
					}
				},
				{
					"type": "skill_bonus",
					"amount": 2,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "sex appeal"
					}
				},
				{
					"type": "skill_bonus",
					"amount": 2,
					"selection_type": "skills_with_name",
					"name": {
						"compare": "is",
						"qualifier": "singing"
					}
				},
				{
					"type": "reaction_bonus",
					"amount": 2,
					"situation": "from others who can hear your voice"
				}
			],
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "895ec744-ce3d-4a91-a194-eb3d1c9f2520",
			"name": "Vow",
			"mental": true,
			"levels": "0",
			"base_points": -1,
			"reference": "B165",
			"calc": {
				"points": -1
			},
			"notes": "@Subject@",
			"categories": [
				"Quirk"
			]
		},
		{
			"type": "advantage",
			"id": "cda3c6b0-703d-4add-88eb-f6e887c2a57f",
			"name": "Vow",
			"physical": true,
			"modifiers": [
				{
					"type": "modifier",
					"id": "b86c5f36-bb6b-44b9-80c2-7ec8d2946da6",
					"disabled": true,
					"name": "Minor",
					"reference": "B161",
					"cost_type": "points",
					"cost": -5,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "9140caed-80fb-42d8-bd78-4dd02a1d5503",
					"disabled": true,
					"name": "Major",
					"reference": "B161",
					"cost_type": "points",
					"cost": -10,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "41f6d00c-96f0-4d02-930d-8d793808461b",
					"disabled": true,
					"name": "Great",
					"reference": "B161",
					"cost_type": "points",
					"cost": -15,
					"affects": "total"
				}
			],
			"reference": "B161",
			"calc": {
				"points": 0
			},
			"notes": "@Subject@",
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "8c0a6469-1b7b-49b1-879a-e50aa2bb9494",
			"name": "Vulnerability",
			"physical": true,
			"exotic": true,
			"modifiers": [
				{
					"type": "modifier",
					"id": "da840630-abbc-426e-a9e3-f7cd34ab0956",
					"disabled": true,
					"name": "@Rare attack@",
					"reference": "B161",
					"cost_type": "points",
					"cost": -5,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "c4f25bac-aec3-430a-b8e2-c5cc8ca62d3d",
					"disabled": true,
					"name": "@Occasional attack@",
					"reference": "B161",
					"cost_type": "points",
					"cost": -10,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "b94356f2-bfcd-4b44-afcf-9491a86b2ff9",
					"disabled": true,
					"name": "@Common attack@",
					"reference": "B161",
					"cost_type": "points",
					"cost": -15,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "c6e65360-efaf-470b-8f12-7e1ae885cf7e",
					"disabled": true,
					"name": "@Very common attack@",
					"reference": "B161",
					"cost_type": "points",
					"cost": -20,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "47f0d0dd-e3de-4212-9348-f73dd42804c6",
					"disabled": true,
					"name": "Wounding x2",
					"reference": "B161",
					"cost_type": "multiplier",
					"cost": 2
				},
				{
					"type": "modifier",
					"id": "7e490fc9-227f-4cab-86b7-6570ed3ec050",
					"disabled": true,
					"name": "Wounding x3",
					"reference": "B161",
					"cost_type": "multiplier",
					"cost": 3
				},
				{
					"type": "modifier",
					"id": "bcb496da-fb92-4f4a-a8bc-ade01ceacaa0",
					"disabled": true,
					"name": "Wounding x4",
					"reference": "B161",
					"cost_type": "multiplier",
					"cost": 4
				},
				{
					"type": "modifier",
					"id": "bac139dd-b536-4d88-aafa-fa927c454816",
					"disabled": true,
					"name": "Fatigue Only",
					"reference": "B161",
					"cost_type": "percentage",
					"cost": -50,
					"affects": "total"
				}
			],
			"reference": "B161",
			"calc": {
				"points": 0
			},
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "31b765ce-fe3a-400f-8181-df754beb4974",
			"name": "Walk On Air",
			"physical": true,
			"exotic": true,
			"base_points": 20,
			"modifiers": [
				{
					"type": "modifier",
					"id": "85643dea-ea4b-4279-a9e2-0d8046965699",
					"disabled": true,
					"name": "Specific",
					"reference": "P87",
					"cost_type": "percentage",
					"cost": -40,
					"affects": "total",
					"notes": "@Substance@"
				},
				{
					"type": "modifier",
					"id": "729023e1-4a16-410c-b6a8-d7607ddf6058",
					"disabled": true,
					"name": "Lighter than Air",
					"reference": "P87",
					"cost_type": "percentage",
					"cost": -10,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "33864f57-2bde-4629-8c1c-dbdc41abc4c0",
					"disabled": true,
					"name": "Maximum Height",
					"reference": "P87",
					"cost_type": "percentage",
					"cost": -10,
					"affects": "total",
					"notes": "30 ft"
				},
				{
					"type": "modifier",
					"id": "963a9505-1fdb-44f2-aaeb-a460b34599a1",
					"disabled": true,
					"name": "Maximum Height",
					"reference": "P87",
					"cost_type": "percentage",
					"cost": -20,
					"affects": "total",
					"notes": "10 ft"
				},
				{
					"type": "modifier",
					"id": "06c26894-41ba-4fb6-932c-24b438647ca0",
					"disabled": true,
					"name": "Maximum Height",
					"reference": "P87",
					"cost_type": "percentage",
					"cost": -25,
					"affects": "total",
					"notes": "5 ft"
				},
				{
					"type": "modifier",
					"id": "2c10462a-cd48-4bdd-83b7-5a1bed727293",
					"disabled": true,
					"name": "Vertical Only",
					"reference": "P87",
					"cost_type": "percentage",
					"cost": -25,
					"affects": "total"
				}
			],
			"reference": "B97,P87",
			"calc": {
				"points": 20
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "3cad081e-04bc-47ed-8fa7-ffd05152c881",
			"name": "Walk On Liquid",
			"physical": true,
			"exotic": true,
			"base_points": 15,
			"modifiers": [
				{
					"type": "modifier",
					"id": "aef1949d-a7fd-4ced-8e76-291fbb5b4627",
					"disabled": true,
					"name": "Specific",
					"reference": "P88",
					"cost_type": "percentage",
					"cost": -10,
					"affects": "total",
					"notes": "Water"
				},
				{
					"type": "modifier",
					"id": "a6af7572-f150-44e7-b01f-e9a53eed0951",
					"disabled": true,
					"name": "Submerged",
					"reference": "P88",
					"cost_type": "percentage",
					"cost": 20,
					"affects": "total"
				}
			],
			"reference": "B97,P88",
			"calc": {
				"points": 15
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "0c14e9c0-caf1-44b2-a421-19ccb1beabd2",
			"name": "Warp",
			"mental": true,
			"supernatural": true,
			"base_points": 100,
			"modifiers": [
				{
					"type": "modifier",
					"id": "fa453ba2-63c5-4a46-b2a2-f9c151b8051e",
					"disabled": true,
					"name": "Blind",
					"reference": "B98",
					"cost_type": "percentage",
					"cost": 50,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "e7a1ecaa-979c-4b99-8476-2d36a0760d40",
					"disabled": true,
					"name": "Extra Carrying Capacity",
					"reference": "B98",
					"cost_type": "percentage",
					"cost": 10,
					"affects": "total",
					"notes": "Up to Light Encumbrance"
				},
				{
					"type": "modifier",
					"id": "0b028d78-a4c2-4678-a3b9-62db19e0f20c",
					"disabled": true,
					"name": "Extra Carrying Capacity",
					"reference": "B98",
					"cost_type": "percentage",
					"cost": 20,
					"affects": "total",
					"notes": "Up to Medium Encumbrance"
				},
				{
					"type": "modifier",
					"id": "f776941e-a452-4561-9b61-90fd9678d7a5",
					"disabled": true,
					"name": "Extra Carrying Capacity",
					"reference": "B98",
					"cost_type": "percentage",
					"cost": 30,
					"affects": "total",
					"notes": "Up to Heavy Encumbrance"
				},
				{
					"type": "modifier",
					"id": "06a1eac8-8013-4a26-8229-93e1f7b2ae96",
					"disabled": true,
					"name": "Extra Carrying Capacity",
					"reference": "B98",
					"cost_type": "percentage",
					"cost": 50,
					"affects": "total",
					"notes": "Up to Extra-Heavy Encumbrance"
				},
				{
					"type": "modifier",
					"id": "bebd7371-8f3a-49e6-be44-94a1cece4389",
					"disabled": true,
					"name": "Reliable",
					"reference": "B98",
					"cost_type": "percentage",
					"cost": 5,
					"affects": "total",
					"levels": 1
				},
				{
					"type": "modifier",
					"id": "5aa90ba6-fc21-429b-a5e1-d5f7b919d649",
					"disabled": true,
					"name": "Warp Jump",
					"reference": "B98",
					"cost_type": "percentage",
					"cost": 10,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "175b2e2a-a52c-4f1d-a85b-2eb7cbd38571",
					"disabled": true,
					"name": "Hyperjump",
					"reference": "B98",
					"cost_type": "percentage",
					"cost": -50,
					"affects": "total",
					"notes": "Speed of light"
				},
				{
					"type": "modifier",
					"id": "e9d50847-faa5-4b9c-9915-5598c8bd3f5a",
					"disabled": true,
					"name": "Hyperjump",
					"reference": "B98",
					"cost_type": "percentage",
					"cost": -25,
					"affects": "total",
					"notes": "One light-year per day"
				},
				{
					"type": "modifier",
					"id": "5d45f27f-9974-469b-8d76-b08c2db89871",
					"disabled": true,
					"name": "Naked",
					"reference": "B99",
					"cost_type": "percentage",
					"cost": -30,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "85253f7c-3ada-41c5-9f8f-23a28b892870",
					"disabled": true,
					"name": "Range Limit",
					"reference": "B99",
					"cost_type": "percentage",
					"cost": -50,
					"affects": "total",
					"notes": "10 yards"
				},
				{
					"type": "modifier",
					"id": "9d738702-01ee-42e4-a71c-4e826ab37197",
					"disabled": true,
					"name": "Range Limit",
					"reference": "B99",
					"cost_type": "percentage",
					"cost": -45,
					"affects": "total",
					"notes": "20 yards"
				},
				{
					"type": "modifier",
					"id": "65ec703e-f087-420c-8ff8-9fc4c77ca763",
					"disabled": true,
					"name": "Range Limit",
					"reference": "B99",
					"cost_type": "percentage",
					"cost": -40,
					"affects": "total",
					"notes": "100 yards"
				},
				{
					"type": "modifier",
					"id": "689af1e5-e750-474a-9de8-71508e4d0984",
					"disabled": true,
					"name": "Range Limit",
					"reference": "B99",
					"cost_type": "percentage",
					"cost": -35,
					"affects": "total",
					"notes": "500 yards"
				},
				{
					"type": "modifier",
					"id": "7d645d29-3d56-4355-a005-503cdb9368b2",
					"disabled": true,
					"name": "Range Limit",
					"reference": "B99",
					"cost_type": "percentage",
					"cost": -30,
					"affects": "total",
					"notes": "2 miles"
				},
				{
					"type": "modifier",
					"id": "e87e00a8-6b93-4068-9730-b95943411c73",
					"disabled": true,
					"name": "Range Limit",
					"reference": "B99",
					"cost_type": "percentage",
					"cost": -25,
					"affects": "total",
					"notes": "10 miles"
				},
				{
					"type": "modifier",
					"id": "41ecd4d1-5e0e-4ddb-86a0-5563213c0e5a",
					"disabled": true,
					"name": "Range Limit",
					"reference": "B99",
					"cost_type": "percentage",
					"cost": -20,
					"affects": "total",
					"notes": "100 miles"
				},
				{
					"type": "modifier",
					"id": "d015913d-213c-4e7a-84d4-b4f22106b921",
					"disabled": true,
					"name": "Range Limit",
					"reference": "B99",
					"cost_type": "percentage",
					"cost": -15,
					"affects": "total",
					"notes": "1000 miles"
				},
				{
					"type": "modifier",
					"id": "19a309ef-a24e-458f-8620-9e294c336f10",
					"disabled": true,
					"name": "Range Limit",
					"reference": "B99",
					"cost_type": "percentage",
					"cost": -10,
					"affects": "total",
					"notes": "10000 miles"
				},
				{
					"type": "modifier",
					"id": "c6f4912c-8e50-465b-a289-878d0a1e15d3",
					"disabled": true,
					"name": "Range Limit",
					"reference": "B99",
					"cost_type": "percentage",
					"cost": -5,
					"affects": "total",
					"notes": "100000 miles"
				},
				{
					"type": "modifier",
					"id": "3415af0e-bc70-4c29-9787-e4ccdc6e6ad5",
					"disabled": true,
					"name": "Blink",
					"reference": "P89",
					"cost_type": "percentage",
					"cost": 25,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "08abf997-65c7-4daf-b8c6-356633295c64",
					"disabled": true,
					"name": "No Strain",
					"reference": "P89",
					"cost_type": "percentage",
					"cost": 25,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "540a38c2-b1b1-4ac8-9297-a6cddb0950ad",
					"disabled": true,
					"name": "Tracking",
					"reference": "P89",
					"cost_type": "percentage",
					"cost": 20,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "eee2c5dd-330b-4ad7-932a-3a800cf480f2",
					"disabled": true,
					"name": "Tunnel",
					"reference": "P89",
					"cost_type": "percentage",
					"cost": 100,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "1505bef3-10be-4ff6-9f5e-d636f0d08753",
					"disabled": true,
					"name": "Tunnel",
					"reference": "P89",
					"cost_type": "percentage",
					"cost": 40,
					"affects": "total",
					"notes": "After teleport"
				},
				{
					"type": "modifier",
					"id": "66198645-14d1-4bb1-ae70-88971e74c7b8",
					"disabled": true,
					"name": "Anchored",
					"reference": "P89",
					"cost_type": "percentage",
					"cost": -50,
					"affects": "total",
					"notes": "Changable"
				},
				{
					"type": "modifier",
					"id": "a434e802-1dd5-424c-93bf-19edc13bca09",
					"disabled": true,
					"name": "Anchored",
					"reference": "P89",
					"cost_type": "percentage",
					"cost": -60,
					"affects": "total",
					"notes": "Item"
				},
				{
					"type": "modifier",
					"id": "2d09c2f8-c762-4c06-a8de-d57b5dcf5879",
					"disabled": true,
					"name": "Anchored",
					"reference": "P89",
					"cost_type": "percentage",
					"cost": -80,
					"affects": "total",
					"notes": "Fixed Site"
				},
				{
					"type": "modifier",
					"id": "32b16a16-d871-4b71-8d1e-f696c926de42",
					"disabled": true,
					"name": "Blind Only",
					"reference": "P89",
					"cost_type": "percentage",
					"cost": -50,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "afd08849-73ff-4859-9c87-f6a1587f1913",
					"disabled": true,
					"name": "Drift",
					"reference": "P89",
					"cost_type": "percentage",
					"cost": -15,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "1bdaf0e2-6b47-4575-85d5-58f248fd86bd",
					"disabled": true,
					"name": "Projection",
					"reference": "P58",
					"cost_type": "percentage",
					"cost": -50,
					"affects": "total",
					"notes": "Can\'t Affect"
				},
				{
					"type": "modifier",
					"id": "65549b1d-1289-43d5-a072-7e2a5af7eb97",
					"disabled": true,
					"name": "Projection",
					"reference": "P58",
					"cost_type": "percentage",
					"cost": 0,
					"affects": "total",
					"notes": "Can use abilities"
				},
				{
					"type": "modifier",
					"id": "cf2a1098-eab8-482b-b0ce-7dc7e8b556bf",
					"disabled": true,
					"name": "Special Portal",
					"reference": "P89",
					"cost_type": "percentage",
					"cost": 0,
					"affects": "total",
					"notes": "@Portal@"
				},
				{
					"type": "modifier",
					"id": "9b3a00be-a573-47ca-b570-3410f66c9816",
					"disabled": true,
					"name": "Mental Carrying Capacity",
					"reference": "SU29",
					"cost_type": "percentage",
					"cost": 20,
					"affects": "total",
					"notes": "MBL: @MBL@ lb"
				},
				{
					"type": "modifier",
					"id": "489424bd-5aeb-48c7-b802-8a4b225acdb3",
					"disabled": true,
					"name": "Rapid Fire",
					"reference": "SU29",
					"cost_type": "percentage",
					"cost": 0,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "8e4ec136-231a-46e7-9447-8ed4a5e6d74d",
					"disabled": true,
					"name": "Telekinetic Carrying Capacity",
					"reference": "SU29",
					"cost_type": "percentage",
					"cost": 20,
					"affects": "total",
					"notes": "TBL: @TBL@ lb"
				},
				{
					"type": "modifier",
					"id": "5a26237f-518d-4fa4-bdb9-8d2f7c7e103f",
					"disabled": true,
					"name": "Exoteleport",
					"reference": "SU30",
					"cost_type": "percentage",
					"cost": -50,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "a6748f97-f017-43b9-8796-a02943919965",
					"disabled": true,
					"name": "Gyroscopic",
					"reference": "PSI18",
					"cost_type": "percentage",
					"cost": 10,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "22f3f9f9-92ad-4083-bc58-1ddac276fb07",
					"disabled": true,
					"name": "Blink Only",
					"reference": "PSI18",
					"cost_type": "percentage",
					"cost": -60,
					"affects": "total"
				}
			],
			"reference": "B97,P88,PSI18",
			"calc": {
				"points": 100
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "8c6dd44c-8c68-4ee1-a57a-d8ebd9b73803",
			"name": "Weak Bite",
			"physical": true,
			"exotic": true,
			"base_points": -2,
			"weapons": [
				{
					"type": "melee_weapon",
					"damage": {
						"type": "cr",
						"st": "thr",
						"base": "-1",
						"modifier_per_die": -2
					},
					"usage": "Bite",
					"reach": "C",
					"parry": "No",
					"block": "No",
					"calc": {
						"level": 0,
						"parry": "No",
						"block": "No",
						"damage": "thr-1 (-2 per die) cr"
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
			"reference": "B161",
			"calc": {
				"points": -2
			},
			"categories": [
				"Animal",
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "b2613fac-cb20-4a44-8b17-371503f41a2e",
			"name": "Weakness",
			"physical": true,
			"exotic": true,
			"modifiers": [
				{
					"type": "modifier",
					"id": "e28bd392-7fd5-45de-a3e3-ec49aec2343a",
					"disabled": true,
					"name": "1d damage per minute",
					"reference": "B161",
					"cost_type": "points",
					"cost": -20,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "4b9dd12d-fa84-462d-b67b-0d27f2f9d3fc",
					"disabled": true,
					"name": "1d damage per 5 minutes",
					"reference": "B161",
					"cost_type": "points",
					"cost": -10,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "e16e7fb5-1597-4644-ac36-07144d853209",
					"disabled": true,
					"name": "1d damage per 30 minutes",
					"reference": "B161",
					"cost_type": "points",
					"cost": -5,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "186bbe2a-9b7e-4879-9dbb-43dddeb6058d",
					"disabled": true,
					"name": "@Rare Substance@",
					"reference": "B161",
					"cost_type": "multiplier",
					"cost": 0.5
				},
				{
					"type": "modifier",
					"id": "636139b9-3bf4-4642-8ad9-9d98b669cf91",
					"disabled": true,
					"name": "@Occasional Substance@",
					"reference": "B161",
					"cost_type": "multiplier",
					"cost": 1
				},
				{
					"type": "modifier",
					"id": "4723bd7d-4a86-45f2-a8e9-2a957d11a501",
					"disabled": true,
					"name": "@Common Substance@",
					"reference": "B161",
					"cost_type": "multiplier",
					"cost": 2
				},
				{
					"type": "modifier",
					"id": "722875e1-a8c4-49a7-af43-0ccd82a3691e",
					"disabled": true,
					"name": "@Very Common Substance@",
					"reference": "B161",
					"cost_type": "multiplier",
					"cost": 3
				},
				{
					"type": "modifier",
					"id": "081ff60c-7208-4ef7-b07a-3f6b24952f3f",
					"disabled": true,
					"name": "Fatigue Only",
					"reference": "B161",
					"cost_type": "percentage",
					"cost": -50,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "0d8aebdd-50b8-4377-9cac-294d221a3fc4",
					"disabled": true,
					"name": "Variable",
					"reference": "B161",
					"cost_type": "percentage",
					"cost": -40,
					"affects": "total"
				}
			],
			"reference": "B161",
			"calc": {
				"points": 0
			},
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "e8c6cf29-d42d-4cd8-8464-d769abceb98f",
			"name": "Wealthy",
			"social": true,
			"base_points": 20,
			"reference": "B25",
			"calc": {
				"points": 20
			},
			"notes": "Starting wealth is 5x normal",
			"categories": [
				"Advantage",
				"Wealth"
			]
		},
		{
			"type": "advantage",
			"id": "d1636dec-2bef-4f85-8869-b1458f9bf698",
			"name": "Weapon Master (@Specialty@)",
			"mental": true,
			"modifiers": [
				{
					"type": "modifier",
					"id": "8cd2d8e2-a670-4e01-b814-7becfb6a9422",
					"disabled": true,
					"name": "One weapon",
					"reference": "B99",
					"cost_type": "points",
					"cost": 20,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "9b9849fc-952f-4492-8778-42398ef38429",
					"disabled": true,
					"name": "Two weapons",
					"reference": "B99",
					"cost_type": "points",
					"cost": 25,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "5a9f4e6e-b31b-4ade-8c3d-5361905efbf6",
					"disabled": true,
					"name": "Small class",
					"reference": "B99",
					"cost_type": "points",
					"cost": 30,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "3a13bb8a-02f5-4433-926b-243a8de165ef",
					"disabled": true,
					"name": "Medium class",
					"reference": "B99",
					"cost_type": "points",
					"cost": 35,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "5b3fb3ba-0062-4ff1-833f-bb9b23fe67b3",
					"disabled": true,
					"name": "Large class",
					"reference": "B99",
					"cost_type": "points",
					"cost": 40,
					"affects": "total"
				}
			],
			"reference": "B99,MA48",
			"calc": {
				"points": 0
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "dc714952-248f-4334-9531-77fbc8507663",
			"name": "Weapon Master (All weapons)",
			"mental": true,
			"base_points": 45,
			"reference": "B99,MA48",
			"calc": {
				"points": 45
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "087fb069-abb3-4f8b-b2ce-660a53b22186",
			"name": "Weirdness Magnet",
			"mental": true,
			"supernatural": true,
			"base_points": -15,
			"modifiers": [
				{
					"type": "modifier",
					"id": "966289db-d5f0-4670-9498-27d9cbd2872e",
					"disabled": true,
					"name": "Origins Magnet",
					"reference": "SU32",
					"cost_type": "percentage",
					"cost": 0,
					"affects": "total"
				}
			],
			"reference": "B161",
			"calc": {
				"points": -15
			},
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "ea12c6b5-ee57-4b9f-8f03-cced31a1a5f3",
			"name": "Wild Talent",
			"mental": true,
			"supernatural": true,
			"levels": "1",
			"points_per_level": 20,
			"modifiers": [
				{
					"type": "modifier",
					"id": "18b55b1d-d84e-4ec0-b8ed-77ef64d222f6",
					"disabled": true,
					"name": "Retention",
					"reference": "B99",
					"cost_type": "percentage",
					"cost": 25,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "50202ec6-a2c5-4557-80f1-1e29b7ec89fd",
					"disabled": true,
					"name": "Emergencies Only",
					"reference": "B100",
					"cost_type": "percentage",
					"cost": -30,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "10fddeca-5320-4639-ab4e-e986f0efb986",
					"disabled": true,
					"name": "Focused",
					"reference": "B99",
					"cost_type": "percentage",
					"cost": -20,
					"affects": "total",
					"notes": "@Type: Mental, Physical, Magical or Chi@"
				},
				{
					"type": "modifier",
					"id": "6b947b4f-1cbe-444d-89f4-a9c35cba90fc",
					"disabled": true,
					"name": "Wild Ability",
					"reference": "P90",
					"cost_type": "percentage",
					"cost": 50,
					"affects": "total"
				},
				{
					"type": "modifier",
					"id": "e28ca336-e0c0-47b9-b547-49d38ceb5b1b",
					"disabled": true,
					"name": "External",
					"reference": "P90",
					"cost_type": "percentage",
					"cost": -20,
					"affects": "total"
				}
			],
			"reference": "B99,P89,MA49",
			"calc": {
				"points": 20
			},
			"categories": [
				"Advantage"
			]
		},
		{
			"type": "advantage",
			"id": "ee1c0420-ae79-4450-ba08-1ab81fa62259",
			"name": "Workaholic",
			"physical": true,
			"base_points": -5,
			"reference": "B162",
			"calc": {
				"points": -5
			},
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "3b2d1b82-0a5c-40b2-9816-5948ff887258",
			"name": "Wounded",
			"physical": true,
			"base_points": -5,
			"reference": "B162",
			"calc": {
				"points": -5
			},
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "c917d444-3f99-4637-a76e-08dd119fe533",
			"name": "Xenophilia",
			"mental": true,
			"base_points": -10,
			"cr": 12,
			"reference": "B162",
			"calc": {
				"points": -10
			},
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "adb17f78-15a1-47d8-a4e1-65c011e6bafb",
			"name": "Xenophobia (Strange and Unknown Things)",
			"mental": true,
			"base_points": -15,
			"cr": 12,
			"cr_adj": "action_penalty",
			"reference": "B150",
			"calc": {
				"points": -15
			},
			"notes": "You are upset by any sort of strange circumstances, and in particular by strange people. Make a self-control roll when surrounded by people of another race or nationality; roll at -3 if the people are not human. If you lose control, you might well attack strangers out of fear.",
			"categories": [
				"Disadvantage"
			]
		},
		{
			"type": "advantage",
			"id": "b35faada-beef-4615-81c4-0fe76df9bc80",
			"name": "Zeroed",
			"social": true,
			"base_points": 10,
			"reference": "B100",
			"calc": {
				"points": 10
			},
			"categories": [
				"Advantage"
			]
		}
	]
}');


