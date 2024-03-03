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

def get_slot_p2(rivStat, direction, rivPlace):
	rivPlace = rivPlace>>2   # remove the bridge bits
	exitEdge = 0
	if direction=="A":
		exitEdge = 3<<10
	if direction=="B":
		exitEdge = 3<<8
	if direction=="C":
		exitEdge = 3<<6
	if direction=="D":
		exitEdge = 3<<4
	if direction=="E":
		exitEdge = 3<<2
	if direction=="F":
		exitEdge = 3<<0

	#print("-->", rivPlace)
	#print("...cw exit:", mek.get_exitPlace_cw(rivStat, exitEdge, rivPlace))
	#print("...ccw exit:", mek.get_exitPlace_ccw(rivStat, exitEdge, rivPlace))
	CW = mek.get_exitPlace_cw(rivStat, exitEdge, rivPlace)
	CCW = mek.get_exitPlace_ccw(rivStat, exitEdge, rivPlace)
	print(">>>>>>>>>>>>>>>>>>", CW, CCW)
	if CW>0:
		return convert_exit2entrancePlace(CW)<<2   # restore the bridge bits
	if CCW>0:
		return convert_exit2entrancePlace(CCW)<<2   # restore the bridge bits

	return 0

def get_slot(riv, frm, frmSlot):
	if frmSlot>0:    # unit is from a river hex
		return get_slot_p2(riv, frm, frmSlot)

	# 16380 : 11111111111100
	print("riv, frm, frmSlot:", riv, frm, frmSlot)
	slots = (riv&16380)>>2
	print(">>>", riv, frm, slots)
	want = 0
	w = 0
	if frm=="A":
		want=3<<4
		w=2<<4
	if frm=="B":
		want=3<<2
		w=2<<2
	if frm=="C":
		want=3<<0
		w=2<<0
	if frm=="D":
		want=3<<10
		w=2<<10
	if frm=="E":
		want=3<<8
		w=2<<8
	if frm=="F":
		want=3<<6
		w=2<<6

	print("want, slots, (want&slots)", want, slots, want&slots)
	if (want&slots)==0:  # if all free, return 1 slot
		print("0 slot:", want&w)
		return (want&w)

	A = want&slots
	print("1 slot:", A^want)
	return A^want  # return a free slot

'''
def get_placement(river, frm):
	# Relative to the adjacent hex
	if frm=="A":
		frm="D"
	if frm=="B":
		frm="E"
	if frm=="C":
		frm="F"
	if frm=="D":
		frm="A"
	if frm=="E":
		frm="B"
	if frm=="F":
		frm="C"
	riv = (river&16383)
	if frm=="A":
		if riv&(1<<13):
			if riv&(1<<12)==0:
				return (1<<12)
			return 0
		return (1<<13)

	if frm=="B":
		if riv&(1<<11):
			if riv&(1<<10)==0:
				return (1<<10)
			return 0
		return (1<<11)

	if frm=="C":
		if riv&(1<<9):
			if riv&(1<<8)==0:
				return (1<<8)
			return 0
		return (1<<9)

	if frm=="D":
		if riv&(1<<7):
			if riv&(1<<6)==0:
				return (1<<6)
			return 0
		return (1<<7)

	if frm=="E":
		if riv&(1<<5):
			if riv&(1<<4)==0:
				return (1<<4)
			return 0
		return (1<<5)
		
	if frm=="F":
		if riv&(1<<3):
			if riv&(1<<2)==0:
				return (1<<2)
			return 0
		return (1<<3)
		
	return 0
'''

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




	
