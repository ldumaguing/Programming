import sys
import re
import mariadb as my
import hexagon as hx
import chits as chit
import map0

def is_block_right(riverStat, want, currPlace):
	print(riverStat, want, currPlace)
	blocking = riverStat>>14
	# exitType = 0   # 1: reached want; 2: reached block
	while currPlace>0:
		print(currPlace)
		if currPlace&want:
			# exitType=1
			return False
			break
		if currPlace&blocking:
			# exitType=2
			return True
			break
		currPlace = currPlace>>1
	# print("exit type:", exitType)
	return False

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
	print(is_block_right(riverStat, exitEdge, currPlace))
	return True

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
	print(currLoc, n, movement, cost)
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



