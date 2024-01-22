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
</head>
<body onload="">
<img id="map" src="images/Map.jpg" hidden>
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
mycursor.execute("select * from v_unit_front_data order by formation, name")
myresult = mycursor.fetchall()

for x in myresult:
	imgString += img0
	imgString += img1 + x[18] + "\">"
	
	imgString += str(x[0]) + " - " + str(x[1]) + " - "
	
	val = x[2]
	if val > 0:
		imgString += str(x[2])
	else:
		imgString += "_"
	
	"""
	imgString += str(x[2]) + "<sup>" + str(x[4]) + "</sup>"
	imgString += str(x[2]) + "<sup>" + str(x[5]) + "</sup>"
	imgString += str(x[3]) + "<sup>" + str(x[4]) + "</sup>"
	imgString += str(x[3]) + "<sup>" + str(x[5]) + "</sup>"
	"""
	
	imgString += "<br>"
	imgString += "\n"












f = open("index.html", "w")
f.write(part1 + imgString + part2 + part3)
f.close()

