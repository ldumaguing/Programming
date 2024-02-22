#!/usr/bin/python3
import chits as chit
import map0
import mariadb as my
import hexagon as hx

# select
# json_value(j, '$.hexLoc[0]'),
# json_value(j, '$.hexLoc[1]')
# from gameData where name regexp '^u';
stmt = "select json_value(j, '$.hexLoc[0]'), json_value(j, '$.hexLoc[1]')" \
	+ " from gameData where name regexp '^u'"

result = my.sql_fetchall(stmt)
for x in result:
	if int(x[0])<0:
		continue
	hexID = hx.convert_loc2id(  (int(x[0]), int(x[1]))  )
	print(hexID, ":", map0.get_riverStat(hexID))
