#!/usr/bin/python3
import sys
import SQLite3

def instructions():
	print()
	print("   Supply a database file, please.")
	print()

# ****************************************************************************************
if len(sys.argv) == 1:
	instructions()
	exit()

SQL = SQLite3.Engine(sys.argv[1])

print(SQL.get_rows("foo"))

print("END")

