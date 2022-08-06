delete from Objects where Id >= 10000;

-- ********************************************************************* Axe
insert into Objects (Id, ClassType, Name, Definition) values (
10000,
'Weapon',
'Axe',
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
insert into Objects (Id, ClassType, Name, Definition) values (
10001,
'Weapon',
'Hatchet',

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
insert into Objects (Id, ClassType, Name, Definition) values (
10002,
'Weapon',
'Throwing Axe',

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
insert into Objects (Id, ClassType, Name, Definition) values (
10003,
'Weapon',
'Mace',

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
insert into Objects (Id, ClassType, Name, Definition) values (
10004,
'Weapon',
'Small Mace',

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
insert into Objects (Id, ClassType, Name, Definition) values (
10005,
'Weapon',
'Pick',

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
insert into Objects (Id, ClassType, Name, Definition) values (
10006,
'Weapon',
'Punch',

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
insert into Objects (Id, ClassType, Name, Definition) values (
10007,
'Weapon',
'Brass Knuckles',

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
insert into Objects (Id, ClassType, Name, Definition) values (
10008,
'Weapon',
'Kick',

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
insert into Objects (Id, ClassType, Name, Definition) values (
10009,
'Weapon',
'Kick w. Boots',

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
insert into Objects (Id, ClassType, Name, Definition) values (
10010,
'Weapon',
'Blunt Teeth',

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
insert into Objects (Id, ClassType, Name, Definition) values (
10011,
'Weapon',
'Fangs',

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
insert into Objects (Id, ClassType, Name, Definition) values (
10012,
'Weapon',
'Sharp Beak',

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
insert into Objects (Id, ClassType, Name, Definition) values (
10013,
'Weapon',
'Sharp Teeth',

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
insert into Objects (Id, ClassType, Name, Definition) values (
10014,
'Weapon',
'Blackjack or Sap',

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

-- ********************************************************************* Light Club
insert into Objects (Id, ClassType, Name, Definition) values (
10016,
'Weapon',
'Light Club',

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
insert into Objects (Id, ClassType, Name, Definition) values (
10017,
'Weapon',
'Broadsword',

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
insert into Objects (Id, ClassType, Name, Definition) values (
10018,
'Weapon',
'Thrusting Broadsword',

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
insert into Objects (Id, ClassType, Name, Definition) values (
10019,
'Weapon',
'Bastard Sword',

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
insert into Objects (Id, ClassType, Name, Definition) values (
10020,
'Weapon',
'Katana',

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
insert into Objects (Id, ClassType, Name, Definition) values (
10021,
'Weapon',
'Thrusting Bastard Sword',

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
insert into Objects (Id, ClassType, Name, Definition) values (
10022,
'Weapon',
'Cavalry Saber',

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
insert into Objects (Id, ClassType, Name, Definition) values (
10023,
'Weapon',
'Morningstar',

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
insert into Objects (Id, ClassType, Name, Definition) values (
10024,
'Weapon',
'Nunchaku',

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
insert into Objects (Id, ClassType, Name, Definition) values (
10025,
'Weapon',
'Force Sword',

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
insert into Objects (Id, ClassType, Name, Definition) values (
10026,
'Weapon',
'Large Knife',

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
insert into Objects (Id, ClassType, Name, Definition) values (
10027,
'Weapon',
'Small Knife',

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
insert into Objects (Id, ClassType, Name, Definition) values (
10028,
'Weapon',
'Wooden Stake',

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
insert into Objects (Id, ClassType, Name, Definition) values (
10029,
'Weapon',
'Dagger',

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
insert into Objects (Id, ClassType, Name, Definition) values (
10030,
'Weapon',
'Kusari',

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
insert into Objects (Id, ClassType, Name, Definition) values (
10031,
'Weapon',
'Lance',

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
insert into Objects (Id, ClassType, Name, Definition) values (
10032,
'Weapon',
'Monowire Whip',

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
insert into Objects (Id, ClassType, Name, Definition) values (
10033,
'Weapon',
'Glaive',

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
insert into Objects (Id, ClassType, Name, Definition) values (
10034,
'Weapon',
'Naginata',

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
insert into Objects (Id, ClassType, Name, Definition) values (
10035,
'Weapon',
'Halberd',

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
insert into Objects (Id, ClassType, Name, Definition) values (
10036,
'Weapon',
'Poleaxe',

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
insert into Objects (Id, ClassType, Name, Definition) values (
10037,
'Weapon',
'Rapier',

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
insert into Objects (Id, ClassType, Name, Definition) values (
10038,
'Weapon',
'Saber',

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
-- ********************************************************************* Baton
insert into Objects (Id, ClassType, Name, Definition) values (
10039,
'Weapon',
'Baton',

JSON_OBJECT()
);
update Objects set Definition =
JSON_INSERT(Definition, '$."one"', JSON_OBJECT())
where Id = 10039;
update Objects set Definition =
JSON_INSERT(Definition, '$."one"."required skill group"', 16)
where Id = 10039;
update Objects set Definition =
JSON_INSERT(Definition, '$."one"."swing"', JSON_OBJECT())
where Id = 10039;
update Objects set Definition =
JSON_INSERT(Definition, '$."one"."swing"."Damage"', '+0 cr')
where Id = 10039;
update Objects set Definition =
JSON_INSERT(Definition, '$."one"."swing"."Reach"', 1)
where Id = 10039;
update Objects set Definition =
JSON_INSERT(Definition, '$."one"."swing"."Parry"', 0)
where Id = 10039;
update Objects set Definition =
JSON_INSERT(Definition, '$."one"."swing"."ST"', 6)
where Id = 10039;
update Objects set Definition =
JSON_INSERT(Definition, '$."one"."swing"."Notes"', null)
where Id = 10039;
update Objects set Definition =
JSON_INSERT(Definition, '$."one"."thrust"', JSON_OBJECT())
where Id = 10039;
update Objects set Definition =
JSON_INSERT(Definition, '$."one"."thrust"."Damage"', '+0 cr')
where Id = 10039;
update Objects set Definition =
JSON_INSERT(Definition, '$."one"."thrust"."Reach"', 1)
where Id = 10039;
update Objects set Definition =
JSON_INSERT(Definition, '$."one"."thrust"."Parry"', 0)
where Id = 10039;
update Objects set Definition =
JSON_INSERT(Definition, '$."one"."thrust"."ST"', 6)
where Id = 10039;
update Objects set Definition =
JSON_INSERT(Definition, '$."one"."thrust"."Notes"', null)
where Id = 10039;
update Objects set Definition =
JSON_INSERT(Definition, '$."stats"', JSON_OBJECT())
where Id = 10039;
update Objects set Definition =
JSON_INSERT(Definition, '$."stats"."TL"', 0)
where Id = 10039;
update Objects set Definition =
JSON_INSERT(Definition, '$."stats"."Cost"', 20)
where Id = 10039;
update Objects set Definition =
JSON_INSERT(Definition, '$."stats"."Weight"', 1)
where Id = 10039;
-- ********************************************************************* Shortsword
insert into Objects (Id, ClassType, Name, Definition) values (
10040,
'Weapon',
'Shortsword',

JSON_OBJECT()
);
update Objects set Definition =
JSON_INSERT(Definition, '$."one"', JSON_OBJECT())
where Id = 10040;
update Objects set Definition =
JSON_INSERT(Definition, '$."one"."required skill group"', 16)
where Id = 10040;
update Objects set Definition =
JSON_INSERT(Definition, '$."one"."swing"', JSON_OBJECT())
where Id = 10040;
update Objects set Definition =
JSON_INSERT(Definition, '$."one"."swing"."Damage"', '+0 cut')
where Id = 10040;
update Objects set Definition =
JSON_INSERT(Definition, '$."one"."swing"."Reach"', 1)
where Id = 10040;
update Objects set Definition =
JSON_INSERT(Definition, '$."one"."swing"."Parry"', 0)
where Id = 10040;
update Objects set Definition =
JSON_INSERT(Definition, '$."one"."swing"."ST"', 8)
where Id = 10040;
update Objects set Definition =
JSON_INSERT(Definition, '$."one"."swing"."Notes"', null)
where Id = 10040;
update Objects set Definition =
JSON_INSERT(Definition, '$."one"."thrust"', JSON_OBJECT())
where Id = 10040;
update Objects set Definition =
JSON_INSERT(Definition, '$."one"."thrust"."Damage"', '+0 imp')
where Id = 10040;
update Objects set Definition =
JSON_INSERT(Definition, '$."one"."thrust"."Reach"', 1)
where Id = 10040;
update Objects set Definition =
JSON_INSERT(Definition, '$."one"."thrust"."Parry"', 0)
where Id = 10040;
update Objects set Definition =
JSON_INSERT(Definition, '$."one"."thrust"."ST"', 8)
where Id = 10040;
update Objects set Definition =
JSON_INSERT(Definition, '$."one"."thrust"."Notes"', null)
where Id = 10040;
update Objects set Definition =
JSON_INSERT(Definition, '$."stats"', JSON_OBJECT())
where Id = 10040;
update Objects set Definition =
JSON_INSERT(Definition, '$."stats"."TL"', 2)
where Id = 10040;
update Objects set Definition =
JSON_INSERT(Definition, '$."stats"."Cost"', 400)
where Id = 10040;
update Objects set Definition =
JSON_INSERT(Definition, '$."stats"."Weight"', 2)
where Id = 10040;
-- ********************************************************************* Cutlass
insert into Objects (Id, ClassType, Name, Definition) values (
10041,
'Weapon',
'Cutlass',

JSON_OBJECT()
);
update Objects set Definition =
JSON_INSERT(Definition, '$."one"', JSON_OBJECT())
where Id = 10041;
update Objects set Definition =
JSON_INSERT(Definition, '$."one"."required skill group"', 16)
where Id = 10041;
update Objects set Definition =
JSON_INSERT(Definition, '$."one"."swing"', JSON_OBJECT())
where Id = 10041;
update Objects set Definition =
JSON_INSERT(Definition, '$."one"."swing"."Damage"', '+0 cut')
where Id = 10041;
update Objects set Definition =
JSON_INSERT(Definition, '$."one"."swing"."Reach"', 1)
where Id = 10041;
update Objects set Definition =
JSON_INSERT(Definition, '$."one"."swing"."Parry"', 0)
where Id = 10041;
update Objects set Definition =
JSON_INSERT(Definition, '$."one"."swing"."ST"', 8)
where Id = 10041;
update Objects set Definition =
JSON_INSERT(Definition, '$."one"."swing"."Notes"', '10')
where Id = 10041;
update Objects set Definition =
JSON_INSERT(Definition, '$."one"."thrust"', JSON_OBJECT())
where Id = 10041;
update Objects set Definition =
JSON_INSERT(Definition, '$."one"."thrust"."Damage"', '+0 imp')
where Id = 10041;
update Objects set Definition =
JSON_INSERT(Definition, '$."one"."thrust"."Reach"', 1)
where Id = 10041;
update Objects set Definition =
JSON_INSERT(Definition, '$."one"."thrust"."Parry"', 0)
where Id = 10041;
update Objects set Definition =
JSON_INSERT(Definition, '$."one"."thrust"."ST"', 8)
where Id = 10041;
update Objects set Definition =
JSON_INSERT(Definition, '$."one"."thrust"."Notes"', null)
where Id = 10041;
update Objects set Definition =
JSON_INSERT(Definition, '$."stats"', JSON_OBJECT())
where Id = 10041;
update Objects set Definition =
JSON_INSERT(Definition, '$."stats"."TL"', 4)
where Id = 10041;
update Objects set Definition =
JSON_INSERT(Definition, '$."stats"."Cost"', 300)
where Id = 10041;
update Objects set Definition =
JSON_INSERT(Definition, '$."stats"."Weight"', 2)
where Id = 10041;



update Objects set Definition =
JSON_INSERT(Definition, '$."handling"', JSON_OBJECT())
where ClassType = 'weapon';
update Objects set Definition =
   json_insert(Definition, '$."handling"."one"', json_query(Definition, '$."one"'))
where ClassType = 'weapon';
update Objects set Definition =
   json_remove(Definition, '$."one"')
where ClassType = 'weapon';
update Objects set Definition =
   json_insert(Definition, '$."handling"."both"', json_query(Definition, '$."both"'))
where ClassType = 'weapon';
update Objects set Definition =
   json_remove(Definition, '$."both"')
where ClassType = 'weapon';



update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."strokes"', JSON_OBJECT())
where ClassType = 'weapon';
update Objects set Definition =
   json_insert(Definition, '$."handling"."strokes"."one"', json_query(Definition, '$."handling"."one"'))
where ClassType = 'weapon';
update Objects set Definition =
   json_insert(Definition, '$."handling"."strokes"."both"', json_query(Definition, '$."handling"."both"'))
where ClassType = 'weapon';
update Objects set Definition =
   json_remove(Definition, '$."handling"."both"')
where ClassType = 'weapon';
update Objects set Definition =
   json_remove(Definition, '$."handling"."one"')
where ClassType = 'weapon';



update Objects set Definition =
   json_remove(Definition, '$."handling"."strokes"."both"')
where ClassType = 'weapon'
and json_query(Definition, '$."handling"."strokes"."both"') is null;
update Objects set Definition =
   json_remove(Definition, '$."handling"."strokes"."one"')
where ClassType = 'weapon'
and json_query(Definition, '$."handling"."strokes"."one"') is null;









update Objects set Definition =
   json_insert(Definition, '$."handling"."strokes"."both2"', json_object())
where Name = 'Naginata';
update Objects set Definition =
   json_insert(Definition, '$."handling"."strokes"."both2"."required skill group"', 19)
where Name = 'Naginata';
update Objects set Definition =
   json_insert(Definition, '$."handling"."strokes"."both2"."swing"', json_object())
where Name = 'Naginata';
update Objects set Definition =
   json_insert(Definition, '$."handling"."strokes"."both2"."swing"."Damage"', "+2 cr")
where Name = 'Naginata';
update Objects set Definition =
   json_insert(Definition, '$."handling"."strokes"."both2"."swing"."Reach"', "1,2")
where Name = 'Naginata';
update Objects set Definition =
   json_insert(Definition, '$."handling"."strokes"."both2"."swing"."Parry"', "0U")
where Name = 'Naginata';
update Objects set Definition =
   json_insert(Definition, '$."handling"."strokes"."both2"."swing"."ST"', "9†")
where Name = 'Naginata';
update Objects set Definition =
   json_insert(Definition, '$."handling"."strokes"."both2"."swing"."Notes"', "Blunt end.")
where Name = 'Naginata';
update Objects set Definition =
   json_insert(Definition, '$."handling"."strokes"."both2"."thrust"', json_object())
where Name = 'Naginata';
update Objects set Definition =
   json_insert(Definition, '$."handling"."strokes"."both2"."thrust"."Damage"', "+2 cr")
where Name = 'Naginata';
update Objects set Definition =
   json_insert(Definition, '$."handling"."strokes"."both2"."thrust"."Reach"', "1,2")
where Name = 'Naginata';
update Objects set Definition =
   json_insert(Definition, '$."handling"."strokes"."both2"."thrust"."Parry"', 0)
where Name = 'Naginata';
update Objects set Definition =
   json_insert(Definition, '$."handling"."strokes"."both2"."thrust"."ST"', "9†")
where Name = 'Naginata';
update Objects set Definition =
   json_insert(Definition, '$."handling"."strokes"."both2"."thrust"."Notes"', "Blunt end.")
where Name = 'Naginata';



















delete from Objects where Id >= 10042;
delete from Objects where ClassType = 'Weapon' and Id >= 10042;

-- ********************************************************************* Spear
insert into Objects (Id, ClassType, Name, Definition) values (
10042,
'Weapon',
'Spear',
JSON_OBJECT()
);
update Objects set Definition =
'{
"stats": 
{
"TL": 0,
"Cost": 40,
"Weight": 4
},
"handling": 
{
"strokes": 
{
"one": 
{
"required skill group": 18,
"thrust": 
{
"Damage": "+2 imp",
"Reach": "1*",
"Parry": 0,
"ST": 9,
"Notes": "1"
}
},
"both": 
{
"required skill group": 18,
"thrust":
{
"Damage": "+3 imp",
"Reach": "1,2*",
"Parry": 0,
"ST": "9†",
"Notes": "1"
}
}
}
}
}'
where Id = 10042;
-- ********************************************************************* Javelin
insert into Objects (Id, ClassType, Name, Definition) values (
10043,
'Weapon',
'Javelin',
JSON_OBJECT()
);
update Objects set Definition =
'{
"stats": 
{
"TL": 0,
"Cost": 40,
"Weight": 4
},
"handling": 
{
"strokes": 
{
"one": 
{
"required skill group": 18,
"thrust": 
{
"Damage": "+2 imp",
"Reach": "1*",
"Parry": 0,
"ST": 9,
"Notes": "1"
}
}
}
}
}'
where Id = 10043;
-- ********************************************************************* Long Spear
insert into Objects (Id, ClassType, Name, Definition) values (
10044,
'Weapon',
'Long Spear',
JSON_OBJECT()
);
update Objects set Definition =
'{
"stats": 
{
"TL": 2,
"Cost": 60,
"Weight": 5
},
"handling": 
{
"strokes": 
{
"one": 
{
"required skill group": 18,
"thrust": 
{
"Damage": "+2 imp",
"Reach": "2,3*",
"Parry": "0U",
"ST": 10,
"Notes": null
}
},
"both": 
{
"required skill group": 18,
"thrust":
{
"Damage": "+3 imp",
"Reach": "2,3*",
"Parry": 0,
"ST": "10†",
"Notes": null
}
}
}
}
}'
where Id = 10044;
-- ********************************************************************* Quarterstaff
insert into Objects (Id, ClassType, Name, Definition) values (
10045,
'Weapon',
'Quarterstaff',
JSON_OBJECT()
);
update Objects set Definition =
'{
"stats": 
{
"TL": 0,
"Cost": 10,
"Weight": 4
},
"handling": 
{
"strokes": 
{
"both": 
{
"required skill group": 18,
"swing":
{
"Damage": "+2 cr",
"Reach": "1,2",
"Parry": 2,
"ST": "7†",
"Notes": null
},
"thrust": 
{
"Damage": "+2 cr",
"Reach": "1,2",
"Parry": 2,
"ST": "7†",
"Notes": null
}
}
}
}
}'
where Id = 10045;





update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."strokes"."both2"', JSON_OBJECT())
where Id = 10045;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."strokes"."both2"."required skill group"', 22)
where Id = 10045;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."strokes"."both2"."swing"', JSON_OBJECT())
where Id = 10045;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."strokes"."both2"."swing"."Damage"', "+2 cr")
where Id = 10045;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."strokes"."both2"."swing"."Reach"', "1,2")
where Id = 10045;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."strokes"."both2"."swing"."Parry"', 0)
where Id = 10045;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."strokes"."both2"."swing"."ST"', "9†")
where Id = 10045;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."strokes"."both2"."swing"."Notes"', null)
where Id = 10045;



update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."strokes"."both2"."thurst"', JSON_OBJECT())
where Id = 10045;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."strokes"."both2"."thurst"."Damage"', "+1 cr")
where Id = 10045;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."strokes"."both2"."thurst"."Reach"', 2)
where Id = 10045;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."strokes"."both2"."thurst"."Parry"', 0)
where Id = 10045;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."strokes"."both2"."thurst"."ST"', "9†")
where Id = 10045;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."strokes"."both2"."thurst"."Notes"', null)
where Id = 10045;








update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."strokes"."both3"', JSON_OBJECT())
where Id = 10034;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."strokes"."both3"."required skill group"', 22)
where Id = 10034;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."strokes"."both3"."swing"', JSON_OBJECT())
where Id = 10034;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."strokes"."both3"."swing"."Damage"', "+3 cut")
where Id = 10034;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."strokes"."both3"."swing"."Reach"', 2)
where Id = 10034;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."strokes"."both3"."swing"."Parry"', "0U")
where Id = 10034;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."strokes"."both3"."swing"."ST"', "9†")
where Id = 10034;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."strokes"."both3"."swing"."Notes"', null)
where Id = 10034;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."strokes"."both3"."thrust"', JSON_OBJECT())
where Id = 10034;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."strokes"."both3"."thrust"."Damage"', "+3 imp")
where Id = 10034;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."strokes"."both3"."thrust"."Reach"', 2)
where Id = 10034;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."strokes"."both3"."thrust"."Parry"', 0)
where Id = 10034;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."strokes"."both3"."thrust"."ST"', "9†")
where Id = 10034;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."strokes"."both3"."thrust"."Notes"', null)
where Id = 10034;











update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."strokes"."both"', JSON_OBJECT())
where Id = 10019;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."strokes"."both"."required skill group"', 22)
where Id = 10019;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."strokes"."both"."swing"', JSON_OBJECT())
where Id = 10019;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."strokes"."both"."swing"."Damage"', "+2 cut")
where Id = 10019;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."strokes"."both"."swing"."Reach"', "1,2")
where Id = 10019;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."strokes"."both"."swing"."Parry"', 0)
where Id = 10019;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."strokes"."both"."swing"."ST"', "10†")
where Id = 10019;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."strokes"."both"."swing"."Notes"', null)
where Id = 10019;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."strokes"."both"."thrust"', JSON_OBJECT())
where Id = 10019;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."strokes"."both"."thrust"."Damage"', "+2 cr")
where Id = 10019;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."strokes"."both"."thrust"."Reach"', 2)
where Id = 10019;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."strokes"."both"."thrust"."Parry"', 0)
where Id = 10019;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."strokes"."both"."thrust"."ST"', "10†")
where Id = 10019;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."strokes"."both"."thrust"."Notes"', null)
where Id = 10019;
















update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."strokes"."both"', JSON_OBJECT())
where Id = 10020;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."strokes"."both"."required skill group"', 22)
where Id = 10020;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."strokes"."both"."swing"', JSON_OBJECT())
where Id = 10020;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."strokes"."both"."swing"."Damage"', "+2 cut")
where Id = 10020;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."strokes"."both"."swing"."Reach"', "1,2")
where Id = 10020;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."strokes"."both"."swing"."Parry"', 0)
where Id = 10020;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."strokes"."both"."swing"."ST"', "10†")
where Id = 10020;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."strokes"."both"."swing"."Notes"', null)
where Id = 10020;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."strokes"."both"."thrust"', JSON_OBJECT())
where Id = 10020;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."strokes"."both"."thrust"."Damage"', "+1 imp")
where Id = 10020;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."strokes"."both"."thrust"."Reach"', 1)
where Id = 10020;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."strokes"."both"."thrust"."Parry"', 0)
where Id = 10020;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."strokes"."both"."thrust"."ST"', "10†")
where Id = 10020;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."strokes"."both"."thrust"."Notes"', null)
where Id = 10020;







update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."strokes"."both"', JSON_OBJECT())
where Id = 10021;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."strokes"."both"."required skill group"', 22)
where Id = 10021;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."strokes"."both"."swing"', JSON_OBJECT())
where Id = 10021;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."strokes"."both"."swing"."Damage"', "+2 cut")
where Id = 10021;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."strokes"."both"."swing"."Reach"', "1,2")
where Id = 10021;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."strokes"."both"."swing"."Parry"', 0)
where Id = 10021;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."strokes"."both"."swing"."ST"', "10†")
where Id = 10021;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."strokes"."both"."swing"."Notes"', null)
where Id = 10021;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."strokes"."both"."thrust"', JSON_OBJECT())
where Id = 10021;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."strokes"."both"."thrust"."Damage"', "+3 imp")
where Id = 10021;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."strokes"."both"."thrust"."Reach"', 2)
where Id = 10021;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."strokes"."both"."thrust"."Parry"', 0)
where Id = 10021;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."strokes"."both"."thrust"."ST"', "10†")
where Id = 10021;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."strokes"."both"."thrust"."Notes"', null)
where Id = 10021;




update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."muscle"', JSON_OBJECT())
where Id = 10001;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."muscle"."one"', JSON_OBJECT())
where Id = 10001;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."muscle"."one"."required skill group"', 33)
where Id = 10001;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."muscle"."one"."Damage"', 'sw cut')
where Id = 10001;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."muscle"."one"."Acc"', 1)
where Id = 10001;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."muscle"."one"."Range"', 'x1.5/x2.5')
where Id = 10001;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."muscle"."one"."RoF"', 1)
where Id = 10001;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."muscle"."one"."Shots"', 'T(1)')
where Id = 10001;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."muscle"."one"."ST"', 8)
where Id = 10001;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."muscle"."one"."Bulk"', -2)
where Id = 10001;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."muscle"."one"."Notes"', null)
where Id = 10001;






update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."muscle"', JSON_OBJECT())
where Id = 10002;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."muscle"."one"', JSON_OBJECT())
where Id = 10002;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."muscle"."one"."required skill group"', 33)
where Id = 10002;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."muscle"."one"."Damage"', 'sw+2 cut')
where Id = 10002;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."muscle"."one"."Acc"', 2)
where Id = 10002;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."muscle"."one"."Range"', 'x1/x1.5')
where Id = 10002;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."muscle"."one"."RoF"', 1)
where Id = 10002;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."muscle"."one"."Shots"', 'T(1)')
where Id = 10002;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."muscle"."one"."ST"', 11)
where Id = 10002;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."muscle"."one"."Bulk"', -3)
where Id = 10002;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."muscle"."one"."Notes"', null)
where Id = 10002;





update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."muscle"', JSON_OBJECT())
where Id = 10003;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."muscle"."one"', JSON_OBJECT())
where Id = 10003;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."muscle"."one"."required skill group"', 33)
where Id = 10003;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."muscle"."one"."Damage"', 'sw+3 cr')
where Id = 10003;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."muscle"."one"."Acc"', 1)
where Id = 10003;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."muscle"."one"."Range"', 'x0.5/x1')
where Id = 10003;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."muscle"."one"."RoF"', 1)
where Id = 10003;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."muscle"."one"."Shots"', 'T(1)')
where Id = 10003;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."muscle"."one"."ST"', 12)
where Id = 10003;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."muscle"."one"."Bulk"', -4)
where Id = 10003;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."muscle"."one"."Notes"', null)
where Id = 10003;









update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."muscle"', JSON_OBJECT())
where Id = 10004;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."muscle"."one"', JSON_OBJECT())
where Id = 10004;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."muscle"."one"."required skill group"', 33)
where Id = 10004;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."muscle"."one"."Damage"', 'sw+2 cr')
where Id = 10004;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."muscle"."one"."Acc"', 1)
where Id = 10004;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."muscle"."one"."Range"', 'x1/x1.5')
where Id = 10004;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."muscle"."one"."RoF"', 1)
where Id = 10004;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."muscle"."one"."Shots"', 'T(1)')
where Id = 10004;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."muscle"."one"."ST"', 10)
where Id = 10004;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."muscle"."one"."Bulk"', -3)
where Id = 10004;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."muscle"."one"."Notes"', null)
where Id = 10004;
















update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."muscle"', JSON_OBJECT())
where Id = 10026;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."muscle"."one"', JSON_OBJECT())
where Id = 10026;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."muscle"."one"."required skill group"', 35)
where Id = 10026;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."muscle"."one"."Damage"', 'thr imp')
where Id = 10026;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."muscle"."one"."Acc"', 0)
where Id = 10026;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."muscle"."one"."Range"', 'x0.8/x1.5')
where Id = 10026;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."muscle"."one"."RoF"', 1)
where Id = 10026;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."muscle"."one"."Shots"', 'T(1)')
where Id = 10026;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."muscle"."one"."ST"', 6)
where Id = 10026;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."muscle"."one"."Bulk"', -2)
where Id = 10026;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."muscle"."one"."Notes"', null)
where Id = 10026;







update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."muscle"', JSON_OBJECT())
where Id = 10027;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."muscle"."one"', JSON_OBJECT())
where Id = 10027;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."muscle"."one"."required skill group"', 35)
where Id = 10027;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."muscle"."one"."Damage"', 'thr-1 imp')
where Id = 10027;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."muscle"."one"."Acc"', 0)
where Id = 10027;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."muscle"."one"."Range"', 'x0.5/x1')
where Id = 10027;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."muscle"."one"."RoF"', 1)
where Id = 10027;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."muscle"."one"."Shots"', 'T(1)')
where Id = 10027;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."muscle"."one"."ST"', 5)
where Id = 10027;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."muscle"."one"."Bulk"', -1)
where Id = 10027;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."muscle"."one"."Notes"', null)
where Id = 10027;












update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."muscle"', JSON_OBJECT())
where Id = 10028;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."muscle"."one"', JSON_OBJECT())
where Id = 10028;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."muscle"."one"."required skill group"', 35)
where Id = 10028;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."muscle"."one"."Damage"', 'thr(0.5) imp')
where Id = 10028;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."muscle"."one"."Acc"', 0)
where Id = 10028;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."muscle"."one"."Range"', 'x0.5/x1')
where Id = 10028;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."muscle"."one"."RoF"', 1)
where Id = 10028;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."muscle"."one"."Shots"', 'T(1)')
where Id = 10028;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."muscle"."one"."ST"', 5)
where Id = 10028;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."muscle"."one"."Bulk"', -2)
where Id = 10028;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."muscle"."one"."Notes"', null)
where Id = 10028;











update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."muscle"', JSON_OBJECT())
where Id = 10029;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."muscle"."one"', JSON_OBJECT())
where Id = 10029;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."muscle"."one"."required skill group"', 35)
where Id = 10029;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."muscle"."one"."Damage"', 'thr-1 imp')
where Id = 10029;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."muscle"."one"."Acc"', 0)
where Id = 10029;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."muscle"."one"."Range"', 'x0.5/x1')
where Id = 10029;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."muscle"."one"."RoF"', 1)
where Id = 10029;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."muscle"."one"."Shots"', 'T(1)')
where Id = 10029;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."muscle"."one"."ST"', 5)
where Id = 10029;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."muscle"."one"."Bulk"', -1)
where Id = 10029;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."muscle"."one"."Notes"', null)
where Id = 10029;








update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."muscle"', JSON_OBJECT())
where Id = 10042;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."muscle"."one"', JSON_OBJECT())
where Id = 10042;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."muscle"."one"."required skill group"', 37)
where Id = 10042;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."muscle"."one"."Damage"', 'thr+3 imp')
where Id = 10042;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."muscle"."one"."Acc"', 2)
where Id = 10042;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."muscle"."one"."Range"', 'x1/x1.5')
where Id = 10042;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."muscle"."one"."RoF"', 1)
where Id = 10042;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."muscle"."one"."Shots"', 'T(1)')
where Id = 10042;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."muscle"."one"."ST"', 9)
where Id = 10042;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."muscle"."one"."Bulk"', -6)
where Id = 10042;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."muscle"."one"."Notes"', null)
where Id = 10042;






update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."muscle"', JSON_OBJECT())
where Id = 10043;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."muscle"."one"', JSON_OBJECT())
where Id = 10043;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."muscle"."one"."required skill group"', 37)
where Id = 10043;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."muscle"."one"."Damage"', 'thr+1 imp')
where Id = 10043;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."muscle"."one"."Acc"', 3)
where Id = 10043;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."muscle"."one"."Range"', 'x1.5/x2.5')
where Id = 10043;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."muscle"."one"."RoF"', 1)
where Id = 10043;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."muscle"."one"."Shots"', 'T(1)')
where Id = 10043;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."muscle"."one"."ST"', 6)
where Id = 10043;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."muscle"."one"."Bulk"', -4)
where Id = 10043;
update Objects set Definition =
JSON_INSERT(Definition, '$."handling"."muscle"."one"."Notes"', null)
where Id = 10043;





-- ********************************************************************* Stun Gun
insert into Objects (Id, ClassType, Name, Definition) values (
10015,
'Weapon',
'Stun Gun',
JSON_OBJECT()
);
update Objects set Definition =
'{
"stats": 
{
"TL": 8,
"Cost": 100,
"Weight": 1
},
"handling": 
{
"strokes": 
{
"one": 
{
"required skill group": 3,
"any":
{
"Damage": "HT-3(0.5) aff",
"Reach": "C,1",
"Parry": "No",
"ST": 2,
"Notes": "5"
}
}
}
}
}'
where Id = 10015;








-- select Id, Name, json_detailed(Definition) from Objects;




