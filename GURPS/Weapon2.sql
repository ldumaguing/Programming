delete from Objects where Id >= 10046;

-- ********************************************************************* Maul
insert into Objects (Id, ClassType, Name, Definition) values (
10046,
'Weapon',
'Maul',
JSON_OBJECT()
);
update Objects set Definition =
'{
"stats": 
{
"TL": 0,
"Cost": 80,
"Weight": 12
},
"handling": 
{
"strokes": 
{
"both": 
{
"required skill group": 20,
"swing":
{
"Damage": "+4 cr",
"Reach": "1,2*",
"Parry": "0U",
"ST": "13‡",
"Notes": null
}
}
}
}
}'
where Id = 10046;
-- ********************************************************************* Great Axe
insert into Objects (Id, ClassType, Name, Definition) values (
10047,
'Weapon',
'Great Axe',
JSON_OBJECT()
);
update Objects set Definition =
'{
"stats": 
{
"TL": 1,
"Cost": 100,
"Weight": 8
},
"handling": 
{
"strokes": 
{
"both": 
{
"required skill group": 20,
"swing":
{
"Damage": "+3 cut",
"Reach": "1,2*",
"Parry": "0U",
"ST": "12‡",
"Notes": null
}
}
}
}
}'
where Id = 10047;
-- ********************************************************************* Scythe
insert into Objects (Id, ClassType, Name, Definition) values (
10048,
'Weapon',
'Scythe',
JSON_OBJECT()
);
update Objects set Definition =
'{
"stats": 
{
"TL": 1,
"Cost": 15,
"Weight": 5
},
"handling": 
{
"strokes": 
{
"both": 
{
"required skill group": 20,
"swing":
{
"Damage": "+2 cut",
"Reach": 1,
"Parry": "0U",
"ST": "11‡",
"Notes": null
},
"swing2":
{
"Damage": "+0 imp",
"Reach": 1,
"Parry": "0U",
"ST": "11‡",
"Notes": "2"
}
}
}
}
}'
where Id = 10048;
-- ********************************************************************* Warhammer
insert into Objects (Id, ClassType, Name, Definition) values (
10049,
'Weapon',
'Warhammer',
JSON_OBJECT()
);
update Objects set Definition =
'{
"stats": 
{
"TL": 3,
"Cost": 100,
"Weight": 7
},
"handling": 
{
"strokes": 
{
"both": 
{
"required skill group": 20,
"swing":
{
"Damage": "+3 imp",
"Reach": "1,2*",
"Parry": "0U",
"ST": "12‡",
"Notes": "2"
}
}
}
}
}'
where Id = 10049;
-- ********************************************************************* Chainsaw
insert into Objects (Id, ClassType, Name, Definition) values (
10050,
'Weapon',
'Chainsaw',
JSON_OBJECT()
);
update Objects set Definition =
'{
"stats": 
{
"TL": 6,
"Cost": 150,
"Weight": 13
},
"handling": 
{
"strokes": 
{
"both": 
{
"required skill group": 20,
"swing":
{
"Damage": "+1d cut",
"Reach": 1,
"Parry": "No",
"ST": "10‡",
"Notes": "11"
}
}
}
}
}'
where Id = 10050;
-- ********************************************************************* Flail
insert into Objects (Id, ClassType, Name, Definition) values (
10051,
'Weapon',
'Flail',
JSON_OBJECT()
);
update Objects set Definition =
'{
"stats": 
{
"TL": 2,
"Cost": 100,
"Weight": 8
},
"handling": 
{
"strokes": 
{
"both": 
{
"required skill group": 21,
"swing":
{
"Damage": "+4 cr",
"Reach": "1,2*",
"Parry": "0U",
"ST": "13†",
"Notes": "6"
}
}
}
}
}'
where Id = 10051;
-- ********************************************************************* Greatsword
insert into Objects (Id, ClassType, Name, Definition) values (
10052,
'Weapon',
'Greatsword',
JSON_OBJECT()
);
update Objects set Definition =
'{
"stats": 
{
"TL": 3,
"Cost": 800,
"Weight": 7
},
"handling": 
{
"strokes": 
{
"both": 
{
"required skill group": 22,
"swing":
{
"Damage": "+3 cut",
"Reach": "1,2",
"Parry": 0,
"ST": "12†",
"Notes": null
},
"thrust":
{
"Damage": "+2 cr",
"Reach": 2,
"Parry": 0,
"ST": "12†",
"Notes": null
}
}
}
}
}'
where Id = 10052;
-- ********************************************************************* Thrusting Greatsword
insert into Objects (Id, ClassType, Name, Definition) values (
10053,
'Weapon',
'Thrusting Greatsword',
JSON_OBJECT()
);
update Objects set Definition =
'{
"stats": 
{
"TL": 3,
"Cost": 900,
"Weight": 7
},
"handling": 
{
"strokes": 
{
"both": 
{
"required skill group": 22,
"swing":
{
"Damage": "+3 cut",
"Reach": "1,2",
"Parry": 0,
"ST": "12†",
"Notes": null
},
"thrust":
{
"Damage": "+3 imp",
"Reach": 2,
"Parry": 0,
"ST": "12†",
"Notes": null
}
}
}
}
}'
where Id = 10053;


















select Name, json_detailed(Definition) from Objects;







