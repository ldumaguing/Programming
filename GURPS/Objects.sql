drop table if exists Objects;
create table Objects (
	id int,
	className varchar(80),
	classDef json
);


insert into Objects values (
1000,
'Humanoid',
'{}'
);


update Objects set classDef =
	json_insert(classDef, '$."Basic Attributes"', '[]')
where id = 1000;

select * from Objects;


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

select * from Objects;


select '*****************************************';
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

select * from Objects;








