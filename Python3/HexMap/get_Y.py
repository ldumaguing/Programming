#!/usr/bin/python3
import sys

def get_Y(hexID):
	return int(hexID[2:]);

# ***** MAIN *****************************************************************************
hexID = sys.argv[1];

print(get_Y(hexID)+3.1);



