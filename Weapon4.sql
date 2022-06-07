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

-- ********************************************************************* Derringer, .41
insert into Objects (Id, ClassType, Name, Definition) values (
10077,
'Weapon',
'Derringer, .41',
JSON_OBJECT()
);
update Objects set Definition =
'{
"stats": 
{
"TL": 5,
"Cost": 100,
"Weight": "0.5/0.1"
},
"handling": 
{
"trigger": 
{
"one": 
{
"required skill group": 39,
"Damage": "1d pi+",
"Acc": 1,
"Range": "80/650",
"RoF": 1,
"Shots": "2(3i)",
"ST": 9,
"Bulk": -1,
"Recoil": 2,
"Notes": null
}
}
}
}'
where Id = 10077;

-- ********************************************************************* Revolver, .36
insert into Objects (Id, ClassType, Name, Definition) values (
10078,
'Weapon',
'Revolver, .36',
JSON_OBJECT()
);
update Objects set Definition =
'{
"stats": 
{
"TL": 5,
"Cost": 150,
"Weight": "2.5/0.24"
},
"handling": 
{
"trigger": 
{
"one": 
{
"required skill group": 39,
"Damage": "2d-1 pi",
"Acc": 1,
"Range": "120/1300",
"RoF": 1,
"Shots": "6(3i)",
"ST": 10,
"Bulk": -2,
"Recoil": 2,
"Notes": null
}}}}'
where Id = 10078;

-- ********************************************************************* Auto Pistol, .45
insert into Objects (Id, ClassType, Name, Definition) values (
10079,
'Weapon',
'Auto Pistol, .45',
JSON_OBJECT()
);
update Objects set Definition =
'{
"stats": 
{
"TL": 6,
"Cost": 300,
"Weight": "3/0.6"
},
"handling": 
{
"trigger": 
{
"one": 
{
"required skill group": 39,
"Damage": "2d pi+",
"Acc": 2,
"Range": "175/1700",
"RoF": 3,
"Shots": "7+1(3)",
"ST": 10,
"Bulk": -2,
"Recoil": 3,
"Notes": null
}}}}'
where Id = 10079;

-- ********************************************************************* Auto Pistol, 9mm
insert into Objects (Id, ClassType, Name, Definition) values (
10080,
'Weapon',
'Auto Pistol, 9mm',
JSON_OBJECT()
);
update Objects set Definition =
'{
"stats": 
{
"TL": 6,
"Cost": 350,
"Weight": "2.4/0.4"
},
"handling": 
{
"trigger": 
{
"one": 
{
"required skill group": 39,
"Damage": "2d+2 pi",
"Acc": 2,
"Range": "150/1850",
"RoF": 3,
"Shots": "8+1(3)",
"ST": 9,
"Bulk": -2,
"Recoil": 2,
"Notes": null
}}}}'
where Id = 10080;

-- ********************************************************************* Revolver, .38
insert into Objects (Id, ClassType, Name, Definition) values (
10081,
'Weapon',
'Revolver, .38',
JSON_OBJECT()
);
update Objects set Definition =
'{
"stats": 
{
"TL": 6,
"Cost": 400,
"Weight": "2/0.2"
},
"handling": 
{
"trigger": 
{
"one": 
{
"required skill group": 39,
"Damage": "2d-1 pi",
"Acc": 2,
"Range": "120/1500",
"RoF": 3,
"Shots": "6(3i)",
"ST": 8,
"Bulk": -2,
"Recoil": 2,
"Notes": null
}}}}'
where Id = 10081;

-- ********************************************************************* Snub Revolver, .38
insert into Objects (Id, ClassType, Name, Definition) values (
10082,
'Weapon',
'Snub Revolver, .38',
JSON_OBJECT()
);
update Objects set Definition =
'{
"stats": 
{
"TL": 6,
"Cost": 250,
"Weight": "1.5/0.2"
},
"handling": 
{
"trigger": 
{
"one": 
{
"required skill group": 39,
"Damage": "1d+2 pi",
"Acc": 1,
"Range": "120/1250",
"RoF": 3,
"Shots": "5(3i)",
"ST": 8,
"Bulk": -1,
"Recoil": 3,
"Notes": null
}}}}'
where Id = 10082;

-- ********************************************************************* Auto Pistol, 9mm
insert into Objects (Id, ClassType, Name, Definition) values (
10083,
'Weapon',
'Auto Pistol, 9mm',
JSON_OBJECT()
);
update Objects set Definition =
'{
"stats": 
{
"TL": 7,
"Cost": 600,
"Weight": "2.6/0.6"
},
"handling": 
{
"trigger": 
{
"one": 
{
"required skill group": 39,
"Damage": "2d+2 pi",
"Acc": 2,
"Range": "150/1850",
"RoF": 3,
"Shots": "15+1(3)",
"ST": 9,
"Bulk": -2,
"Recoil": 2,
"Notes": null
}}}}'
where Id = 10083;

-- ********************************************************************* Holdout Pistol, .380
insert into Objects (Id, ClassType, Name, Definition) values (
10084,
'Weapon',
'Holdout Pistol, .380',
JSON_OBJECT()
);
update Objects set Definition =
'{
"stats": 
{
"TL": 7,
"Cost": 300,
"Weight": "1.3/0.2"
},
"handling": 
{
"trigger": 
{
"one": 
{
"required skill group": 39,
"Damage": "2d pi",
"Acc": 1,
"Range": "125/1500",
"RoF": 3,
"Shots": "5+1(3)",
"ST": 8,
"Bulk": -1,
"Recoil": 3,
"Notes": null
}}}}'
where Id = 10084;

-- ********************************************************************* Revolver, .357M
insert into Objects (Id, ClassType, Name, Definition) values (
10085,
'Weapon',
'Revolver, .357M',
JSON_OBJECT()
);
update Objects set Definition =
'{
"stats": 
{
"TL": 7,
"Cost": 500,
"Weight": "3/0.21"
},
"handling": 
{
"trigger": 
{
"one": 
{
"required skill group": 39,
"Damage": "3d-1 pi",
"Acc": 2,
"Range": "185/2000",
"RoF": 3,
"Shots": "6(3i)",
"ST": 10,
"Bulk": -2,
"Recoil": 3,
"Notes": null
}}}}'
where Id = 10085;

-- ********************************************************************* Revolver, .44M
insert into Objects (Id, ClassType, Name, Definition) values (
10086,
'Weapon',
'Revolver, .44M',
JSON_OBJECT()
);
update Objects set Definition =
'{
"stats": 
{
"TL": 7,
"Cost": 900,
"Weight": "3.25/0.3"
},
"handling": 
{
"trigger": 
{
"one": 
{
"required skill group": 39,
"Damage": "3d pi+",
"Acc": 2,
"Range": "200/2500",
"RoF": 3,
"Shots": "6(3i)",
"ST": 11,
"Bulk": -3,
"Recoil": 4,
"Notes": null
}}}}'
where Id = 10086;

-- ********************************************************************* Auto Pistol, .44M
insert into Objects (Id, ClassType, Name, Definition) values (
10087,
'Weapon',
'Auto Pistol, .44M',
JSON_OBJECT()
);
update Objects set Definition =
'{
"stats": 
{
"TL": 8,
"Cost": 750,
"Weight": "4.5/0.6"
},
"handling": 
{
"trigger": 
{
"one": 
{
"required skill group": 39,
"Damage": "3d pi+",
"Acc": 2,
"Range": "230/2500",
"RoF": 3,
"Shots": "9+1(3)",
"ST": 12,
"Bulk": -3,
"Recoil": 4,
"Notes": null
}}}}'
where Id = 10087;

-- ********************************************************************* Auto Pistol, .40
insert into Objects (Id, ClassType, Name, Definition) values (
10088,
'Weapon',
'Auto Pistol, .40',
JSON_OBJECT()
);
update Objects set Definition =
'{
"stats": 
{
"TL": 8,
"Cost": 640,
"Weight": "2.1/0.7"
},
"handling": 
{
"trigger": 
{
"one": 
{
"required skill group": 39,
"Damage": "2d pi+",
"Acc": 2,
"Range": "150/1900",
"RoF": 3,
"Shots": "15+1(3)",
"ST": 9,
"Bulk": -2,
"Recoil": 2,
"Notes": null
}}}}'
where Id = 10088;

-- ********************************************************************* Auto Pistol, 9mm
insert into Objects (Id, ClassType, Name, Definition) values (
10089,
'Weapon',
'Auto Pistol, 9mm',
JSON_OBJECT()
);
update Objects set Definition =
'{
"stats": 
{
"TL": 9,
"Cost": 800,
"Weight": "2/0.7"
},
"handling": 
{
"trigger": 
{
"one": 
{
"required skill group": 39,
"Damage": "2d+2 pi",
"Acc": 2,
"Range": "150/1900",
"RoF": 3,
"Shots": "18+1(3)",
"ST": 9,
"Bulk": -2,
"Recoil": 2,
"Notes": null
}}}}'
where Id = 10089;

-- ********************************************************************* Gyroc Pistol, 15mm
insert into Objects (Id, ClassType, Name, Definition) values (
10090,
'Weapon',
'Gyroc Pistol, 15mm',
JSON_OBJECT()
);
update Objects set Definition =
'{
"stats": 
{
"TL": 9,
"Cost": 200,
"Weight": "1/0.4"
},
"handling": 
{
"trigger": 
{
"one": 
{
"required skill group": 40,
"Damage": "6d pi++",
"Acc": 1,
"Range": 1900,
"RoF": 3,
"Shots": "4(3i)",
"ST": 9,
"Bulk": -2,
"Recoil": 1,
"Notes": "1,2"
}}}}'
where Id = 10090;

-- ********************************************************************* SMG, .45
insert into Objects (Id, ClassType, Name, Definition) values (
10091,
'Weapon',
'SMG, .45',
JSON_OBJECT()
);
update Objects set Definition =
'{
"stats": 
{
"TL": 6,
"Cost": 2200,
"Weight": "15.7/4.9"
},
"handling": 
{
"trigger": 
{
"both": 
{
"required skill group": 41,
"Damage": "2d+1 pi+",
"Acc": 3,
"Range": "190/1750",
"RoF": 13,
"Shots": "50+1(5)",
"ST": "11†",
"Bulk": -4,
"Recoil": 3,
"Notes": "3"
}}}}'
where Id = 10091;

-- ********************************************************************* SMG, 9mm
insert into Objects (Id, ClassType, Name, Definition) values (
10092,
'Weapon',
'SMG, 9mm',
JSON_OBJECT()
);
update Objects set Definition =
'{
"stats": 
{
"TL": 6,
"Cost": 700,
"Weight": "10.5/1.5"
},
"handling": 
{
"trigger": 
{
"both": 
{
"required skill group": 41,
"Damage": "3d-1 pi",
"Acc": 3,
"Range": "160/1900",
"RoF": "8!",
"Shots": "32(3)",
"ST": "10†",
"Bulk": -4,
"Recoil": 2,
"Notes": "3"
}}}}'
where Id = 10092;

-- ********************************************************************* Machine Pistol, 9mm
insert into Objects (Id, ClassType, Name, Definition) values (
10093,
'Weapon',
'Machine Pistol, 9mm',
JSON_OBJECT()
);
update Objects set Definition =
'{
"stats": 
{
"TL": 7,
"Cost": 900,
"Weight": "5.5/1.1"
},
"handling": 
{
"trigger": 
{
"one": 
{
"required skill group": 41,
"Damage": "2d+2 pi",
"Acc": 2,
"Range": "160/1900",
"RoF": 20,
"Shots": "25+1(3)",
"ST": 12,
"Bulk": -3,
"Recoil": 3,
"Notes": "3"
}}}}'
where Id = 10093;

-- ********************************************************************* SMG, 9mm
insert into Objects (Id, ClassType, Name, Definition) values (
10094,
'Weapon',
'SMG, 9mm',
JSON_OBJECT()
);
update Objects set Definition =
'{
"stats": 
{
"TL": 7,
"Cost": 1200,
"Weight": "7.5/1.2"
},
"handling": 
{
"trigger": 
{
"both": 
{
"required skill group": 41,
"Damage": "3d-1 pi",
"Acc": 4,
"Range": "160/1900",
"RoF": 13,
"Shots": "30+1(3)",
"ST": "10†",
"Bulk": -4,
"Recoil": 2,
"Notes": "3"
}}}}'
where Id = 10094;

-- ********************************************************************* PDW, 4.6mm
insert into Objects (Id, ClassType, Name, Definition) values (
10095,
'Weapon',
'PDW, 4.6mm',
JSON_OBJECT()
);
update Objects set Definition =
'{
"stats": 
{
"TL": 8,
"Cost": 800,
"Weight": "3.9/0.5"
},
"handling": 
{
"trigger": 
{
"both": 
{
"required skill group": 41,
"Damage": "4d+1 pi-",
"Acc": 3,
"Range": "200/2000",
"RoF": 15,
"Shots": "20+1(3)",
"ST": "7†",
"Bulk": -3,
"Recoil": 2,
"Notes": null
}}}}'
where Id = 10095;

-- ********************************************************************* Gause PDW, 4mm
insert into Objects (Id, ClassType, Name, Definition) values (
10096,
'Weapon',
'Gause PDW, 4mm',
JSON_OBJECT()
);
update Objects set Definition =
'{
"stats": 
{
"TL": 10,
"Cost": 3600,
"Weight": "4.6/1"
},
"handling": 
{
"trigger": 
{
"both": 
{
"required skill group": 41,
"Damage": "4d(3) pi-",
"Acc": "6+1",
"Range": "700/2900",
"RoF": 16,
"Shots": "80(3)",
"ST": "9†",
"Bulk": -3,
"Recoil": 2,
"Notes": "1"
}}}}'
where Id = 10096;

-- ********************************************************************* Handgonne, .90
insert into Objects (Id, ClassType, Name, Definition) values (
10097,
'Weapon',
'Handgonne, .90',
JSON_OBJECT()
);
update Objects set Definition =
'{
"stats": 
{
"TL": 3,
"Cost": 300,
"Weight": "15/0.1"
},
"handling": 
{
"trigger": 
{
"both": 
{
"required skill group": 42,
"Damage": "2d p++",
"Acc": 0,
"Range": "100/600",
"RoF": 1,
"Shots": "1(60)",
"ST": "10†",
"Bulk": -6,
"Recoil": 4,
"Notes": null
}}}}'
where Id = 10097;

-- ********************************************************************* Matchlock Musket, .80
insert into Objects (Id, ClassType, Name, Definition) values (
10098,
'Weapon',
'Matchlock Musket, .80',
JSON_OBJECT()
);
update Objects set Definition =
'{
"stats": 
{
"TL": 4,
"Cost": 150,
"Weight": "20/0.05"
},
"handling": 
{
"trigger": 
{
"both": 
{
"required skill group": 42,
"Damage": "4d pi++",
"Acc": 2,
"Range": "100/600",
"RoF": 1,
"Shots": "1(60)",
"ST": "10R†",
"Bulk": -6,
"Recoil": 3,
"Notes": null
}}}}'
where Id = 10098;

-- ********************************************************************* Flintlock Musket, .75
insert into Objects (Id, ClassType, Name, Definition) values (
10099,
'Weapon',
'Flintlock Musket, .75',
JSON_OBJECT()
);
update Objects set Definition =
'{
"stats": 
{
"TL": 4,
"Cost": 200,
"Weight": "13/0.05"
},
"handling": 
{
"trigger": 
{
"both": 
{
"required skill group": 42,
"Damage": "4d pi++",
"Acc": 2,
"Range": "100/1500",
"RoF": 1,
"Shots": "1(15)",
"ST": "10†",
"Bulk": -6,
"Recoil": 4,
"Notes": null
}}}}'
where Id = 10099;






































































select Id, Name, json_detailed(Definition) from Objects order by Id;











