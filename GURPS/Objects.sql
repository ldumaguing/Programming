drop table if exists Objects;
create table Objects (
	Id          int unsigned primary key,
	ClassName   varchar(128),
	ClassGroup  varchar(128),
	Definition  json,
	Body        json
);

