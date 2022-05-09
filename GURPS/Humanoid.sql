delete from Objects where id = 1000;
insert into Objects (id, className, classDef) values (
1000,
'Humanoid',
'{}'
);


update Objects set classDef =
	json_insert(classDef, '$."Basic Attributes"', '[]')
where id = 1000;


update Objects set classDef =
JSON_SET(
	classDef,
	'$."Basic Attributes"[0]',
	JSON_ARRAY_INSERT(
		JSON_VALUE(
			classDef,
			'$."Basic Attributes"'),
		'$[0]',
		JSON_OBJECT("ST",10)))
where id = 1000;


-- select '*****************************************';
update Objects set classDef =
JSON_SET(classDef, '$."Basic Attributes"',
	JSON_ARRAY_APPEND(
		JSON_QUERY(classDef, '$."Basic Attributes"'),
		'$',
		JSON_OBJECT("DX",10),
		'$',
		JSON_OBJECT("IQ",10),
		'$',
		JSON_OBJECT("HT",10)
	)
)
where id = 1000;


-- select '*****************************************';
update Objects set classDef =
	json_insert(classDef, '$."Secondary Characteristics"', '[]')
where id = 1000;


update Objects set classDef =
JSON_SET(classDef, '$."Secondary Characteristics"',
	JSON_ARRAY_APPEND(
		JSON_VALUE(classDef, '$."Secondary Characteristics"[0]'),
		'$',
		JSON_OBJECT("HP",10),
		'$',
		JSON_OBJECT("Will",10),
		'$',
		JSON_OBJECT("Per",10),
		'$',
		JSON_OBJECT("FP",10),
		'$',
		JSON_OBJECT("Damage",null),
		'$',
		JSON_OBJECT("Basic Lift",null),
		'$',
		JSON_OBJECT("Basic Speed",null),
		'$',
		JSON_OBJECT("Basic Move",null),
		'$',
		JSON_OBJECT("Size Modifier",0)
	)
)
where id = 1000;

select * from Objects where id = 1000;






