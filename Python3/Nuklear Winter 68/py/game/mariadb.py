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

# ****************************************************************************************
def insert(fields, values):
	stmt = "insert into gameData (" + fields + ") values (" \
		+ values + ")"
	mycursor = mydb.cursor()
	mycursor.execute(stmt)
	mydb.commit()
	
def select(fields, conditions, table):
	stmt = "select " + fields + " from " + table + " where " + conditions
	mycursor = mydb.cursor()
	mycursor.execute(stmt)
	return mycursor.fetchall()

def get_results(stmt):
	mycursor = mydb.cursor()
	mycursor.execute(stmt)
	return mycursor.fetchall()

def sql(stmt):
	mycursor = mydb.cursor()
	mycursor.execute(stmt)
	mydb.commit()
	
def update_j(j, uID, scenario):
	stmt = "update gameData set j = " + j \
		+ " where name = '" + uID + "' and scenario = '" + scenario + "'"
	mycursor = mydb.cursor()
	mycursor.execute(stmt)
	mydb.commit()

def update_html(h, uID, scenario):
	stmt = "update gameData set html = '" + h \
		+ "' where name = '" + uID + "' and scenario = '" + scenario + "'"
	mycursor = mydb.cursor()
	mycursor.execute(stmt)
	mydb.commit()

# ****************************************************************************************
def new_scenario(scenario):
	stmt = "select count(*) from gameData"
	mycursor = mydb.cursor()
	mycursor.execute(stmt)
	if mycursor.fetchone()[0]==0:
		print("blank")
		stmt = "insert into gameData (scenario, name) values ('" + scenario + "', '" \
			+ "current scenario')"
		mycursor.execute(stmt)
		mydb.commit()
	else:
		stmt = "update gameData set scenario = '" + scenario + "' where" \
			+ " name = 'current scenario'"
		mycursor.execute(stmt)
		stmt = "delete from gameData where scenario = '" + scenario + "' and name != " \
			+ "'current scenario'"
		mycursor.execute(stmt)
		mydb.commit()

def get_current_scenario():
	stmt = "select scenario from gameData where name = 'current scenario'"
	mycursor = mydb.cursor()
	mycursor.execute(stmt)
	results = mycursor.fetchall()
	for x in results:
		return x[0]

