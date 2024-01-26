#!/usr/bin/python3
import sys
import re
import mysql.connector

scenario = ""
unit_id = 0

mydb = mysql.connector.connect(
	host="localhost",
	user="ayeka",
	password="",
	database="NuklearWinter68"
)

def sql_stmt(stmt):
	global mydb

	#mycursor = mydb.cursor()
	#mycursor.execute(stmt)
	#mydb.commit()

def mode_Board(f):
	global scenario

	scenario = sys.argv[1]
	scenario = scenario[scenario.find('/')+1:scenario.find('.')]
	mapWidth = 0
	mapHeight = 0
	HexZero_X = 0
	HexZero_Y = 0
	heigth = 0
	hexY_count = 0
	width = 0
	hexX_count = 0

	while True:
		line = f.readline()
		if re.search("^\n$", line):
			Ydisp = (height - HexZero_Y) / (hexY_count - 1)
			Xdisp = (width - HexZero_X) / (hexX_count - 1)
			sql_stmt("insert into gameData (scenario, name, val) values ('"
				+ scenario + "', " + "'X_multiplier', '"
				+ str(Xdisp) + "')")
			sql_stmt("insert into gameData (scenario, name, val) values ('"
				+ scenario + "', " + "'Y_multiplier', '"
				+ str(Ydisp) + "')")
			sql_stmt("insert into gameData (scenario, name, val) values ('"
				+ scenario + "', " + "'Y_adjust', '"
				+ str(Ydisp/2) + "')")
			break
		if re.search("Board na", line):
			mapName = line[0:line.find(' ')]
			sql_stmt("delete from gameData")
			sql_stmt("insert into gameData (scenario, name, val) values ('"
				+ scenario + "', " + "'map', '" + mapName + "')")
			html = """<img id="map" src="images/"""
			html += mapName
			html += """" hidden>"""
			stmt = "update gameData set html = '" + html + "' " + "where scenario = '" \
				+ scenario + "' and name = 'map'"
			sql_stmt(stmt)
		if re.search("pixel w", line):
			mapWidth = int(line[0:line.find(',')])
			mapHeight = int(line[line.find(',')+1:line.find(' ')])
		if re.search("HexZ", line):
			HexZero_X = int(line[0:line.find(',')])
			HexZero_Y = int(line[line.find(',')+1:line.find(' ')])
			sql_stmt("insert into gameData (scenario, name, val) values ('"
				+ scenario + "', " + "'HexZero', '"
				+ line[0:line.find(' ')] + "')")
		if re.search("chit w", line):
			sql_stmt("insert into gameData (scenario, name, val) values ('"
				+ scenario + "', " + "'chitDimention', '"
				+ line[0:line.find(' ')] + "')")
		if re.search("lowest h", line):
			height = int(line[0:line.find(',')])
			hexY_count = int(line[line.find(',')+1:line.find(' ')])
		if re.search("right-", line):
			width = int(line[0:line.find(',')])
			hexX_count = int(line[line.find(',')+1:line.find(' ')])

def mk_instance(formation, unit, count):
	global unit_id

	for x in range(count):
		unit_id += 1
		id = "u" + str(unit_id)
		print(formation + ";" + unit)
		print(id)

def gen_units(formation, units):
	print("..")
	print(formation)
	unit = ""
	count = 0
	
	while re.search(",", units):
		unit = units[units.find("x")+1:units.find(",")]
		count = int(units[0:units.find("x")])
		mk_instance(formation, unit, count)
		units = units[units.find(",")+2:]

	unit = units[units.find("x")+1:]
	count = int(units[0:units.find("x")])
	mk_instance(formation, unit, count)

def w_formation(faction, line):
	formation = faction + "," + line[0:line.find(" -")]
	units = line[line.find("-")+2:line.find(" /")]
	gen_units(formation, units)

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

		#print(line)

# ****************************************************************************************
f = open(sys.argv[1], "r")

while True:
	print(".")
	line = f.readline()
	if not line:
		break
	if re.search(">>>>> BOARD", line):
		mode_Board(f)
	if re.search(">>>>> ORDER", line):
		mode_OOB(f)


f.close()




