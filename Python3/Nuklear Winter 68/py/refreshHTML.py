#!/usr/bin/python3
import sys
import re
import mariadb as my

scenario = my.get_current_scenario()

part1 = """<!DOCTYPE html>
<html>
<head>
<title>Nuklear Winter '68</title>
<!-- <meta http-equiv="refresh" content="3"> -->
<link rel="stylesheet" href="css/style.css">
</head>
<body onload="populateCanvas()">
<canvas id="canvas0" width="6372" height="4139"></canvas>
"""

part2 = """<script>
function populateCanvas() {
	let c = document.getElementById("canvas0");
	let ctx = c.getContext("2d");
"""

part3 = """}
</script>
</body>
</html>
"""

imgString = ""

conditions = "html regexp '<img' and scenario = '" + scenario + "'"
stmt = "select html from gameData where " + conditions
myresult = my.sql_fetchall(stmt)
for x in myresult:
	imgString += x[0] + "\n"

unitScript = "\n"
conditions = "name regexp '^[umo]'" \
	+ " and JSON_VALUE(j, '$.carried') is null" \
	+ " and scenario = '" + scenario + "'"
stmt = "select name from gameData where " + conditions
myresult = my.sql_fetchall(stmt)
for x in myresult:
	unitScript += "\tlet " + x[0] + " = document.getElementById(\"" + x[0]
	unitScript += "\");"
	unitScript += "\n"
unitScript += "\n\tctx.drawImage(map, 0, 0);\n\n"

# ****************************************************************************************
hexZero_X = 0
hexZero_Y = 0
chitDimention = 0
X_multiplier = 0.0
Y_multiplier = 0.0
Y_adjust = 0.0
conditions = "html is null and scenario = '" + scenario + "'"
stmt = "select name, val from gameData where " + conditions
myresult = my.sql_fetchall(stmt)
temp = ""
for x in myresult:
	if x[0]=='HexZero':
		temp = x[1]
		hexZero_X = int(temp[0:temp.find(",")])
		hexZero_Y = int(temp[temp.find(",")+1:])
	if x[0]=='chitDimention':
		chitDimention = int(x[1])
	if x[0]=='X_multiplier':
		X_multiplier = float(x[1])
	if x[0]=='Y_multiplier':
		Y_multiplier = float(x[1])
	if x[0]=='Y_adjust':
		Y_adjust = float(x[1])

fields = "JSON_VALUE(j, '$.hexLoc[0]'), JSON_VALUE(j, '$.hexLoc[1]'), name"
conditions = "JSON_VALUE(j, '$.hexLoc[0]')>=0 and scenario = '" + scenario + "'" \
	+ " and JSON_VALUE(j, '$.carried') is null"
stmt = "select " + fields + " from gameData where " + conditions
myresult = my.sql_fetchall(stmt)
unitPlacement = ""
for x in myresult:
	float_X = float(x[0])
	float_Y = float(x[1])
	pixel_X = (float_X*X_multiplier)+hexZero_X
	pixel_X -= chitDimention/2.0
	pixel_Y = (float_Y*Y_multiplier)+hexZero_Y + ((float_X%2)*Y_adjust)
	pixel_Y -= chitDimention/2.0

	unitPlacement += "\tctx.drawImage(" + x[2] + ", " + str(pixel_X) + ", " \
		+ str(pixel_Y) + ");\n"

# ****************************************************************************************
f = open("index.html", "w")
f.write(part1 + imgString + part2 + unitScript + unitPlacement + part3)
f.close()


