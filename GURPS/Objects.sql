drop table if exists Objects;
create table Objects (
	Id          int unsigned primary key,
	ClassName   varchar(80),
	ClassGroup  varchar(80),
	Definition  json,
	Body        json
);

