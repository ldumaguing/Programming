import sys
import re
import mariadb as my
import hexagon as hx
import chits as chit
import map0

def is_not_enough_movement(subject, obj, scenario, hexAhead):
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
	cost = map0.get_terrain_cost(chit.get_currHexID(subject, scenario), subject, hexAhead, scenario)
	#print("cost:", map0.get_terrain_cost(chit.get_currHexID(subject, scenario), subject, hexAhead, scenario))
	print("-----", movement, cost)
	return True




