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

def get_exitPlace_ccw(riverStat, want, currPlace):
	print("ccw.....want, riverStat, currPlace:", want, riverStat, currPlace)
	blocking = riverStat>>14
	print("ccw blocking:", blocking)
	currPlace = currPlace>>2
	currPlace = oneBitShiftRotateLeft(currPlace)
	for x in range(12):
		print("ccw-??? currPlace, blocking, want", currPlace, blocking, want)
		if currPlace&blocking:
			return -1
		if currPlace&want:
			return currPlace

		currPlace = oneBitShiftRotateLeft(currPlace)

	return -1

def get_exitPlace_cw(riverStat, want, currPlace):
	print("cw.....want, riverStat, currPlace:", want, riverStat, currPlace)
	blocking = riverStat>>14
	print("cw blocking:", blocking)
	currPlace = currPlace>>2
	#currPlace = oneBitShiftRotateRight(currPlace)
	for x in range(12):
		print("cw-??? currPlace, blocking, want", currPlace, blocking, want)
		if currPlace&want:
			return currPlace
		if currPlace&blocking:
			return -1

		currPlace = oneBitShiftRotateRight(currPlace)

	return -1

def is_adjay_river_blocking(unit, scenario, direction):
	print("????????????? adjay river")
	currLoc = chit.get_currLoc(unit, scenario)
	hexID = hx.convert_loc2id(hx.get_neighborLoc(currLoc, direction))
	print(unit, currLoc, hexID)
	riverStat = map0.get_riverStat(hexID)
	print("riverStat:", riverStat, bin(riverStat))
	if riverStat==0:
		print("There is no river there.")
		return False
	rivPlace = chit.get_riverPlace(unit, scenario)
	print("direction, rivPlace", direction, rivPlace)
	slot = map0.get_slot(riverStat, direction, rivPlace)
	print("slot:", slot)
	
	if slot>0:
		return False
	return True

def is_my_river_blocking(unit, scenario, direction):
	print("????????????? my river")
	riverStat = map0.get_riverStat(chit.get_currHexID(unit, scenario))
	print("riverStat:", riverStat)
	if riverStat==0:  # there is no river
		print("There is no river here.")
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

	currPlace = chit.get_riverPlace(unit, scenario)
	print(">>> unit, scenario, direction, riverStat, exitEdge, currPlace")
	print(">>>", unit, scenario, direction, riverStat, exitEdge, currPlace)
	r_riv = get_exitPlace_cw(riverStat, exitEdge, currPlace)
	l_riv = get_exitPlace_ccw(riverStat, exitEdge, currPlace)
	print("right blocked:", r_riv)
	print("left blocked:", l_riv)
	print("***", r_riv | l_riv)
	return not (r_riv | l_riv)

def is_not_enough_movement(subject, scenario, obj):
	currLoc = chit.get_currLoc(subject, scenario)
	
	n = ()
	if obj=="A":
		n = hx.get_neighborLoc(currLoc, "A")
	if obj=="B":
		n = hx.get_neighborLoc(currLoc, "B")
	if obj=="C":
		n = hx.get_neighborLoc(currLoc, "C")
	if obj=="D":
		n = hx.get_neighborLoc(currLoc, "D")
	if obj=="E":
		n = hx.get_neighborLoc(currLoc, "E")
	if obj=="F":
		n = hx.get_neighborLoc(currLoc, "F")
	
	movement = chit.get_curr_movement(subject, scenario)
	cost = map0.get_terrain_cost(
		hx.convert_loc2id(currLoc),
		subject,
		hx.convert_loc2id(n),
		scenario
		)
	#print(currLoc, n, movement, cost)
	return (movement<cost)



