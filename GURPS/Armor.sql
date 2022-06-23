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

-- ********************************************************************* Cloth Armor
insert into Objects (Id, ClassType, Name, Definition) values (
20004,
'Armor',
'Cloth Armor',
JSON_OBJECT()
);
update Objects set Definition =
'{
"TL": 1,
"Locations": ["torso", "groin"],
"DR": "1*",
"Cost": 30,
"Weight": 6,
"Notes": "1"
}'
where Id = 20004;

-- ********************************************************************* Leather Armor
insert into Objects (Id, ClassType, Name, Definition) values (
20005,
'Armor',
'Leather Armor',
JSON_OBJECT()
);
update Objects set Definition =
'{
"TL": 1,
"Locations": ["torso", "groin"],
"DR": 2,
"Cost": 100,
"Weight": 10,
"Notes": null
}'
where Id = 20005;

-- ********************************************************************* Leather Jacket
insert into Objects (Id, ClassType, Name, Definition) values (
20006,
'Armor',
'Leather Jacket',
JSON_OBJECT()
);
update Objects set Definition =
'{
"TL": 1,
"Locations": ["torso", "arms"],
"DR": "1*",
"Cost": 50,
"Weight": 4,
"Notes": "1"
}'
where Id = 20006;

-- ********************************************************************* Light Scale Armor
insert into Objects (Id, ClassType, Name, Definition) values (
20007,
'Armor',
'Light Scale Armor',
JSON_OBJECT()
);
update Objects set Definition =
'{
"TL": 2,
"Locations": ["torso"],
"DR": 3,
"Cost": 150,
"Weight": 15,
"Notes": null
}'
where Id = 20007;











































select Id, Name, json_detailed(Definition) from Objects order by Id;


