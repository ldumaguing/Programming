#!/usr/bin/python3
import mysql.connector
import sys

scenario = sys.argv[1]
scenario = scenario[scenario.find('/')+1:scenario.find('.')]

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
<body onload="">
"""

part2 = """
</body>
</html>

"""

units = ""

stmt = "select name, JSON_VALUE(j, '$.front'), JSON_VALUE(j, '$.back'), scenario" \
	+ " from gameData where name regexp ('^u') and" \
	+ " scenario = '" + scenario + "'" \
	+ " order by val"
cur = mydb.cursor()
cur.execute(stmt)
results = cur.fetchall()
for x in results:
	units += "<img src=\"" + x[1] + "\">"
	units += "<img src=\"" + x[2] + "\">"
	units += "<span class=\"whitefont\">ID: " + x[0] + "</span>"
	units += "\n<br>\n"

# ****************************************************************************************

f = open("cheatsheet_0.html", "w")
f.write(part1 + units + part2)
f.close()


