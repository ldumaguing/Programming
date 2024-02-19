#!/usr/bin/python3
import sys
import re
import mysql.connector

hill = (1 << 1)
water = (1 << 5)

mydb = mysql.connector.connect(
	host="localhost",
	user="ayeka",
	password="",
	database="NuklearWinter68"
)

def sql(stmt):
	mycursor = mydb.cursor()
	mycursor.execute(stmt)
	mydb.commit()

# ****************************************************************************************
def is_hex_exist(hexID):
	stmt = "select * from map where hexID = '" + hexID + "'"
	mycursor = mydb.cursor()
	mycursor.execute(stmt)
	X = mycursor.fetchone()
	if X is None:
		return 0
	else:
		return 1

# ****************************************************************************************
def define_hills(f):
	while True:
		line = f.readline()
		if re.search("^\n$", line):
			break
		line = line.strip()

		stmt = "insert into map (scenario, hexID, flags) values ('map0', '" \
			+ line + "', " + str(hill) + ")"
		sql(stmt)

# ****************************************************************************************
def define_water(f):
	while True:
		line = f.readline()
		if re.search("^\n$", line):
			break
		line = line.strip()
		
		stmt = "insert into map (scenario, hexID, flags) values ('map0', '" \
			+ line + "', " + str(water) + ")"
		sql(stmt)

# ****************************************************************************************
def define_river(f):
	while True:
		line = f.readline()
		if re.search("^\n$", line):
			break
		line = line.strip()
		hexID = line.split()[0].strip()
		blocking = int(line.split()[1])
		slot = int(line.split()[2])
		bridge = int(line.split()[3])
		river = (blocking<<14)
		river = river + (slot<<2)
		river = river + bridge
		stmt = ""
		if is_hex_exist(hexID):
			stmt = "update map set river = " + str(river) + " where scenario = " \
				+ "'map0' and hexID = '" + hexID + "'"
		else:
			stmt = "insert into map (scenario, hexID, river) values ('map0', '" \
			+ hexID + "', " + str(river) + ")"
		sql(stmt)

# ****************************************************************************************
def main():
	stmt = "delete from map"
	sql(stmt)

	f = open(sys.argv[1], "r")
	
	while True:
		line = f.readline()
		if not line:
			break
		if re.search(">>>>> HILLS", line):
			define_hills(f)
		if re.search(">>>>> WATER", line):
			define_water(f)
		if re.search(">>>>> RIVER", line):
			define_river(f)

	f.close()

# ****************************************************************************************
main()







