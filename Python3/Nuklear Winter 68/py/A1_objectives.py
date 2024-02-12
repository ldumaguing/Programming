import sys
import re
import mariadb as sql

scenario = ""

def place_objective(ob):
	hexX = 0
	hexY = 0
	
	if re.search("[A-Z][A-Z]", ob):
		hexX = ord(ob[0:1]) - ord('A') + 26
		hexY = int(ob[2:]) - 1
	else:
		hexX = ord(ob[0:1]) - ord('A')
		hexY = int(ob[1:]) - 1

	ob = ob.strip()
	fields = "scenario,name,val,html,j"
	values = "'" + scenario + "', 'o" + ob + "', '" + ob + "', '" \
		+ "<img id=\"o" + ob + "\" src=\"images/Red control.png\" hidden>', " \
		+ "'{\"hexLoc\": [" + str(hexX) + ", " + str(hexY) + "]}'"
	stmt = "insert into gameData(" + fields + ") values (" + values + ")"
	sql.sql_insert_update(stmt)

def place_objectives(ob):
	while re.search(",", ob):
		place_objective(ob[0:ob.find(",")])
		ob = ob[ob.find(",")+1:]
	place_objective(ob)

def mode_Objective(f):
	global scenario
	scenario = sql.get_current_scenario()

	while True:
		line = f.readline()
		if re.search("^\n$", line):
			break
		print(line)
		if re.search("placeRedControl", line):
			place_objectives(line[line.find(" ")+1:])







