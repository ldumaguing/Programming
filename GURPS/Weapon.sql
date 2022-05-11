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
	JSON_INSERT(Definition, '$."Axe"."TL"', 0)
where Id = 2;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Axe"."Damage"', 'sw+2 cut')
where Id = 2;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Axe"."Reach"', 1)
where Id = 2;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Axe"."Parry"', '0U')
where Id = 2;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Axe"."Cost"', 50)
where Id = 2;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Axe"."Weight"', 4)
where Id = 2;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Axe"."ST"', 11)
where Id = 2;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Axe"."Notes"', '')
where Id = 2;
-- ********************************************************************* Hatchet
update Objects set Definition =
	JSON_INSERT(Definition, '$."Hatchet"', JSON_OBJECT())
where Id = 2;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Hatchet"."TL"', 0)
where Id = 2;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Hatchet"."Damage"', 'sw cut')
where Id = 2;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Hatchet"."Reach"', 1)
where Id = 2;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Hatchet"."Parry"', '0')
where Id = 2;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Hatchet"."Cost"', 40)
where Id = 2;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Hatchet"."Weight"', 2)
where Id = 2;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Hatchet"."ST"', 8)
where Id = 2;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Hatchet"."Notes"', '1')
where Id = 2;
-- ********************************************************************* Throwing Axe
update Objects set Definition =
	JSON_INSERT(Definition, '$."Throwing Axe"', JSON_OBJECT())
where Id = 2;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Throwing Axe"."TL"', 0)
where Id = 2;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Throwing Axe"."Damage"', 'sw+2 cut')
where Id = 2;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Throwing Axe"."Reach"', 1)
where Id = 2;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Throwing Axe"."Parry"', '0U')
where Id = 2;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Throwing Axe"."Cost"', 60)
where Id = 2;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Throwing Axe"."Weight"', 4)
where Id = 2;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Throwing Axe"."ST"', 11)
where Id = 2;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Throwing Axe"."Notes"', '1')
where Id = 2;
-- ********************************************************************* Mace
update Objects set Definition =
	JSON_INSERT(Definition, '$."Mace"', JSON_OBJECT())
where Id = 2;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Mace"."TL"', 2)
where Id = 2;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Mace"."Damage"', 'sw+3 cr')
where Id = 2;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Mace"."Reach"', 1)
where Id = 2;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Mace"."Parry"', '0U')
where Id = 2;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Mace"."Cost"', 50)
where Id = 2;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Mace"."Weight"', 5)
where Id = 2;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Mace"."ST"', 12)
where Id = 2;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Mace"."Notes"', '1')
where Id = 2;
-- ********************************************************************* Small Mace
update Objects set Definition =
	JSON_INSERT(Definition, '$."Small Mace"', JSON_OBJECT())
where Id = 2;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Small Mace"."TL"', 2)
where Id = 2;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Small Mace"."Damage"', 'sw+2 cr')
where Id = 2;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Small Mace"."Reach"', 1)
where Id = 2;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Small Mace"."Parry"', '0U')
where Id = 2;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Small Mace"."Cost"', 35)
where Id = 2;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Small Mace"."Weight"', 3)
where Id = 2;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Small Mace"."ST"', 10)
where Id = 2;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Small Mace"."Notes"', '1')
where Id = 2;
-- ********************************************************************* Pick
update Objects set Definition =
	JSON_INSERT(Definition, '$."Pick"', JSON_OBJECT())
where Id = 2;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Pick"."TL"', 3)
where Id = 2;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Pick"."Damage"', 'sw+1 imp')
where Id = 2;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Pick"."Reach"', 1)
where Id = 2;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Pick"."Parry"', '0U')
where Id = 2;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Pick"."Cost"', 70)
where Id = 2;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Pick"."Weight"', 3)
where Id = 2;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Pick"."ST"', 10)
where Id = 2;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Pick"."Notes"', '2')
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
	JSON_INSERT(Definition, '$."Punch"."TL"', null)
where Id = 3;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Punch"."Damage"', 'thr-1 cr')
where Id = 3;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Punch"."Reach"', 'C')
where Id = 3;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Punch"."Parry"', '0')
where Id = 3;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Punch"."Cost"', null)
where Id = 3;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Punch"."Weight"', null)
where Id = 3;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Punch"."ST"', null)
where Id = 3;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Punch"."Notes"', '3')
where Id = 3;
-- ********************************************************************* Brass Knuckles
update Objects set Definition =
	JSON_INSERT(Definition, '$."Brass Knuckles"', JSON_OBJECT())
where Id = 3;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Brass Knuckles"."TL"', 1)
where Id = 3;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Brass Knuckles"."Damage"', 'thr cr')
where Id = 3;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Brass Knuckles"."Reach"', 'C')
where Id = 3;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Brass Knuckles"."Parry"', '0')
where Id = 3;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Brass Knuckles"."Cost"', 10)
where Id = 3;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Brass Knuckles"."Weight"', .25)
where Id = 3;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Brass Knuckles"."ST"', null)
where Id = 3;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Brass Knuckles"."Notes"', '3')
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
	JSON_INSERT(Definition, '$."Kick"."TL"', null)
where Id = 4;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Kick"."Damage"', 'thr cr')
where Id = 4;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Kick"."Reach"', 'C,1')
where Id = 4;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Kick"."Parry"', 'No')
where Id = 4;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Kick"."Cost"', null)
where Id = 4;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Kick"."Weight"', null)
where Id = 4;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Kick"."ST"', null)
where Id = 4;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Kick"."Notes"', '3,4')
where Id = 4;
-- ********************************************************************* Kick w. Boots
update Objects set Definition =
	JSON_INSERT(Definition, '$."Kick w. Boots"', JSON_OBJECT())
where Id = 4;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Kick w. Boots"."TL"', null)
where Id = 4;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Kick w. Boots"."Damage"', 'thr+1 cr')
where Id = 4;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Kick w. Boots"."Reach"', 'C,1')
where Id = 4;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Kick w. Boots"."Parry"', 'No')
where Id = 4;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Kick w. Boots"."Cost"', null)
where Id = 4;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Kick w. Boots"."Weight"', null)
where Id = 4;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Kick w. Boots"."ST"', null)
where Id = 4;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Kick w. Boots"."Notes"', '3,4')
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
	JSON_INSERT(Definition, '$."Blunt Teeth"."TL"', null)
where Id = 5;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Blunt Teeth"."Damage"', 'thr-1 cr')
where Id = 5;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Blunt Teeth"."Reach"', 'C')
where Id = 5;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Blunt Teeth"."Parry"', 'No')
where Id = 5;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Blunt Teeth"."Cost"', null)
where Id = 5;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Blunt Teeth"."Weight"', null)
where Id = 5;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Blunt Teeth"."ST"', null)
where Id = 5;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Blunt Teeth"."Notes"', '3')
where Id = 5;
-- ********************************************************************* Fangs
update Objects set Definition =
	JSON_INSERT(Definition, '$."Fangs"', JSON_OBJECT())
where Id = 5;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Fangs"."TL"', null)
where Id = 5;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Fangs"."Damage"', 'thr-1 imp')
where Id = 5;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Fangs"."Reach"', 'C')
where Id = 5;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Fangs"."Parry"', 'No')
where Id = 5;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Fangs"."Cost"', null)
where Id = 5;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Fangs"."Weight"', null)
where Id = 5;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Fangs"."ST"', null)
where Id = 5;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Fangs"."Notes"', '3')
where Id = 5;
-- ********************************************************************* Sharp Beak
update Objects set Definition =
	JSON_INSERT(Definition, '$."Sharp Beak"', JSON_OBJECT())
where Id = 5;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Sharp Beak"."TL"', null)
where Id = 5;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Sharp Beak"."Damage"', 'thr-1 pi+')
where Id = 5;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Sharp Beak"."Reach"', 'C')
where Id = 5;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Sharp Beak"."Parry"', 'No')
where Id = 5;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Sharp Beak"."Cost"', null)
where Id = 5;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Sharp Beak"."Weight"', null)
where Id = 5;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Sharp Beak"."ST"', null)
where Id = 5;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Sharp Beak"."Notes"', '3')
where Id = 5;
-- ********************************************************************* Sharp Teeth
update Objects set Definition =
	JSON_INSERT(Definition, '$."Sharp Teeth"', JSON_OBJECT())
where Id = 5;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Sharp Teeth"."TL"', null)
where Id = 5;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Sharp Teeth"."Damage"', 'thr-1 cut')
where Id = 5;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Sharp Teeth"."Reach"', 'C')
where Id = 5;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Sharp Teeth"."Parry"', 'No')
where Id = 5;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Sharp Teeth"."Cost"', null)
where Id = 5;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Sharp Teeth"."Weight"', null)
where Id = 5;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Sharp Teeth"."ST"', null)
where Id = 5;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Sharp Teeth"."Notes"', '3')
where Id = 5;
-- ********************************************************************* Blackjack or Sap
update Objects set Definition =
	JSON_INSERT(Definition, '$."Blackjack or Sap"', JSON_OBJECT())
where Id = 5;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Blackjack or Sap"."TL"', 1)
where Id = 5;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Blackjack or Sap"."Damage"', 'thr cr')
where Id = 5;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Blackjack or Sap"."Reach"', 'C')
where Id = 5;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Blackjack or Sap"."Parry"', 0)
where Id = 5;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Blackjack or Sap"."Cost"', 20)
where Id = 5;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Blackjack or Sap"."Weight"', 1)
where Id = 5;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Blackjack or Sap"."ST"', 7)
where Id = 5;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Blackjack or Sap"."Notes"', '3')
where Id = 5;
-- ********************************************************************* Stun Gun
update Objects set Definition =
	JSON_INSERT(Definition, '$."Stun Gun"', JSON_OBJECT())
where Id = 5;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Stun Gun"."TL"', 8)
where Id = 5;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Stun Gun"."Damage"', 'HT-3(0.5) aff')
where Id = 5;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Stun Gun"."Reach"', 'C,1')
where Id = 5;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Stun Gun"."Parry"', 'No')
where Id = 5;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Stun Gun"."Cost"', 100)
where Id = 5;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Stun Gun"."Weight"', 1)
where Id = 5;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Stun Gun"."ST"', 2)
where Id = 5;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Stun Gun"."Notes"', '5')
where Id = 5;







































select json_detailed(Definition), json_detailed(Body) from Objects where ClassName = 'Weapon';


