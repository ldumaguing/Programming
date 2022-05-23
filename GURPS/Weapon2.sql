delete from Objects where Id >= 10042;
delete from Objects where ClassType = 'Weapon' and Id >= 10042;

-- ********************************************************************* Spear
insert into Objects (Id, ClassType, Name, Definition) values (
10042,
'Weapon',
'Spear',
JSON_OBJECT()
);
update Objects set Definition =
'{
	"stats": 
	{
		"TL": 0,
		"Cost": 40,
		"Weight": 4
	},
	"handling": 
	{
		"strokes": 
		{
			"one": 
			{
				"required skill group": 18,
				"thrust": 
				{
					"Damage": "+2 imp",
					"Reach": "1*",
					"Parry": 0,
					"ST": 9,
					"Notes": "1"
				}
			},
			"both": 
			{
				"required skill group": 18,
				"thrust":
				{
					"Damage": "+3 imp",
					"Reach": "1,2*",
					"Parry": 0,
					"ST": "9†",
					"Notes": "1"
				}
			}
		}
	}
}'
where Id = 10042;
-- ********************************************************************* Javelin
insert into Objects (Id, ClassType, Name, Definition) values (
10043,
'Weapon',
'Javelin',
JSON_OBJECT()
);
update Objects set Definition =
'{
	"stats": 
	{
		"TL": 0,
		"Cost": 40,
		"Weight": 4
	},
	"handling": 
	{
		"strokes": 
		{
			"one": 
			{
				"required skill group": 18,
				"thrust": 
				{
					"Damage": "+2 imp",
					"Reach": "1*",
					"Parry": 0,
					"ST": 9,
					"Notes": "1"
				}
			}
		}
	}
}'
where Id = 10043;
-- ********************************************************************* Long Spear
insert into Objects (Id, ClassType, Name, Definition) values (
10044,
'Weapon',
'Long Spear',
JSON_OBJECT()
);
update Objects set Definition =
'{
	"stats": 
	{
		"TL": 2,
		"Cost": 60,
		"Weight": 5
	},
	"handling": 
	{
		"strokes": 
		{
			"one": 
			{
				"required skill group": 18,
				"thrust": 
				{
					"Damage": "+2 imp",
					"Reach": "2,3*",
					"Parry": "0U",
					"ST": 10,
					"Notes": null
				}
			},
			"both": 
			{
				"required skill group": 18,
				"thrust":
				{
					"Damage": "+3 imp",
					"Reach": "2,3*",
					"Parry": 0,
					"ST": "10†",
					"Notes": null
				}
			}
		}
	}
}'
where Id = 10044;
-- ********************************************************************* Quarterstaff
insert into Objects (Id, ClassType, Name, Definition) values (
10045,
'Weapon',
'Quarterstaff',
JSON_OBJECT()
);
update Objects set Definition =
'{
	"stats": 
	{
		"TL": 0,
		"Cost": 100,
		"Weight": 4
	},
	"handling": 
	{
		"strokes": 
		{
			"both": 
			{
				"required skill group": 18,
				"swing":
				{
					"Damage": "+2 cr",
					"Reach": "1,2",
					"Parry": 2,
					"ST": "7†",
					"Notes": null
				},
				"thrust": 
				{
					"Damage": "+2 cr",
					"Reach": "1,2",
					"Parry": 2,
					"ST": "7†",
					"Notes": null
				}
			}
		}
	}
}'
where Id = 10045;














select Name, json_detailed(Definition) from Objects where ClassType = 'weapon';

