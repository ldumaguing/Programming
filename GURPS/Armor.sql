delete from Objects where Id >= 20000;

-- ********************************************************************* Fur Loincloth
insert into Objects (Id, ClassType, Name, Definition) values (
20000,
'Armor',
'Fur Loincloth',
JSON_OBJECT()
);
update Objects set Definition =
'{
"TL": 0,
"Locations": ["groin"],
"DR": "1*",
"Cost": 10,
"Weight": null,
"Notes": "1"
}'
where Id = 20000;

-- ********************************************************************* Fur Tunic
insert into Objects (Id, ClassType, Name, Definition) values (
20001,
'Armor',
'Fur Tunic',
JSON_OBJECT()
);
update Objects set Definition =
'{
"TL": 0,
"Locations": ["torso"],
"DR": "1*",
"Cost": 25,
"Weight": 2,
"Notes": "1"
}'
where Id = 20001;



















select Id, Name, json_detailed(Definition) from Objects order by Id;


