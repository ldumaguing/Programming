#!/usr/bin/python3
import sys
import sqlite_wrapper as sql

# ****************************************************************************************
def instructions():
	print("Need a config file.")

# ****************************************************************************************
# ***** MAIN *****************************************************************************
if len(sys.argv)<2:
	instructions()
	exit()

f = open(sys.argv[1], "r")

while True:
	line = f.readline()
	if not line:
		sql.foo()
		exit()
	print(">>>", line)





