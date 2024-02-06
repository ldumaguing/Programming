#!/usr/bin/python3
import sys
import math
import re
import mariadb as sql

scenario = ""

def conver2number(hexID):
	hex_X = 0
	hex_Y = 0
	askey = ord('A')
	X = re.search("[0-9]", hexID).start()
	if X<2:
		hex_X = ord(hexID[0:X]) - askey
	else:
		hex_X = ord(hexID[0]) - askey + 26

	hex_Y = hexID[X:]
	hex_Y = int(hex_Y) - 1
	
	return (str(hex_X).zfill(2) + str(hex_Y).zfill(2))

def get_X(hexID):
	return int(hexID[0:2]);
	
def get_Y(hexID):
	return int(hexID[2:]);

def evenXcol(X, Y, direction):
	match direction:
		case "A":
			Y = Y-1;
		case "B":
			X = X+1;
			Y = Y-1;
		case "C":
			X = X+1;
		case "D":
			Y = Y+1;
		case "E":
			X = X-1;
		case "F":
			X = X-1;
			Y = Y-1;

	return str(X).zfill(2) + str(Y).zfill(2);

def oddXcol(X, Y, direction):
	match direction:
		case "A":
			Y = Y-1;
		case "B":
			X = X+1;
		case "C":
			X = X+1;
			Y = Y+1;
		case "D":
			Y = Y+1;
		case "E":
			X = X-1;
			Y = Y+1;
		case "F":
			X = X-1;

	return str(X).zfill(2) + str(Y).zfill(2);

def stepDir(hexID, direction):
	X = get_X(hexID);
	Y = get_Y(hexID);
	if X%2:
		return oddXcol(X, Y, direction);
	else:
		return evenXcol(X, Y, direction);

def get_angle(hexID_a, hexID_b):
	Xa = get_X(hexID_a);
	Ya = get_Y(hexID_a);
	Xb = get_X(hexID_b);
	Yb = get_Y(hexID_b);
	
	cartisian_X = math.cos(math.radians(30)) * 2.0;

	real_Xa = cartisian_X * Xa;
	real_Ya = Ya*2;
	if Xa%2:
		real_Ya = real_Ya+1;

	real_Xb = cartisian_X * Xb;
	real_Yb = Yb*2;
	if Xb%2:
		real_Yb = real_Yb+1;

	X = real_Xb - real_Xa;
	Y = real_Yb - real_Ya;
	
	if X==0:
		if Y<0:
			return 90;
		return 270;
	
	angle = (math.atan(Y/X)*180.0)/math.pi;
	angle = round(angle, ndigits=2);
	if X<0 and Y<0:
		return 180 - angle;
	if X<0 and Y>=0:
		return abs(angle - 180);
	if X>=0 and Y>=0:
		return 360 - angle;

	return abs(angle);

def narrow_direction(direction, angle):
	
	return direction

# ****************************************************************************************
def put_dot(hexDot):
	# insert into gameData (scenario, name, j) values
	# ('01-Day8', 'yellowDot', '{"hexLoc": [15,15]}' );
	X = int(hexDot[0:2])
	Y = int(hexDot[2:])
	print("...", X, Y)
	stmt = "insert into gameData (scenario, name, j) values " \
		+ "('" + scenario + "', 'yellowDot', '{\"hexLoc\": [" + str(X) + "," \
		+ str(Y) + "]}' )"
	sql.sql(stmt)

def create_path(hexID_a, hexID_b):
	if re.search("^[A-Za-z]", hexID_a):
		hexID_a = conver2number(hexID_a)
	
	if re.search("^[A-Za-z]", hexID_b):
		hexID_b = conver2number(hexID_b)
	
	direction = "";

	while True:
		if hexID_a == hexID_b:
			return;

		angle = get_angle(hexID_a, hexID_b);
		if angle>0 and angle<=60:
			direction = narrow_direction("B", angle);
		if angle>60 and angle<=120:
			direction = narrow_direction("A", angle);
		if angle>120 and angle<=180:
			direction = narrow_direction("F", angle);
		if angle>180 and angle<=240:
			direction = narrow_direction("E", angle);
		if angle>240 and angle<=300:
			direction = narrow_direction("D", angle);
		if angle>300:
			direction = narrow_direction("C", angle);
		hexID_a = stepDir(hexID_a, direction);
		put_dot(hexID_a);

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

starting = "A1   "
points = "A1,D19,DD15"
scenario = sql.get_current_scenario()
create_paths(starting, points)



