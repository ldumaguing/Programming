#!/usr/bin/python3
import mariadb as my
import hexagon as hx

# ****************************************************************************************
scenario = my.get_current_scenario()

stmt = "select name, val, json_query(j, '$.hexLoc') as hex," \
	+ " json_value(j, '$.riverHexPlace') from gameData" \
	+ " where name regexp '^u' and scenario = '" + scenario \
	+ "' order by val"
print("********************************************************************************")

results = my.sql_fetchall(stmt)

for x in results:
	#y = x[2]
	#print(y.replace('[','').replace(']','').split(',')   )
	#print(x[0], x[1], hx.convert_loc2id(x[2]))
	y = x[2].replace('[','').replace(']','').split(',')
	z = int(x[3])
	z = z>>2
	if int(y[0])<0:
		print(x[0], "[]", x[1].replace(';',' --- '))
	else:
		print(x[0], "["+hx.convert_loc2id(y)+"]", "["+str(z)+"]", x[1].replace(';',' --- '))

print()








