drop table if exists Objects;
create table Objects (
	Id          int unsigned primary key,
	ClassType   varchar(128),
	Name        varchar(128),
	Definition  json
);


drop table if exists Instances;
create table Instances (
	Id          int unsigned primary key,
	ClassType   varchar(128),
	Name        varchar(128),
	Definition  json,
	Tags        json,
	LocX        int,
	LocY        int,
	LocZ        int
);












