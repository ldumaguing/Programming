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

-- ********************************************************************* Rifle-Musket, .577
insert into Objects (Id, ClassType, Name, Definition) values (
10100,
'Weapon',
'Rifle-Musket, .577',
JSON_OBJECT()
);
update Objects set Definition =
'{
"stats": 
{
"TL": 5,
"Cost": 150,
"Weight": "8.5/0.05"
},
"handling": 
{
"trigger": 
{
"both": 
{
"required skill group": 43,
"Damage": "4d pi+",
"Acc": 4,
"Range": "700/2100",
"RoF": 1,
"Shots": "1(15)",
"ST": "10†",
"Bulk": -6,
"Recoil": 3,
"Notes": null
}}}}'
where Id = 10100;

-- ********************************************************************* Cartridge Rifle, .45
insert into Objects (Id, ClassType, Name, Definition) values (
10101,
'Weapon',
'Cartridge Rifle, .45',
JSON_OBJECT()
);
update Objects set Definition =
'{
"stats": 
{
"TL": 5,
"Cost": 200,
"Weight": "6/0.1"
},
"handling": 
{
"trigger": 
{
"both": 
{
"required skill group": 43,
"Damage": "5d pi+",
"Acc": 3,
"Range": "600/2000",
"RoF": 1,
"Shots": "1(4)",
"ST": "10†",
"Bulk": -6,
"Recoil": 3,
"Notes": null
}}}}'
where Id = 10101;

-- ********************************************************************* Lever-Action Carbine, .30
insert into Objects (Id, ClassType, Name, Definition) values (
10102,
'Weapon',
'Lever-Action Carbine, .30',
JSON_OBJECT()
);
update Objects set Definition =
'{
"stats": 
{
"TL": 5,
"Cost": 300,
"Weight": "7/0.3"
},
"handling": 
{
"trigger": 
{
"both": 
{
"required skill group": 43,
"Damage": "5d pi",
"Acc": 4,
"Range": "450/3000",
"RoF": 1,
"Shots": "6+1(3i)",
"ST": "10†",
"Bulk": -4,
"Recoil": 2,
"Notes": null
}}}}'
where Id = 10102;

-- ********************************************************************* Bolt-Action Rifle, 7.62mm
insert into Objects (Id, ClassType, Name, Definition) values (
10103,
'Weapon',
'Bolt-Action Rifle, 7.62mm',
JSON_OBJECT()
);
update Objects set Definition =
'{
"stats": 
{
"TL": 6,
"Cost": 350,
"Weight": "8.9/0.3"
},
"handling": 
{
"trigger": 
{
"both": 
{
"required skill group": 43,
"Damage": "7d pi",
"Acc": 5,
"Range": "1000/4200",
"RoF": 1,
"Shots": "5+1(3)",
"ST": "10†",
"Bulk": -5,
"Recoil": 4,
"Notes": null
}}}}'
where Id = 10103;

-- ********************************************************************* Self-Loading Rifle, 7.62mm
insert into Objects (Id, ClassType, Name, Definition) values (
10104,
'Weapon',
'Self-Loading Rifle, 7.62mm',
JSON_OBJECT()
);
update Objects set Definition =
'{
"stats": 
{
"TL": 6,
"Cost": 600,
"Weight": "10/0.5"
},
"handling": 
{
"trigger": 
{
"both": 
{
"required skill group": 43,
"Damage": "7d pi",
"Acc": 5,
"Range": "1000/4200",
"RoF": 3,
"Shots": "8(3)",
"ST": "10†",
"Bulk": -5,
"Recoil": 3,
"Notes": null
}}}}'
where Id = 10104;

-- ********************************************************************* Assault Rifle, 5.56mm
insert into Objects (Id, ClassType, Name, Definition) values (
10105,
'Weapon',
'Assault Rifle, 5.56mm',
JSON_OBJECT()
);
update Objects set Definition =
'{
"stats": 
{
"TL": 7,
"Cost": 800,
"Weight": "9/1"
},
"handling": 
{
"trigger": 
{
"both": 
{
"required skill group": 43,
"Damage": "5d pi",
"Acc": 5,
"Range": "500/3500",
"RoF": 12,
"Shots": "30+1(3)",
"ST": "9†",
"Bulk": -4,
"Recoil": 2,
"Notes": "1"
}}}}'
where Id = 10105;

-- ********************************************************************* Assault Rifle, 7.62mmS
insert into Objects (Id, ClassType, Name, Definition) values (
10106,
'Weapon',
'Assault Rifle, 7.62mmS',
JSON_OBJECT()
);
update Objects set Definition =
'{
"stats": 
{
"TL": 7,
"Cost": 300,
"Weight": "10.5/1.8"
},
"handling": 
{
"trigger": 
{
"both": 
{
"required skill group": 43,
"Damage": "5d+1 pi",
"Acc": 4,
"Range": "400/3000",
"RoF": 10,
"Shots": "30+1(3)",
"ST": "10†",
"Bulk": -4,
"Recoil": 2,
"Notes": "1"
}}}}'
where Id = 10106;

-- ********************************************************************* Battle Rifle, 7.62mm
insert into Objects (Id, ClassType, Name, Definition) values (
10107,
'Weapon',
'Battle Rifle, 7.62mm',
JSON_OBJECT()
);
update Objects set Definition =
'{
"stats": 
{
"TL": 7,
"Cost": 900,
"Weight": "11/1.7"
},
"handling": 
{
"trigger": 
{
"both": 
{
"required skill group": 43,
"Damage": "7d pi",
"Acc": 5,
"Range": "1000/4200",
"RoF": 11,
"Shots": "20+1(3)",
"ST": "11†",
"Bulk": -5,
"Recoil": 3,
"Notes": "1"
}}}}'
where Id = 10107;

-- ********************************************************************* Assault Carbine, 5.56mm
insert into Objects (Id, ClassType, Name, Definition) values (
10108,
'Weapon',
'Assault Carbine, 5.56mm',
JSON_OBJECT()
);
update Objects set Definition =
'{
"stats": 
{
"TL": 8,
"Cost": 900,
"Weight": "7.3/1"
},
"handling": 
{
"trigger": 
{
"both": 
{
"required skill group": 43,
"Damage": "4d+2 pi",
"Acc": 4,
"Range": "400/3000",
"RoF": 15,
"Shots": "30+1(3)",
"ST": "9†",
"Bulk": -3,
"Recoil": 2,
"Notes": "1"
}}}}'
where Id = 10108;

-- ********************************************************************* Dart Rifle, 11mm
insert into Objects (Id, ClassType, Name, Definition) values (
10109,
'Weapon',
'Dart Rifle, 11mm',
JSON_OBJECT()
);
update Objects set Definition =
'{
"stats": 
{
"TL": 8,
"Cost": 1200,
"Weight": "6.6/0.02"
},
"handling": 
{
"trigger": 
{
"both": 
{
"required skill group": 43,
"Damage": "1d(0.2) pi-",
"Acc": "5+1",
"Range": "45/145",
"RoF": 1,
"Shots": "1(3)",
"ST": "9†",
"Bulk": -5,
"Recoil": 2,
"Notes": "2"
}}}}'
where Id = 10109;

-- ********************************************************************* Sniper Rifle, .338
insert into Objects (Id, ClassType, Name, Definition) values (
10110,
'Weapon',
'Sniper Rifle, .338',
JSON_OBJECT()
);
update Objects set Definition =
'{
"stats": 
{
"TL": 8,
"Cost": 5600,
"Weight": "17.5/0.8"
},
"handling": 
{
"trigger": 
{
"both": 
{
"required skill group": 43,
"Damage": "9d+1 pi",
"Acc": "6+3",
"Range": "1500/5500",
"RoF": 1,
"Shots": "4+1(3)",
"ST": "11B†",
"Bulk": -6,
"Recoil": 4,
"Notes": null
}}}}'
where Id = 10110;

-- ********************************************************************* ICW, 6.8mm
insert into Objects (Id, ClassType, Name, Definition) values (
10111,
'Weapon',
'ICW, 6.8mm',
JSON_OBJECT()
);
update Objects set Definition =
'{
"stats": 
{
"TL": 9,
"Cost": 7000,
"Weight": "12/1.5"
},
"handling": 
{
"trigger": 
{
"both": 
{
"required skill group": 43,
"Damage": "6d pi",
"Acc": "6+3",
"Range": "700/4000",
"RoF": 15,
"Shots": "25+1(3)",
"ST": "10†",
"Bulk": -5,
"Recoil": 2,
"Notes": "3,4"
}}}}'
where Id = 10111;

-- ********************************************************************* Gauss Rifle, 4mm
insert into Objects (Id, ClassType, Name, Definition) values (
10112,
'Weapon',
'Gauss Rifle, 4mm',
JSON_OBJECT()
);
update Objects set Definition =
'{
"stats": 
{
"TL": 10,
"Cost": 7100,
"Weight": "8.5/1.4"
},
"handling": 
{
"trigger": 
{
"both": 
{
"required skill group": 43,
"Damage": "6d+2(3) pi-",
"Acc": "7+2",
"Range": "1200/4800",
"RoF": 12,
"Shots": "60(3)",
"ST": "10†",
"Bulk": -4,
"Recoil": 2,
"Notes": "3"
}}}}'
where Id = 10112;

-- ********************************************************************* Blunderbuss, 8G
insert into Objects (Id, ClassType, Name, Definition) values (
10113,
'Weapon',
'Blunderbuss, 8G',
JSON_OBJECT()
);
update Objects set Definition =
'{
"stats": 
{
"TL": 4,
"Cost": 150,
"Weight": "12/0.13"
},
"handling": 
{
"trigger": 
{
"both": 
{
"required skill group": 44,
"Damage": "1d pi",
"Acc": 1,
"Range": "15/100",
"RoF": "1x9",
"Shots": "1(15)",
"ST": "11†",
"Bulk": -5,
"Recoil": 1,
"Notes": null
}}}}'
where Id = 10113;

-- ********************************************************************* Double Shotgun, 10G
insert into Objects (Id, ClassType, Name, Definition) values (
10114,
'Weapon',
'Double Shotgun, 10G',
JSON_OBJECT()
);
update Objects set Definition =
'{
"stats": 
{
"TL": 5,
"Cost": 450,
"Weight": "10/0.1"
},
"handling": 
{
"trigger": 
{
"both": 
{
"required skill group": 44,
"Damage": "1d+2 pi",
"Acc": 3,
"Range": "50/125",
"RoF": "2x9",
"Shots": "2(3i)",
"ST": "11†",
"Bulk": -5,
"Recoil": 1,
"Notes": null
}}}}'
where Id = 10114;

-- ********************************************************************* Pump Shotgun, 12G
insert into Objects (Id, ClassType, Name, Definition) values (
10115,
'Weapon',
'Pump Shotgun, 12G',
JSON_OBJECT()
);
update Objects set Definition =
'{
"stats": 
{
"TL": 6,
"Cost": 240,
"Weight": "8/0.7"
},
"handling": 
{
"trigger": 
{
"both": 
{
"required skill group": 44,
"Damage": "1d+1 pi",
"Acc": 3,
"Range": "50/125",
"RoF": "2x9",
"Shots": "5(3i)",
"ST": "10†",
"Bulk": -5,
"Recoil": 1,
"Notes": null
}}}}'
where Id = 10115;

-- ********************************************************************* Auto Shotgun, 12G
insert into Objects (Id, ClassType, Name, Definition) values (
10116,
'Weapon',
'Auto Shotgun, 12G',
JSON_OBJECT()
);
update Objects set Definition =
'{
"stats": 
{
"TL": 7,
"Cost": 950,
"Weight": "8.4/0.85"
},
"handling": 
{
"trigger": 
{
"both": 
{
"required skill group": 44,
"Damage": "1d+1 pi",
"Acc": 3,
"Range": "50/125",
"RoF": "3x9",
"Shots": "6+1(3i)",
"ST": "10†",
"Bulk": -5,
"Recoil": 1,
"Notes": null
}}}}'
where Id = 10116;

-- ********************************************************************* Electrolaser Pistol
insert into Objects (Id, ClassType, Name, Definition) values (
10117,
'Weapon',
'Electrolaser Pistol',
JSON_OBJECT()
);
update Objects set Definition =
'{
"stats": 
{
"TL": 9,
"Cost": 1800,
"Weight": "2.2/0.5"
},
"handling": 
{
"trigger": 
{
"one": 
{
"required skill group": 45,
"Damage": ["1d-3 burn", "HT-4(2) aff"],
"Acc": 4,
"Range": "40/80",
"RoF": 3,
"Shots": "180(3)",
"ST": 4,
"Bulk": -2,
"Recoil": 1,
"Notes": "1,2,3"
}}}}'
where Id = 10117;

-- ********************************************************************* Laser Pistol
insert into Objects (Id, ClassType, Name, Definition) values (
10118,
'Weapon',
'Laser Pistol',
JSON_OBJECT()
);
update Objects set Definition =
'{
"stats": 
{
"TL": 10,
"Cost": 2800,
"Weight": "3.3/0.5"
},
"handling": 
{
"trigger": 
{
"one": 
{
"required skill group": 45,
"Damage": "3d(2) burn",
"Acc": 6,
"Range": "250/750",
"RoF": 10,
"Shots": "400(3)",
"ST": 6,
"Bulk": -2,
"Recoil": 1,
"Notes": "3"
}}}}'
where Id = 10118;

-- ********************************************************************* Blaster Pistol
insert into Objects (Id, ClassType, Name, Definition) values (
10119,
'Weapon',
'Blaster Pistol',
JSON_OBJECT()
);
update Objects set Definition =
'{
"stats": 
{
"TL": 11,
"Cost": 2200,
"Weight": "1.6/0.5"
},
"handling": 
{
"trigger": 
{
"one": 
{
"required skill group": 45,
"Damage": "3d(5) burn",
"Acc": 5,
"Range": "300/900",
"RoF": 3,
"Shots": "200(3)",
"ST": 4,
"Bulk": -2,
"Recoil": 1,
"Notes": "4,5"
}}}}'
where Id = 10119;

-- ********************************************************************* Electrolaser Carbine
insert into Objects (Id, ClassType, Name, Definition) values (
10120,
'Weapon',
'Electrolaser Carbine',
JSON_OBJECT()
);
update Objects set Definition =
'{
"stats": 
{
"TL": 9,
"Cost": 3900,
"Weight": "3.7/1"
},
"handling": 
{
"trigger": 
{
"both": 
{
"required skill group": 46,
"Damage": ["1d-3 burn", "HT-4(2) aff"],
"Acc": "8+1",
"Range": "160/470",
"RoF": 3,
"Shots": "360(3)",
"ST": "4†",
"Bulk": -4,
"Recoil": 1,
"Notes": "1,2,3"
}}}}'
where Id = 10120;

-- ********************************************************************* Laser Sniper Rifle
insert into Objects (Id, ClassType, Name, Definition) values (
10121,
'Weapon',
'Laser Sniper Rifle',
JSON_OBJECT()
);
update Objects set Definition =
'{
"stats": 
{
"TL": 9,
"Cost": 20000,
"Weight": "20/4p"
},
"handling": 
{
"trigger": 
{
"both": 
{
"required skill group": 46,
"Damage": "5d(2) burn",
"Acc": "12+2",
"Range": "1100/3300",
"RoF": 3,
"Shots": "75(3)",
"ST": "10†",
"Bulk": -8,
"Recoil": 1,
"Notes": "3"
}}}}'
where Id = 10121;

-- ********************************************************************* Laser Rifle
insert into Objects (Id, ClassType, Name, Definition) values (
10122,
'Weapon',
'Laser Rifle',
JSON_OBJECT()
);
update Objects set Definition =
'{
"stats": 
{
"TL": 10,
"Cost": 10000,
"Weight": "10/2"
},
"handling": 
{
"trigger": 
{
"both": 
{
"required skill group": 46,
"Damage": "5d(2) burn",
"Acc": "12+2",
"Range": "700/2100",
"RoF": 10,
"Shots": "150(3)",
"ST": "7†",
"Bulk": -4,
"Recoil": 1,
"Notes": "3"
}}}}'
where Id = 10122;

-- ********************************************************************* Blaster Rifle
insert into Objects (Id, ClassType, Name, Definition) values (
10123,
'Weapon',
'Blaster Rifle',
JSON_OBJECT()
);
update Objects set Definition =
'{
"stats": 
{
"TL": 11,
"Cost": 18000,
"Weight": "10/1"
},
"handling": 
{
"trigger": 
{
"both": 
{
"required skill group": 46,
"Damage": "6d(5) burn",
"Acc": "10+2",
"Range": "700/2100",
"RoF": 3,
"Shots": "50(3)",
"ST": "7†",
"Bulk": -4,
"Recoil": 1,
"Notes": "4,5"
}}}}'
where Id = 10123;

-- ********************************************************************* Heavy Blaster
insert into Objects (Id, ClassType, Name, Definition) values (
10124,
'Weapon',
'Heavy Blaster',
JSON_OBJECT()
);
update Objects set Definition =
'{
"stats": 
{
"TL": 11,
"Cost": 23000,
"Weight": "20/4p"
},
"handling": 
{
"trigger": 
{
"both": 
{
"required skill group": 46,
"Damage": "8d(5) burn",
"Acc": "10+4",
"Range": "900/2700",
"RoF": 3,
"Shots": "90(5)",
"ST": "10†",
"Bulk": -6,
"Recoil": 1,
"Notes": "4"
}}}}'
where Id = 10124;

-- ********************************************************************* ATGM, 115mm
insert into Objects (Id, ClassType, Name, Definition) values (
10125,
'Weapon',
'ATGM, 115mm',
JSON_OBJECT()
);
update Objects set Definition =
'{
"stats": 
{
"TL": 7,
"Cost": 20000,
"Weight": "37/26"
},
"handling": 
{
"trigger": 
{
"both": 
{
"required skill group": 47,
"Damage": "6dx10(10) cr ex",
"Acc": 3,
"Range": "200/2000",
"RoF": 1,
"Shots": "1(20)",
"ST": "11B†",
"Bulk": -10,
"Recoil": 1,
"Notes": "1,2,3"
}}}}'
where Id = 10125;

-- ********************************************************************* SAM, 70mm
insert into Objects (Id, ClassType, Name, Definition) values (
10126,
'Weapon',
'SAM, 70mm',
JSON_OBJECT()
);
update Objects set Definition =
'{
"stats": 
{
"TL": 8,
"Cost": 38000,
"Weight": "18/22"
},
"handling": 
{
"trigger": 
{
"both": 
{
"required skill group": 47,
"Damage": "6dx3 cr ex[6d]",
"Acc": 7,
"Range": "1000/8800",
"RoF": 1,
"Shots": "1(20)",
"ST": "10†",
"Bulk": -8,
"Recoil": 1,
"Notes": "1,2,4"
}}}}'
where Id = 10126;

-- ********************************************************************* Scorpion
insert into Objects (Id, ClassType, Name, Definition) values (
10127,
'Weapon',
'Scorpion',
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
where Id = 10127;















select Id, Name, json_detailed(Definition) from Objects order by Id;











