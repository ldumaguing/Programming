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

-- ********************************************************************* Bronze Breastplate
insert into Objects (Id, ClassType, Name, Definition) values (
20002,
'Armor',
'Bronze Breastplate',
JSON_OBJECT()
);
update Objects set Definition =
'{
"TL": 1,
"Locations": ["torso"],
"DR": "4F",
"Cost": 400,
"Weight": 20,
"Notes": "2"
}'
where Id = 20002;

-- ********************************************************************* Bronze Corselet
insert into Objects (Id, ClassType, Name, Definition) values (
20003,
'Armor',
'Bronze Corselet',
JSON_OBJECT()
);
update Objects set Definition =
'{
"TL": 1,
"Locations": ["torso", "groin"],
"DR": 5,
"Cost": 1300,
"Weight": 40,
"Notes": null
}'
where Id = 20003;



























select Id, Name, json_detailed(Definition) from Objects order by Id;


