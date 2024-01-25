#!/usr/bin/python3
import sys
import re
import mysql.connector

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
		if re.search("^\.$", line):
			Ydisp = (height - HexZero_Y) / (hexY_count - 1)
			Xdisp = (width - HexZero_X) / (hexX_count - 1)
			print(Xdisp)
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
		print("..." + line)
		if re.search("Board na", line):
			mapName = line[0:line.find(' ')]
			sql_stmt("delete from gameData")
			sql_stmt("insert into gameData (scenario, name, val) values ('"
				+ scenario + "', " + "'map', '" + mapName + "')")
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

# ****************************************************************************************
f = open(sys.argv[1], "r")

while True:
	line = f.readline()
	if not line:
		break
	if re.search(">>>>> BOARD", line):
		mode_Board(f)




f.close()


