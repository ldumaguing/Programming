import sqlite3
import json
import engine as e
import misc

def add_doors(tile, From):
	doors = 0

	dont = 2
	if From=="n": dont = 8
	if From=="e": dont = 4
	if From=="w": dont = 1

	should = tile | dont
	doors = (misc.get_random(16) | should)^should

	return doors

def cleanTile(tile, X, Y, From):
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
	if X<0 or X>9 or Y<0 or Y>12:
		print("Reached board's limit.")
		return

	if e.is_door_blocking(X, Y, From):
		print("door")
		d_event = misc.door_event()
		if d_event==1:
			print("trap")
			return
		if d_event==2:
			print("stuck")
			return
		print("open")

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

	if e.is_tile_exists(X, Y):
		print("Tile already exists.")
		if e.is_threshold(X, Y, From):
			print("There is a threshold.")
			stmt = "update characters set x=" + str(X)
			stmt += ", y=" + str(Y)
			stmt += " where flags & 1"
			e.sql_set(stmt)
			return
		print("No threshold.")
		return

	# create tile
	tiles = (-1, 13, 5, 9, 12, 8, 4, 1, 0)
	# likelyHood = (1,1,1,1,1,1,1,1)    # even
	likelyHood = (1,1,1,1,2,2,2,4)    # easy
	# likelyHood = (3,1,1,1,1,1,1,1)    # hard
	rolled = misc.get_fixed_roll(likelyHood)
	tile = tiles[rolled]
	for i in range(rotations):
		tile = ((tile & 1)<<3) | (tile>>1)
	print("tile:", tile)
	tile = cleanTile(tile, X, Y, From)
	print("tile:", tile)

	# place tile
	stmt = "insert into board (x, y, openings) values ("
	stmt += str(X)+", "
	stmt += str(Y)+", "
	stmt += str(tile)+")"
	e.sql_set(stmt)

	# add doors
	doors = add_doors(tile, From)
	stmt = "update board set doors="+str(doors)
	stmt += " where x="+str(X)
	stmt += " and y="+str(Y)
	e.sql_set(stmt)

	# add portcullis
	p = misc.get_random_1(15)
	A = tile ^ 15
	p = p & A
	A = doors ^ 15
	p = p & A
	stmt = "update board set portcullis="+str(p)
	stmt += " where x="+str(X)
	stmt += " and y="+str(Y)
	e.sql_set(stmt)

	# place character
	stmt = "update characters set x=" + str(X)
	stmt += ", y=" + str(Y)
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














