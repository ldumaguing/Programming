import sys
import re
import mariadb as my

scenario = ""

# ****************************************************************************************
def mode_Placement(f):
	global scenario
	scenario = my.get_current_scenario()

	while True:
		line = f.readline()
		if re.search("^\n$", line):
			break
		unitID = line[0:line.find(" ")]
		hexID = line[line.find(" ")+1:]

		hexX = 0
		hexY = 0

		if re.search("[A-Z][A-Z]", hexID):
			hexX = ord(hexID[0:1]) - ord('A') + 26
			hexY = int(hexID[2:]) - 1
		else:
			hexX = ord(hexID[0:1]) - ord('A')
			hexY = int(hexID[1:]) - 1
	
		stmt = "update gameData set j = JSON_REPLACE(j, '$.hexLoc[0]', " \
			+ str(hexX) + ", '$.hexLoc[1]', " + str(hexY) + ") where name = '" + unitID + "'" \
			+ " and scenario = '" + scenario + "'"
		print(stmt)
		my.sql_insert_update(stmt)


