#!/usr/bin/python3
import sys

def get_X(hexID):
	return int(hexID[0:2]);

# ***** MAIN *****************************************************************************
hexID = sys.argv[1];

print(get_X(hexID));



