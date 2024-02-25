import sys
import re
import mariadb as my
import hexagon as hx
import chits as chit
import map0

def oneBitShiftRotateRight(position):
	x = position>>1
	if x==0:
		return 2048   # 12 bits position
	return x

def oneBitShiftRotateLeft(position):
	x = position<<1
	if x>2048:
		return 1   # 12 bits position
	return x


def is_block_left(riverStat, want, currPlace):
	blocking = riverStat>>14
	# print(">>>", riverStat, want, currPlace, blocking)
	for x in range(12):
		# print(currPlace)
		if currPlace&blocking:
			return True
		if currPlace&want:
			return False
		currPlace = oneBitShiftRotateLeft(currPlace)

	return False

def is_block_right(riverStat, want, currPlace):
	blocking = riverStat>>14
	# print(">>>", riverStat, want, currPlace, blocking)
	for x in range(12):
		# print(currPlace)
		if currPlace&want:
			return False
		if currPlace&blocking:
			return True
		currPlace = oneBitShiftRotateRight(currPlace)

	return False

def is_adjay_river_blocking(unit, scenario, direction):
	# print("test adjay")
	currLoc = chit.get_currLoc(unit, scenario)
	hexID = hx.convert_loc2id(hx.get_neighbor(currLoc, direction))
	# print(unit, currLoc, hexID)
	river = map0.get_riverStat(hexID)
	if river==0:
		print(">>> There is no river ahead.")
		return 0
	placement = map0.get_placement(river, direction)
	print("is adjay river blocking?", river, placement, direction)
	return placement

def is_my_river_blocking(unit, scenario, direction):
	riverStat = map0.get_riverStat(chit.get_currHexID(unit, scenario))
	if riverStat==0:  # there is no river
		print("There is no river")
		return False
	exitEdge = 0
	if direction=="A":
		exitEdge=(3<<10)
	if direction=="B":
		exitEdge=(3<<8)
	if direction=="C":
		exitEdge=(3<<6)
	if direction=="D":
		exitEdge=(3<<4)
	if direction=="E":
		exitEdge=(3<<2)
	if direction=="F":
		exitEdge=(3<<0)

	currPlace = chit.get_riverPlace(unit, scenario)>>2
	# print(">>>", unit, scenario, direction, riverStat, exitEdge, currPlace)
	print("right blocked:", is_block_right(riverStat, exitEdge, currPlace))
	print("left blocked:", is_block_left(riverStat, exitEdge, currPlace))
	return is_block_right(riverStat, exitEdge, currPlace) \
		and is_block_left(riverStat, exitEdge, currPlace)

def is_not_enough_movement(subject, scenario, obj):
	currLoc = chit.get_currLoc(subject, scenario)
	
	n = ()
	if obj=="A":
		n = hx.get_neighbor(currLoc, "A")
	if obj=="B":
		n = hx.get_neighbor(currLoc, "B")
	if obj=="C":
		n = hx.get_neighbor(currLoc, "C")
	if obj=="D":
		n = hx.get_neighbor(currLoc, "D")
	if obj=="E":
		n = hx.get_neighbor(currLoc, "E")
	if obj=="F":
		n = hx.get_neighbor(currLoc, "F")
	
	movement = chit.get_curr_movement(subject, scenario)
	cost = map0.get_terrain_cost(
		hx.convert_loc2id(currLoc),
		subject,
		hx.convert_loc2id(n),
		scenario
		)
	#print(currLoc, n, movement, cost)
	return (movement<cost)

'''
def is_not_enough_movement(subject, scenario, hexAhead_ID):
	# get current movement points
	#print(chit.get_flip_status(subject, scenario))
	movement = chit.get_movement(subject, scenario,
		chit.get_flip_status(subject, scenario))
	"""
	print("subject:  ", subject)
	print("flip:     ", chit.get_flip_status(subject, scenario))
	print("move:     ", movement)
	print("hexAhead: ", hexAhead)
	print("currHexID:", chit.get_currHexID(subject, scenario))
	"""
	#print(get_hexID(subject, scenario), hexAhead, "<<<")
	#print(      get_terrain_cost(get_hexID(subject, scenario), scenario, subject, hexAhead)                        )
	cost = map0.get_terrain_cost(chit.get_currHexID(subject, scenario), subject, hexAhead_ID, scenario)
	#print("cost:", map0.get_terrain_cost(chit.get_currHexID(subject, scenario), subject, hexAhead, scenario))
	print("-----", movement, cost)
	return True
'''



