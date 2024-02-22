import sys
import re
import mariadb as my
import hexagon as hx

def get_currLoc(subject, scenario):
	# returning a tuple
	stmt = "select JSON_VALUE(j, '$.hexLoc[0]'), JSON_VALUE(j, '$.hexLoc[1]') from gameData where name = '" + subject \
		+ "' and scenario = '" + scenario + "'"
	result = my.sql_fetchone(stmt)
	return (int(result[0]), int(result[1]))

def get_currHexID(subject, scenario):
	#currLoc = get_currLoc(subject, scenario)
	#print("currLoc:", currLoc)
	#print("hexID", hx.convert_loc2id(currLoc))
	#return "AA10"
	return hx.convert_loc2id(get_currLoc(subject, scenario))

def get_curr_movement(subject, scenario):
	# select json_value(j, '$.currMove') from gameData where scenario = '01-day8' and name = 'u1';
	stmt = "select json_value(j, '$.currMove') from gameData where scenario = '" \
		+ scenario + "' and name = '" + subject + "'"
	return int(my.sql_fetchone(stmt)[0])




'''
def get_movement(subject, scenario, flip):
	# unit's current movement "money"
	fields = "JSON_VALUE(j, '$.frontData[10]')"
	if flip=="back":
		fields = "JSON_VALUE(j, '$.backData[10]')"
	conditions = "scenario = '" + scenario + "' and name = '" \
		+ subject + "'"
	table = "gameData"
	stmt = "select " + fields + " from gameData where " + conditions
	#print("stmt:     ", stmt)
	return my.sql_fetchone(stmt)[0]
'''

def is_on_riverHex(subject, scenario):
	# select JSON_VALUE(j, '$.riverHexPlace') from gameData
	# where name regexp '^u' and scenario = '01-Day8'
	# and name = 'u1'
	stmt = "select JSON_VALUE(j, '$.riverHexPlace') from gameData" \
		+ " where name regexp '^u' and scenario = '" + scenario + "'" \
		+ " and name = '" + subject + "'"
	X = int(my.sql_fetchone(stmt)[0])
	if X>0:
		return True
	return False

def is_on_hill(subject, scenario):
	fields = "flags & (1<<1)"
	conditions = "hexID = '" + get_currHexID(subject, scenario) + "'"
	table = "map"
	stmt = "select " + fields + " from map where " + conditions
	if my.sql_fetchone(stmt)==None:
		return False
	return True

def get_flip_status(subject, scenario):
	#fields = "JSON_VALUE(j, '$.flip')"
	#conditions = "scenario = '" + scenario + "' and name = '" \
	#	+ subject + "'"
	#table = "gameData"
	stmt = "select JSON_VALUE(j, '$.flip') from gameData where name = '" + subject \
		+ "' and scenario = '" + scenario + "'"
	return my.sql_fetchone(stmt)[0]

def is_infantry(unit, scenario):
	stmt = "select JSON_VALUE(j, '$.frontData[12]') from gameData where name = '" \
		+ unit + "' and scenario = '" + scenario + "'"
	if int(my.sql_fetchone(stmt)[0]) & 16:
		return True
	return False

def is_apc(unit, scenario):
	stmt = "select JSON_VALUE(j, '$.frontData[12]') from gameData where name = '" \
		+ unit + "' and scenario = '" + scenario + "'"
	if int(my.sql_fetchone(stmt)[0]) & 2:
		return True
	return False









