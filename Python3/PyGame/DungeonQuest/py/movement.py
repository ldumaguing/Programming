import sqlite3
import json
import engine as e
import misc

def cleanTile(tile, X, Y):
	if Y==0:
		tile |= 8
	if X==0:
		tile |= 1
	if Y==12:
		tile |= 2
	if X==9:
		tile |= 4
	return tile

def placeTile(X, Y, From):
	tiles = (-1, 13, 5, 9, 12, 8, 4, 1, 0)
	rotations = 0
	if From=="n":
		rotations=2
		Y += 1
	if From=="e":
		rotations=3
		X -= 1
	if From=="w":
		rotations=1
		X += 1
	if From=="s":
		Y -= 1

	if X<0 or X>9 or Y<0 or Y>12:
		print("Reached board's limit.")
		return

	if e.is_tile_exists(X, Y):
		print("Tile already exists.")
		if e.is_threshold(X, Y, From):
			print("There is a threshold.")
			stmt = "update characters set x=" + str(X)
			stmt += " where flags & 1"
			e.sql_set(stmt)
			stmt = "update characters set y=" + str(Y)
			stmt += " where flags & 1"
			e.sql_set(stmt)
		print("No threshold.")
		return

	# Placing new tile
	tile = tiles[misc.roll_d8()]
	for i in range(rotations):
		print("i:", i)
		tile = ((tile & 1)<<3) | (tile>>1)
	print("tile:", tile)
	tile = cleanTile(tile, X, Y)
	print("tile:", tile)

	stmt = "insert into board (x, y, openings) values ("
	stmt += str(X)+", "
	stmt += str(Y)+", "
	stmt += str(tile)+")"
	e.sql_set(stmt)

	stmt = "update characters set x=" + str(X)
	stmt += " where flags & 1"
	e.sql_set(stmt)
	stmt = "update characters set y=" + str(Y)
	stmt += " where flags & 1"
	e.sql_set(stmt)

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
		if (openings & 8)==0:
			placeTile(x, y, "s")
			return
	if argv[2]=='e':
		if (openings & 4)==0:
			placeTile(x, y, "w")
			return
	if argv[2]=='s':
		if (openings & 2)==0:
			placeTile(x, y, "n")
			return
	if argv[2]=='w':
		if (openings & 1)==0:
			placeTile(x, y, "e")
			return


	print("The wall is blocking you.")














