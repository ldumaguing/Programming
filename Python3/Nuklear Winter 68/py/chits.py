import sys
import re
import mariadb as my

def get_currLoc(subject, scenario):
	# returning a tuple
	stmt = "select JSON_VALUE(j, '$.hexLoc[0]'), JSON_VALUE(j, '$.hexLoc[1]') from gameData where name = '" + subject \
		+ "' and scenario = '" + scenario + "'"
	result = my.sql_fetchone(stmt)
	return (int(result[0]), int(result[1]))

def get_movement(subject, scenario, flip):
	# unit's current movement "money"
	fields = "JSON_VALUE(j, '$.frontData[10]')"
	if flip=="back":
		fields = "JSON_VALUE(j, '$.backData[10]')"
	conditions = "scenario = '" + scenario + "' and name = '" \
		+ subject + "'"
	table = "gameData"
	return sql.select_one(fields, conditions, table)[0]

def is_on_hill(subject, scenario):
	fields = "flags & (1<<1)"
	conditions = "hexID = '" + get_hexID(subject, scenario) + "'"
	table = "map"
	if sql.select_one(fields, conditions, table)==None:
		return False
	return True

def get_flip_status(subject, scenario):
	fields = "JSON_VALUE(j, '$.flip')"
	conditions = "scenario = '" + scenario + "' and name = '" \
		+ subject + "'"
	table = "gameData"
	stmt = "select JSON_VALUE(j, '$.flip') from gameData where name = '" + subject
	return sql.select_one(fields, conditions, table)[0]

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









