#!/usr/bin/python3
import sys
import re
import mysql.connector
import a1_init

scenario = ""
faction = ""
formation = ""
unit_id = 0

mydb = mysql.connector.connect(
	host="localhost",
	user="ayeka",
	password="",
	database="NuklearWinter68"
)

def sql_stmt(stmt):
	global mydb

	mycursor = mydb.cursor()
	mycursor.execute(stmt)
	mydb.commit()

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

def mk_instance(unit, count):
	global unit_id
	stmt = ""

	for x in range(count):
		unit_id += 1
		id = "u" + str(unit_id)
		stmt = """insert into gameData(scenario, name, val, j) values ('"""
		stmt += scenario + "', '" + id + "', '"
		stmt += faction + "," + formation + ";" + unit + "', '{}')"
		sql_stmt(stmt)

def gen_units(units):
	unit = ""
	count = 0
	
	while re.search(",", units):
		unit = units[units.find("x")+1:units.find(",")]
		count = int(units[0:units.find("x")])
		mk_instance(unit, count)
		units = units[units.find(",")+2:]

	unit = units[units.find("x")+1:]
	count = int(units[0:units.find("x")])
	mk_instance(unit, count)

def wo_formation(line):
	global formation
	if line.find("AMs")<=0:
		return

	formation = faction
	units = line[0:line.find(" /")]
	gen_units(units)

	am = line[line.find("/ ")+2:line.find("AMs")]
	am = "AM:" + formation + ";" + am
	stmt = "insert into gameData(name, val, scenario) values ('" + am + "', '" \
		+ line[line.find("/ ")+2:line.find("AMs")] + "', '" \
		+ scenario + "')"
	sql_stmt(stmt)

def w_formation(line):
	global formation

	formation = line[0:line.find(" -")]
	units = line[line.find("-")+2:line.find(" /")]
	gen_units(units)

	am = line[line.find("/ ")+2:line.find("AMs")]
	am = "AM:" + formation + ";" + am
	stmt = "insert into gameData(name, val, scenario) values ('" + am + "', '" \
		+ line[line.find("/ ")+2:line.find("AMs")] + "', '" \
		+ scenario + "')"
	sql_stmt(stmt)

def mode_OOB(f):
	global faction

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
			w_formation(line)
		else:
			wo_formation(line)

# ****************************************************************************************
def select_stmt(stmt):
	mycursor = mydb.cursor()
	mycursor.execute(stmt)
	return mycursor.fetchall()

def unit_setup():
	stmt = "select name, val from gameData where name regexp '^u'"
	results = select_stmt(stmt)
	for x in results:
		uID = x[0]
		val = x[1]
		formation = val[val.find(",")+1:val.find(";")]
		unit = val[val.find(";")+1:]
		stmt = "select front, back from v_units where name = '" + unit + "'"
		stmt += " and formation = '" + formation + "'"
		res0 = select_stmt(stmt)
		for y in res0:
			j = "JSON_INSERT(j,'$.front', 'images/" + y[0] + "',"
			j += " '$.back', 'images/" + y[1] + "',"
			j += " '$.flip', 'front',"
			j += " '$.hexLoc', JSON_ARRAY(-1,-1),"
			j += " '$.pixLoc', JSON_ARRAY(0,0),"
			j += " '$.identity', JSON_ARRAY("
			j += "'" + formation + "'" + ", '" + unit + "')"
			j += ")"
			j = "update gameData set j = " + j
			j += " where name = '" + uID + "'"
			sql_stmt(j)
			h = "<img id=\"" + uID + "\" src=\"images/" + y[0] + "\" hidden>"
			h = "update gameData set html = '" + h + "'"
			h += " where name = '" + uID + "'"
			sql_stmt(h)
	
	# ********** front data
	stmt = "select * from gameData where scenario = '" + scenario + "'" \
		+ " and name regexp '^u'"
	results = select_stmt(stmt)
	for x in results:
		unitID = x[1]
		unit = x[2]
		unit = unit[unit.find(';')+1:]

		stmt = "select * from unitData where side = 'front'" \
			+ " and name = '" + unit + "'"
		res0 = select_stmt(stmt)
		for y in res0:
			unit = y[0]
			j = "update gameData set j = JSON_INSERT(j, '$.frontData', JSON_ARRAY(" \
				+ str(y[2]) + "," + str(y[3]) + "," + str(y[4]) + "," \
				+ str(y[5]) + "," + str(y[6]) + "," + str(y[7]) + "," \
				+ str(y[8]) + "," + str(y[9]) + "," + str(y[10]) + "," \
				+ str(y[11]) + "," + str(y[12]) + "," + str(y[13]) + "," \
				+ str(y[14]) + "," + str(y[15]) + "," + str(y[16]) + "," \
				+ str(y[17]) \
				+ ")) where val regexp '" + unit + "'"
			sql_stmt(j)

	# ********** back data
	stmt = "select * from gameData where scenario = '" + scenario + "'" \
		+ " and name regexp '^u'"
	results = select_stmt(stmt)
	for x in results:
		unitID = x[1]
		unit = x[2]
		unit = unit[unit.find(';')+1:]

		stmt = "select * from unitData where side = 'back'" \
			+ " and name = '" + unit + "'"
		res0 = select_stmt(stmt)
		for y in res0:
			unit = y[0]
			j = "update gameData set j = JSON_INSERT(j, '$.backData', JSON_ARRAY(" \
				+ str(y[2]) + "," + str(y[3]) + "," + str(y[4]) + "," \
				+ str(y[5]) + "," + str(y[6]) + "," + str(y[7]) + "," \
				+ str(y[8]) + "," + str(y[9]) + "," + str(y[10]) + "," \
				+ str(y[11]) + "," + str(y[12]) + "," + str(y[13]) + "," \
				+ str(y[14]) + "," + str(y[15]) + "," + str(y[16]) + "," \
				+ str(y[17]) \
				+ ")) where val regexp '" + unit + "'"
			sql_stmt(j)

# ****************************************************************************************
f = open(sys.argv[1], "r")

while True:
	line = f.readline()
	if not line:
		break
	if re.search(">>>>> BOARD", line):
		mode_Board(f)
	if re.search(">>>>> ORDER", line):
		mode_OOB(f)

f.close()

# ===========================================
unit_setup()










