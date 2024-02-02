#!/usr/bin/python3
import mysql.connector
import sys

mydb = mysql.connector.connect(
  host="localhost",
  user="ayeka",
  password="",
  database="Panzer"
)

part1 = """<!DOCTYPE html>
<html>
<head>
<title>Panzer</title>
<!-- <meta http-equiv="refresh" content="3"> -->
</head>
<body onload="">
"""

part2 = "<script>"

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
	imgString += str(x[0]) + " - " + x[1] + "<br>"
	imgString += "\n"












f = open("index.html", "w")
f.write(part1 + imgString + part2 + part3)
f.close()

