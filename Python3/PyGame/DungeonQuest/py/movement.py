import sqlite3
import json
import engine as e
import misc

tiles = (-1, 13, 5, 9, 12, 8, 4, 1, 0)

def placeTile(X, Y, From):
	print(From)
	tile = tiles[misc.roll_d8()]
	print(tile)

def move(argv):
	if len(argv)<3:
		print("Please supply a direction.")
		return

	cols = "x, y"
	conditions = "flags & 1"
	tbl = "v_chars"
	selected = e.sql_select(cols, conditions, tbl)

	cols = "openings, x, y"
	conditions = "x="+str(selected[0]) + " and " + "y="+str(selected[1])
	tbl = "board"
	selected = e.sql_select(cols, conditions, tbl)
	openings = selected[0]
	x = selected[1]
	y = selected[2]

	if argv[2]=='n':
		if (openings & 8)==0: placeTile(x, y, "s")
	if argv[2]=='e':
		if (openings & 4)==0: placeTile(x, y, "w")
	if argv[2]=='s':
		if (openings & 2)==0: placeTile(x, y, "n")
	if argv[2]=='w':
		if (openings & 1)==0: placeTile(x, y, "e")

















