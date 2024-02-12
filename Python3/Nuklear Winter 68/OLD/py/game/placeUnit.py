#!/usr/bin/python3
import sys
import re
import mariadb as sql

if len(sys.argv)!=3:
	print("placeUnit.py [unitID] [hexID]\n")
	exit()

scenario = sql.get_current_scenario()
unitID = sys.argv[1]
hexID = sys.argv[2]

hexX = 0
hexY = 0

if re.search("[A-Z][A-Z]", hexID):
	hexX = ord(hexID[0:1]) - ord('A') + 26
	hexY = int(hexID[2:]) - 1
else:
	hexX = ord(hexID[0:1]) - ord('A')
	hexY = int(hexID[1:]) - 1
	
stmt = "update gameData set j = JSON_REPLACE(j, '$.hexLoc[0]', " \
	+ str(hexX) + ", '$.hexLoc[1]'," + str(hexY) + ") where name = '" + unitID + "'" \
	+ " and scenario = '" + scenario + "'"
sql.sql(stmt)




