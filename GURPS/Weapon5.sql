delete from Objects where Id >= 10128;

-- ********************************************************************* 
insert into Objects (Id, ClassType, Name, Definition) values (
10128,
'Weapon',
'',
JSON_OBJECT()
);
update Objects set Definition =
'{
"stats": 
{
"TL": 2,
"Cost": 5000,
"Weight": "110/0.9"
},
"handling": 
{
"trigger": 
{
"both": 
{
"required skill group": 48,
"Damage": "5d imp",
"Acc": 3,
"Range": "415/520",
"RoF": 1,
"Shots": "1(30)",
"ST": "45M†",
"Bulk": -10,
"Recoil": null,
"Notes": null
}}}}'
where Id = 10128;















select Id, Name, json_detailed(Definition) from Objects order by Id;











