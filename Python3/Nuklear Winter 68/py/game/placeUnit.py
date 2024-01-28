#!/usr/bin/python3
import sys
import re
import mysql.connector

if len(sys.argv)!=4:
	print("placeUnit.py [scenario] [unitID] [hexID]\n")
	exit()

scenario = sys.argv[1]
scenario = scenario[scenario.find('/')+1:scenario.find('.')]
unitID = sys.argv[2]
hexID = sys.argv[3]

hexX = 0
hexY = 0

if re.search("[A-Z][A-Z]", hexID):
	hexX = ord(hexID[0:1]) - ord('A') + 26
	hexY = int(hexID[2:])
else:
	hexX = ord(hexID[0:1]) - ord('A')
	hexY = int(hexID[1:])
	
#print(unitID, hexX, hexY)

stmt = "update gameData set j = JSON_REPLACE(j, '$.hexLoc[0]', " \
	+ str(hexX) + ", '$.hexLoc[1]'," + str(hexY) + ") where name = '" + unitID + "'"

#print(stmt)

mydb = mysql.connector.connect(
  host="localhost",
  user="ayeka",
  password="",
  database="NuklearWinter68"
)

mycursor = mydb.cursor()
mycursor.execute(stmt)
mydb.commit()






