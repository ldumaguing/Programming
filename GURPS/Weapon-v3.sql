delete from Objects where ClassType = 'Weapon';

-- ********************************************************************* Axe
insert into Objects (Id, ClassType, Name, Definition, Body) values (
10000,
'Weapon',
'Axe',
JSON_OBJECT(),
JSON_OBJECT()
);
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"', JSON_OBJECT())
where Id = 10000;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."required skill group"', 0)
where Id = 10000;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."swing"', JSON_OBJECT())
where Id = 10000;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."swing"."Damage"', '+2 cut')
where Id = 10000;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."swing"."Reach"', 1)
where Id = 10000;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."swing"."Parry"', '0U')
where Id = 10000;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."swing"."ST"', 11)
where Id = 10000;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."swing"."Notes"', null)
where Id = 10000;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"', JSON_OBJECT())
where Id = 10000;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"."TL"', 0)
where Id = 10000;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"."Cost"', 50)
where Id = 10000;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"."Weight"', 4)
where Id = 10000;
-- ********************************************************************* Hatchet
insert into Objects (Id, ClassType, Name, Definition, Body) values (
10001,
'Weapon',
'Hatchet',
JSON_OBJECT(),
JSON_OBJECT()
);
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"', JSON_OBJECT())
where Id = 10001;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."required skill group"', 0)
where Id = 10001;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."swing"', JSON_OBJECT())
where Id = 10001;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."swing"."Damage"', '+0 cut')
where Id = 10001;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."swing"."Reach"', 1)
where Id = 10001;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."swing"."Parry"', 0)
where Id = 10001;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."swing"."ST"', 8)
where Id = 10001;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."swing"."Notes"', '1')
where Id = 10001;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"', JSON_OBJECT())
where Id = 10001;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"."TL"', 0)
where Id = 10001;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"."Cost"', 40)
where Id = 10001;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"."Weight"', 8)
where Id = 10001;
-- ********************************************************************* Throwing Axe
insert into Objects (Id, ClassType, Name, Definition, Body) values (
10002,
'Weapon',
'Throwing Axe',
JSON_OBJECT(),
JSON_OBJECT()
);
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"', JSON_OBJECT())
where Id = 10002;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."required skill group"', 0)
where Id = 10002;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."swing"', JSON_OBJECT())
where Id = 10002;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."swing"."Damage"', '+2 cut')
where Id = 10002;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."swing"."Reach"', 1)
where Id = 10002;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."swing"."Parry"', '0U')
where Id = 10002;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."swing"."ST"', 11)
where Id = 10002;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."swing"."Notes"', '1')
where Id = 10002;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"', JSON_OBJECT())
where Id = 10002;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"."TL"', 0)
where Id = 10002;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"."Cost"', 60)
where Id = 10002;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"."Weight"', 4)
where Id = 10002;
-- ********************************************************************* Mace
insert into Objects (Id, ClassType, Name, Definition, Body) values (
10003,
'Weapon',
'Mace',
JSON_OBJECT(),
JSON_OBJECT()
);
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"', JSON_OBJECT())
where Id = 10003;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."required skill group"', 0)
where Id = 10003;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."swing"', JSON_OBJECT())
where Id = 10003;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."swing"."Damage"', '+3 cr')
where Id = 10003;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."swing"."Reach"', 1)
where Id = 10003;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."swing"."Parry"', '0U')
where Id = 10003;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."swing"."ST"', 12)
where Id = 10003;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."swing"."Notes"', '1')
where Id = 10003;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"', JSON_OBJECT())
where Id = 10003;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"."TL"', 2)
where Id = 10003;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"."Cost"', 50)
where Id = 10003;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"."Weight"', 5)
where Id = 10003;
-- ********************************************************************* Small Mace
insert into Objects (Id, ClassType, Name, Definition, Body) values (
10004,
'Weapon',
'Small Mace',
JSON_OBJECT(),
JSON_OBJECT()
);
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"', JSON_OBJECT())
where Id = 10004;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."required skill group"', 0)
where Id = 10004;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."swing"', JSON_OBJECT())
where Id = 10004;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."swing"."Damage"', '+2 cr')
where Id = 10004;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."swing"."Reach"', 1)
where Id = 10004;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."swing"."Parry"', '0U')
where Id = 10004;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."swing"."ST"', 10)
where Id = 10004;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."swing"."Notes"', '1')
where Id = 10004;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"', JSON_OBJECT())
where Id = 10004;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"."TL"', 2)
where Id = 10004;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"."Cost"', 35)
where Id = 10004;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"."Weight"', 3)
where Id = 10004;
-- ********************************************************************* Pick
insert into Objects (Id, ClassType, Name, Definition, Body) values (
10005,
'Weapon',
'Pick',
JSON_OBJECT(),
JSON_OBJECT()
);
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"', JSON_OBJECT())
where Id = 10005;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."required skill group"', 0)
where Id = 10005;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."swing"', JSON_OBJECT())
where Id = 10005;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."swing"."Damage"', '+1 imp')
where Id = 10005;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."swing"."Reach"', 1)
where Id = 10005;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."swing"."Parry"', '0U')
where Id = 10005;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."swing"."ST"', 10)
where Id = 10005;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."swing"."Notes"', '2')
where Id = 10005;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"', JSON_OBJECT())
where Id = 10005;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"."TL"', 3)
where Id = 10005;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"."Cost"', 70)
where Id = 10005;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"."Weight"', 3)
where Id = 10005;
-- ********************************************************************* Punch
insert into Objects (Id, ClassType, Name, Definition, Body) values (
10006,
'Weapon',
'Punch',
JSON_OBJECT(),
JSON_OBJECT()
);
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"', JSON_OBJECT())
where Id = 10006;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."required skill group"', 1)
where Id = 10006;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."thrust"', JSON_OBJECT())
where Id = 10006;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."thrust"."Damage"', '-1 cr')
where Id = 10006;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."thrust"."Reach"', 'C')
where Id = 10006;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."thrust"."Parry"', 0)
where Id = 10006;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."thrust"."ST"', null)
where Id = 10006;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."thrust"."Notes"', '3')
where Id = 10006;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"', JSON_OBJECT())
where Id = 10006;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"."TL"', null)
where Id = 10006;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"."Cost"', null)
where Id = 10006;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"."Weight"', null)
where Id = 10006;
-- ********************************************************************* Brass Knuckles
insert into Objects (Id, ClassType, Name, Definition, Body) values (
10007,
'Weapon',
'Brass Knuckles',
JSON_OBJECT(),
JSON_OBJECT()
);
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"', JSON_OBJECT())
where Id = 10007;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."required skill group"', 1)
where Id = 10007;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."thrust"', JSON_OBJECT())
where Id = 10007;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."thrust"."Damage"', '+0 cr')
where Id = 10007;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."thrust"."Reach"', 'C')
where Id = 10007;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."thrust"."Parry"', 0)
where Id = 10007;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."thrust"."ST"', null)
where Id = 10007;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."thrust"."Notes"', '3')
where Id = 10007;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"', JSON_OBJECT())
where Id = 10007;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"."TL"', 1)
where Id = 10007;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"."Cost"', 10)
where Id = 10007;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"."Weight"', 0.25)
where Id = 10007;









select name, json_detailed(Definition) from Objects where ClassType = 'Weapon';


