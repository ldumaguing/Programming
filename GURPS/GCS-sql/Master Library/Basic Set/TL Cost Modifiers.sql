insert into GCS (FolderId, Filename, Stuffs) values (
15,
'TL Cost Modifiers',
'{
	"type": "eqp_modifier_list",
	"version": 2,
	"id": "18295ea1-4369-46a1-82a5-407d578f6e08",
	"rows": [
		{
			"type": "eqp_modifier_container",
			"id": "33eec32e-cbd6-4fa2-95aa-bfa04a2b9ff8",
			"disabled": true,
			"name": "Cost Factors",
			"open": true,
			"children": [
				{
					"type": "eqp_modifier",
					"id": "2526e681-ecf1-4f03-83fa-2c091b0bda6a",
					"name": "TL +1 CF",
					"reference": "B27",
					"cost_type": "to_base_cost",
					"cost": "+1 CF"
				},
				{
					"type": "eqp_modifier",
					"id": "718a8d44-52a7-4a41-a64f-f70b9cb0e136",
					"name": "TL +2 CF",
					"reference": "B27",
					"cost_type": "to_base_cost",
					"cost": "+3 CF"
				},
				{
					"type": "eqp_modifier",
					"id": "1b2b7516-a453-476d-9904-0a865755038d",
					"name": "TL +3 CF",
					"reference": "B27",
					"cost_type": "to_base_cost",
					"cost": "+7 CF"
				},
				{
					"type": "eqp_modifier",
					"id": "07cd7898-0323-4908-9b4a-aaec2128bfc9",
					"name": "TL +4 CF",
					"reference": "B27",
					"cost_type": "to_base_cost",
					"cost": "+15 CF"
				},
				{
					"type": "eqp_modifier",
					"id": "defb53f5-28e9-45d0-9083-85e637bae7ac",
					"name": "TL +5 CF",
					"reference": "B27",
					"cost_type": "to_base_cost",
					"cost": "+31 CF"
				}
			]
		},
		{
			"type": "eqp_modifier_container",
			"id": "adce602f-3cb4-4184-a81e-7f488b1a104e",
			"disabled": true,
			"name": "Multipliers",
			"open": true,
			"children": [
				{
					"type": "eqp_modifier",
					"id": "22a7538b-b842-4c0d-91a5-4434a7551495",
					"name": "TL +1",
					"reference": "B27",
					"cost_type": "to_base_cost",
					"cost": "x2"
				},
				{
					"type": "eqp_modifier",
					"id": "896db01f-6a47-429a-bf0a-658544726c93",
					"name": "TL +2",
					"reference": "B27",
					"cost_type": "to_base_cost",
					"cost": "x4"
				},
				{
					"type": "eqp_modifier",
					"id": "087f6a5c-267d-4fa1-b277-e4830b060625",
					"name": "TL +3",
					"reference": "B27",
					"cost_type": "to_base_cost",
					"cost": "x8"
				},
				{
					"type": "eqp_modifier",
					"id": "a7f42c16-f951-4248-ab54-5ac90276052e",
					"name": "TL +4",
					"reference": "B27",
					"cost_type": "to_base_cost",
					"cost": "x16"
				},
				{
					"type": "eqp_modifier",
					"id": "5926470f-75d1-4b4d-9f8d-393977069730",
					"name": "TL +5",
					"reference": "B27",
					"cost_type": "to_base_cost",
					"cost": "x32"
				}
			]
		}
	]
}');


