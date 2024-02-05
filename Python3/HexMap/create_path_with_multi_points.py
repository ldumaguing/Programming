#!/usr/bin/python3
import sys
import math
import re

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

def create_path(starting, pts):
	starting = re.sub("\s", "", starting)
	pts = starting + "," + re.sub("\s", "", pts)
	pts = remove_redundance(pts)
	pts = re.split(",", pts)
	print(pts, len(pts))
	for x in range(len(pts)-1):
		print(".", pts[x])

# ***** MAIN *****************************************************************************
starting = "A1   "
points = "A1,  B1,D10,  D10, E15, F1"

create_path(starting, points)

