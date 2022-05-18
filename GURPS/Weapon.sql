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
-- ********************************************************************* Katana
insert into Objects (Id, ClassType, Name, Definition, Body) values (
10020,
'Weapon',
'Katana',
JSON_OBJECT(),
JSON_OBJECT()
);
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"', JSON_OBJECT())
where Id = 10020;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."required skill group"', 4)
where Id = 10020;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."swing"', JSON_OBJECT())
where Id = 10020;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."swing"."Damage"', '+1 cut')
where Id = 10020;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."swing"."Reach"', '1,2')
where Id = 10020;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."swing"."Parry"', 0)
where Id = 10020;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."swing"."ST"', 11)
where Id = 10020;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."swing"."Notes"', null)
where Id = 10020;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."thrust"', JSON_OBJECT())
where Id = 10020;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."thrust"."Damage"', '+1 imp')
where Id = 10020;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."thrust"."Reach"', 1)
where Id = 10020;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."thrust"."Parry"', 0)
where Id = 10020;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."thrust"."ST"', 11)
where Id = 10020;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."thrust"."Notes"', null)
where Id = 10020;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"', JSON_OBJECT())
where Id = 10020;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"."TL"', 3)
where Id = 10020;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"."Cost"', 650)
where Id = 10020;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"."Weight"', 5)
where Id = 10020;
-- ********************************************************************* Thrusting Bastard Sword
insert into Objects (Id, ClassType, Name, Definition, Body) values (
10021,
'Weapon',
'Thrusting Bastard Sword',
JSON_OBJECT(),
JSON_OBJECT()
);
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"', JSON_OBJECT())
where Id = 10021;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."required skill group"', 4)
where Id = 10021;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."swing"', JSON_OBJECT())
where Id = 10021;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."swing"."Damage"', '+1 cut')
where Id = 10021;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."swing"."Reach"', '1,2')
where Id = 10021;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."swing"."Parry"', '0U')
where Id = 10021;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."swing"."ST"', 11)
where Id = 10021;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."swing"."Notes"', null)
where Id = 10021;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."thrust"', JSON_OBJECT())
where Id = 10021;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."thrust"."Damage"', '+2 imp')
where Id = 10021;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."thrust"."Reach"', 2)
where Id = 10021;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."thrust"."Parry"', '0U')
where Id = 10021;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."thrust"."ST"', 11)
where Id = 10021;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."thrust"."Notes"', null)
where Id = 10021;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"', JSON_OBJECT())
where Id = 10021;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"."TL"', 3)
where Id = 10021;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"."Cost"', 750)
where Id = 10021;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"."Weight"', 5)
where Id = 10021;
-- ********************************************************************* Cavalry Saber
insert into Objects (Id, ClassType, Name, Definition, Body) values (
10022,
'Weapon',
'Cavalry Saber',
JSON_OBJECT(),
JSON_OBJECT()
);
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"', JSON_OBJECT())
where Id = 10022;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."required skill group"', 4)
where Id = 10022;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."swing"', JSON_OBJECT())
where Id = 10022;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."swing"."Damage"', '+1 cut')
where Id = 10022;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."swing"."Reach"', 1)
where Id = 10022;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."swing"."Parry"', 0)
where Id = 10022;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."swing"."ST"', 10)
where Id = 10022;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."swing"."Notes"', null)
where Id = 10022;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."thrust"', JSON_OBJECT())
where Id = 10022;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."thrust"."Damage"', '+1 imp')
where Id = 10022;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."thrust"."Reach"', 1)
where Id = 10022;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."thrust"."Parry"', 0)
where Id = 10022;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."thrust"."ST"', 10)
where Id = 10022;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."thrust"."Notes"', null)
where Id = 10022;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"', JSON_OBJECT())
where Id = 10022;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"."TL"', 4)
where Id = 10022;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"."Cost"', 500)
where Id = 10022;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"."Weight"', 3)
where Id = 10022;
-- ********************************************************************* Morningstar
insert into Objects (Id, ClassType, Name, Definition, Body) values (
10023,
'Weapon',
'Morningstar',
JSON_OBJECT(),
JSON_OBJECT()
);
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"', JSON_OBJECT())
where Id = 10023;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."required skill group"', 5)
where Id = 10023;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."swing"', JSON_OBJECT())
where Id = 10023;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."swing"."Damage"', '+3 cr')
where Id = 10023;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."swing"."Reach"', 1)
where Id = 10023;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."swing"."Parry"', '0U')
where Id = 10023;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."swing"."ST"', 12)
where Id = 10023;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."swing"."Notes"', '6')
where Id = 10023;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"', JSON_OBJECT())
where Id = 10023;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"."TL"', 3)
where Id = 10023;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"."Cost"', 80)
where Id = 10023;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"."Weight"', 6)
where Id = 10023;
-- ********************************************************************* Nunchaku
insert into Objects (Id, ClassType, Name, Definition, Body) values (
10024,
'Weapon',
'Nunchaku',
JSON_OBJECT(),
JSON_OBJECT()
);
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"', JSON_OBJECT())
where Id = 10024;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."required skill group"', 5)
where Id = 10024;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."swing"', JSON_OBJECT())
where Id = 10024;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."swing"."Damage"', '+1 cr')
where Id = 10024;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."swing"."Reach"', 1)
where Id = 10024;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."swing"."Parry"', '0U')
where Id = 10024;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."swing"."ST"', 7)
where Id = 10024;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."swing"."Notes"', '6')
where Id = 10024;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"', JSON_OBJECT())
where Id = 10024;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"."TL"', 3)
where Id = 10024;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"."Cost"', 20)
where Id = 10024;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"."Weight"', 2)
where Id = 10024;
-- ********************************************************************* Force Sword
insert into Objects (Id, ClassType, Name, Definition, Body) values (
10025,
'Weapon',
'Force Sword',
JSON_OBJECT(),
JSON_OBJECT()
);
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"', JSON_OBJECT())
where Id = 10025;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."required skill group"', 6)
where Id = 10025;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."any"', JSON_OBJECT())
where Id = 10025;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."any"."Damage"', '8d(5) burn')
where Id = 10025;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."any"."Reach"', '1,2')
where Id = 10025;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."any"."Parry"', 0)
where Id = 10025;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."any"."ST"', 3)
where Id = 10025;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."any"."Notes"', '7')
where Id = 10025;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"', JSON_OBJECT())
where Id = 10025;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"."TL"', '^')
where Id = 10025;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"."Cost"', 10000)
where Id = 10025;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"."Weight"', 2)
where Id = 10025;
-- ********************************************************************* Large Knife
insert into Objects (Id, ClassType, Name, Definition, Body) values (
10026,
'Weapon',
'Large Knife',
JSON_OBJECT(),
JSON_OBJECT()
);
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"', JSON_OBJECT())
where Id = 10026;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."required skill group"', 8)
where Id = 10026;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."swing"', JSON_OBJECT())
where Id = 10026;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."swing"."Damage"', '-2 cut')
where Id = 10026;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."swing"."Reach"', 'C,1')
where Id = 10026;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."swing"."Parry"', -1)
where Id = 10026;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."swing"."ST"', 6)
where Id = 10026;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."swing"."Notes"', null)
where Id = 10026;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."thrust"', JSON_OBJECT())
where Id = 10026;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."thrust"."Damage"', '+0 imp')
where Id = 10026;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."thrust"."Reach"', 'C')
where Id = 10026;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."thrust"."Parry"', -1)
where Id = 10026;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."thrust"."ST"', 6)
where Id = 10026;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."thrust"."Notes"', '1')
where Id = 10026;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"', JSON_OBJECT())
where Id = 10026;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"."TL"', 0)
where Id = 10026;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"."Cost"', 40)
where Id = 10026;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"."Weight"', 1)
where Id = 10026;
-- ********************************************************************* Small Knife
insert into Objects (Id, ClassType, Name, Definition, Body) values (
10027,
'Weapon',
'Small Knife',
JSON_OBJECT(),
JSON_OBJECT()
);
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"', JSON_OBJECT())
where Id = 10027;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."required skill group"', 8)
where Id = 10027;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."swing"', JSON_OBJECT())
where Id = 10027;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."swing"."Damage"', '-3 cut')
where Id = 10027;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."swing"."Reach"', 'C,1')
where Id = 10027;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."swing"."Parry"', -1)
where Id = 10027;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."swing"."ST"', 5)
where Id = 10027;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."swing"."Notes"', null)
where Id = 10027;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."thrust"', JSON_OBJECT())
where Id = 10027;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."thrust"."Damage"', '-1 imp')
where Id = 10027;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."thrust"."Reach"', 'C')
where Id = 10027;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."thrust"."Parry"', -1)
where Id = 10027;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."thrust"."ST"', 5)
where Id = 10027;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."thrust"."Notes"', '1')
where Id = 10027;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"', JSON_OBJECT())
where Id = 10027;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"."TL"', 0)
where Id = 10027;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"."Cost"', 30)
where Id = 10027;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"."Weight"', 0.5)
where Id = 10027;
-- ********************************************************************* Wooden Stake
insert into Objects (Id, ClassType, Name, Definition, Body) values (
10028,
'Weapon',
'Wooden Stake',
JSON_OBJECT(),
JSON_OBJECT()
);
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"', JSON_OBJECT())
where Id = 10028;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."required skill group"', 8)
where Id = 10028;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."thrust"', JSON_OBJECT())
where Id = 10028;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."thrust"."Damage"', '(0.5) imp')
where Id = 10028;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."thrust"."Reach"', 'C')
where Id = 10028;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."thrust"."Parry"', -1)
where Id = 10028;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."thrust"."ST"', 5)
where Id = 10028;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."thrust"."Notes"', '1')
where Id = 10028;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"', JSON_OBJECT())
where Id = 10028;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"."TL"', 0)
where Id = 10028;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"."Cost"', 4)
where Id = 10028;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"."Weight"', 0.5)
where Id = 10028;
-- ********************************************************************* Dagger
insert into Objects (Id, ClassType, Name, Definition, Body) values (
10029,
'Weapon',
'Dagger',
JSON_OBJECT(),
JSON_OBJECT()
);
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"', JSON_OBJECT())
where Id = 10029;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."required skill group"', 8)
where Id = 10029;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."thrust"', JSON_OBJECT())
where Id = 10029;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."thrust"."Damage"', '-1 imp')
where Id = 10029;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."thrust"."Reach"', 'C')
where Id = 10029;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."thrust"."Parry"', -1)
where Id = 10029;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."thrust"."ST"', 5)
where Id = 10029;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."thrust"."Notes"', '1')
where Id = 10029;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"', JSON_OBJECT())
where Id = 10029;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"."TL"', 1)
where Id = 10029;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"."Cost"', 20)
where Id = 10029;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"."Weight"', 0.25)
where Id = 10029;
-- ********************************************************************* Kusari
insert into Objects (Id, ClassType, Name, Definition, Body) values (
10030,
'Weapon',
'Kusari',
JSON_OBJECT(),
JSON_OBJECT()
);
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"', JSON_OBJECT())
where Id = 10030;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."required skill group"', 9)
where Id = 10030;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."swing"', JSON_OBJECT())
where Id = 10030;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."swing"."Damage"', '+2 cr')
where Id = 10030;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."swing"."Reach"', '1-4*')
where Id = 10030;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."swing"."Parry"', '-2U')
where Id = 10030;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."swing"."ST"', 11)
where Id = 10030;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."swing"."Notes"', '6')
where Id = 10030;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"', JSON_OBJECT())
where Id = 10030;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"."TL"', 3)
where Id = 10030;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"."Cost"', 70)
where Id = 10030;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"."Weight"', 5)
where Id = 10030;
-- ********************************************************************* Lance
insert into Objects (Id, ClassType, Name, Definition, Body) values (
10031,
'Weapon',
'Lance',
JSON_OBJECT(),
JSON_OBJECT()
);
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"', JSON_OBJECT())
where Id = 10031;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."required skill group"', 10)
where Id = 10031;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."thrust"', JSON_OBJECT())
where Id = 10031;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."thrust"."Damage"', '+3 imp')
where Id = 10031;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."thrust"."Reach"', 4)
where Id = 10031;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."thrust"."Parry"', 'No')
where Id = 10031;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."thrust"."ST"', 12)
where Id = 10031;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."thrust"."Notes"', '9')
where Id = 10031;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"', JSON_OBJECT())
where Id = 10031;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"."TL"', 2)
where Id = 10031;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"."Cost"', 60)
where Id = 10031;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"."Weight"', 6)
where Id = 10031;
-- ********************************************************************* Monowire Whip
insert into Objects (Id, ClassType, Name, Definition, Body) values (
10032,
'Weapon',
'Monowire Whip',
JSON_OBJECT(),
JSON_OBJECT()
);
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"', JSON_OBJECT())
where Id = 10032;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."required skill group"', 11)
where Id = 10032;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."swing"', JSON_OBJECT())
where Id = 10032;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."swing"."Damage"', '+1d-2(10) cut')
where Id = 10032;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."swing"."Reach"', '1-7*')
where Id = 10032;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."swing"."Parry"', '-2U')
where Id = 10032;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."swing"."ST"', 5)
where Id = 10032;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."swing"."Notes"', null)
where Id = 10032;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"', JSON_OBJECT())
where Id = 10032;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"."TL"', '^')
where Id = 10032;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"."Cost"', 900)
where Id = 10032;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"."Weight"', 0.5)
where Id = 10032;
-- ********************************************************************* Glaive
insert into Objects (Id, ClassType, Name, Definition, Body) values (
10033,
'Weapon',
'Glaive',
JSON_OBJECT(),
JSON_OBJECT()
);
update Objects set Definition =
	JSON_INSERT(Definition, '$."both"', JSON_OBJECT())
where Id = 10033;
update Objects set Definition =
	JSON_INSERT(Definition, '$."both"."required skill group"', 12)
where Id = 10033;
update Objects set Definition =
	JSON_INSERT(Definition, '$."both"."swing"', JSON_OBJECT())
where Id = 10033;
update Objects set Definition =
	JSON_INSERT(Definition, '$."both"."swing"."Damage"', '+3 cut')
where Id = 10033;
update Objects set Definition =
	JSON_INSERT(Definition, '$."both"."swing"."Reach"', '2,3*')
where Id = 10033;
update Objects set Definition =
	JSON_INSERT(Definition, '$."both"."swing"."Parry"', '0U')
where Id = 10033;
update Objects set Definition =
	JSON_INSERT(Definition, '$."both"."swing"."ST"', '11‡')
where Id = 10033;
update Objects set Definition =
	JSON_INSERT(Definition, '$."both"."swing"."Notes"', null)
where Id = 10033;
update Objects set Definition =
	JSON_INSERT(Definition, '$."both"."thrust"', JSON_OBJECT())
where Id = 10033;
update Objects set Definition =
	JSON_INSERT(Definition, '$."both"."thrust"."Damage"', '+3 imp')
where Id = 10033;
update Objects set Definition =
	JSON_INSERT(Definition, '$."both"."thrust"."Reach"', '1-3*')
where Id = 10033;
update Objects set Definition =
	JSON_INSERT(Definition, '$."both"."thrust"."Parry"', '0U')
where Id = 10033;
update Objects set Definition =
	JSON_INSERT(Definition, '$."both"."thrust"."ST"', '11†')
where Id = 10033;
update Objects set Definition =
	JSON_INSERT(Definition, '$."both"."thrust"."Notes"', null)
where Id = 10033;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"', JSON_OBJECT())
where Id = 10033;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"."TL"', 1)
where Id = 10033;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"."Cost"', 100)
where Id = 10033;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"."Weight"', 8)
where Id = 10033;
-- ********************************************************************* Naginata
insert into Objects (Id, ClassType, Name, Definition, Body) values (
10034,
'Weapon',
'Naginata',
JSON_OBJECT(),
JSON_OBJECT()
);
update Objects set Definition =
	JSON_INSERT(Definition, '$."both"', JSON_OBJECT())
where Id = 10034;
update Objects set Definition =
	JSON_INSERT(Definition, '$."both"."required skill group"', 12)
where Id = 10034;
update Objects set Definition =
	JSON_INSERT(Definition, '$."both"."swing"', JSON_OBJECT())
where Id = 10034;
update Objects set Definition =
	JSON_INSERT(Definition, '$."both"."swing"."Damage"', '+2 cut')
where Id = 10034;
update Objects set Definition =
	JSON_INSERT(Definition, '$."both"."swing"."Reach"', '1,2*')
where Id = 10034;
update Objects set Definition =
	JSON_INSERT(Definition, '$."both"."swing"."Parry"', '0U')
where Id = 10034;
update Objects set Definition =
	JSON_INSERT(Definition, '$."both"."swing"."ST"', '9†')
where Id = 10034;
update Objects set Definition =
	JSON_INSERT(Definition, '$."both"."swing"."Notes"', null)
where Id = 10034;
update Objects set Definition =
	JSON_INSERT(Definition, '$."both"."thrust"', JSON_OBJECT())
where Id = 10034;
update Objects set Definition =
	JSON_INSERT(Definition, '$."both"."thrust"."Damage"', '+3 imp')
where Id = 10034;
update Objects set Definition =
	JSON_INSERT(Definition, '$."both"."thrust"."Reach"', 2)
where Id = 10034;
update Objects set Definition =
	JSON_INSERT(Definition, '$."both"."thrust"."Parry"', 0)
where Id = 10034;
update Objects set Definition =
	JSON_INSERT(Definition, '$."both"."thrust"."ST"', '9†')
where Id = 10034;
update Objects set Definition =
	JSON_INSERT(Definition, '$."both"."thrust"."Notes"', null)
where Id = 10034;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"', JSON_OBJECT())
where Id = 10034;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"."TL"', 2)
where Id = 10034;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"."Cost"', 100)
where Id = 10034;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"."Weight"', 6)
where Id = 10034;
-- ********************************************************************* Halberd
insert into Objects (Id, ClassType, Name, Definition, Body) values (
10035,
'Weapon',
'Halberd',
JSON_OBJECT(),
JSON_OBJECT()
);
update Objects set Definition =
	JSON_INSERT(Definition, '$."both"', JSON_OBJECT())
where Id = 10035;
update Objects set Definition =
	JSON_INSERT(Definition, '$."both"."required skill group"', 12)
where Id = 10035;
update Objects set Definition =
	JSON_INSERT(Definition, '$."both"."swing"', JSON_OBJECT())
where Id = 10035;
update Objects set Definition =
	JSON_INSERT(Definition, '$."both"."swing"."Damage"', '+5 cut')
where Id = 10035;
update Objects set Definition =
	JSON_INSERT(Definition, '$."both"."swing"."Reach"', '2,3*')
where Id = 10035;
update Objects set Definition =
	JSON_INSERT(Definition, '$."both"."swing"."Parry"', '0U')
where Id = 10035;
update Objects set Definition =
	JSON_INSERT(Definition, '$."both"."swing"."ST"', '13‡')
where Id = 10035;
update Objects set Definition =
	JSON_INSERT(Definition, '$."both"."swing"."Notes"', null)
where Id = 10035;
update Objects set Definition =
	JSON_INSERT(Definition, '$."both"."swing2"', JSON_OBJECT())
where Id = 10035;
update Objects set Definition =
	JSON_INSERT(Definition, '$."both"."swing2"."Damage"', '+4 imp')
where Id = 10035;
update Objects set Definition =
	JSON_INSERT(Definition, '$."both"."swing2"."Reach"', '2,3*')
where Id = 10035;
update Objects set Definition =
	JSON_INSERT(Definition, '$."both"."swing2"."Parry"', '0U')
where Id = 10035;
update Objects set Definition =
	JSON_INSERT(Definition, '$."both"."swing2"."ST"', '13‡')
where Id = 10035;
update Objects set Definition =
	JSON_INSERT(Definition, '$."both"."swing2"."Notes"', '2')
where Id = 10035;
update Objects set Definition =
	JSON_INSERT(Definition, '$."both"."thrust"', JSON_OBJECT())
where Id = 10035;
update Objects set Definition =
	JSON_INSERT(Definition, '$."both"."thrust"."Damage"', '+3 imp')
where Id = 10035;
update Objects set Definition =
	JSON_INSERT(Definition, '$."both"."thrust"."Reach"', '1-3*')
where Id = 10035;
update Objects set Definition =
	JSON_INSERT(Definition, '$."both"."thrust"."Parry"', '0U')
where Id = 10035;
update Objects set Definition =
	JSON_INSERT(Definition, '$."both"."thrust"."ST"', '12†')
where Id = 10035;
update Objects set Definition =
	JSON_INSERT(Definition, '$."both"."thrust"."Notes"', null)
where Id = 10035;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"', JSON_OBJECT())
where Id = 10035;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"."TL"', 3)
where Id = 10035;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"."Cost"', 150)
where Id = 10035;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"."Weight"', 12)
where Id = 10035;
-- ********************************************************************* Poleaxe
insert into Objects (Id, ClassType, Name, Definition, Body) values (
10036,
'Weapon',
'Poleaxe',
JSON_OBJECT(),
JSON_OBJECT()
);
update Objects set Definition =
	JSON_INSERT(Definition, '$."both"', JSON_OBJECT())
where Id = 10036;
update Objects set Definition =
	JSON_INSERT(Definition, '$."both"."required skill group"', 12)
where Id = 10036;
update Objects set Definition =
	JSON_INSERT(Definition, '$."both"."swing"', JSON_OBJECT())
where Id = 10036;
update Objects set Definition =
	JSON_INSERT(Definition, '$."both"."swing"."Damage"', '+4 cut')
where Id = 10036;
update Objects set Definition =
	JSON_INSERT(Definition, '$."both"."swing"."Reach"', '2,3*')
where Id = 10036;
update Objects set Definition =
	JSON_INSERT(Definition, '$."both"."swing"."Parry"', '0U')
where Id = 10036;
update Objects set Definition =
	JSON_INSERT(Definition, '$."both"."swing"."ST"', '12‡')
where Id = 10036;
update Objects set Definition =
	JSON_INSERT(Definition, '$."both"."swing"."Notes"', null)
where Id = 10036;
update Objects set Definition =
	JSON_INSERT(Definition, '$."both"."swing2"', JSON_OBJECT())
where Id = 10036;
update Objects set Definition =
	JSON_INSERT(Definition, '$."both"."swing2"."Damage"', '+4 cr')
where Id = 10036;
update Objects set Definition =
	JSON_INSERT(Definition, '$."both"."swing2"."Reach"', '2,3*')
where Id = 10036;
update Objects set Definition =
	JSON_INSERT(Definition, '$."both"."swing2"."Parry"', '0U')
where Id = 10036;
update Objects set Definition =
	JSON_INSERT(Definition, '$."both"."swing2"."ST"', '12‡')
where Id = 10036;
update Objects set Definition =
	JSON_INSERT(Definition, '$."both"."swing2"."Notes"', null)
where Id = 10036;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"', JSON_OBJECT())
where Id = 10036;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"."TL"', 3)
where Id = 10036;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"."Cost"', 120)
where Id = 10036;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"."Weight"', 10)
where Id = 10036;
-- ********************************************************************* Rapier
insert into Objects (Id, ClassType, Name, Definition, Body) values (
10037,
'Weapon',
'Rapier',
JSON_OBJECT(),
JSON_OBJECT()
);
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"', JSON_OBJECT())
where Id = 10037;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."required skill group"', 13)
where Id = 10037;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."thrust"', JSON_OBJECT())
where Id = 10037;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."thrust"."Damage"', '+1 imp')
where Id = 10037;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."thrust"."Reach"', '1,2')
where Id = 10037;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."thrust"."Parry"', '0F')
where Id = 10037;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."thrust"."ST"', 9)
where Id = 10037;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."thrust"."Notes"', null)
where Id = 10037;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"', JSON_OBJECT())
where Id = 10037;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"."TL"', 4)
where Id = 10037;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"."Cost"', 500)
where Id = 10037;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"."Weight"', 2.75)
where Id = 10037;
-- ********************************************************************* Saber
insert into Objects (Id, ClassType, Name, Definition, Body) values (
10038,
'Weapon',
'Saber',
JSON_OBJECT(),
JSON_OBJECT()
);
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"', JSON_OBJECT())
where Id = 10038;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."required skill group"', 14)
where Id = 10038;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."swing"', JSON_OBJECT())
where Id = 10038;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."swing"."Damage"', '-1 cut')
where Id = 10038;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."swing"."Reach"', 1)
where Id = 10038;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."swing"."Parry"', '0F')
where Id = 10038;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."swing"."ST"', 8)
where Id = 10038;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."swing"."Notes"', null)
where Id = 10038;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."thrust"', JSON_OBJECT())
where Id = 10038;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."thrust"."Damage"', '+1 imp')
where Id = 10038;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."thrust"."Reach"', 1)
where Id = 10038;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."thrust"."Parry"', '0F')
where Id = 10038;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."thrust"."ST"', 8)
where Id = 10038;
update Objects set Definition =
	JSON_INSERT(Definition, '$."one"."thrust"."Notes"', null)
where Id = 10038;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"', JSON_OBJECT())
where Id = 10038;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"."TL"', 4)
where Id = 10038;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"."Cost"', 700)
where Id = 10038;
update Objects set Definition =
	JSON_INSERT(Definition, '$."stats"."Weight"', 2)
where Id = 10038;

















select name, json_detailed(Definition) from Objects where ClassType = 'Weapon';



