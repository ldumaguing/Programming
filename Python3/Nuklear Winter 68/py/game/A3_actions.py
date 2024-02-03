import sys
import re
import mariadb as sql

scenario = ""

# ****************************************************************************************
def action_embark(line):
	print("embark", line)
	unitA = line[0:line.find(" ")]
	print("unitA:", unitA)
	if sql.is_infantry(unitA)==0:
		return

	unitB = line[line.find(">")+2:].strip()
	print("unitB:", unitB)
	if sql.is_apc(unitB)==0:
		return

	j = "JSON_SET(j, '$.carrying', '" + unitA + "')"
	sql.update_j(j, unitB, scenario)
	j = "JSON_SET(j, '$.carried', '" + unitB + "')"
	sql.update_j(j, unitA, scenario)
	
# ****************************************************************************************
def action_disembark(line):
	print("disembark", line)
	unitA = line[0:line.find(" ")]
	if sql.is_infantry(unitA)==0:
		return
	
	fields = "JSON_VALUE(j, '$.carried')"
	conditions = "name = '" + unitA + "' and scenario = '" + scenario + "'"
	table = "gameData"
	unitB = sql.select_one(fields, conditions, table)[0]
	
	j = "JSON_REMOVE(j, '$.carried')"
	sql.update_j(j, unitA, scenario)
	j = "JSON_REMOVE(j, '$.carrying')"
	sql.update_j(j, unitB, scenario)

# ****************************************************************************************
def mode_Actions(f):
	print("Actions...")
	global scenario
	scenario = sql.get_current_scenario()

	while True:
		line = f.readline()
		if re.search("^\n$", line):
			break
		if re.search(">", line):
			action_embark(line)
		if re.search("_$", line):
			pass
			action_disembark(line)








