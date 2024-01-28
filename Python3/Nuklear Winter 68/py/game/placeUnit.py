#!/usr/bin/python3
import sys
import re
import mysql.connector

if len(sys.argv)!=4:
	print("placeUnit.py [scenario] [unitID] [hexID]")
	exit()

scenario = sys.argv[1]
scenario = scenario[scenario.find('/')+1:scenario.find('.')]
unitID = sys.argv[2]
hexID = sys.argv[3]

print(len(sys.argv))


