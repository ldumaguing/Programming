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
	JSON_INSERT(Definition, '$."Axe"."melee"."swing"', JSON_OBJECT())
where Id = 2;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Axe"."melee"."swing"."Damage"', '+2 cut')
where Id = 2;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Axe"."melee"."swing"."Reach"', 1)
where Id = 2;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Axe"."melee"."swing"."Parry"', '0U')
where Id = 2;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Axe"."melee"."swing"."ST"', 11)
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
	JSON_INSERT(Definition, '$."Hatchet"."melee"."swing"', JSON_OBJECT())
where Id = 2;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Hatchet"."melee"."swing"."Damage"', '+0 cut')
where Id = 2;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Hatchet"."melee"."swing"."Reach"', 1)
where Id = 2;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Hatchet"."melee"."swing"."Parry"', '0')
where Id = 2;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Hatchet"."melee"."swing"."ST"', 8)
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
	JSON_INSERT(Definition, '$."Throwing Axe"."melee"."swing"', JSON_OBJECT())
where Id = 2;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Throwing Axe"."melee"."swing"."Damage"', '+2 cut')
where Id = 2;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Throwing Axe"."melee"."swing"."Reach"', 1)
where Id = 2;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Throwing Axe"."melee"."swing"."Parry"', '0U')
where Id = 2;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Throwing Axe"."melee"."swing"."ST"', 11)
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
	JSON_INSERT(Definition, '$."Mace"."melee"."swing"', JSON_OBJECT())
where Id = 2;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Mace"."melee"."swing"."Damage"', '+3 cr')
where Id = 2;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Mace"."melee"."swing"."Reach"', 1)
where Id = 2;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Mace"."melee"."swing"."Parry"', '0U')
where Id = 2;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Mace"."melee"."swing"."ST"', 12)
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
	JSON_INSERT(Definition, '$."Small Mace"."melee"."swing"', JSON_OBJECT())
where Id = 2;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Small Mace"."melee"."swing"."Damage"', '+2 cr')
where Id = 2;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Small Mace"."melee"."swing"."Reach"', 1)
where Id = 2;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Small Mace"."melee"."swing"."Parry"', '0U')
where Id = 2;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Small Mace"."melee"."swing"."ST"', 10)
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
	JSON_INSERT(Definition, '$."Pick"."melee"."swing"', JSON_OBJECT())
where Id = 2;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Pick"."melee"."swing"."Damage"', '+1 imp')
where Id = 2;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Pick"."melee"."swing"."Reach"', 1)
where Id = 2;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Pick"."melee"."swing"."Parry"', '0U')
where Id = 2;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Pick"."melee"."swing"."ST"', 10)
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
	JSON_INSERT(Definition, '$."Punch"."melee"."thrust"', JSON_OBJECT())
where Id = 3;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Punch"."melee"."thrust"."Damage"', '-1 cr')
where Id = 3;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Punch"."melee"."thrust"."Reach"', 'C')
where Id = 3;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Punch"."melee"."thrust"."Parry"', '0')
where Id = 3;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Punch"."melee"."thrust"."ST"', 0)
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
	JSON_INSERT(Definition, '$."Brass Knuckles"."melee"."thrust"', JSON_OBJECT())
where Id = 3;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Brass Knuckles"."melee"."thrust"."Damage"', '+0 cr')
where Id = 3;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Brass Knuckles"."melee"."thrust"."Reach"', 'C')
where Id = 3;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Brass Knuckles"."melee"."thrust"."Parry"', '0')
where Id = 3;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Brass Knuckles"."melee"."thrust"."ST"', 0)
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
	JSON_INSERT(Definition, '$."Kick"."melee"."thrust"', JSON_OBJECT())
where Id = 4;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Kick"."melee"."thrust"."Damage"', '+0 cr')
where Id = 4;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Kick"."melee"."thrust"."Reach"', 'C,1')
where Id = 4;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Kick"."melee"."thrust"."Parry"', 'No')
where Id = 4;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Kick"."melee"."thrust"."ST"', 0)
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
	JSON_INSERT(Definition, '$."Kick w. Boots"."melee"."thrust"', JSON_OBJECT())
where Id = 4;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Kick w. Boots"."melee"."thrust"."Damage"', '+1 cr')
where Id = 4;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Kick w. Boots"."melee"."thrust"."Reach"', 'C,1')
where Id = 4;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Kick w. Boots"."melee"."thrust"."Parry"', 'No')
where Id = 4;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Kick w. Boots"."melee"."thrust"."ST"', 0)
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
	JSON_INSERT(Definition, '$."Blunt Teeth"."melee"."thrust"', JSON_OBJECT())
where Id = 5;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Blunt Teeth"."melee"."thrust"."Damage"', '-1 cr')
where Id = 5;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Blunt Teeth"."melee"."thrust"."Reach"', 'C')
where Id = 5;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Blunt Teeth"."melee"."thrust"."Parry"', 'No')
where Id = 5;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Blunt Teeth"."melee"."thrust"."ST"', 0)
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
	JSON_INSERT(Definition, '$."Fangs"."melee"."thrust"', JSON_OBJECT())
where Id = 5;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Fangs"."melee"."thrust"."Damage"', '-1 imp')
where Id = 5;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Fangs"."melee"."thrust"."Reach"', 'C')
where Id = 5;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Fangs"."melee"."thrust"."Parry"', 'No')
where Id = 5;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Fangs"."melee"."thrust"."ST"', 0)
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
	JSON_INSERT(Definition, '$."Sharp Teeth"."melee"."thrust"', JSON_OBJECT())
where Id = 5;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Sharp Teeth"."melee"."thrust"."Damage"', '-1 cut')
where Id = 5;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Sharp Teeth"."melee"."thrust"."Reach"', 'C')
where Id = 5;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Sharp Teeth"."melee"."thrust"."Parry"', 'No')
where Id = 5;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Sharp Teeth"."melee"."thrust"."ST"', null)
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
-- ********************************************************************* Blackjack or Sap
update Objects set Definition =
	JSON_INSERT(Definition, '$."Blackjack or Sap"', JSON_OBJECT())
where Id = 5;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Blackjack or Sap"."melee"', JSON_OBJECT())
where Id = 5;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Blackjack or Sap"."melee"."thrust"', JSON_OBJECT())
where Id = 5;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Blackjack or Sap"."melee"."thrust"."Damage"', '+0 cr')
where Id = 5;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Blackjack or Sap"."melee"."thrust"."Reach"', 'C')
where Id = 5;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Blackjack or Sap"."melee"."thrust"."Parry"', 0)
where Id = 5;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Blackjack or Sap"."melee"."thrust"."ST"', 7)
where Id = 5;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Blackjack or Sap"."stats"', JSON_OBJECT())
where Id = 5;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Blackjack or Sap"."stats"."TL"', 1)
where Id = 5;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Blackjack or Sap"."stats"."Cost"', 20)
where Id = 5;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Blackjack or Sap"."stats"."Weight"', 1)
where Id = 5;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Blackjack or Sap"."stats"."Notes"', '3')
where Id = 5;
-- ********************************************************************* Stun Gun
update Objects set Definition =
	JSON_INSERT(Definition, '$."Stun Gun"', JSON_OBJECT())
where Id = 5;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Stun Gun"."melee"', JSON_OBJECT())
where Id = 5;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Stun Gun"."melee"."?"', JSON_OBJECT())
where Id = 5;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Stun Gun"."melee"."?"."Damage"', 'HT-3(0.5) aff')
where Id = 5;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Stun Gun"."melee"."?"."Reach"', 'C,1')
where Id = 5;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Stun Gun"."melee"."?"."Parry"', 'No')
where Id = 5;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Stun Gun"."melee"."?"."ST"', 2)
where Id = 5;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Stun Gun"."stats"', JSON_OBJECT())
where Id = 5;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Stun Gun"."stats"."TL"', 8)
where Id = 5;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Stun Gun"."stats"."Cost"', 100)
where Id = 5;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Stun Gun"."stats"."Weight"', 1)
where Id = 5;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Stun Gun"."stats"."Notes"', '5')
where Id = 5;



insert into Objects (Id, ClassName, Definition, Body) values (
6,
'Weapon',
JSON_OBJECT(),
JSON_OBJECT()
);

update Objects set ClassGroup = 'BROADSWORD (DX-5, Force Sword-4, Rapier-4, Saber-4, Shortsword-2, Two-Handed Sword-4)'
where Id = 6;
-- ********************************************************************* Light Club
update Objects set Definition =
	JSON_INSERT(Definition, '$."Light Club"', JSON_OBJECT())
where Id = 6;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Light Club"."melee"', JSON_OBJECT())
where Id = 6;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Light Club"."melee"."swing"', JSON_OBJECT())
where Id = 6;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Light Club"."melee"."swing"."Damage"', '+1 cr')
where Id = 6;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Light Club"."melee"."swing"."Reach"', 1)
where Id = 6;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Light Club"."melee"."swing"."Parry"', 0)
where Id = 6;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Light Club"."melee"."swing"."ST"', 10)
where Id = 6;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Light Club"."melee"."thrust"', JSON_OBJECT())
where Id = 6;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Light Club"."melee"."thrust"."Damage"', '+1 cr')
where Id = 6;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Light Club"."melee"."thrust"."Reach"', 1)
where Id = 6;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Light Club"."melee"."thrust"."Parry"', 0)
where Id = 6;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Light Club"."melee"."thrust"."ST"', 10)
where Id = 6;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Light Club"."stats"', JSON_OBJECT())
where Id = 6;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Light Club"."stats"."TL"', 0)
where Id = 6;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Light Club"."stats"."Cost"', 5)
where Id = 6;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Light Club"."stats"."Weight"', 3)
where Id = 6;
update Objects set Definition =
	JSON_INSERT(Definition, '$."Light Club"."stats"."Notes"', null)
where Id = 6;










select json_detailed(Definition), json_detailed(Body) from Objects where ClassName = 'Weapon';


