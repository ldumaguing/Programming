import sys
import re
import mariadb as sql
import hexagon as hx



def get_flip_status(subject, scenario):
	fields = "JSON_VALUE(j, '$.flip')"
	conditions = "scenario = '" + scenario + "' and name = '" \
		+ subject + "'"
	table = "gameData"
	return sql.select_one(fields, conditions, table)[0]

def get_movement(subject, scenario, flip):
	# unit's current movement "money"
	fields = "JSON_VALUE(j, '$.frontData[10]')"
	if flip=="back":
		fields = "JSON_VALUE(j, '$.backData[10]')"
	conditions = "scenario = '" + scenario + "' and name = '" \
		+ subject + "'"
	table = "gameData"
	return sql.select_one(fields, conditions, table)[0]

def get_hexID(subject, scenario):
	fields = "JSON_VALUE(j, '$.hexLoc[0]'), JSON_VALUE(j, '$.hexLoc[1]')"
	conditions = "scenario = '" + scenario + "' and name = '" \
		+ subject + "'"
	table = "gameData"

	return hx.convert_loc2id((sql.select_one(fields, conditions, table)[0],
		sql.select_one(fields, conditions, table)[1]))

def get_terrain_cost(hexID, scenario, subject):
	fields = "flags"
	conditions = "hexID = '" + hexID + "'"
	table = "map"
	r = sql.select_one(fields, conditions, table)
	if r==None:
		return 1
	flags = r[0]
	cost = 0
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
	if flags & (1<<1):   # hill
		cost += 1
	if flags & (1<<2):   # sand
		cost += 2
	if flags & (1<<3):   # shellholes
		cost += 1
	if flags & (1<<5):   # water
		cost += 1000

	return cost

def not_enough_movement(subject, obj, scenario):
	# get current movement points
	print(get_flip_status(subject, scenario))
	movement = get_movement(subject, scenario,
		get_flip_status(subject, scenario))

	print(get_hexID(subject, scenario), "<<<")
	print(      get_terrain_cost(get_hexID(subject, scenario), scenario, subject)                        )
	return True




