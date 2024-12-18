insert into GCS (FolderId, Filename, Stuffs) values (
15,
'Enhancement Modifiers',
'{
	"type": "modifier_list",
	"version": 2,
	"id": "de1ed933-5cfe-4628-aa1d-c746174ed2f4",
	"rows": [
		{
			"type": "modifier",
			"id": "4c9ca0f0-c156-492f-bfb3-fabf4e068403",
			"name": "2x Increased Range",
			"reference": "B106",
			"cost_type": "percentage",
			"cost": 10,
			"affects": "total"
		},
		{
			"type": "modifier",
			"id": "c5243942-ebce-4fcc-82cd-5d0904dc2c79",
			"name": "2x Increased 1/2 D Range",
			"reference": "B106",
			"cost_type": "percentage",
			"cost": 5,
			"affects": "total"
		},
		{
			"type": "modifier",
			"id": "7e78d8eb-520d-425e-bb42-2c20e0bc3379",
			"name": "3x Duration",
			"reference": "B105",
			"cost_type": "percentage",
			"cost": 20,
			"affects": "total"
		},
		{
			"type": "modifier",
			"id": "1cd6ffc6-df75-4c48-9522-c62136b9780d",
			"name": "5x Increased Range",
			"reference": "B106",
			"cost_type": "percentage",
			"cost": 20,
			"affects": "total"
		},
		{
			"type": "modifier",
			"id": "9a8980a3-f42f-4422-b122-068888d32a54",
			"name": "5x Increased 1/2 D Range",
			"reference": "B106",
			"cost_type": "percentage",
			"cost": 10,
			"affects": "total"
		},
		{
			"type": "modifier",
			"id": "67faee7a-d439-483b-a29b-b6b9a984015d",
			"name": "10x Duration",
			"reference": "B105",
			"cost_type": "percentage",
			"cost": 40,
			"affects": "total"
		},
		{
			"type": "modifier",
			"id": "4624da5e-a53f-498b-8c75-735eb16bda40",
			"name": "10x Increased Range",
			"reference": "B106",
			"cost_type": "percentage",
			"cost": 30,
			"affects": "total"
		},
		{
			"type": "modifier",
			"id": "f54830fe-ff81-41d4-a832-cd0b33da604e",
			"name": "10x Increased 1/2 D Range",
			"reference": "B106",
			"cost_type": "percentage",
			"cost": 15,
			"affects": "total"
		},
		{
			"type": "modifier",
			"id": "d2a89287-e2bd-429c-9d3b-cc0c2aed12dd",
			"name": "20x Increased Range",
			"reference": "B106",
			"cost_type": "percentage",
			"cost": 40,
			"affects": "total"
		},
		{
			"type": "modifier",
			"id": "4f4fbb60-8825-4c85-a8ea-791cc97521e1",
			"name": "30x Duration",
			"reference": "B105",
			"cost_type": "percentage",
			"cost": 60,
			"affects": "total"
		},
		{
			"type": "modifier",
			"id": "8a762b96-e0db-4cab-9f63-cfd5ece16e49",
			"name": "50x Increased Range",
			"reference": "B106",
			"cost_type": "percentage",
			"cost": 50,
			"affects": "total"
		},
		{
			"type": "modifier",
			"id": "38c799ea-b229-4438-9595-3509bafc37ad",
			"name": "100x Duration",
			"reference": "B105",
			"cost_type": "percentage",
			"cost": 80,
			"affects": "total"
		},
		{
			"type": "modifier",
			"id": "bd49dd83-b27c-42f6-972d-88e4a1f8d985",
			"name": "100x Increased Range",
			"reference": "B106",
			"cost_type": "percentage",
			"cost": 60,
			"affects": "total"
		},
		{
			"type": "modifier",
			"id": "f067101b-6eaa-4432-97ee-44238c07ec00",
			"name": "300x Duration",
			"reference": "B105",
			"cost_type": "percentage",
			"cost": 100,
			"affects": "total"
		},
		{
			"type": "modifier",
			"id": "15f3c08c-e5a2-495d-9c9f-30a4a964f30e",
			"name": "1000x Duration",
			"reference": "B105",
			"cost_type": "percentage",
			"cost": 120,
			"affects": "total"
		},
		{
			"type": "modifier",
			"id": "219bf44f-0974-43f4-b76f-bd55001112f7",
			"name": "Accessibility",
			"reference": "B110,P99",
			"cost_type": "percentage",
			"cost": 0,
			"affects": "total",
			"notes": "Must enter cost manually"
		},
		{
			"type": "modifier",
			"id": "cdbdc9fc-4a4f-44be-acd8-141c67272616",
			"name": "Accurate",
			"reference": "B102,P99",
			"cost_type": "percentage",
			"cost": 5,
			"affects": "total",
			"levels": 1,
			"notes": "+1/level to Accuracy"
		},
		{
			"type": "modifier",
			"id": "e1edd45e-5c25-4464-9dcd-99c747208861",
			"name": "Affects Insubstantial",
			"reference": "B102,P99",
			"cost_type": "percentage",
			"cost": 20,
			"affects": "total"
		},
		{
			"type": "modifier",
			"id": "42817a63-e778-4e71-a1ae-4bcadaab113c",
			"name": "Affects Substantial",
			"reference": "B102,P99",
			"cost_type": "percentage",
			"cost": 40,
			"affects": "total"
		},
		{
			"type": "modifier",
			"id": "6ee4ca1c-db0d-49c2-9d7a-6167e59d47c8",
			"name": "Area Effect",
			"reference": "B102,P100",
			"cost_type": "percentage",
			"cost": 50,
			"affects": "total",
			"levels": 1,
			"notes": "2^level radius"
		},
		{
			"type": "modifier",
			"id": "e2aeed88-df4a-4c84-b648-a7ec32355349",
			"name": "Armor Divisor (2)",
			"reference": "B102",
			"cost_type": "percentage",
			"cost": 50,
			"affects": "total"
		},
		{
			"type": "modifier",
			"id": "949a9cdd-a872-4151-a7d2-43fa59e63903",
			"name": "Armor Divisor (3)",
			"reference": "B102",
			"cost_type": "percentage",
			"cost": 100,
			"affects": "total"
		},
		{
			"type": "modifier",
			"id": "0b941635-bbb2-463d-99a0-70f14d488a6a",
			"name": "Armor Divisor (5)",
			"reference": "B102",
			"cost_type": "percentage",
			"cost": 150,
			"affects": "total"
		},
		{
			"type": "modifier",
			"id": "cac96a97-2345-4e03-a3b3-fb8a7aab87a7",
			"name": "Armor Divisor (10)",
			"reference": "B102",
			"cost_type": "percentage",
			"cost": 200,
			"affects": "total"
		},
		{
			"type": "modifier",
			"id": "8e453e3f-3f12-4133-a39c-05c59f29de08",
			"name": "Aura",
			"reference": "B102,P100",
			"cost_type": "percentage",
			"cost": 80,
			"affects": "total"
		},
		{
			"type": "modifier",
			"id": "84362959-be4d-4d5b-b4b8-26463afa06b1",
			"name": "Based on @Attribute@",
			"reference": "B102",
			"cost_type": "percentage",
			"cost": 20,
			"affects": "total",
			"notes": "Must manually alter advantage for Attribute chosen"
		},
		{
			"type": "modifier",
			"id": "1b0b5b91-b2b8-41c7-8d2e-5d5ba86ecaef",
			"name": "Blood Agent",
			"reference": "B102,P100",
			"cost_type": "percentage",
			"cost": 100,
			"affects": "total",
			"notes": "Area Effect or Cone"
		},
		{
			"type": "modifier",
			"id": "464d0b6f-2e7a-4307-abb8-f12179377e71",
			"name": "Burning Radiation (rad)",
			"reference": "B105",
			"cost_type": "percentage",
			"cost": 100,
			"affects": "total",
			"notes": "In addition to regular damage"
		},
		{
			"type": "modifier",
			"id": "cb0a1770-7037-465d-87d9-afc4eb9eafa3",
			"name": "Cone",
			"reference": "B103,P100",
			"cost_type": "percentage",
			"cost": 50,
			"affects": "total",
			"notes": "Must manually adjust cost upwards +10% per yard of maximum width"
		},
		{
			"type": "modifier",
			"id": "e1a9cd75-8d18-43f2-bf14-0ab6ac3e84a8",
			"name": "Cosmic",
			"reference": "B103",
			"cost_type": "percentage",
			"cost": 50,
			"affects": "total",
			"notes": "Ability other than an attack or a defense"
		},
		{
			"type": "modifier",
			"id": "14b13aab-cfba-4562-9f0a-7ba9e8f14fd7",
			"name": "Cosmic",
			"reference": "B103",
			"cost_type": "percentage",
			"cost": 100,
			"affects": "total",
			"notes": "Attack with a lingering special effect"
		},
		{
			"type": "modifier",
			"id": "18efc6e6-0f18-4841-9ee8-80b52c6dc769",
			"name": "Cosmic",
			"reference": "B103",
			"cost_type": "percentage",
			"cost": 50,
			"affects": "total",
			"notes": "Defense or countermeasure"
		},
		{
			"type": "modifier",
			"id": "b67c31b4-0e39-47b4-82ef-3e1dcd0610c1",
			"name": "Cosmic",
			"reference": "B103",
			"cost_type": "percentage",
			"cost": 300,
			"affects": "total",
			"notes": "Irresistible attack"
		},
		{
			"type": "modifier",
			"id": "9f028321-76e2-495d-a5e3-87c2bb99fb58",
			"name": "Cyclic - 1 day",
			"reference": "B103",
			"cost_type": "percentage",
			"cost": 10,
			"affects": "total",
			"notes": "Halted by @description of what halts the cycle@"
		},
		{
			"type": "modifier",
			"id": "9c085632-450f-4ce4-aa1a-d3fdb4939b4b",
			"name": "Cyclic - 1 hour",
			"reference": "B103",
			"cost_type": "percentage",
			"cost": 20,
			"affects": "total",
			"notes": "Halted by @description of what halts the cycle@"
		},
		{
			"type": "modifier",
			"id": "282e6542-e9fc-4bb3-b493-c8871056c4ab",
			"name": "Cyclic - 1 minute",
			"reference": "B103",
			"cost_type": "percentage",
			"cost": 40,
			"affects": "total",
			"notes": "Halted by @description of what halts the cycle@"
		},
		{
			"type": "modifier",
			"id": "cf056076-ef57-48f6-be16-72b3cb86af43",
			"name": "Cyclic - 1 second",
			"reference": "B103",
			"cost_type": "percentage",
			"cost": 100,
			"affects": "total",
			"notes": "Halted by @description of what halts the cycle@"
		},
		{
			"type": "modifier",
			"id": "58f87447-822d-4f26-8db1-22d6f53739b2",
			"name": "Cyclic - 10 seconds",
			"reference": "B103",
			"cost_type": "percentage",
			"cost": 50,
			"affects": "total",
			"notes": "Halted by @description of what halts the cycle@"
		},
		{
			"type": "modifier",
			"id": "417ab43b-9ad0-4652-b077-2c7916d804a2",
			"name": "Double Blunt Trauma (dbt)",
			"reference": "B104",
			"cost_type": "percentage",
			"cost": 20,
			"affects": "total"
		},
		{
			"type": "modifier",
			"id": "077c022f-9ea3-4eb5-93ab-ad3129e7a3a1",
			"name": "Double Knockback (dkb)",
			"reference": "B104",
			"cost_type": "percentage",
			"cost": 20,
			"affects": "total"
		},
		{
			"type": "modifier",
			"id": "45560dcb-4aa4-4347-9aef-6147d46b3efb",
			"name": "Drifting",
			"reference": "B105",
			"cost_type": "percentage",
			"cost": 20,
			"affects": "total"
		},
		{
			"type": "modifier",
			"id": "90e02616-e10a-4b70-b7d9-43de584130aa",
			"name": "Explosion (exp)",
			"reference": "B104",
			"cost_type": "percentage",
			"cost": 50,
			"affects": "total",
			"levels": 1
		},
		{
			"type": "modifier",
			"id": "0ebae95b-f762-4365-aec6-fa3c4390ffbb",
			"name": "Fixed Delay",
			"reference": "B105",
			"cost_type": "percentage",
			"cost": 0,
			"affects": "total",
			"notes": "@delay period@, @method to neutralize@"
		},
		{
			"type": "modifier",
			"id": "71193529-387e-46ba-a5ad-7fbbd6becbdf",
			"name": "Follow-Up",
			"reference": "B105,P102",
			"cost_type": "percentage",
			"cost": 0,
			"affects": "total",
			"notes": "Cost is variable and must be entered manually"
		},
		{
			"type": "modifier",
			"id": "10fa0088-2982-4531-8ba5-a4833b649ab4",
			"name": "Fragmentation (frag)",
			"reference": "B104",
			"cost_type": "percentage",
			"cost": 15,
			"affects": "total",
			"levels": 1,
			"notes": "Take levels equal to the number of dice"
		},
		{
			"type": "modifier",
			"id": "67761396-4442-4685-82d9-e64d91080dab",
			"name": "Guided",
			"reference": "B105,P103",
			"cost_type": "percentage",
			"cost": 50,
			"affects": "total"
		},
		{
			"type": "modifier",
			"id": "9a209bd3-97f4-4d62-887c-2233c073fdec",
			"name": "Hazard",
			"reference": "B104",
			"cost_type": "percentage",
			"cost": 20,
			"affects": "total",
			"notes": "Dehydration"
		},
		{
			"type": "modifier",
			"id": "b641e5c1-1c79-4166-b216-eafea978dae6",
			"name": "Hazard",
			"reference": "B104",
			"cost_type": "percentage",
			"cost": 0,
			"affects": "total",
			"notes": "Drowning"
		},
		{
			"type": "modifier",
			"id": "fe4ba515-333d-4e26-a719-5b7461248bdd",
			"name": "Hazard",
			"reference": "B104",
			"cost_type": "percentage",
			"cost": 20,
			"affects": "total",
			"notes": "Freezing"
		},
		{
			"type": "modifier",
			"id": "3840cdf6-fd44-40cb-be10-b93d0ea66637",
			"name": "Hazard",
			"reference": "B104",
			"cost_type": "percentage",
			"cost": 50,
			"affects": "total",
			"notes": "Missed Sleep"
		},
		{
			"type": "modifier",
			"id": "3f33f14f-abc2-4e9c-acfb-6bc3fdc451d7",
			"name": "Hazard",
			"reference": "B104",
			"cost_type": "percentage",
			"cost": 40,
			"affects": "total",
			"notes": "Starvation"
		},
		{
			"type": "modifier",
			"id": "0563610f-0fe3-4844-91e3-7962c8545e5b",
			"name": "Hazard",
			"reference": "B104",
			"cost_type": "percentage",
			"cost": 0,
			"affects": "total",
			"notes": "Suffocation"
		},
		{
			"type": "modifier",
			"id": "0b0d5d93-ac35-4b0a-80a0-743e4bb28984",
			"name": "Homing (@sense@)",
			"reference": "B105",
			"cost_type": "percentage",
			"cost": 50,
			"affects": "total",
			"notes": "Must manually add +1% per point of cost of the chosen sense to the cost of Homing"
		},
		{
			"type": "modifier",
			"id": "48038195-f56f-4402-b7fb-810c66e0f2c8",
			"name": "Incendiary (inc)",
			"reference": "B105",
			"cost_type": "percentage",
			"cost": 10,
			"affects": "total"
		},
		{
			"type": "modifier",
			"id": "5f1cd59a-baf4-4b23-b527-e560e5f7e2a6",
			"name": "Jet",
			"reference": "B106,P103",
			"cost_type": "percentage",
			"cost": 0,
			"affects": "total"
		},
		{
			"type": "modifier",
			"id": "38949801-fa50-4145-958c-9de43b1853e8",
			"name": "Link",
			"reference": "B106,P103",
			"cost_type": "percentage",
			"cost": 20,
			"affects": "total",
			"notes": "@linked abilities@"
		},
		{
			"type": "modifier",
			"id": "9cd3c6da-1226-4b0a-8285-a8b967d59ad2",
			"name": "Link",
			"reference": "B106,P103",
			"cost_type": "percentage",
			"cost": 10,
			"affects": "total",
			"notes": "@linked abilities@, must be used as a single ability"
		},
		{
			"type": "modifier",
			"id": "1d7c96b8-5d59-46fa-827a-649887a6d9b3",
			"name": "Low Signature",
			"reference": "B106,P103",
			"cost_type": "percentage",
			"cost": 10,
			"affects": "total"
		},
		{
			"type": "modifier",
			"id": "04ab2b2e-a18c-42a1-a3d7-8d4d0c2357ea",
			"name": "Malediction",
			"reference": "B106,P103",
			"cost_type": "percentage",
			"cost": 100,
			"affects": "total",
			"notes": "-1 per yard of range"
		},
		{
			"type": "modifier",
			"id": "506c4ac2-8875-4206-be80-b763d6baaae7",
			"name": "Malediction",
			"reference": "B106,P103",
			"cost_type": "percentage",
			"cost": 150,
			"affects": "total",
			"notes": "Use SSRT range penalties"
		},
		{
			"type": "modifier",
			"id": "9d7ad3b4-ce06-4995-8d91-eb908893a68e",
			"name": "Malediction",
			"reference": "B106,P103",
			"cost_type": "percentage",
			"cost": 200,
			"affects": "total",
			"notes": "Uses Long-Distance Modifiers"
		},
		{
			"type": "modifier",
			"id": "899a6949-bad9-401a-9e60-f3aea5ce6a2a",
			"name": "Mobile",
			"reference": "B107,P104",
			"cost_type": "percentage",
			"cost": 40,
			"affects": "total",
			"levels": 1
		},
		{
			"type": "modifier",
			"id": "44abf0d2-8573-41f5-936f-f972d64c6a96",
			"name": "No Signature",
			"reference": "B106,P103",
			"cost_type": "percentage",
			"cost": 20,
			"affects": "total"
		},
		{
			"type": "modifier",
			"id": "5c3a94f2-e091-4413-a66f-236687eb9955",
			"name": "Overhead",
			"reference": "B107,P104",
			"cost_type": "percentage",
			"cost": 30,
			"affects": "total"
		},
		{
			"type": "modifier",
			"id": "acdea83d-78b2-4b63-8b26-4c178111e85b",
			"name": "Permanent Duration",
			"reference": "B105",
			"cost_type": "percentage",
			"cost": 300,
			"affects": "total"
		},
		{
			"type": "modifier",
			"id": "0e0423ba-732a-4f14-8f1d-75a07e49f12f",
			"name": "Permanent Duration",
			"reference": "B105",
			"cost_type": "percentage",
			"cost": 150,
			"affects": "total",
			"notes": "Dispelled by @method of dispelling effect@"
		},
		{
			"type": "modifier",
			"id": "757a2c1f-11c3-4231-93ab-839d1db3ab7b",
			"name": "Persistent",
			"reference": "B107,P104",
			"cost_type": "percentage",
			"cost": 40,
			"affects": "total"
		},
		{
			"type": "modifier",
			"id": "f0472171-af6d-41f0-8668-e6e5dcddb96a",
			"name": "Ranged",
			"reference": "B107,P105",
			"cost_type": "percentage",
			"cost": 40,
			"affects": "total"
		},
		{
			"type": "modifier",
			"id": "07f85bb2-ae3e-406d-95eb-a07e0b3f8f09",
			"name": "Rapid Fire",
			"reference": "B108,P105",
			"cost_type": "percentage",
			"cost": 40,
			"affects": "total",
			"notes": "RoF 2"
		},
		{
			"type": "modifier",
			"id": "2f519d7e-c1c2-44f7-8ee3-52c47b1c7e4f",
			"name": "Rapid Fire",
			"reference": "B108,P105",
			"cost_type": "percentage",
			"cost": 50,
			"affects": "total",
			"notes": "RoF 3"
		},
		{
			"type": "modifier",
			"id": "ac137207-60a9-4ec9-a1ed-5c5ac34c354a",
			"name": "Rapid Fire",
			"reference": "B108,P105",
			"cost_type": "percentage",
			"cost": 70,
			"affects": "total",
			"notes": "RoF @4-7@"
		},
		{
			"type": "modifier",
			"id": "d3f6c24f-0fe5-4da8-9b4a-0f20b2e8d718",
			"name": "Rapid Fire",
			"reference": "B108,P105",
			"cost_type": "percentage",
			"cost": 100,
			"affects": "total",
			"notes": "RoF @8-15@"
		},
		{
			"type": "modifier",
			"id": "1ef234e2-dc51-44cd-86fe-e90616935ffa",
			"name": "Rapid Fire",
			"reference": "B108,P105",
			"cost_type": "percentage",
			"cost": 150,
			"affects": "total",
			"notes": "RoF @16-30@"
		},
		{
			"type": "modifier",
			"id": "3dc9ea87-8627-41c7-aa0e-82b6bb1b5052",
			"name": "Rapid Fire",
			"reference": "B108,P105",
			"cost_type": "percentage",
			"cost": 200,
			"affects": "total",
			"notes": "RoF @31-70@"
		},
		{
			"type": "modifier",
			"id": "538f46c0-7690-464d-a5d4-4f7db297cf0a",
			"name": "Rapid Fire",
			"reference": "B108,P105",
			"cost_type": "percentage",
			"cost": 250,
			"affects": "total",
			"notes": "RoF @71-150@"
		},
		{
			"type": "modifier",
			"id": "71eff140-36ed-4a7d-b808-5030d31ca715",
			"name": "Rapid Fire",
			"reference": "B108,P105",
			"cost_type": "percentage",
			"cost": 300,
			"affects": "total",
			"notes": "RoF @151-300@"
		},
		{
			"type": "modifier",
			"id": "1ca12f24-5287-4311-93c9-6c073652245f",
			"name": "Reduced Fatigue Cost",
			"reference": "B108,P105",
			"cost_type": "percentage",
			"cost": 20,
			"affects": "total",
			"levels": 1
		},
		{
			"type": "modifier",
			"id": "2b83a49f-07d1-4418-b552-051537202346",
			"name": "Reduced Time",
			"reference": "B108",
			"cost_type": "percentage",
			"cost": 20,
			"affects": "total",
			"levels": 1
		},
		{
			"type": "modifier",
			"id": "f50ccddb-f787-48c3-8798-8eba97cd4c1a",
			"name": "Respiratory Agent",
			"reference": "B108",
			"cost_type": "percentage",
			"cost": 50,
			"affects": "total"
		},
		{
			"type": "modifier",
			"id": "f00d3455-be24-49eb-b382-4cc85546a95b",
			"name": "Selective Area",
			"reference": "B108,P105",
			"cost_type": "percentage",
			"cost": 20,
			"affects": "total"
		},
		{
			"type": "modifier",
			"id": "9c2e244a-c88b-490d-924d-6c6e991a1043",
			"name": "Selective Fire",
			"reference": "B108",
			"cost_type": "percentage",
			"cost": 10,
			"affects": "total"
		},
		{
			"type": "modifier",
			"id": "997c5950-4568-42f2-b6e4-ef978e7209f6",
			"name": "Selectivity",
			"reference": "B108,P105",
			"cost_type": "percentage",
			"cost": 10,
			"affects": "total"
		},
		{
			"type": "modifier",
			"id": "e3ef2f15-6eb8-4980-aac3-c46777aacdb8",
			"name": "Sense-Based (@senses@)",
			"reference": "B109",
			"cost_type": "percentage",
			"cost": 150,
			"affects": "total",
			"notes": "Manually add +50% for each sense beyond the first"
		},
		{
			"type": "modifier",
			"id": "0f8b0253-7226-4e10-91b9-778feca993da",
			"name": "Side Effect",
			"reference": "B109,P106",
			"cost_type": "percentage",
			"cost": 50,
			"affects": "total"
		},
		{
			"type": "modifier",
			"id": "55d277cc-6a80-442d-a9d2-c43c7277302f",
			"name": "Surge (sur)",
			"reference": "B105",
			"cost_type": "percentage",
			"cost": 20,
			"affects": "total"
		},
		{
			"type": "modifier",
			"id": "a078bf9b-9e4a-4957-af2a-9451bd74c169",
			"name": "Symptoms",
			"reference": "B109",
			"cost_type": "percentage",
			"cost": 0,
			"affects": "total",
			"notes": "Cost must be manually entered"
		},
		{
			"type": "modifier",
			"id": "4420f98e-c13c-47e4-8c15-a522381db947",
			"name": "Toxic Radiation (rad)",
			"reference": "B105",
			"cost_type": "percentage",
			"cost": 25,
			"affects": "total",
			"notes": "Instead of regular damage"
		},
		{
			"type": "modifier",
			"id": "ed718ed2-30c4-4256-9651-79fe53e10ace",
			"name": "Triggered Delay",
			"reference": "B105",
			"cost_type": "percentage",
			"cost": 50,
			"affects": "total",
			"notes": "@trigger@, @method to neutralize@"
		},
		{
			"type": "modifier",
			"id": "6786d747-6962-4106-8ed5-e44eeff27adb",
			"name": "Underwater",
			"reference": "B109,P107",
			"cost_type": "percentage",
			"cost": 20,
			"affects": "total"
		},
		{
			"type": "modifier",
			"id": "bc321421-aac1-4add-bc1b-e556ffa3b37a",
			"name": "Variable",
			"reference": "B109,P107",
			"cost_type": "percentage",
			"cost": 5,
			"affects": "total"
		},
		{
			"type": "modifier",
			"id": "94b08993-7bd1-41e2-a665-922fe3b3c697",
			"name": "Variable Delay",
			"reference": "B105",
			"cost_type": "percentage",
			"cost": 20,
			"affects": "total",
			"notes": "@method to neutralize@"
		},
		{
			"type": "modifier",
			"id": "75b34c7a-14f2-4141-9c0c-f2dc7c3668c0",
			"name": "Variable Delay",
			"reference": "B105",
			"cost_type": "percentage",
			"cost": 10,
			"affects": "total",
			"notes": "Delay up to 10 seconds, @method to neutralize@"
		},
		{
			"type": "modifier",
			"id": "041a0265-ba5d-40f9-93c7-5930bd28bab6",
			"name": "Wall",
			"reference": "B109",
			"cost_type": "percentage",
			"cost": 60,
			"affects": "total",
			"notes": "Permeable"
		},
		{
			"type": "modifier",
			"id": "9402b4f1-3e4c-42f8-8e74-517bdb6ef35e",
			"name": "Wall",
			"reference": "B109",
			"cost_type": "percentage",
			"cost": 30,
			"affects": "total",
			"notes": "Permeable Line"
		},
		{
			"type": "modifier",
			"id": "2d7809d4-512f-40d4-b558-e6cae29a1e94",
			"name": "Wall",
			"reference": "B109",
			"cost_type": "percentage",
			"cost": 60,
			"affects": "total",
			"notes": "Rigid"
		},
		{
			"type": "modifier",
			"id": "341a707a-87e3-4702-b08b-5f48a37cfe37",
			"name": "Wall",
			"reference": "B109",
			"cost_type": "percentage",
			"cost": 30,
			"affects": "total",
			"notes": "Rigid Line"
		}
	]
}');


