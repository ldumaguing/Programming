import sys
import re
import mysql.connector

mydb = mysql.connector.connect(
	host="localhost",
	user="ayeka",
	password="",
	database="NuklearWinter68"
)

# ****************************************************************************************
def insert(fields, values):
	stmt = "insert into gameData (" + fields + ") values (" \
		+ values + ")"
	mycursor = mydb.cursor()
	mycursor.execute(stmt)
	mydb.commit()

def select_one(fields, conditions, table):
	stmt = "select " + fields + " from " + table + " where " + conditions
	mycursor = mydb.cursor()
	mycursor.execute(stmt)
	return mycursor.fetchone()

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

def is_infantry(unit):
	scenario = get_current_scenario()
	stmt = "select JSON_VALUE(j, '$.frontData[12]') from gameData where name = '" \
		+ unit + "' and scenario = '" + scenario + "'"
	mycursor = mydb.cursor()
	mycursor.execute(stmt)

	return int(mycursor.fetchone()[0]) & 16
	
def is_apc(unit):
	scenario = get_current_scenario()
	stmt = "select JSON_VALUE(j, '$.frontData[12]') from gameData where name = '" \
		+ unit + "' and scenario = '" + scenario + "'"

	mycursor = mydb.cursor()
	mycursor.execute(stmt)
	
	return int(mycursor.fetchone()[0]) & 2

def get_hexLoc(unitA):
	fields = "JSON_VALUE(j, '$.hexLoc[0]')"
	table = "gameData"
	conditions = "name = '" + unitA + "'"
	hexX = select_one(fields, conditions, table)[0]
	fields = "JSON_VALUE(j, '$.hexLoc[1]')"
	hexY = select_one(fields, conditions, table)[0]
	return (int(hexX), int(hexY))

