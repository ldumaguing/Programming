import sys
import re
import mariadb as my
import hexagon as hx
import chits as chit

def get_riverStat(hexID):
	stmt = "select river from map where hexID = '" + hexID + "'"
	result = my.sql_fetchone(stmt)
	if result==None:
		return 0
	return int(result[0])

def is_hill(hexID):
	stmt = "select flags & (1<<1) from map where hexID = '" + hexID + "'"
	#print(stmt)
	result = my.sql_fetchone(stmt)
	if result==None:
		return False
	if int(result[0])==0:
		return False
	return True

def get_terrain_cost(hexID, subject, hexAhead_ID, scenario):
	#print("terrain cost")
	stmt = "select flags from map where hexID = '" + hexAhead_ID + "'"
	#print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>", stmt)
	r = my.sql_fetchone(stmt)
	#print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>", r)
	if r==None:
		return 1
	flags = r[0]
	cost = 1
	if chit.is_infantry(subject, scenario):
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

	onHill = chit.is_on_hill(subject, scenario)
	hillAhead = is_hill(hexAhead_ID)
	#print("onHill, hillAhead",onHill, hillAhead)
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




	
