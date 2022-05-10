drop table if exists Objects;
create table Objects (
	id          int primary key,
	className   varchar(80),
	classDef    json,
	body        json
);

