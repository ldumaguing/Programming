#!/usr/bin/python3
import mysql.connector
import sys

mydb = mysql.connector.connect(
  host="localhost",
  user="ayeka",
  password="",
  database="Ukraine43"
)

part1 = """<!DOCTYPE html>
<html>
<head>
<title>Nuklear Winter '68</title>
<!-- <meta http-equiv="refresh" content="3"> -->
</head>
<body onload="">
"""

part2 = """<canvas id="canvas0" width="6372" height="4139"></canvas>
<script>"""

part3 = """</script>
</body>
</html>"""

imgString = ""
img0 = """<img"""
img1 = """ src="images/"""



mycursor = mydb.cursor()
mycursor.execute("select front_f, rear_f, rem_f from units")
myresult = mycursor.fetchall()

for x in myresult:
	imgString += img0
	imgString += img1 + x[0] + "\">"

	imgString += img0
	imgString += img1 + x[1] + "\">"

	imgString += img0
	imgString += img1 + x[2] + "\">"

	# imgString += str(x[0]) + " - " + str(x[2]) + "<br>"
	imgString += "<br>"
	imgString += "\n"












f = open("index.html", "w")
f.write(part1 + imgString + part2 + part3)
f.close()
