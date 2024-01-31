import sys
import re
import mariadb as sql

scenario = ""

# ****************************************************************************************
def action_embark(line):
	unitA = line[0:line.find(" ")]
	if sql.is_infantry(unitA)==0:
		return
	unitB = line[line.find(">")+2:].strip()
	if sql.is_apc(unitB)==0:
		return

	j = "JSON_SET(j, '$.carrying', '" + unitA + "')"
	sql.update_j(j, unitB, scenario)
	j = "JSON_SET(j, '$.carried', '" + unitB + "')"
	sql.update_j(j, unitA, scenario)

# ****************************************************************************************
def mode_Actions(f):
	print("Actions...")
	global scenario
	scenario = sql.get_current_scenario()

	while True:
		line = f.readline()
		if re.search("^\n$", line):
			break
		if line.find(" > "):
			action_embark(line)
