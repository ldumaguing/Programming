import sys
import re
import mariadb as sql
import hexagon as hx
import chits as chit

def get_hexID(subject, scenario):
	fields = "JSON_VALUE(j, '$.hexLoc[0]'), JSON_VALUE(j, '$.hexLoc[1]')"
	conditions = "scenario = '" + scenario + "' and name = '" \
		+ subject + "'"
	table = "gameData"

	return hx.convert_loc2id((sql.select_one(fields, conditions, table)[0],
		sql.select_one(fields, conditions, table)[1]))

def get_terrain_cost(hexID, scenario, subject, hexAhead):
	print("terrain cost")
	fields = "flags"
	conditions = "hexID = '" + hexAhead + "'"
	table = "map"
	r = sql.select_one(fields, conditions, table)
	if r==None:
		return 1
	flags = r[0]
	cost = 1


	if sql.is_infantry(subject):
		if flags & (1<<0):   # crop fields
			cost += 2
		if flags & (1<<4):   # urban
			cost += 1
		if flags & (1<<6):   # woods
			cost += 1
	else:
		if flags & (1<<0):   # crop fields
			cost += 1
		if flags & (1<<4):   # urban
			cost += 2
		if flags & (1<<6):   # woods
			cost += 2

	#print("...........", is_on_hill(subject, scenario))
	#print("...........", is_hill(hexAhead))
	onHill = is_on_hill(subject, scenario)
	hillAhead = is_hill(hexAhead)

	if hillAhead & (not onHill):
		print("pay hill")
		cost += 1

	if flags & (1<<2):   # sand
		cost += 2
	if flags & (1<<3):   # shellholes
		cost += 1
	if flags & (1<<5):   # water
		cost += 1000

	return cost

def not_enough_movement(subject, obj, scenario, hexAhead):
	# get current movement points
	print(chit.get_flip_status(subject, scenario))
	movement = chit.get_movement(subject, scenario,
		chit.get_flip_status(subject, scenario))

	#print(get_hexID(subject, scenario), hexAhead, "<<<")
	#print(      get_terrain_cost(get_hexID(subject, scenario), scenario, subject, hexAhead)                        )
	return True




