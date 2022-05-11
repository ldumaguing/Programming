delete from Objects where Id = 1;
insert into Objects (Id, ClassName, Definition, Body) values (
1,
'Humanoid',
JSON_OBJECT(),
JSON_OBJECT()
);

-- *********************************************************************************** Definition
update Objects set Definition =
	JSON_INSERT(Definition, '$."Basic Attributes"', JSON_OBJECT())
where Id = 1;

update Objects set Definition =
	JSON_INSERT(Definition, '$."Secondary Characteristics"', JSON_OBJECT())
where Id = 1;


update Objects set Definition =
	JSON_INSERT(Definition, '$."Basic Attributes"."ST"', 10)
where Id = 1;

update Objects set Definition =
	JSON_INSERT(Definition, '$."Basic Attributes"."DX"', 10)
where Id = 1;

update Objects set Definition =
	JSON_INSERT(Definition, '$."Basic Attributes"."IQ"', 10)
where Id = 1;

update Objects set Definition =
	JSON_INSERT(Definition, '$."Basic Attributes"."HT"', 10)
where Id = 1;


update Objects set Definition =
	JSON_INSERT(Definition, '$."Secondary Characteristics"."HP"', 10)
where Id = 1;

update Objects set Definition =
	JSON_INSERT(Definition, '$."Secondary Characteristics"."Will"', 10)
where Id = 1;

update Objects set Definition =
	JSON_INSERT(Definition, '$."Secondary Characteristics"."Per"', 10)
where Id = 1;

update Objects set Definition =
	JSON_INSERT(Definition, '$."Secondary Characteristics"."FP"', 10)
where Id = 1;

update Objects set Definition =
	JSON_INSERT(Definition, '$."Secondary Characteristics"."Damage"', null)
where Id = 1;

update Objects set Definition =
	JSON_INSERT(Definition, '$."Secondary Characteristics"."Basic Lift"', null)
where Id = 1;

update Objects set Definition =
	JSON_INSERT(Definition, '$."Secondary Characteristics"."Basic Speed"', null)
where Id = 1;

update Objects set Definition =
	JSON_INSERT(Definition, '$."Secondary Characteristics"."Basic Move"', null)
where Id = 1;

update Objects set Definition =
	JSON_INSERT(Definition, '$."Secondary Characteristics"."Size Modifier"', 0)
where Id = 1;


-- *********************************************************************************** Body
update Objects set Body =
	JSON_INSERT(Body, '$."Skull"', JSON_OBJECT())
where Id = 1;

update Objects set Body =
	JSON_INSERT(Body, '$."Eyes"', JSON_OBJECT())
where Id = 1;
	update Objects set Body =
		JSON_INSERT(Body, '$."Eyes"."Left"', JSON_OBJECT())
	where Id = 1;
	update Objects set Body =
		JSON_INSERT(Body, '$."Eyes"."Right"', JSON_OBJECT())
	where Id = 1;

update Objects set Body =
	JSON_INSERT(Body, '$."Face"', JSON_OBJECT())
where Id = 1;

update Objects set Body =
	JSON_INSERT(Body, '$."Neck"', JSON_OBJECT())
where Id = 1;

update Objects set Body =
	JSON_INSERT(Body, '$."Arms"', JSON_OBJECT())
where Id = 1;
	update Objects set Body =
		JSON_INSERT(Body, '$."Arms"."Left"', JSON_OBJECT())
	where Id = 1;
	update Objects set Body =
		JSON_INSERT(Body, '$."Arms"."Right"', JSON_OBJECT())
	where Id = 1;

update Objects set Body =
	JSON_INSERT(Body, '$."Hands"', JSON_OBJECT())
where Id = 1;
	update Objects set Body =
		JSON_INSERT(Body, '$."Hands"."Left"', JSON_OBJECT())
	where Id = 1;
	update Objects set Body =
		JSON_INSERT(Body, '$."Hands"."Right"', JSON_OBJECT())
	where Id = 1;

update Objects set Body =
	JSON_INSERT(Body, '$."Torso"', JSON_OBJECT())
where Id = 1;
	update Objects set Body =
		JSON_INSERT(Body, '$."Torso"."Vitals"', JSON_OBJECT())
	where Id = 1;
		update Objects set Body =
			JSON_INSERT(Body, '$."Torso"."Vitals"."Lungs"', JSON_OBJECT())
		where Id = 1;
			update Objects set Body =
				JSON_INSERT(Body, '$."Torso"."Vitals"."Lungs"."Left"', JSON_OBJECT())
			where Id = 1;
			update Objects set Body =
				JSON_INSERT(Body, '$."Torso"."Vitals"."Lungs"."Right"', JSON_OBJECT())
			where Id = 1;
		update Objects set Body =
			JSON_INSERT(Body, '$."Torso"."Vitals"."Heart"', JSON_OBJECT())
		where Id = 1;
		update Objects set Body =
			JSON_INSERT(Body, '$."Torso"."Vitals"."Kidneys"', JSON_OBJECT())
		where Id = 1;
			update Objects set Body =
				JSON_INSERT(Body, '$."Torso"."Vitals"."Kidneys"."Left"', JSON_OBJECT())
			where Id = 1;
			update Objects set Body =
				JSON_INSERT(Body, '$."Torso"."Vitals"."Kidneys"."Right"', JSON_OBJECT())
			where Id = 1;
	update Objects set Body =
		JSON_INSERT(Body, '$."Torso"."Groin"', JSON_OBJECT())
	where Id = 1;
	
update Objects set Body =
	JSON_INSERT(Body, '$."Legs"', JSON_OBJECT())
where Id = 1;
	update Objects set Body =
		JSON_INSERT(Body, '$."Legs"."Left"', JSON_OBJECT())
	where Id = 1;
	update Objects set Body =
		JSON_INSERT(Body, '$."Legs"."Right"', JSON_OBJECT())
	where Id = 1;
	
update Objects set Body =
	JSON_INSERT(Body, '$."Feet"', JSON_OBJECT())
where Id = 1;
	update Objects set Body =
		JSON_INSERT(Body, '$."Feet"."Left"', JSON_OBJECT())
	where Id = 1;
	update Objects set Body =
		JSON_INSERT(Body, '$."Feet"."Right"', JSON_OBJECT())
	where Id = 1;


select json_detailed(Definition), json_detailed(Body) from Objects where Id = 1;
-- mysql GURPS -p'sasamichan[]()' < Humanoid-v3.sql | sed 's/\\n/\n/g' | sed 's/\t/\n************\n/g'





