import sys
import re
import mariadb as sql

scenario = ""

def get_current_hexLoc(unitA):
	fields = "JSON_VALUE(j, '$.hexLoc[0]')"
	table = "gameData"
	conditions = "name = '" + unitA + "'"
	hexX = sql.select_one(fields, conditions, table)[0]
	fields = "JSON_VALUE(j, '$.hexLoc[1]')"
	hexY = sql.select_one(fields, conditions, table)[0]
	return (int(hexX), int(hexY))

def get_destination_hex():


# ****************************************************************************************
def move(f):
	global scenario
	scenario = sql.get_current_scenario()

	unitA = f[0:f.find(" ")]
	direction = f[f.find(">")+2:].strip()

	X = get_current_hexLoc(unitA)
	if direction=='A':
		print("A")
	X = get_current_hexLoc(unitA)
	if direction=='B':
		print("B")
	X = get_current_hexLoc(unitA)
	if direction=='C':
		print("C")
	X = get_current_hexLoc(unitA)
	if direction=='D':
		print("D")
	X = get_current_hexLoc(unitA)
	if direction=='E':
		print("E")


	print(X)

