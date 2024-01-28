#!/usr/bin/python3
import mysql.connector
import sys

mydb = mysql.connector.connect(
  host="localhost",
  user="ayeka",
  password="",
  database="NuklearWinter68"
)

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
</html>"""

imgString = ""

mycursor = mydb.cursor()
mycursor.execute("select html from gameData where html regexp '<img'")
myresult = mycursor.fetchall()

for x in myresult:
	imgString += x[0] + "\n"

f = open("index_A.html", "w")
f.write(part1 + imgString + part2)
f.close()

f = open("index_B.html", "w")
f.write(part3)
f.close()
