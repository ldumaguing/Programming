delete from Objects where Id >= 10075;

-- ********************************************************************* Flintlock Pistol, .51
insert into Objects (Id, ClassType, Name, Definition) values (
10075,
'Weapon',
'Flintlock Pistol, .51',
JSON_OBJECT()
);
update Objects set Definition =
'{
"stats": 
{
"TL": 4,
"Cost": 200,
"Weight": "3/0.01"
},
"handling": 
{
"trigger": 
{
"one": 
{
"required skill group": 39,
"Damage": "2d-1 pi+",
"Acc": 1,
"Range": "75/450",
"RoF": 1,
"Shots": "1(20)",
"ST": 10,
"Bulk": -3,
"Recoil": 2,
"Notes": null
}
}
}
}'
where Id = 10075;

-- ********************************************************************* Wheel-Lock Pistol, .60
insert into Objects (Id, ClassType, Name, Definition) values (
10076,
'Weapon',
'Wheel-Lock Pistol, .60',
JSON_OBJECT()
);
update Objects set Definition =
'{
"stats": 
{
"TL": 4,
"Cost": 200,
"Weight": "3.25/0.01"
},
"handling": 
{
"trigger": 
{
"one": 
{
"required skill group": 39,
"Damage": "1d+1 pi+",
"Acc": 1,
"Range": "75/400",
"RoF": 1,
"Shots": "1(20)",
"ST": 10,
"Bulk": -3,
"Recoil": 2,
"Notes": null
}
}
}
}'
where Id = 10076;

























select Id, Name, json_detailed(Definition) from Objects order by Id;











