import sys
import re
import mariadb as my
import hexagon as hx
import mechanics as mek
import chits as chit

def move(subject, obj, scenario):
	# move u1 A
	if mek.is_not_enough_movement(subject, scenario, obj):
		print("***** Not enough movement points.")
		return
	if mek.is_my_river_blocking(subject, scenario, obj):
		print("***** My river is blocking.")
		return
	if mek.is_adjay_river_blocking(unit, scenario, direction):
		print("***** Adjacent river is blocking.")
		return
'''
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

	print("%%%%%", currLoc, n)
	hexAhead_ID = hx.convert_loc2id(n)
	# print(">>>>>>>>>>>", currLoc, n, subject, obj, hexAhead_ID)
	"""
	currLoc      (20, 8)
	n            (20, 7)
	subject      u1
	hexAhead_ID  U8
	"""


	if mek.is_not_enough_movement(subject, scenario, hexAhead_ID):
		print("***** Not enough movement points.")
		return

	print("Roger that.")
	stmt = "update gameData set j = JSON_REPLACE(j, '$.hexLoc[0]', " \
		+ str(n[0]) + ", '$.hexLoc[1]'," + str(n[1]) + ") where name = '" + subject + "'" \
		+ " and scenario = '" + scenario + "'"
	sql.sql(stmt)



def embark(subject, obj, scenario):
	print(subject, "embark", obj)

	if sql.is_infantry(subject)==0:
		print("Can't embark")
		return

	if sql.is_apc(obj)==0:
		print("Not an APC")
		return

	j = "JSON_SET(j, '$.carrying', '" + subject + "')"
	sql.update_j(j, unitB, scenario)
	j = "JSON_SET(j, '$.carried', '" + obj + "')"
	sql.update_j(j, unitA, scenario)

def disembark(subject, scenario):
	if sql.is_infantry(subject)==0:
		print("Shouldn't be embarked in the first place")
		return
	
	fields = "JSON_VALUE(j, '$.carried')"
	conditions = "name = '" + subject + "' and scenario = '" + scenario + "'"
	table = "gameData"
	unitB = sql.select_one(fields, conditions, table)[0]
	
	j = "JSON_REMOVE(j, '$.carried')"
	sql.update_j(j, unitA, scenario)
	j = "JSON_REMOVE(j, '$.carrying')"
	sql.update_j(j, unitB, scenario)

'''


