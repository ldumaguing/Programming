#!/usr/bin/python3
import sys
import math

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

# ****************************************************************************************
def hex_dist(hexID_a, hexID_b):
	direction = "";
	count = 0;

	while True:
		if hexID_a == hexID_b:
			return count;

		angle = get_angle(hexID_a, hexID_b);
		if angle>0 and angle<=60:
			direction = "B";
		if angle>60 and angle<=120:
			direction = "A";
		if angle>120 and angle<=180:
			direction = "F";
		if angle>180 and angle<=240:
			direction = "E";
		if angle>240 and angle<=300:
			direction = "D";
		if angle>300:
			direction = "C";
		hexID_a = stepDir(hexID_a, direction);
		count = count+1;

# ***** MAIN *****************************************************************************
hexID_a = sys.argv[1];
hexID_b = sys.argv[2];

print(hex_dist(hexID_a, hexID_b));



