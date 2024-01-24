#!/usr/bin/python3
import sys
import re

mapName = ""

def mode_Board(f):
	global mapName

	while True:
		line = f.readline()
		if re.search("^\.$", line):
			break
		print("..." + line)
		if re.search("Board na", line):
			mapName = line

f = open(sys.argv[1], "r")

while True:
	line = f.readline()
	if not line:
		break
	if re.search(">>>>> BOA", line):
		mode_Board(f)
	# print(line)

print("::::" + mapName)



