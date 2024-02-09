#!/usr/bin/python3
import sys
import math
import re
import mariadb as sql
import hexagon_v2 as hx

scenario = ""

# ****************************************************************************************
def put_dot(hexDot):
	# insert into gameData (scenario, name, j) values
	# ('01-Day8', 'yellowDot', '{"hexLoc": [15,15]}' );
	X = hexDot[0]
	Y = hexDot[1]
	print(">>>", X, Y)
	stmt = "insert into gameData (scenario, name, j) values " \
		+ "('" + scenario + "', 'yellowDot', '{\"hexLoc\": [" + str(X) + "," \
		+ str(Y) + "]}' )"
	sql.sql(stmt)

def create_path(hexID_a, hexID_b):
	hexLoc_a = hx.convert_id2loc(hexID_a)
	hexLoc_b = hx.convert_id2loc(hexID_b)
	path = hx.get_path(hexLoc_a, hexLoc_b)
	for x in path:
		print(x)
		put_dot(x)

def remove_redundance(pts):
	pts = re.split(",", pts)
	priv = ""
	newString = ""
	for x in pts:
		if priv==x:
			continue
		newString += x + ","
		priv = x
	return re.sub(",$", "", newString)

def create_paths(starting, pts):
	starting = re.sub("\s", "", starting)
	pts = starting + "," + re.sub("\s", "", pts)
	pts = remove_redundance(pts)
	pts = re.split(",", pts)
	print(pts, len(pts))
	for x in range(len(pts)-1):
		create_path(pts[x], pts[x+1])

# ***** MAIN *****************************************************************************
stmt = "delete from gameData where name = 'yellowDot' and html is null"
sql.sql(stmt)

starting = "A10   "
points = "A10,CC5"
scenario = sql.get_current_scenario()
create_paths(starting, points)



