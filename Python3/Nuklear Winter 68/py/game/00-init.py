#!/usr/bin/python3
import sys


f = open(sys.argv[1], "r")

while True:
	line = f.readline()
	if not line:
		break

	print(line)
