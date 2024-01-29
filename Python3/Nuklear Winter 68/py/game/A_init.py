#!/usr/bin/python3
import sys
import re
import mariadb as sql

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

		if re.search(" - ", line):
			w_formation(faction, line)
		else:
			wo_formation(faction, line)

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
		"""
		if re.search(">>>>> ORDER", line):
			mode_OOB(f)
		if re.search(">>>>> OBJEC", line):
			a1.mode_Objective(f, scenario)
		"""
	f.close()

# ****************************************************************************************
main()


