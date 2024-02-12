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
def get_current_scenario():
	stmt = "select scenario from gameData where name = 'current scenario'"
	mycursor = mydb.cursor()
	mycursor.execute(stmt)
	return mycursor.fetchone()[0]

# ****************************************************************************************
def sql_fetchone(stmt):
	mycursor = mydb.cursor()
	mycursor.execute(stmt)
	return mycursor.fetchone()

# ****************************************************************************************
def sql_insert_update(stmt):
	mycursor = mydb.cursor()
	mycursor.execute(stmt)
	mydb.commit()

# ****************************************************************************************
def sql_fetchall(stmt):
	mycursor = mydb.cursor()
	mycursor.execute(stmt)
	return mycursor.fetchall()

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
