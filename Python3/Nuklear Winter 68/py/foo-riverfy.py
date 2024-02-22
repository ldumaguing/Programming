#!/usr/bin/python3
import chits as chit
import map0
import mariadb as my
import hexagon as hx

def get_placement(river, frm):
	riv = (river&16383)
	print(river, riv&(1<<13))
	if frm=="A":
		if riv&(1<<13):
			if riv&(1<<12)==0:
				return (1<<12)
			return 0
		return (1<<13)
	if frm=="B":
		return 66
	if frm=="C":
		return 66
	if frm=="D":
		return 66
	if frm=="E":
		return 66
	if frm=="F":
		return 66
	return 0



entering_from = "A"

# select
# json_value(j, '$.hexLoc[0]'),
# json_value(j, '$.hexLoc[1]')
# from gameData where name regexp '^u';
stmt = "select json_value(j, '$.hexLoc[0]'), json_value(j, '$.hexLoc[1]')" \
	+ " from gameData where name regexp '^u'"

result = my.sql_fetchall(stmt)
for x in result:
	if int(x[0])<0:   # is unit not in play
		continue
	hexID = hx.convert_loc2id(  (int(x[0]), int(x[1]))  )
	river = map0.get_riverStat(hexID)
	if river>0:  # is unit on a rivered hex
		print(hexID, river)
		print(">>>", get_placement(river, entering_from))
