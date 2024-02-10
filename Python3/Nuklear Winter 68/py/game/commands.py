import sys
import re
import mariadb as sql
import hexagon as hx
import mechanics as mek

def move(subject, obj, scenario):
	print("moving...")
	currLoc = sql.get_hexLoc(subject)
	print(currLoc)

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

	if mek.not_enough_movement(subject, obj, scenario):
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
