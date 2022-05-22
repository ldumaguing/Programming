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
"Damage": "+3 imp",
"Reach": "1,2*",
"Parry": 0,
"ST": "9†",
"Notes": "1"
}
}
}
}'
where Id = 10042;
















select Name, json_detailed(Definition) from Objects where ClassType = 'weapon';


