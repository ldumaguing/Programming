#!/usr/bin/python3
import sys
	
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
			X = X-1;ls

	return str(X).zfill(2) + str(Y).zfill(2);

# ****************************************************************************************
def stepDir(hexID, direction):
	X = get_X(hexID);
	Y = get_Y(hexID);
	if X%2:
		return oddXcol(X, Y, direction);
	else:
		return evenXcol(X, Y, direction);

# ***** MAIN *****************************************************************************
hexID = sys.argv[1];
direction = sys.argv[2];

print("***");
print(stepDir(hexID, direction));




