#!/usr/bin/python3
import chits as chit
import map0
import mariadb as my
import hexagon as hx

def get_placement(river, frm):
	riv = (river&16383)
	if frm=="A":
		if riv&(1<<13):
			if riv&(1<<12)==0:
				return (1<<12)
			return 0
		return (1<<13)

	if frm=="B":
		if riv&(1<<11):
			if riv&(1<<10)==0:
				return (1<<10)
			return 0
		return (1<<11)

	if frm=="C":
		if riv&(1<<9):
			if riv&(1<<8)==0:
				return (1<<8)
			return 0
		return (1<<9)

	if frm=="D":
		if riv&(1<<7):
			if riv&(1<<6)==0:
				return (1<<6)
			return 0
		return (1<<7)

	if frm=="E":
		if riv&(1<<5):
			if riv&(1<<4)==0:
				return (1<<4)
			return 0
		return (1<<5)
		
	if frm=="F":
		if riv&(1<<3):
			if riv&(1<<2)==0:
				return (1<<2)
			return 0
		return (1<<3)
		
	return 0



entering_from = "F"

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
