delete from Objects where ClassName = 'Weapon';
insert into Objects (Id, ClassName, Definition, Body) values (
2,
'Weapon',
JSON_OBJECT(),
JSON_OBJECT()
);

update Objects set ClassGroup = 'AXE/MACE (DX-5, Flail-4, Two-Handed Axe/Mace-3)'
where Id = 2;
-- ********************************************************************* Axe
update Objects set Definition =
	JSON_INSERT(Definition, '$."Axe"', JSON_OBJECT())
where Id = 2;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Axe"."melee"', JSON_OBJECT())
where Id = 2;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Axe"."melee"."one-sw"', JSON_OBJECT())
where Id = 2;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Axe"."melee"."one-sw"."Damage"', '+2 cut')
where Id = 2;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Axe"."melee"."one-sw"."Reach"', 1)
where Id = 2;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Axe"."melee"."one-sw"."Parry"', '0U')
where Id = 2;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Axe"."melee"."one-sw"."ST"', 11)
where Id = 2;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Axe"."stats"', JSON_OBJECT())
where Id = 2;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Axe"."stats"."TL"', 0)
where Id = 2;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Axe"."stats"."Cost"', 50)
where Id = 2;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Axe"."stats"."Weight"', 4)
where Id = 2;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Axe"."stats"."Notes"', '')
where Id = 2;
-- ********************************************************************* Hatchet
update Objects set Definition =
	JSON_INSERT(Definition, '$."Hatchet"', JSON_OBJECT())
where Id = 2;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Hatchet"."melee"', JSON_OBJECT())
where Id = 2;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Hatchet"."melee"."one-sw"', JSON_OBJECT())
where Id = 2;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Hatchet"."melee"."one-sw"."Damage"', '+0 cut')
where Id = 2;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Hatchet"."melee"."one-sw"."Reach"', 1)
where Id = 2;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Hatchet"."melee"."one-sw"."Parry"', '0')
where Id = 2;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Hatchet"."melee"."one-sw"."ST"', 8)
where Id = 2;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Hatchet"."stats"', JSON_OBJECT())
where Id = 2;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Hatchet"."stats"."TL"', 0)
where Id = 2;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Hatchet"."stats"."Cost"', 40)
where Id = 2;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Hatchet"."stats"."Weight"', 2)
where Id = 2;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Hatchet"."stats"."Notes"', '1')
where Id = 2;
-- ********************************************************************* Throwing Axe
update Objects set Definition =
	JSON_INSERT(Definition, '$."Throwing Axe"', JSON_OBJECT())
where Id = 2;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Throwing Axe"."melee"', JSON_OBJECT())
where Id = 2;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Throwing Axe"."melee"."one-sw"', JSON_OBJECT())
where Id = 2;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Throwing Axe"."melee"."one-sw"."Damage"', '+2 cut')
where Id = 2;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Throwing Axe"."melee"."one-sw"."Reach"', 1)
where Id = 2;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Throwing Axe"."melee"."one-sw"."Parry"', '0U')
where Id = 2;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Throwing Axe"."melee"."one-sw"."ST"', 11)
where Id = 2;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Throwing Axe"."stats"', JSON_OBJECT())
where Id = 2;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Throwing Axe"."stats"."TL"', 0)
where Id = 2;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Throwing Axe"."stats"."Cost"', 60)
where Id = 2;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Throwing Axe"."stats"."Weight"', 4)
where Id = 2;

update Objects set Definition =
	JSON_INSERT(Definition, '$."Throwing Axe"."stats"."Notes"', '1')
where Id = 2;
-- ********************************************************************* Mace
update Objects set Definition =
	JSON_INSERT(Definition, '$."Mace"', JSON_OBJECT())
where Id = 2;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Mace"."melee"', JSON_OBJECT())
where Id = 2;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Mace"."melee"."one-sw"', JSON_OBJECT())
where Id = 2;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Mace"."melee"."one-sw"."Damage"', '+3 cr')
where Id = 2;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Mace"."melee"."one-sw"."Reach"', 1)
where Id = 2;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Mace"."melee"."one-sw"."Parry"', '0U')
where Id = 2;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Mace"."melee"."one-sw"."ST"', 12)
where Id = 2;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Mace"."stats"', JSON_OBJECT())
where Id = 2;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Mace"."stats"."TL"', 2)
where Id = 2;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Mace"."stats"."Cost"', 50)
where Id = 2;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Mace"."stats"."Weight"', 5)
where Id = 2;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Mace"."stats"."Notes"', '1')
where Id = 2;
-- ********************************************************************* Small Mace
update Objects set Definition =
	JSON_INSERT(Definition, '$."Small Mace"', JSON_OBJECT())
where Id = 2;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Small Mace"."melee"', JSON_OBJECT())
where Id = 2;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Small Mace"."melee"."one-sw"', JSON_OBJECT())
where Id = 2;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Small Mace"."melee"."one-sw"."Damage"', '+2 cr')
where Id = 2;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Small Mace"."melee"."one-sw"."Reach"', 1)
where Id = 2;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Small Mace"."melee"."one-sw"."Parry"', '0U')
where Id = 2;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Small Mace"."melee"."one-sw"."ST"', 10)
where Id = 2;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Small Mace"."stats"', JSON_OBJECT())
where Id = 2;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Small Mace"."stats"."TL"', 2)
where Id = 2;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Small Mace"."stats"."Cost"', 35)
where Id = 2;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Small Mace"."stats"."Weight"', 3)
where Id = 2;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Small Mace"."stats"."Notes"', '1')
where Id = 2;
-- ********************************************************************* Pick
update Objects set Definition =
	JSON_INSERT(Definition, '$."Pick"', JSON_OBJECT())
where Id = 2;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Pick"."melee"', JSON_OBJECT())
where Id = 2;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Pick"."melee"."one-sw"', JSON_OBJECT())
where Id = 2;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Pick"."melee"."one-sw"."Damage"', '+1 imp')
where Id = 2;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Pick"."melee"."one-sw"."Reach"', 1)
where Id = 2;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Pick"."melee"."one-sw"."Parry"', '0U')
where Id = 2;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Pick"."melee"."one-sw"."ST"', 10)
where Id = 2;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Pick"."stats"', JSON_OBJECT())
where Id = 2;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Pick"."stats"."TL"', 3)
where Id = 2;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Pick"."stats"."Cost"', 70)
where Id = 2;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Pick"."stats"."Weight"', 3)
where Id = 2;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Pick"."stats"."Notes"', '2')
where Id = 2;



insert into Objects (Id, ClassName, Definition, Body) values (
3,
'Weapon',
JSON_OBJECT(),
JSON_OBJECT()
);

update Objects set ClassGroup = 'BOXING, BRAWLING, KARATE, DX'
where Id = 3;
-- ********************************************************************* Punch
update Objects set Definition =
	JSON_INSERT(Definition, '$."Punch"', JSON_OBJECT())
where Id = 3;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Punch"."melee"', JSON_OBJECT())
where Id = 3;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Punch"."melee"."one-thr"', JSON_OBJECT())
where Id = 3;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Punch"."melee"."one-thr"."Damage"', '-1 cr')
where Id = 3;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Punch"."melee"."one-thr"."Reach"', 'C')
where Id = 3;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Punch"."melee"."one-thr"."Parry"', '0')
where Id = 3;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Punch"."melee"."one-thr"."ST"', 0)
where Id = 3;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Punch"."stats"', JSON_OBJECT())
where Id = 3;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Punch"."stats"."TL"', null)
where Id = 3;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Punch"."stats"."Cost"', 0)
where Id = 3;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Punch"."stats"."Weight"', 0)
where Id = 3;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Punch"."stats"."Notes"', '3')
where Id = 3;
-- ********************************************************************* Brass Knuckles
update Objects set Definition =
	JSON_INSERT(Definition, '$."Brass Knuckles"', JSON_OBJECT())
where Id = 3;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Brass Knuckles"."melee"', JSON_OBJECT())
where Id = 3;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Brass Knuckles"."melee"."one-thr"', JSON_OBJECT())
where Id = 3;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Brass Knuckles"."melee"."one-thr"."Damage"', '+0 cr')
where Id = 3;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Brass Knuckles"."melee"."one-thr"."Reach"', 'C')
where Id = 3;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Brass Knuckles"."melee"."one-thr"."Parry"', '0')
where Id = 3;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Brass Knuckles"."melee"."one-thr"."ST"', 0)
where Id = 3;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Brass Knuckles"."stats"', JSON_OBJECT())
where Id = 3;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Brass Knuckles"."stats"."TL"', 1)
where Id = 3;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Brass Knuckles"."stats"."Cost"', 10)
where Id = 3;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Brass Knuckles"."stats"."Weight"', .25)
where Id = 3;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Brass Knuckles"."stats"."Notes"', '3')
where Id = 3;



insert into Objects (Id, ClassName, Definition, Body) values (
4,
'Weapon',
JSON_OBJECT(),
JSON_OBJECT()
);

update Objects set ClassGroup = 'BRAWLING-2, KARATE-2, DX-2'
where Id = 4;
-- ********************************************************************* Kick
update Objects set Definition =
	JSON_INSERT(Definition, '$."Kick"', JSON_OBJECT())
where Id = 4;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Kick"."melee"', JSON_OBJECT())
where Id = 4;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Kick"."melee"."one-thr"', JSON_OBJECT())
where Id = 4;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Kick"."melee"."one-thr"."Damage"', '+0 cr')
where Id = 4;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Kick"."melee"."one-thr"."Reach"', 'C,1')
where Id = 4;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Kick"."melee"."one-thr"."Parry"', 'No')
where Id = 4;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Kick"."melee"."one-thr"."ST"', 0)
where Id = 4;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Kick"."stats"', JSON_OBJECT())
where Id = 4;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Kick"."TL"', null)
where Id = 4;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Kick"."Cost"', 0)
where Id = 4;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Kick"."Weight"', 0)
where Id = 4;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Kick"."Notes"', '3,4')
where Id = 4;
-- ********************************************************************* Kick w. Boots
update Objects set Definition =
	JSON_INSERT(Definition, '$."Kick w. Boots"', JSON_OBJECT())
where Id = 4;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Kick w. Boots"."melee"', JSON_OBJECT())
where Id = 4;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Kick w. Boots"."melee"."one-thr"', JSON_OBJECT())
where Id = 4;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Kick w. Boots"."melee"."one-thr"."Damage"', '+1 cr')
where Id = 4;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Kick w. Boots"."melee"."one-thr"."Reach"', 'C,1')
where Id = 4;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Kick w. Boots"."melee"."one-thr"."Parry"', 'No')
where Id = 4;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Kick w. Boots"."melee"."one-thr"."ST"', 0)
where Id = 4;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Kick w. Boots"."stats"', JSON_OBJECT())
where Id = 4;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Kick w. Boots"."stats"."TL"', null)
where Id = 4;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Kick w. Boots"."stats"."Cost"', 0)
where Id = 4;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Kick w. Boots"."stats"."Weight"', 0)
where Id = 4;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Kick w. Boots"."stats"."Notes"', '3,4')
where Id = 4;



insert into Objects (Id, ClassName, Definition, Body) values (
5,
'Weapon',
JSON_OBJECT(),
JSON_OBJECT()
);

update Objects set ClassGroup = 'BRAWLING, DX'
where Id = 5;
-- ********************************************************************* Blunt Teeth
update Objects set Definition =
	JSON_INSERT(Definition, '$."Blunt Teeth"', JSON_OBJECT())
where Id = 5;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Blunt Teeth"."melee"', JSON_OBJECT())
where Id = 5;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Blunt Teeth"."melee"."one-thr"', JSON_OBJECT())
where Id = 5;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Blunt Teeth"."melee"."one-thr"."Damage"', '-1 cr')
where Id = 5;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Blunt Teeth"."melee"."one-thr"."Reach"', 'C')
where Id = 5;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Blunt Teeth"."melee"."one-thr"."Parry"', 'No')
where Id = 5;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Blunt Teeth"."melee"."one-thr"."ST"', 0)
where Id = 5;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Blunt Teeth"."stats"', JSON_OBJECT())
where Id = 5;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Blunt Teeth"."stats"."TL"', null)
where Id = 5;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Blunt Teeth"."stats"."Cost"', 0)
where Id = 5;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Blunt Teeth"."stats"."Weight"', 0)
where Id = 5;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Blunt Teeth"."stats"."Notes"', '3')
where Id = 5;
-- ********************************************************************* Fangs
update Objects set Definition =
	JSON_INSERT(Definition, '$."Fangs"', JSON_OBJECT())
where Id = 5;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Fangs"."melee"', JSON_OBJECT())
where Id = 5;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Fangs"."melee"."one-thr"', JSON_OBJECT())
where Id = 5;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Fangs"."melee"."one-thr"."Damage"', '-1 imp')
where Id = 5;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Fangs"."melee"."one-thr"."Reach"', 'C')
where Id = 5;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Fangs"."melee"."one-thr"."Parry"', 'No')
where Id = 5;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Fangs"."melee"."one-thr"."ST"', 0)
where Id = 5;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Fangs"."stats"', JSON_OBJECT())
where Id = 5;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Fangs"."stats"."TL"', null)
where Id = 5;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Fangs"."stats"."Cost"', 0)
where Id = 5;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Fangs"."stats"."Weight"', 0)
where Id = 5;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Fangs"."stats"."Notes"', '3')
where Id = 5;
-- ********************************************************************* Sharp Beak
update Objects set Definition =
	JSON_INSERT(Definition, '$."Sharp Beak"', JSON_OBJECT())
where Id = 5;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Sharp Beak"."melee"', JSON_OBJECT())
where Id = 5;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Sharp Beak"."melee"."thr"', JSON_OBJECT())
where Id = 5;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Sharp Beak"."melee"."thr"."Damage"', '-1 pi+')
where Id = 5;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Sharp Beak"."melee"."thr"."Reach"', 'C')
where Id = 5;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Sharp Beak"."melee"."thr"."Parry"', 'No')
where Id = 5;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Sharp Beak"."melee"."thr"."ST"', 0)
where Id = 5;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Sharp Beak"."stats"', JSON_OBJECT())
where Id = 5;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Sharp Beak"."stats"."TL"', null)
where Id = 5;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Sharp Beak"."stats"."Cost"', 0)
where Id = 5;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Sharp Beak"."stats"."Weight"', 0)
where Id = 5;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Sharp Beak"."stats"."Notes"', '3')
where Id = 5;
-- ********************************************************************* Sharp Teeth
update Objects set Definition =
	JSON_INSERT(Definition, '$."Sharp Teeth"', JSON_OBJECT())
where Id = 5;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Sharp Teeth"."melee"', JSON_OBJECT())
where Id = 5;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Sharp Teeth"."melee"."one-thr"', JSON_OBJECT())
where Id = 5;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Sharp Teeth"."melee"."one-thr"."Damage"', '-1 cut')
where Id = 5;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Sharp Teeth"."melee"."one-thr"."Reach"', 'C')
where Id = 5;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Sharp Teeth"."melee"."one-thr"."Parry"', 'No')
where Id = 5;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Sharp Teeth"."melee"."one-thr"."ST"', null)
where Id = 5;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Sharp Teeth"."stats"', JSON_OBJECT())
where Id = 5;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Sharp Teeth"."stats"."TL"', null)
where Id = 5;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Sharp Teeth"."stats"."Cost"', null)
where Id = 5;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Sharp Teeth"."stats"."Weight"', null)
where Id = 5;

update Objects set Definition =
	JSON_INSERT(Definition, '$."Sharp Teeth"."stats"."Notes"', '3')
where Id = 5;

















select json_detailed(Definition), json_detailed(Body) from Objects where ClassName = 'Weapon';


