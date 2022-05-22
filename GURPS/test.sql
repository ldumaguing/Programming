delete from Objects where ClassType = 'Weapon';

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



update Objects set Definition =
	JSON_INSERT(Definition, '$."handling"', JSON_OBJECT())
where Id = 10000;
--update Objects set Definition =
--	JSON_INSERT(Definition, '$."handling"."one"', JSON_OBJECT())
--where Id = 10000;








--select json_detailed(json_query(Definition, '$."one"')) from Objects where ClassType = 'weapon';

--select json_insert(Definition, '$."handling"."one"', json_query(Definition, '$."one"'))
--   from Objects where ClassType = 'weapon';


update Objects set Definition =
   json_insert(Definition, '$."handling"."one"', json_query(Definition, '$."one"'))
where ClassType = 'weapon';


-- select json_detailed(json_remove(Definition, '$."one"')) from Objects where ClassType = 'weapon';

update Objects set Definition =
   json_remove(Definition, '$."one"')
where ClassType = 'weapon';





select Name, json_detailed(Definition) from Objects where ClassType = 'weapon';









