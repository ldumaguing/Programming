import sys
import re
import mariadb as my
import hexagon as hx
import chits as chit
import mechanics as mek

def convert_exit2entrancePlace(exitPlace):
	if exitPlace==1:
		return 128
	if exitPlace==2:
		return 64
	if exitPlace==4:
		return 512
	if exitPlace==8:
		return 256
	if exitPlace==16:
		return 2048
	if exitPlace==32:
		return 1024
	if exitPlace==64:
		return 2
	if exitPlace==128:
		return 1
	if exitPlace==256:
		return 8
	if exitPlace==512:
		return 4
	if exitPlace==1024:
		return 32
	return 16

def get_exitEdge(direction):
	print("direction:", direction)
	if direction=="A":
		return 3072
	if direction=="B":
		return 768
	if direction=="C":
		return 192
	if direction=="D":
		return 48
	if direction=="E":
		return 12
	return 3

def get_placement_p2(entrancePlace, hexID, direction):
	# 16380 : 11111111111100
	n_hexID = hx.get_neighborHexID(hexID, direction)
	n_rivStat = get_riverStat(n_hexID)
	print("p2) entrancePlace, hexID:", entrancePlace, hexID, direction, n_hexID, n_rivStat)
	placements = (n_rivStat&16380)>>2
	print("p2) placements:", placements)
	print("p2) placements&entrancePlace", placements&entrancePlace)
	print("p2) (placements&entrancePlace)^entrancePlace", (placements&entrancePlace)^entrancePlace)
	placement = (placements&entrancePlace)^entrancePlace
	if placement==0:
		return -1
	return placement

def get_placement(subject, scenario, direction):
	rivPlace = chit.get_riverPlace(subject, scenario)
	if rivPlace==0:
		rivPlace=1
	exitEdge = get_exitEdge(direction)
	hexID = chit.get_currHexID(subject, scenario)
	rivStat = get_riverStat(hexID)
	print("rivPlace, exitEdge, hexID, rivStat:", rivPlace, exitEdge, hexID, rivStat)
	CW = mek.get_exitPlace_cw(rivStat, exitEdge, rivPlace)
	CCW = mek.get_exitPlace_ccw(rivStat, exitEdge, rivPlace)
	print(">>>>>>>>>>>>>>>>>>", CW, CCW)
	exitPlace = 0
	if CW>0:
		exitPlace = CW
	else:
		exitPlace = CCW

	if exitPlace==0:
		return 0
	if exitPlace<0:
		return -1



	print("exitPlace", exitPlace)
	entrancePlace = convert_exit2entrancePlace(exitPlace)
	print("entrancePlace:", entrancePlace)




	placement = get_placement_p2(entrancePlace, hexID, direction)
	print("1) placement:", placement)
	print(">>>>>>>>>>>>>>>>>>>>>", placement)
	return placement<<2

def get_riverStat(hexID):
	stmt = "select river from map where hexID = '" + hexID + "'"
	print(stmt)
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




	
