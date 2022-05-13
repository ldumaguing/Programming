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
-- ********************************************************************* Kick
insert into Objects (Id, ClassType, Name, Definition, Body) values (
10008,
'Weapon',
'Kick',
JSON_OBJECT(),
JSON_OBJECT()
);
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"', JSON_OBJECT())
where Id = 10008;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."required skill group"', 2)
where Id = 10008;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."thrust"', JSON_OBJECT())
where Id = 10008;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."thrust"."Damage"', '+0 cr')
where Id = 10008;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."thrust"."Reach"', 'C,1')
where Id = 10008;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."thrust"."Parry"', 'No')
where Id = 10008;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."thrust"."ST"', null)
where Id = 10008;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."thrust"."Notes"', '3,4')
where Id = 10008;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"', JSON_OBJECT())
where Id = 10008;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"."TL"', null)
where Id = 10008;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"."Cost"', null)
where Id = 10008;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"."Weight"', null)
where Id = 10008;
-- ********************************************************************* Kick w. Boots
insert into Objects (Id, ClassType, Name, Definition, Body) values (
10009,
'Weapon',
'Kick w. Boots',
JSON_OBJECT(),
JSON_OBJECT()
);
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"', JSON_OBJECT())
where Id = 10009;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."required skill group"', 2)
where Id = 10009;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."thrust"', JSON_OBJECT())
where Id = 10009;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."thrust"."Damage"', '+1 cr')
where Id = 10009;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."thrust"."Reach"', 'C,1')
where Id = 10009;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."thrust"."Parry"', 'No')
where Id = 10009;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."thrust"."ST"', null)
where Id = 10009;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."thrust"."Notes"', '3,4')
where Id = 10009;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"', JSON_OBJECT())
where Id = 10009;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"."TL"', null)
where Id = 10009;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"."Cost"', null)
where Id = 10009;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"."Weight"', null)
where Id = 10009;
-- ********************************************************************* Blunt Teeth
insert into Objects (Id, ClassType, Name, Definition, Body) values (
10010,
'Weapon',
'Blunt Teeth',
JSON_OBJECT(),
JSON_OBJECT()
);
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"', JSON_OBJECT())
where Id = 10010;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."required skill group"', 3)
where Id = 10010;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."thrust"', JSON_OBJECT())
where Id = 10010;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."thrust"."Damage"', '-1 cr')
where Id = 10010;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."thrust"."Reach"', 'C')
where Id = 10010;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."thrust"."Parry"', 'No')
where Id = 10010;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."thrust"."ST"', null)
where Id = 10010;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."thrust"."Notes"', '3')
where Id = 10010;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"', JSON_OBJECT())
where Id = 10010;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"."TL"', null)
where Id = 10010;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"."Cost"', null)
where Id = 10010;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"."Weight"', null)
where Id = 10010;
-- ********************************************************************* Fangs
insert into Objects (Id, ClassType, Name, Definition, Body) values (
10011,
'Weapon',
'Fangs',
JSON_OBJECT(),
JSON_OBJECT()
);
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"', JSON_OBJECT())
where Id = 10011;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."required skill group"', 3)
where Id = 10011;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."thrust"', JSON_OBJECT())
where Id = 10011;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."thrust"."Damage"', '-1 imp')
where Id = 10011;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."thrust"."Reach"', 'C')
where Id = 10011;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."thrust"."Parry"', 'No')
where Id = 10011;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."thrust"."ST"', null)
where Id = 10011;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."thrust"."Notes"', '3')
where Id = 10011;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"', JSON_OBJECT())
where Id = 10011;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"."TL"', null)
where Id = 10011;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"."Cost"', null)
where Id = 10011;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"."Weight"', null)
where Id = 10011;
-- ********************************************************************* Sharp Beak
insert into Objects (Id, ClassType, Name, Definition, Body) values (
10012,
'Weapon',
'Sharp Beak',
JSON_OBJECT(),
JSON_OBJECT()
);
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"', JSON_OBJECT())
where Id = 10012;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."required skill group"', 3)
where Id = 10012;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."thrust"', JSON_OBJECT())
where Id = 10012;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."thrust"."Damage"', '-1 pi+')
where Id = 10012;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."thrust"."Reach"', 'C')
where Id = 10012;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."thrust"."Parry"', 'No')
where Id = 10012;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."thrust"."ST"', null)
where Id = 10012;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."thrust"."Notes"', '3')
where Id = 10012;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"', JSON_OBJECT())
where Id = 10012;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"."TL"', null)
where Id = 10012;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"."Cost"', null)
where Id = 10012;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"."Weight"', null)
where Id = 10012;
-- ********************************************************************* Sharp Teeth
insert into Objects (Id, ClassType, Name, Definition, Body) values (
10013,
'Weapon',
'Sharp Teeth',
JSON_OBJECT(),
JSON_OBJECT()
);
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"', JSON_OBJECT())
where Id = 10013;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."required skill group"', 3)
where Id = 10013;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."thrust"', JSON_OBJECT())
where Id = 10013;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."thrust"."Damage"', '-1 cut')
where Id = 10013;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."thrust"."Reach"', 'C')
where Id = 10013;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."thrust"."Parry"', 'No')
where Id = 10013;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."thrust"."ST"', null)
where Id = 10013;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."thrust"."Notes"', '3')
where Id = 10013;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"', JSON_OBJECT())
where Id = 10013;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"."TL"', null)
where Id = 10013;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"."Cost"', null)
where Id = 10013;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"."Weight"', null)
where Id = 10013;
-- ********************************************************************* Blackjack or Sap
insert into Objects (Id, ClassType, Name, Definition, Body) values (
10014,
'Weapon',
'Blackjack or Sap',
JSON_OBJECT(),
JSON_OBJECT()
);
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"', JSON_OBJECT())
where Id = 10014;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."required skill group"', 3)
where Id = 10014;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."thrust"', JSON_OBJECT())
where Id = 10014;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."thrust"."Damage"', '+0 cr')
where Id = 10014;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."thrust"."Reach"', 'C')
where Id = 10014;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."thrust"."Parry"', 0)
where Id = 10014;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."thrust"."ST"', 7)
where Id = 10014;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."thrust"."Notes"', '3')
where Id = 10014;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"', JSON_OBJECT())
where Id = 10014;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"."TL"', 1)
where Id = 10014;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"."Cost"', 20)
where Id = 10014;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"."Weight"', 1)
where Id = 10014;
-- ********************************************************************* Stun Gun
insert into Objects (Id, ClassType, Name, Definition, Body) values (
10015,
'Weapon',
'Stun Gun',
JSON_OBJECT(),
JSON_OBJECT()
);
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"', JSON_OBJECT())
where Id = 10015;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."required skill group"', 3)
where Id = 10015;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."trigger"', JSON_OBJECT())
where Id = 10015;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."trigger"."Damage"', 'HT-3(0.5) aff')
where Id = 10015;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."trigger"."Reach"', 'C,1')
where Id = 10015;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."trigger"."Parry"', 'No')
where Id = 10015;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."trigger"."ST"', 2)
where Id = 10015;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."trigger"."Notes"', '5')
where Id = 10015;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"', JSON_OBJECT())
where Id = 10015;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"."TL"', 8)
where Id = 10015;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"."Cost"', 100)
where Id = 10015;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"."Weight"', 1)
where Id = 10015;


-- ********************************************************************* Light Club
insert into Objects (Id, ClassType, Name, Definition, Body) values (
10016,
'Weapon',
'Light Club',
JSON_OBJECT(),
JSON_OBJECT()
);
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"', JSON_OBJECT())
where Id = 10016;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."required skill group"', 4)
where Id = 10016;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."swing"', JSON_OBJECT())
where Id = 10016;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."swing"."Damage"', '+1 cr')
where Id = 10016;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."swing"."Reach"', 1)
where Id = 10016;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."swing"."Parry"', 0)
where Id = 10016;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."swing"."ST"', 10)
where Id = 10016;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."swing"."Notes"', null)
where Id = 10016;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."thrust"', JSON_OBJECT())
where Id = 10016;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."thrust"."Damage"', '+1 cr')
where Id = 10016;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."thrust"."Reach"', 1)
where Id = 10016;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."thrust"."Parry"', 0)
where Id = 10016;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."thrust"."ST"', 10)
where Id = 10016;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."thrust"."Notes"', null)
where Id = 10016;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"', JSON_OBJECT())
where Id = 10016;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"."TL"', 0)
where Id = 10016;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"."Cost"', 5)
where Id = 10016;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"."Weight"', 3)
where Id = 10016;
-- ********************************************************************* Broadsword
insert into Objects (Id, ClassType, Name, Definition, Body) values (
10017,
'Weapon',
'Broadsword',
JSON_OBJECT(),
JSON_OBJECT()
);
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"', JSON_OBJECT())
where Id = 10017;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."required skill group"', 4)
where Id = 10017;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."swing"', JSON_OBJECT())
where Id = 10017;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."swing"."Damage"', '+1 cut')
where Id = 10017;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."swing"."Reach"', 1)
where Id = 10017;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."swing"."Parry"', 0)
where Id = 10017;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."swing"."ST"', 10)
where Id = 10017;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."swing"."Notes"', null)
where Id = 10017;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."thrust"', JSON_OBJECT())
where Id = 10017;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."thrust"."Damage"', '+1 cr')
where Id = 10017;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."thrust"."Reach"', 1)
where Id = 10017;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."thrust"."Parry"', 0)
where Id = 10017;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."thrust"."ST"', 10)
where Id = 10017;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."thrust"."Notes"', null)
where Id = 10017;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"', JSON_OBJECT())
where Id = 10017;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"."TL"', 2)
where Id = 10017;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"."Cost"', 500)
where Id = 10017;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"."Weight"', 3)
where Id = 10017;
-- ********************************************************************* Thrusting Broadsword
insert into Objects (Id, ClassType, Name, Definition, Body) values (
10018,
'Weapon',
'Thrusting Broadsword',
JSON_OBJECT(),
JSON_OBJECT()
);
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"', JSON_OBJECT())
where Id = 10018;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."required skill group"', 4)
where Id = 10018;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."swing"', JSON_OBJECT())
where Id = 10018;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."swing"."Damage"', '+1 cut')
where Id = 10018;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."swing"."Reach"', 1)
where Id = 10018;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."swing"."Parry"', 0)
where Id = 10018;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."swing"."ST"', 10)
where Id = 10018;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."swing"."Notes"', null)
where Id = 10018;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."thrust"', JSON_OBJECT())
where Id = 10018;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."thrust"."Damage"', '+2 imp')
where Id = 10018;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."thrust"."Reach"', 1)
where Id = 10018;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."thrust"."Parry"', 0)
where Id = 10018;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."thrust"."ST"', 10)
where Id = 10018;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."thrust"."Notes"', null)
where Id = 10018;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"', JSON_OBJECT())
where Id = 10018;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"."TL"', 2)
where Id = 10018;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"."Cost"', 600)
where Id = 10018;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"."Weight"', 3)
where Id = 10018;
-- ********************************************************************* Bastard Sword
insert into Objects (Id, ClassType, Name, Definition, Body) values (
10019,
'Weapon',
'Bastard Sword',
JSON_OBJECT(),
JSON_OBJECT()
);
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"', JSON_OBJECT())
where Id = 10019;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."required skill group"', 4)
where Id = 10019;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."swing"', JSON_OBJECT())
where Id = 10019;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."swing"."Damage"', '+1 cut')
where Id = 10019;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."swing"."Reach"', '1,2')
where Id = 10019;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."swing"."Parry"', '0U')
where Id = 10019;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."swing"."ST"', 11)
where Id = 10019;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."swing"."Notes"', null)
where Id = 10019;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."thrust"', JSON_OBJECT())
where Id = 10019;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."thrust"."Damage"', '+1 cr')
where Id = 10019;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."thrust"."Reach"', 2)
where Id = 10019;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."thrust"."Parry"', '0U')
where Id = 10019;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."thrust"."ST"', 11)
where Id = 10019;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."thrust"."Notes"', null)
where Id = 10019;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"', JSON_OBJECT())
where Id = 10019;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"."TL"', 3)
where Id = 10019;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"."Cost"', 650)
where Id = 10019;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"."Weight"', 5)
where Id = 10019;






















select name, json_detailed(Definition) from Objects where ClassType = 'Weapon';



