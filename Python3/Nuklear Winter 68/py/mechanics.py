import sys
import re
import mariadb as my
import hexagon as hx
import chits as chit
import map0

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



