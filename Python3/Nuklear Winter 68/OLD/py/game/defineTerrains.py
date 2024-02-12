#!/usr/bin/python3
import sys
import re
import mysql.connector

flag = (1 << 1)

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
def mode_hills(f):
	while True:
		line = f.readline()
		if re.search("^\n$", line):
			break
		line = line.strip()

		stmt = "insert into map (scenario, hexID, flags) values ('map0', '" \
			+ line + "', " + str(flag) + ")"
		sql(stmt)

def save_road(hexID, edges):
	roads = 0
	for x in edges:
		num_shift = ord(x) - ord('A')
		val = 1 << num_shift
		roads |= val
	
	roads = roads << 7
	stmt = ""
	if is_hex_exist(hexID):
		stmt = "update map set flags = flags | " + str(roads) + " where hexID = '" \
			+ hexID + "'"
	else:
		stmt = "insert into map (flags, hexID, scenario) values (flags | " + str(roads) \
			+ ", '" + hexID + "', 'map0'" + ")"

	mycursor = mydb.cursor()
	mycursor.execute(stmt)
	mydb.commit()

# ****************************************************************************************
def mode_roads(f):
	while True:
		line = f.readline()
		if re.search("^\n$", line):
			break
		line = line.strip()
		hexID = line[0:line.find(" ")].strip()
		edges = line[line.find(" "):].strip()
		save_road(hexID, edges)

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
			mode_hills(f)
		if re.search(">>>>> ROADS", line):
			mode_roads(f)
	f.close()

# ****************************************************************************************
main()







