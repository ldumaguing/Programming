import sys
import re
import mysql.connector

scenario = ""

mydb = mysql.connector.connect(
	host="localhost",
	user="ayeka",
	password="",
	database="NuklearWinter68"
)

def save_objective(ob):
	hexX = 0
	hexY = 0
	
	if re.search("[A-Z][A-Z]", ob):
		hexX = ord(ob[0:1]) - ord('A') + 26
		hexY = int(ob[2:]) - 1
	else:
		hexX = ord(ob[0:1]) - ord('A')
		hexY = int(ob[1:]) - 1
	
	ob = ob.strip()
	stmt = "insert into gameData (scenario,name,val,html,j) values ('" \
		+ scenario + "', 'u" + ob + "', '" + ob + "', '" \
		+ "<img id=\"u" + ob + "\" src=\"images/Objective.png\" hidden>', " \
		+ "'{\"hexLoc\": [" + str(hexX) + ", " + str(hexY) + "]}')"

	mycursor = mydb.cursor()
	mycursor.execute(stmt)
	mydb.commit()

def place_objectives(ob):
	while re.search(",", ob):
		save_objective(ob[0:ob.find(",")])
		ob = ob[ob.find(",")+1:]
	save_objective(ob)

def mode_Objective(f, scn):
	global scenario
	scenario = scn

	while True:
		line = f.readline()
		if re.search("^\n$", line):
			break
		print(line)
		if re.search("placeObjectives", line):
			place_objectives(line[line.find(" ")+1:])







