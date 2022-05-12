drop table if exists Objects;
create table Objects (
	Id          int unsigned primary key,
	ClassType   varchar(128),
	Name        varchar(128),
	Definition  json,
	Body        json
);

