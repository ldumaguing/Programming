#!/usr/bin/python3
import sys
import re
import mariadb as sql
import B1_moving as b1

# ****************************************************************************************
def mode_Battle(f):
	while True:
		line = f.readline()
		print(line)
		if re.search("^\n$", line):
			break
		if re.search("-->", line):
			b1.move(line)

# ****************************************************************************************
def main():
	f = open(sys.argv[1], "r")

	scenario = sys.argv[1]
	scenario = scenario[scenario.find('/')+1:scenario.find('.')]
	sql.new_scenario(scenario)

	while True:
		line = f.readline()
		if not line:
			break
		if re.search(">>>>> BATTLE", line):
			mode_Battle(f)
	f.close()

# ****************************************************************************************
main()







