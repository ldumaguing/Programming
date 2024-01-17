#!/usr/bin/python3
import sys
import math

def get_X(hexID):
	return int(hexID[0:2]);
	
def get_Y(hexID):
	return int(hexID[2:]);

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
	angle = round(angle, ndigits=4);
	if X<0 and Y<0:
		return 180 - angle;
	if X<0 and Y>=0:
		return abs(angle - 180);
	if X>=0 and Y>=0:
		return 360 - angle;

	return abs(angle);

# ***** MAIN *****************************************************************************
hexID_a = sys.argv[1];
hexID_b = sys.argv[2];

print("*");
print(get_angle(hexID_a, hexID_b));




