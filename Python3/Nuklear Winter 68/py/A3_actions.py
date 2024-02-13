import sys
import re
import mariadb as my
import chits as chit

scenario = ""

# ****************************************************************************************
def action_embark(line):
	print("embark", line)
	unitA = line[0:line.find(" ")]
	print("unitA:", unitA)
	if chit.is_infantry(unitA):
		return

	unitB = line[line.find(">")+2:].strip()
	print("unitB:", unitB)
	if chit.is_apc(unitB):
		return

	j = "JSON_SET(j, '$.carrying', '" + unitA + "')"
	stmt = "update gameData set j = " + j \
		+ " where name = '" + unitB + "' and scenario = '" + scenario + "'"
	my.sql_insert_update(stmt)
	j = "JSON_SET(j, '$.carried', '" + unitB + "')"
	stmt = "update gameData set j = " + j \
		+ " where name = '" + unitA + "' and scenario = '" + scenario + "'"
	my.sql_insert_update(stmt)
	
# ****************************************************************************************
def action_disembark(line):
	print("disembark", line)
	unitA = line[0:line.find(" ")]
	if my.is_infantry(unitA):
		return
	
	fields = "JSON_VALUE(j, '$.carried')"
	conditions = "name = '" + unitA + "' and scenario = '" + scenario + "'"
	table = "gameData"
	unitB = my.select_one(fields, conditions, table)[0]
	
	j = "JSON_REMOVE(j, '$.carried')"
	my.update_j(j, unitA, scenario)
	j = "JSON_REMOVE(j, '$.carrying')"
	my.update_j(j, unitB, scenario)

# ****************************************************************************************
def mode_Actions(f):
	print("Actions...")
	global scenario
	scenario = my.get_current_scenario()

	while True:
		line = f.readline()
		if re.search("^\n$", line):
			break
		if re.search(">", line):
			action_embark(line)
		if re.search("_$", line):
			pass
			action_disembark(line)








