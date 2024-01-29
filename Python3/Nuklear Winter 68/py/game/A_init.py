#!/usr/bin/python3
import sys
import re
import mariadb as sql

unit_id = 0

# ******************************************************************************
def mode_Board(f):
	mapWidth = 0
	mapHeight = 0
	HexZero_X = 0
	HexZero_Y = 0
	heigth = 0
	hexY_count = 0
	width = 0
	hexX_count = 0
	scenario = sql.get_current_scenario()
	fields = "scenario, name, val"

	while True:
		line = f.readline()
		if re.search("^\n$", line):
			Ydisp = (height - HexZero_Y) / (hexY_count - 1)
			Xdisp = (width - HexZero_X) / (hexX_count - 1)
			values = "'" + scenario + "', " \
				+ "'X_multiplier', '" + str(Xdisp) + "'"
			sql.insert(fields, values)
			values = "'" + scenario + "', " \
				+ "'Y_multiplier', '" + str(Ydisp) + "'"
			sql.insert(fields, values)
			values = "'" + scenario + "', " \
				+ "'Y_adjust', '" + str(Ydisp/2) + "'"
			sql.insert(fields, values)
			break
		if re.search("Board na", line):
			mapName = line[0:line.find(' ')]
			values = "'" + scenario + "', " \
				+ "'map', '" + mapName + "'"
			sql.insert(fields, values)
		if re.search("pixel w", line):
			mapWidth = int(line[0:line.find(',')])
			mapHeight = int(line[line.find(',')+1:line.find(' ')])
		if re.search("HexZ", line):
			HexZero_X = int(line[0:line.find(',')])
			HexZero_Y = int(line[line.find(',')+1:line.find(' ')])
			values = "'" + scenario + "', " \
				+ "'HexZero', '" + line[0:line.find(' ')] + "'"
			sql.insert(fields, values)
		if re.search("chit w", line):
			values = "'" + scenario + "', " \
				+ "'chitDimention', '" + line[0:line.find(' ')] + "'"
			sql.insert(fields, values)
		if re.search("lowest h", line):
			height = int(line[0:line.find(',')])
			hexY_count = int(line[line.find(',')+1:line.find(' ')])
		if re.search("right-", line):
			width = int(line[0:line.find(',')])
			hexX_count = int(line[line.find(',')+1:line.find(' ')])

# ******************************************************************************
def save_unit(scenario, unit, count, faction, formation):
	global unit_id

	fields = "scenario, name, val, j"

	for x in range(count):
		unit_id += 1
		id = "u" + str(unit_id)
		values = "'" + scenario + "', '" + id + "', '" \
			+ faction + "," + formation + ";" + unit + "'" + ", '{}'"
		sql.insert(fields, values)

def save_units(scenario, units, faction, formation):
	unit = ""
	count = 0
	while re.search(",", units):
		unit = units[units.find("x")+1:units.find(",")]
		count = int(units[0:units.find("x")])
		save_unit(scenario, unit, count, faction, formation)
		units = units[units.find(",")+2:]

	unit = units[units.find("x")+1:]
	count = int(units[0:units.find("x")])
	save_unit(scenario, unit, count, faction, formation)

def formation(faction, line):
	if line.find("AMs")<=0:
		return

	scenario = sql.get_current_scenario()

	if line.find(" -")>0:
		formation = line[0:line.find(" -")]
		units = line[line.find("-")+2:line.find(" /")]
	else:
		formation = faction
		units = line[0:line.find(" /")]

	fields = "name, val, scenario"
	save_units(scenario, units, faction, formation)

	am = line[line.find("/ ")+2:line.find("AMs")]
	am = "AM:" + formation + ";" + am
	values = "'" + am + "', '" \
		+ line[line.find("/ ")+2:line.find("AMs")] + "', '" \
		+ scenario + "'"
	sql.insert(fields, values)

def mode_OOB(f):
	faction = ""

	while True:
		line = f.readline()
		if re.search("Event m", line):
			break
		if re.search("REICH", line):
			faction = "RITTES REICH"
		if re.search("NATO", line):
			faction = "NATO"
		if re.search("BLACK", line):
			faction = "Black Hand"

		formation(faction, line)

# ****************************************************************************************
def main():
	f = open(sys.argv[1], "r")

	scenario = sys.argv[1]
	scenario = scenario[scenario.find('/')+1:scenario.find('.')]
	sql.new_scenario(scenario)

	while True:
		line = f.readline()
		if not line:
			break
		if re.search(">>>>> BOARD", line):
			mode_Board(f)
		if re.search(">>>>> ORDER", line):
			mode_OOB(f)
		"""
		if re.search(">>>>> OBJEC", line):
			a1.mode_Objective(f, scenario)
		"""
	f.close()

# ****************************************************************************************
def unit_setup():
	fields = "name, val"
	conditions = "name regexp '^u'"
	results = sql.select(fields, conditions)
	for x in results:
		uID = x[0]
		val = x[1]
		formation = val[val.find(",")+1:val.find(";")]
		unit = val[val.find(";")+1:]
		print(uID, val, formation, unit)
		fields = "front, back"
		conditions = "name = '" + unit + "' and formation = '" + formation + "'"
		res0 = sql.select_v_units(fields, conditions)
		for y in res0:
			j = "JSON_INSERT(j,'$.front', 'images/" + y[0] + "',"
			j += " '$.back', 'images/" + y[1] + "',"
			j += " '$.flip', 'front',"
			j += " '$.hexLoc', JSON_ARRAY(-1,-1),"
			j += " '$.pixLoc', JSON_ARRAY(0,0),"
			j += " '$.identity', JSON_ARRAY("
			j += "'" + formation + "'" + ", '" + unit + "')"
			j += ")"
			sql.update_j(j, uID)
			h = "<img id=\"" + uID + "\" src=\"images/" + y[0] + "\" hidden>"
			sql.update_html(h, uID)

# ****************************************************************************************
main()
unit_setup()




