import sys
import re
import mariadb as sql

scenario = ""

def evenXcol(X, Y, direction):
	match direction:
		case "A":
			Y = Y-1
		case "B":
			X = X+1
			Y = Y-1
		case "C":
			X = X+1
		case "D":
			Y = Y+1
		case "E":
			X = X-1
		case "F":
			X = X-1
			Y = Y-1

	return (X, Y)

def oddXcol(X, Y, direction):
	match direction:
		case "A":
			Y = Y-1
		case "B":
			X = X+1
		case "C":
			X = X+1
			Y = Y+1
		case "D":
			Y = Y+1
		case "E":
			X = X-1
			Y = Y+1
		case "F":
			X = X-1

	return (X, Y)

def get_current_hexLoc(unitA):
	fields = "JSON_VALUE(j, '$.hexLoc[0]')"
	table = "gameData"
	conditions = "name = '" + unitA + "'"
	hexX = sql.select_one(fields, conditions, table)[0]
	fields = "JSON_VALUE(j, '$.hexLoc[1]')"
	hexY = sql.select_one(fields, conditions, table)[0]
	return (int(hexX), int(hexY))

def get_destination_hex(currHex, direction):
	X = currHex[0]
	Y = currHex[1]
	if X%2:
		return oddXcol(X, Y, direction);
	else:
		return evenXcol(X, Y, direction);
	
	return (X, Y)


# ****************************************************************************************
def move(f):
	global scenario
	scenario = sql.get_current_scenario()

	unitA = f[0:f.find(" ")]
	direction = f[f.find(">")+2:].strip()

	
	otherHex = get_destination_hex(get_current_hexLoc(unitA), direction)
	print(otherHex)

	
	
	
	
	
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

