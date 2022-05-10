delete from Objects where id = 1000;
insert into Objects (id, className, classDef) values (
1000,
'Humanoid',
JSON_OBJECT()
);


update Objects set classDef =
	json_insert(classDef, '$."Basic Attributes"', JSON_OBJECT())
where id = 1000;

update Objects set classDef =
	json_insert(classDef, '$."Secondary Characteristics"', JSON_OBJECT())
where id = 1000;

update Objects set classDef =
	json_insert(classDef, '$."Body"', JSON_OBJECT())
where id = 1000;


update Objects set classDef =
	json_insert(classDef, '$."Basic Attributes"."ST"', 10)
where id = 1000;

update Objects set classDef =
	json_insert(classDef, '$."Basic Attributes"."DX"', 10)
where id = 1000;

update Objects set classDef =
	json_insert(classDef, '$."Basic Attributes"."IQ"', 10)
where id = 1000;

update Objects set classDef =
	json_insert(classDef, '$."Basic Attributes"."HT"', 10)
where id = 1000;


update Objects set classDef =
	json_insert(classDef, '$."Secondary Characteristics"."HP"', 10)
where id = 1000;

update Objects set classDef =
	json_insert(classDef, '$."Secondary Characteristics"."Will"', 10)
where id = 1000;

update Objects set classDef =
	json_insert(classDef, '$."Secondary Characteristics"."Per"', 10)
where id = 1000;

update Objects set classDef =
	json_insert(classDef, '$."Secondary Characteristics"."FP"', 10)
where id = 1000;


update Objects set classDef =
	json_insert(classDef, '$."Body"."Skull"', JSON_OBJECT())
where id = 1000;

update Objects set classDef =
	json_insert(classDef, '$."Body"."Eyes"', JSON_OBJECT())
where id = 1000;
	update Objects set classDef =
		json_insert(classDef, '$."Body"."Eyes"."Left"', JSON_OBJECT())
	where id = 1000;
	update Objects set classDef =
		json_insert(classDef, '$."Body"."Eyes"."Right"', JSON_OBJECT())
	where id = 1000;

update Objects set classDef =
	json_insert(classDef, '$."Body"."Face"', JSON_OBJECT())
where id = 1000;

update Objects set classDef =
	json_insert(classDef, '$."Body"."Neck"', JSON_OBJECT())
where id = 1000;

update Objects set classDef =
	json_insert(classDef, '$."Body"."Arms"', JSON_OBJECT())
where id = 1000;
	update Objects set classDef =
		json_insert(classDef, '$."Body"."Arms"."Left"', JSON_OBJECT())
	where id = 1000;
	update Objects set classDef =
		json_insert(classDef, '$."Body"."Arms"."Right"', JSON_OBJECT())
	where id = 1000;

update Objects set classDef =
	json_insert(classDef, '$."Body"."Hands"', JSON_OBJECT())
where id = 1000;
	update Objects set classDef =
		json_insert(classDef, '$."Body"."Hands"."Left"', JSON_OBJECT())
	where id = 1000;
	update Objects set classDef =
		json_insert(classDef, '$."Body"."Hands"."Right"', JSON_OBJECT())
	where id = 1000;

update Objects set classDef =
	json_insert(classDef, '$."Body"."Torso"', JSON_OBJECT())
where id = 1000;
	update Objects set classDef =
		json_insert(classDef, '$."Body"."Torso"."Vitals"', JSON_OBJECT())
	where id = 1000;
		update Objects set classDef =
			json_insert(classDef, '$."Body"."Torso"."Vitals"."Lungs"', JSON_OBJECT())
		where id = 1000;
		update Objects set classDef =
			json_insert(classDef, '$."Body"."Torso"."Vitals"."Heart"', JSON_OBJECT())
		where id = 1000;
		update Objects set classDef =
			json_insert(classDef, '$."Body"."Torso"."Vitals"."Kidneys"', JSON_OBJECT())
		where id = 1000;
	update Objects set classDef =
		json_insert(classDef, '$."Body"."Torso"."Groin"', JSON_OBJECT())
	where id = 1000;

update Objects set classDef =
	json_insert(classDef, '$."Body"."Legs"', JSON_OBJECT())
where id = 1000;
	update Objects set classDef =
		json_insert(classDef, '$."Body"."Legs"."Left"', JSON_OBJECT())
	where id = 1000;
	update Objects set classDef =
		json_insert(classDef, '$."Body"."Legs"."Right"', JSON_OBJECT())
	where id = 1000;

update Objects set classDef =
	json_insert(classDef, '$."Body"."Feet"', JSON_OBJECT())
where id = 1000;
	update Objects set classDef =
		json_insert(classDef, '$."Body"."Feet"."Left"', JSON_OBJECT())
	where id = 1000;
	update Objects set classDef =
		json_insert(classDef, '$."Body"."Feet"."Right"', JSON_OBJECT())
	where id = 1000;


select json_detailed(classDef) from Objects where id = 1000;


-- mysql GURPS -p'sasamichan[]()' < Humanoid-v2.sql | sed 's/\\n/\n/g'
-- select json_value(json_detailed(classDef), '$."Basic Attributes"."ST"') from Objects;


