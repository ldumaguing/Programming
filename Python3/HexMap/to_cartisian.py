#!/usr/bin/python3
import sys
import math

cartisian_X = math.cos(math.radians(30)) * 2.0;

def get_X(hexID):
	return int(hexID[0:2]);
	
def get_Y(hexID):
	return int(hexID[2:]);

# ****************************************************************************************
def cartisian(hexID):
	X = get_X(hexID);
	Y = get_Y(hexID);

	real_X = cartisian_X * X;
	real_Y = Y*2;
	if X%2:
		real_Y = real_Y+1;

	print(real_X);
	print(real_Y);
	
	return "***";

# ***** MAIN *****************************************************************************
hexID = sys.argv[1];

print("***");
print(cartisian(hexID));




