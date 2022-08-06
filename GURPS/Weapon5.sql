delete from Objects where Id >= 10128;

-- ********************************************************************* HMG, .50
insert into Objects (Id, ClassType, Name, Definition) values (
10128,
'Weapon',
'HMG, .50',
JSON_OBJECT()
);
update Objects set Definition =
'{
"stats": 
{
"TL": 6,
"Cost": 14000,
"Weight": "116/32"
},
"handling": 
{
"trigger": 
{
"both": 
{
"required skill group": 49,
"Damage": "13d+1 pi+",
"Acc": 6,
"Range": "1800/7400",
"RoF": "8!",
"Shots": "100(5)",
"ST": "20M†",
"Bulk": -8,
"Recoil": 2,
"Notes": "5"
}}}}'
where Id = 10128;

-- ********************************************************************* Under-Barrel, 40mm
insert into Objects (Id, ClassType, Name, Definition) values (
10129,
'Weapon',
'Under-Barrel, 40mm',
JSON_OBJECT()
);
update Objects set Definition =
'{
"stats": 
{
"TL": 7,
"Cost": 500,
"Weight": "+3.5/0.5"
},
"handling": 
{
"trigger": 
{
"one": 
{
"required skill group": 50,
"Damage": "4d(10) cr ex[2d]",
"Acc": 2,
"Range": "150/440",
"RoF": 1,
"Shots": "1(3)",
"ST": 11,
"Bulk": null,
"Recoil": 2,
"Notes": "1,6,7"
}}}}'
where Id = 10129;

-- ********************************************************************* Integral, 25mm
insert into Objects (Id, ClassType, Name, Definition) values (
10130,
'Weapon',
'Integral, 25mm',
JSON_OBJECT()
);
update Objects set Definition =
'{
"stats": 
{
"TL": 9,
"Cost": null,
"Weight": "0/1.6"
},
"handling": 
{
"trigger": 
{
"one": 
{
"required skill group": 50,
"Damage": "7d cr ex[3d]",
"Acc": "4+2",
"Range": 2200,
"RoF": 1,
"Shots": "3(3)",
"ST": 10,
"Bulk": null,
"Recoil": 3,
"Notes": "8"
}}}}'
where Id = 10130;

-- ********************************************************************* Bazooka, 60mm
insert into Objects (Id, ClassType, Name, Definition) values (
10131,
'Weapon',
'Bazooka, 60mm',
JSON_OBJECT()
);
update Objects set Definition =
'{
"stats": 
{
"TL": 7,
"Cost": 1000,
"Weight": "16.7/3.4"
},
"handling": 
{
"trigger": 
{
"both": 
{
"required skill group": 51,
"Damage": "6dx2(10) cr ex",
"Acc": 3,
"Range": "100/650",
"RoF": 1,
"Shots": "1(4)",
"ST": "10†",
"Bulk": -6,
"Recoil": 1,
"Notes": "2,7"
}}}}'
where Id = 10131;

-- ********************************************************************* RPG, 85mm
insert into Objects (Id, ClassType, Name, Definition) values (
10132,
'Weapon',
'RPG, 85mm',
JSON_OBJECT()
);
update Objects set Definition =
'{
"stats": 
{
"TL": 7,
"Cost": 800,
"Weight": "21/5.7"
},
"handling": 
{
"trigger": 
{
"both": 
{
"required skill group": 51,
"Damage": "6dx3(10) cr ex",
"Acc": "3+1",
"Range": "300/1000",
"RoF": 1,
"Shots": "1(5)",
"ST": "10†",
"Bulk": -6,
"Recoil": 1,
"Notes": "2,7"
}}}}'
where Id = 10132;

-- ********************************************************************* LAW, 84mm
insert into Objects (Id, ClassType, Name, Definition) values (
10133,
'Weapon',
'LAW, 84mm',
JSON_OBJECT()
);
update Objects set Definition =
'{
"stats": 
{
"TL": 8,
"Cost": 750,
"Weight": 14.7
},
"handling": 
{
"trigger": 
{
"both": 
{
"required skill group": 51,
"Damage": "6dx6(10) cr ex",
"Acc": 3,
"Range": "330/2300",
"RoF": 1,
"Shots": "1(0)",
"ST": "10†",
"Bulk": -5,
"Recoil": 1,
"Notes": "2,7"
}}}}'
where Id = 10133;

-- ********************************************************************* Auto Rifle, 7.62mm
insert into Objects (Id, ClassType, Name, Definition) values (
10134,
'Weapon',
'Auto Rifle, 7.62mm',
JSON_OBJECT()
);
update Objects set Definition =
'{
"stats": 
{
"TL": 6,
"Cost": 6500,
"Weight": "22/1.6"
},
"handling": 
{
"trigger": 
{
"both": 
{
"required skill group": 52,
"Damage": "7d pi",
"Acc": 5,
"Range": "1000/4200",
"RoF": "9!",
"Shots": "20(3)",
"ST": "12B†",
"Bulk": -6,
"Recoil": 3,
"Notes": null
}}}}'
where Id = 10134;

-- ********************************************************************* LMG, 7.62mm
insert into Objects (Id, ClassType, Name, Definition) values (
10135,
'Weapon',
'LMG, 7.62mm',
JSON_OBJECT()
);
update Objects set Definition =
'{
"stats": 
{
"TL": 6,
"Cost": 6600,
"Weight": "30/6"
},
"handling": 
{
"trigger": 
{
"both": 
{
"required skill group": 52,
"Damage": "7d pi",
"Acc": 5,
"Range": "1000/4200",
"RoF": "15!",
"Shots": "100(5)",
"ST": "13B†",
"Bulk": -6,
"Recoil": 2,
"Notes": null
}}}}'
where Id = 10135;

-- ********************************************************************* SAW, 5.56mm
insert into Objects (Id, ClassType, Name, Definition) values (
10136,
'Weapon',
'SAW, 5.56mm',
JSON_OBJECT()
);
update Objects set Definition =
'{
"stats": 
{
"TL": 7,
"Cost": 4800,
"Weight": "24/7"
},
"handling": 
{
"trigger": 
{
"both": 
{
"required skill group": 52,
"Damage": "5d+1 pi",
"Acc": 5,
"Range": "800/3500",
"RoF": "12!",
"Shots": "200(5)",
"ST": "12B†",
"Bulk": -6,
"Recoil": 2,
"Notes": null
}}}}'
where Id = 10136;

-- ********************************************************************* Flamethrower
insert into Objects (Id, ClassType, Name, Definition) values (
10137,
'Weapon',
'Flamethrower',
JSON_OBJECT()
);
update Objects set Definition =
'{
"stats": 
{
"TL": 6,
"Cost": 1800,
"Weight": "24/7"
},
"handling": 
{
"trigger": 
{
"both": 
{
"required skill group": 53,
"Damage": "3d burn",
"Acc": null,
"Range": 50,
"RoF": 70,
"Shots": 10,
"ST": "10†",
"Bulk": -8,
"Recoil": null,
"Notes": null
}}}}'
where Id = 10137;


















-- select Id, Name, json_detailed(Definition) from Objects order by Id;











