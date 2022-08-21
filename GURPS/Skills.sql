create table Skills (
	Id           int,
	Name         varchar(128),
	difficulty   varchar(64),
	points       int,
	refer        varchar(64),
	defaults     varchar(512),
	primary key(Id)
);




create table Skills (
	Id           int,
	Name         varchar(128),
	difficulty   varchar(64),
	points       int,
	refer        varchar(64),
	defaults     varchar(512)
);


LOAD DATA LOCAL INFILE '/home/ayeka/Programming/GURPS/BasicSet.csv' INTO TABLE Skills
FIELDS TERMINATED BY ',' 
 OPTIONALLY ENCLOSED BY '"'
 ESCAPED BY '"'
 LINES TERMINATED BY '\n';
