import sys
import re
import mysql.connector

def mode_Objective(f):
	while True:
		line = f.readline()
		if re.search("^\n$", line):
			break
		print(line)













