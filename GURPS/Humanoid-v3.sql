delete from Objects where id = 1;
insert into Objects (id, className, classDef, body) values (
1,
'Humanoid',
JSON_OBJECT(),
JSON_OBJECT()
);

-- *********************************************************************************** classDef
update Objects set classDef =
	JSON_INSERT(classDef, '$."Basic Attributes"', JSON_OBJECT())
where id = 1;

update Objects set classDef =
	JSON_INSERT(classDef, '$."Secondary Characteristics"', JSON_OBJECT())
where id = 1;


update Objects set classDef =
	JSON_INSERT(classDef, '$."Basic Attributes"."ST"', 10)
where id = 1;

update Objects set classDef =
	JSON_INSERT(classDef, '$."Basic Attributes"."DX"', 10)
where id = 1;

update Objects set classDef =
	JSON_INSERT(classDef, '$."Basic Attributes"."IQ"', 10)
where id = 1;

update Objects set classDef =
	JSON_INSERT(classDef, '$."Basic Attributes"."HT"', 10)
where id = 1;


update Objects set classDef =
	JSON_INSERT(classDef, '$."Secondary Characteristics"."HP"', 10)
where id = 1;

update Objects set classDef =
	JSON_INSERT(classDef, '$."Secondary Characteristics"."Will"', 10)
where id = 1;

update Objects set classDef =
	JSON_INSERT(classDef, '$."Secondary Characteristics"."Per"', 10)
where id = 1;

update Objects set classDef =
	JSON_INSERT(classDef, '$."Secondary Characteristics"."FP"', 10)
where id = 1;

update Objects set classDef =
	JSON_INSERT(classDef, '$."Secondary Characteristics"."Damage"', null)
where id = 1;

update Objects set classDef =
	JSON_INSERT(classDef, '$."Secondary Characteristics"."Basic Lift"', null)
where id = 1;

update Objects set classDef =
	JSON_INSERT(classDef, '$."Secondary Characteristics"."Basic Speed"', null)
where id = 1;

update Objects set classDef =
	JSON_INSERT(classDef, '$."Secondary Characteristics"."Basic Move"', null)
where id = 1;

update Objects set classDef =
	JSON_INSERT(classDef, '$."Secondary Characteristics"."Size Modifier"', 0)
where id = 1;


-- *********************************************************************************** body
update Objects set body =
	JSON_INSERT(body, '$."Skull"', JSON_OBJECT())
where id = 1;

update Objects set body =
	JSON_INSERT(body, '$."Eyes"', JSON_OBJECT())
where id = 1;
	update Objects set body =
		JSON_INSERT(body, '$."Eyes"."Left"', JSON_OBJECT())
	where id = 1;
	update Objects set body =
		JSON_INSERT(body, '$."Eyes"."Right"', JSON_OBJECT())
	where id = 1;

update Objects set body =
	JSON_INSERT(body, '$."Face"', JSON_OBJECT())
where id = 1;

update Objects set body =
	JSON_INSERT(body, '$."Neck"', JSON_OBJECT())
where id = 1;

update Objects set body =
	JSON_INSERT(body, '$."Arms"', JSON_OBJECT())
where id = 1;
	update Objects set body =
		JSON_INSERT(body, '$."Arms"."Left"', JSON_OBJECT())
	where id = 1;
	update Objects set body =
		JSON_INSERT(body, '$."Arms"."Right"', JSON_OBJECT())
	where id = 1;

update Objects set body =
	JSON_INSERT(body, '$."Hands"', JSON_OBJECT())
where id = 1;
	update Objects set body =
		JSON_INSERT(body, '$."Hands"."Left"', JSON_OBJECT())
	where id = 1;
	update Objects set body =
		JSON_INSERT(body, '$."Hands"."Right"', JSON_OBJECT())
	where id = 1;

update Objects set body =
	JSON_INSERT(body, '$."Torso"', JSON_OBJECT())
where id = 1;
	update Objects set body =
		JSON_INSERT(body, '$."Torso"."Vitals"', JSON_OBJECT())
	where id = 1;
		update Objects set body =
			JSON_INSERT(body, '$."Torso"."Vitals"."Lungs"', JSON_OBJECT())
		where id = 1;
			update Objects set body =
				JSON_INSERT(body, '$."Torso"."Vitals"."Lungs"."Left"', JSON_OBJECT())
			where id = 1;
			update Objects set body =
				JSON_INSERT(body, '$."Torso"."Vitals"."Lungs"."Right"', JSON_OBJECT())
			where id = 1;
		update Objects set body =
			JSON_INSERT(body, '$."Torso"."Vitals"."Heart"', JSON_OBJECT())
		where id = 1;
		update Objects set body =
			JSON_INSERT(body, '$."Torso"."Vitals"."Kidneys"', JSON_OBJECT())
		where id = 1;
			update Objects set body =
				JSON_INSERT(body, '$."Torso"."Vitals"."Kidneys"."Left"', JSON_OBJECT())
			where id = 1;
			update Objects set body =
				JSON_INSERT(body, '$."Torso"."Vitals"."Kidneys"."Right"', JSON_OBJECT())
			where id = 1;
	update Objects set body =
		JSON_INSERT(body, '$."Torso"."Groin"', JSON_OBJECT())
	where id = 1;
	
update Objects set body =
	JSON_INSERT(body, '$."Legs"', JSON_OBJECT())
where id = 1;
	update Objects set body =
		JSON_INSERT(body, '$."Legs"."Left"', JSON_OBJECT())
	where id = 1;
	update Objects set body =
		JSON_INSERT(body, '$."Legs"."Right"', JSON_OBJECT())
	where id = 1;
	
update Objects set body =
	JSON_INSERT(body, '$."Feet"', JSON_OBJECT())
where id = 1;
	update Objects set body =
		JSON_INSERT(body, '$."Feet"."Left"', JSON_OBJECT())
	where id = 1;
	update Objects set body =
		JSON_INSERT(body, '$."Feet"."Right"', JSON_OBJECT())
	where id = 1;


select json_detailed(classDef), json_detailed(body) from Objects where id = 1;
-- mysql GURPS -p'sasamichan[]()' < Humanoid-v3.sql | sed 's/\\n/\n/g' | sed 's/\t/\n************\n/g'





