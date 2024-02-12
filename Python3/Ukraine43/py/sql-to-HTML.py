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
<title>Ukraine '43</title>
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
img0 = """<img id="i"""
img1 = """" src="images/"""



mycursor = mydb.cursor()
mycursor.execute(sys.argv[1])
myresult = mycursor.fetchall()

for x in myresult:
	imgString += img0 + str(x[0])
	imgString += img1 + x[1] + "\">"
	imgString += str(x[0]) + " - " + "<br>"
	imgString += "\n"












f = open("index.html", "w")
f.write(part1 + imgString + part2 + part3)
f.close()

