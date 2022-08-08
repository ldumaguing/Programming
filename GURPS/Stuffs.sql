drop table if exists Stuffs;
create table Stuffs (
	Id          int unsigned primary key,
	ClassType   varchar(128),
	Name        varchar(128),
	Definition  json
);


drop table if exists TheWorld;
create table TheWorld (
	Id          int unsigned primary key,
	ClassType   varchar(128),
	Name        varchar(128),
	Definition  json,
	Tags        json,
	LocX        int,
	LocY        int,
	LocZ        int
);












