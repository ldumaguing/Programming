#!/usr/bin/python3
import sys
import math

def get_X(hexID):
	return int(hexID[0:2]);
	
def get_Y(hexID):
	return int(hexID[2:]);

def cartisian_dist(hexID_a, hexID_b):
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

	a = real_Xa - real_Xb;
	a = a**2;

	b = real_Ya - real_Yb;
	b = b**2;

	c = math.sqrt(a+b);

	return c;

# ***** MAIN *****************************************************************************
hexID_a = sys.argv[1];
hexID_b = sys.argv[2];

print("*");
print(cartisian_dist(hexID_a, hexID_b));




