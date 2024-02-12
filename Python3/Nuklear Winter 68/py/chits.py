import sys
import re
import mariadb as my

def is_infantry(unit):
	scenario = my.get_current_scenario()
	stmt = "select JSON_VALUE(j, '$.frontData[12]') from gameData where name = '" \
		+ unit + "' and scenario = '" + scenario + "'"
	if int(my.sql_fetchone(stmt)[0]) & 16:
		return True
	return False

def is_apc(unit):
	scenario = my.get_current_scenario()
	stmt = "select JSON_VALUE(j, '$.frontData[12]') from gameData where name = '" \
		+ unit + "' and scenario = '" + scenario + "'"
	if int(my.sql_fetchone(stmt)[0]) & 2:
		return True
	return False









