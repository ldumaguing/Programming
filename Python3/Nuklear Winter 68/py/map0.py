import sys
import re
import mariadb as my
import hexagon as hx
import chits as chit


def get_slot(riv, frm):
	# 16380 : 11111111111100
	slots = riv&16380
	print(">>>", riv, frm, slots)
	if frm=="D":
		if riv&(1<<13):
			if riv&(1<<12)==0:
				return (1<<12)
			return 0
		return (1<<13)

	if frm=="E":
		if riv&(1<<11):
			if riv&(1<<10)==0:
				return (1<<10)
			return 0
		return (1<<11)

	if frm=="F":
		if riv&(1<<9):
			if riv&(1<<8)==0:
				return (1<<8)
			return 0
		return (1<<9)

	if frm=="A":
		if riv&(1<<7):
			if riv&(1<<6)==0:
				return (1<<6)
			return 0
		return (1<<7)

	if frm=="B":
		if riv&(1<<5):
			if riv&(1<<4)==0:
				return (1<<4)
			return 0
		return (1<<5)
		
	if frm=="C":
		if riv&(1<<3):
			if riv&(1<<2)==0:
				return (1<<2)
			return 0
		return (1<<3)
	return 0

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




	
