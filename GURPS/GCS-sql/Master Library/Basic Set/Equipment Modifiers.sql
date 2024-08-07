insert into GCS (FolderId, Filename, Stuffs) values (
15,
'Equipment Modifiers',
'{
	"type": "eqp_modifier_list",
	"version": 2,
	"id": "945608e7-f7f1-4355-a8cf-02d292e7ab82",
	"rows": [
		{
			"type": "eqp_modifier_container",
			"id": "04f61624-9ebc-4ce9-ac6f-b381e359f3ac",
			"disabled": true,
			"name": "Weapon Quality",
			"open": true,
			"children": [
				{
					"type": "eqp_modifier_container",
					"id": "deeb1400-a8b7-4e33-8f8c-5e747507c63d",
					"disabled": true,
					"name": "Blowpipe, Bow & Crossbow Weapon Quality",
					"reference": "B277",
					"open": true,
					"children": [
						{
							"type": "eqp_modifier",
							"id": "a82d5d92-78d3-418d-a4d3-9f4e4100ffb0",
							"name": "Fine Quality",
							"reference": "B277",
							"cost_type": "to_base_cost",
							"cost": "x4",
							"notes": "Increase 1/2D and Max range by 20%"
						}
					]
				},
				{
					"type": "eqp_modifier_container",
					"id": "4966e73f-b195-483b-a04c-978ac9138624",
					"disabled": true,
					"name": "Firearm Weapon Quality",
					"reference": "B280",
					"open": true,
					"children": [
						{
							"type": "eqp_modifier",
							"id": "6ed41037-feef-407e-a166-d97d0a32d684",
							"name": "Fine Quality",
							"reference": "B280",
							"cost_type": "to_base_cost",
							"cost": "x2",
							"notes": "+1 to Acc; +1 to Malf"
						},
						{
							"type": "eqp_modifier",
							"id": "98591a98-c689-44a7-b1c8-e4d002acb453",
							"name": "Very Fine Quality",
							"reference": "B280",
							"cost_type": "to_base_cost",
							"cost": "x5",
							"notes": "+2 to Acc; +1 to Malf"
						}
					]
				},
				{
					"type": "eqp_modifier_container",
					"id": "f373d17e-1f6b-4312-88a0-d3a4a18bcd76",
					"disabled": true,
					"name": "Melee, Thrown, Arrow & Bolt Weapon Quality",
					"reference": "B274",
					"notes": "Weapon damage is included in the modifiers",
					"open": true,
					"children": [
						{
							"type": "eqp_modifier_container",
							"id": "8efb201a-db64-47bd-8ac3-d0ea85f55740",
							"disabled": true,
							"name": "TL6 or less",
							"reference": "B274",
							"open": true,
							"children": [
								{
									"type": "eqp_modifier",
									"id": "e1f0980b-eec4-4e27-9e56-9c0a797417cd",
									"name": "Cheap Quality",
									"reference": "B274",
									"cost_type": "to_base_cost",
									"cost": "x0.4",
									"notes": "+2 to break, -1 Acc if thrown"
								},
								{
									"type": "eqp_modifier",
									"id": "41229252-0fe2-4b85-97b8-bfcc440808d6",
									"name": "Fine Quality",
									"reference": "B274",
									"cost_type": "to_base_cost",
									"cost": "x4",
									"features": [
										{
											"type": "weapon_bonus",
											"amount": 1,
											"selection_type": "this_weapon"
										}
									],
									"notes": "-1 to break; blades only"
								},
								{
									"type": "eqp_modifier",
									"id": "58c7080b-005b-4677-804f-3d31df72ce66",
									"name": "Fine Quality",
									"reference": "B274",
									"cost_type": "to_base_cost",
									"cost": "x3",
									"notes": "-1 to break; for non-blades that do only crushing or impaling damage"
								},
								{
									"type": "eqp_modifier",
									"id": "5ab0e073-5309-4caa-a2c0-e62488d5d25e",
									"name": "Fine Quality",
									"reference": "B274",
									"cost_type": "to_base_cost",
									"cost": "x10",
									"features": [
										{
											"type": "weapon_bonus",
											"amount": 1,
											"selection_type": "this_weapon"
										}
									],
									"notes": "-1 to break; for non-blades that do cutting damage"
								},
								{
									"type": "eqp_modifier",
									"id": "431dc28d-d5cd-45e8-ba48-591362d71614",
									"name": "Very Fine Quality",
									"reference": "B274",
									"cost_type": "to_base_cost",
									"cost": "x20",
									"features": [
										{
											"type": "weapon_bonus",
											"amount": 2,
											"selection_type": "this_weapon"
										}
									],
									"notes": "-2 to break; for fencing weapons and swords only"
								}
							]
						},
						{
							"type": "eqp_modifier_container",
							"id": "5b0fe0f0-124d-4410-acea-25e2a687d934",
							"disabled": true,
							"name": "TL7 or greater",
							"reference": "B274",
							"open": true,
							"children": [
								{
									"type": "eqp_modifier",
									"id": "e225f88d-21c7-4d77-a0df-13d9acc48d24",
									"name": "Cheap Quality",
									"reference": "B274",
									"cost_type": "to_base_cost",
									"cost": "x0.2",
									"notes": "+2 to break, -1 Acc if thrown"
								},
								{
									"type": "eqp_modifier",
									"id": "5121cc2f-efd9-4ad5-b4b4-882fb5d86630",
									"name": "Good Quality",
									"reference": "B274",
									"cost_type": "to_base_cost",
									"cost": "x0.4"
								},
								{
									"type": "eqp_modifier",
									"id": "6328780f-a1e3-41b4-8661-2b306b86b960",
									"name": "Fine Quality",
									"reference": "B274",
									"features": [
										{
											"type": "weapon_bonus",
											"amount": 1,
											"selection_type": "this_weapon"
										}
									],
									"notes": "-1 to break; for blades that do cutting and impaling damage"
								},
								{
									"type": "eqp_modifier",
									"id": "41b1736e-bf77-4dd6-83f3-8923bb4d5309",
									"name": "Very Fine Quality",
									"reference": "B274",
									"cost_type": "to_base_cost",
									"cost": "x4",
									"features": [
										{
											"type": "weapon_bonus",
											"amount": 2,
											"selection_type": "this_weapon"
										}
									],
									"notes": "-2 to break; +2 to cutting and impaling damage; for fencing weapons and swords only"
								},
								{
									"type": "eqp_modifier",
									"id": "02151d9e-7f86-4be4-bd12-eae88f8f0c12",
									"name": "Fine Quality",
									"reference": "B274",
									"notes": "-1 to break; for other weapons"
								}
							]
						}
					]
				}
			]
		},
		{
			"type": "eqp_modifier",
			"id": "14b76b22-60e4-42ff-94c2-d3ae2d0fb1b9",
			"name": "Silver",
			"reference": "B275",
			"cost_type": "to_base_cost",
			"cost": "x19",
			"notes": "+2 to break"
		},
		{
			"type": "eqp_modifier",
			"id": "d94a64f0-47ba-48e6-9cb1-285dd5d0c780",
			"name": "Silver-coated",
			"reference": "B275",
			"cost_type": "to_base_cost",
			"cost": "x2",
			"notes": "Reduced wounding multiplier to vulnerable targets: x2 becomes x1.5, x3 becomes x2, x4 becomes x3"
		},
		{
			"type": "eqp_modifier",
			"id": "c49a7edd-1c86-4e0f-962b-c4e1b083060c",
			"name": "Silver Bullets",
			"reference": "B275",
			"cost_type": "to_base_cost",
			"cost": "x49"
		}
	]
}');


