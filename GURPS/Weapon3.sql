delete from Objects where Id >= 10055;

-- ********************************************************************* Blowpipe
insert into Objects (Id, ClassType, Name, Definition) values (
10055,
'Weapon',
'Blowpipe',
JSON_OBJECT()
);
update Objects set Definition =
'{
"stats": 
{
"TL": 0,
"Cost": 30,
"Weight": "1/0.05"
},
"handling": 
{
"muscle": 
{
"one": 
{
"required skill group": 24,
"Damage": "1d-3 pi-",
"Acc": 1,
"Range": "x4",
"RoF": 1,
"Shots": "1(2)",
"ST": 2,
"Bulk": -6,
"Notes": "1,2,3"
}
}
}
}'
where Id = 10055;
-- ********************************************************************* Bolas
insert into Objects (Id, ClassType, Name, Definition) values (
10056,
'Weapon',
'Bolas',
JSON_OBJECT()
);
update Objects set Definition =
'{
"stats": 
{
"TL": 0,
"Cost": 20,
"Weight": 2
},
"handling": 
{
"muscle": 
{
"one": 
{
"required skill group": 25,
"Damage": "thr-1 cr",
"Acc": 0,
"Range": "x3",
"RoF": 1,
"Shots": "T(1)",
"ST": 7,
"Bulk": -2,
"Notes": "4"
}
}
}
}'
where Id = 10056;
-- ********************************************************************* Longbow
insert into Objects (Id, ClassType, Name, Definition) values (
10057,
'Weapon',
'Longbow',
JSON_OBJECT()
);
update Objects set Definition =
'{
"stats": 
{
"TL": 0,
"Cost": 200,
"Weight": "3/0.1"
},
"handling": 
{
"muscle": 
{
"both": 
{
"required skill group": 26,
"Damage": "thr+2 imp",
"Acc": 3,
"Range": "x15/x20",
"RoF": 1,
"Shots": "1(2)",
"ST": "11†",
"Bulk": -8,
"Notes": "3"
}
}
}
}'
where Id = 10057;
-- ********************************************************************* Regular Bow
insert into Objects (Id, ClassType, Name, Definition) values (
10058,
'Weapon',
'Regular Bow',
JSON_OBJECT()
);
update Objects set Definition =
'{
"stats": 
{
"TL": 0,
"Cost": 100,
"Weight": "2/0.1"
},
"handling": 
{
"muscle": 
{
"both": 
{
"required skill group": 26,
"Damage": "thr+1 imp",
"Acc": 2,
"Range": "x15/x20",
"RoF": 1,
"Shots": "1(2)",
"ST": "10†",
"Bulk": -7,
"Notes": "3"
}
}
}
}'
where Id = 10058;
-- ********************************************************************* Short Bow
insert into Objects (Id, ClassType, Name, Definition) values (
10059,
'Weapon',
'Short Bow',
JSON_OBJECT()
);
update Objects set Definition =
'{
"stats": 
{
"TL": 0,
"Cost": 50,
"Weight": "2/0.1"
},
"handling": 
{
"muscle": 
{
"both": 
{
"required skill group": 26,
"Damage": "thr imp",
"Acc": 1,
"Range": "x10/x15",
"RoF": 1,
"Shots": "1(2)",
"ST": "7†",
"Bulk": -6,
"Notes": "3"
}
}
}
}'
where Id = 10059;
-- ********************************************************************* Composite Bow
insert into Objects (Id, ClassType, Name, Definition) values (
10060,
'Weapon',
'Composite Bow',
JSON_OBJECT()
);
update Objects set Definition =
'{
"stats": 
{
"TL": 1,
"Cost": 900,
"Weight": "4/0.1"
},
"handling": 
{
"muscle": 
{
"both": 
{
"required skill group": 26,
"Damage": "thr+3 imp",
"Acc": 3,
"Range": "x20/x25",
"RoF": 1,
"Shots": "1(2)",
"ST": "10†",
"Bulk": -7,
"Notes": "3"
}
}
}
}'
where Id = 10060;
-- ********************************************************************* Heavy Cloak
insert into Objects (Id, ClassType, Name, Definition) values (
10061,
'Weapon',
'Heavy Cloak',
JSON_OBJECT()
);
update Objects set Definition =
'{
"stats": 
{
"TL": 1,
"Cost": 50,
"Weight": 5
},
"handling": 
{
"muscle": 
{
"one": 
{
"required skill group": 27,
"Damage": "spec.",
"Acc": 1,
"Range": 2,
"RoF": 1,
"Shots": "T(1)",
"ST": 8,
"Bulk": -6,
"Notes": "4"
}
}
}
}'
where Id = 10061;
-- ********************************************************************* Light Cloak
insert into Objects (Id, ClassType, Name, Definition) values (
10062,
'Weapon',
'Light Cloak',
JSON_OBJECT()
);
update Objects set Definition =
'{
"stats": 
{
"TL": 1,
"Cost": 20,
"Weight": 2
},
"handling": 
{
"muscle": 
{
"one": 
{
"required skill group": 27,
"Damage": "spec.",
"Acc": 1,
"Range": 2,
"RoF": 1,
"Shots": "T(1)",
"ST": 5,
"Bulk": -4,
"Notes": "4"
}
}
}
}'
where Id = 10062;
-- ********************************************************************* Crossbow
insert into Objects (Id, ClassType, Name, Definition) values (
10063,
'Weapon',
'Crossbow',
JSON_OBJECT()
);
update Objects set Definition =
'{
"stats": 
{
"TL": 2,
"Cost": 150,
"Weight": "6/0.06"
},
"handling": 
{
"muscle": 
{
"both": 
{
"required skill group": 28,
"Damage": "thr+4 imp",
"Acc": 4,
"Range": "x20/x25",
"RoF": 1,
"Shots": "1(4)",
"ST": "7†",
"Bulk": -6,
"Notes": "3"
}
}
}
}'
where Id = 10063;
-- ********************************************************************* Pistol Crossbow
insert into Objects (Id, ClassType, Name, Definition) values (
10064,
'Weapon',
'Pistol Crossbow',
JSON_OBJECT()
);
update Objects set Definition =
'{
"stats": 
{
"TL": 3,
"Cost": 150,
"Weight": "4/0.06"
},
"handling": 
{
"muscle": 
{
"one": 
{
"required skill group": 28,
"Damage": "thr+2 imp",
"Acc": 1,
"Range": "x15/x20",
"RoF": 1,
"Shots": "1(4)",
"ST": 7,
"Bulk": -4,
"Notes": "2,3"
}
}
}
}'
where Id = 10064;
-- ********************************************************************* Prodd
insert into Objects (Id, ClassType, Name, Definition) values (
10065,
'Weapon',
'Prodd',
JSON_OBJECT()
);
update Objects set Definition =
'{
"stats": 
{
"TL": 3,
"Cost": 150,
"Weight": "6/0.06"
},
"handling": 
{
"muscle": 
{
"both": 
{
"required skill group": 28,
"Damage": "thr+4 pi",
"Acc": 2,
"Range": "x20/x25",
"RoF": 1,
"Shots": "1(4)",
"ST": "7†",
"Bulk": -6,
"Notes": "3"
}
}
}
}'
where Id = 10065;
-- ********************************************************************* Lariat
insert into Objects (Id, ClassType, Name, Definition) values (
10066,
'Weapon',
'Lariat',
JSON_OBJECT()
);
update Objects set Definition =
'{
"stats": 
{
"TL": 1,
"Cost": 40,
"Weight": 3
},
"handling": 
{
"muscle": 
{
"both": 
{
"required skill group": 29,
"Damage": "spec.",
"Acc": 0,
"Range": "spec.",
"RoF": 1,
"Shots": "T(spec.)",
"ST": "7†",
"Bulk": -2,
"Notes": "4"
}
}
}
}'
where Id = 10066;
-- ********************************************************************* Large Net
insert into Objects (Id, ClassType, Name, Definition) values (
10067,
'Weapon',
'Large Net',
JSON_OBJECT()
);
update Objects set Definition =
'{
"stats": 
{
"TL": 0,
"Cost": 40,
"Weight": 20
},
"handling": 
{
"muscle": 
{
"one": 
{
"required skill group": 30,
"Damage": "spec.",
"Acc": 1,
"Range": "spec.",
"RoF": 1,
"Shots": "T(1)",
"ST": 11,
"Bulk": -6,
"Notes": "4,6"
}
}
}
}'
where Id = 10067;
-- ********************************************************************* Melee Net
insert into Objects (Id, ClassType, Name, Definition) values (
10068,
'Weapon',
'Melee Net',
JSON_OBJECT()
);
update Objects set Definition =
'{
"stats": 
{
"TL": 2,
"Cost": 20,
"Weight": 5
},
"handling": 
{
"muscle": 
{
"one": 
{
"required skill group": 30,
"Damage": "spec.",
"Acc": 1,
"Range": "spec.",
"RoF": 1,
"Shots": "T(1)",
"ST": 8,
"Bulk": -4,
"Notes": "4,6"
}
}
}
}'
where Id = 10068;
-- ********************************************************************* Sling
insert into Objects (Id, ClassType, Name, Definition) values (
10069,
'Weapon',
'Sling',
JSON_OBJECT()
);
update Objects set Definition =
'{
"stats": 
{
"TL": 0,
"Cost": 20,
"Weight": "0.5/0.05"
},
"handling": 
{
"muscle": 
{
"one": 
{
"required skill group": 31,
"Damage": "sw pi",
"Acc": 0,
"Range": "x6/x10",
"RoF": 1,
"Shots": "1(2)",
"ST": 6,
"Bulk": -4,
"Notes": "4,3,7"
}
}
}
}'
where Id = 10069;
-- ********************************************************************* Staff Sling
insert into Objects (Id, ClassType, Name, Definition) values (
10070,
'Weapon',
'Staff Sling',
JSON_OBJECT()
);
update Objects set Definition =
'{
"stats": 
{
"TL": 1,
"Cost": 20,
"Weight": "2/0.05"
},
"handling": 
{
"muscle": 
{
"both": 
{
"required skill group": 31,
"Damage": "sw+1 pi",
"Acc": 1,
"Range": "x10/x15",
"RoF": 1,
"Shots": "1(2)",
"ST": "7†",
"Bulk": -6,
"Notes": "3,7"
}
}
}
}'
where Id = 10070;
-- ********************************************************************* Atlatl with Dart
insert into Objects (Id, ClassType, Name, Definition) values (
10071,
'Weapon',
'Atlatl with Dart',
JSON_OBJECT()
);
update Objects set Definition =
'{
"stats": 
{
"TL": 0,
"Cost": 20,
"Weight": 1
},
"handling": 
{
"muscle": 
{
"one": 
{
"required skill group": 32,
"Damage": "sw-1 imp",
"Acc": 1,
"Range": "x3/x4",
"RoF": 1,
"Shots": "1(1)",
"ST": 5,
"Bulk": -3,
"Notes": "2"
}
}
}
}'
where Id = 10071;
-- ********************************************************************* Atlatl with Javelin
insert into Objects (Id, ClassType, Name, Definition) values (
10072,
'Weapon',
'Atlatl with Javelin',
JSON_OBJECT()
);
update Objects set Definition =
'{
"stats": 
{
"TL": 0,
"Cost": 30,
"Weight": 2
},
"handling": 
{
"muscle": 
{
"one": 
{
"required skill group": 32,
"Damage": "sw+1 imp",
"Acc": 3,
"Range": "x2/x3",
"RoF": 1,
"Shots": "1(1)",
"ST": 6,
"Bulk": -4,
"Notes": "2"
}
}
}
}'
where Id = 10072;

















































select Id, Name, json_detailed(Definition) from Objects order by Id;







