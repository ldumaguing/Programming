import sys
import re
import mariadb as my
import hexagon as hx
import mechanics as mek
import chits as chit
import map0
import mariadb as my

def move(subject, direction, scenario):
	# move u1 A
	placement = map0.get_placement(subject, scenario, direction)
	print("0) placement:", placement)
	'''
	if mek.is_my_river_blocking(subject, scenario, obj):
		print("***** My river is blocking.")
		return
	if mek.is_adjay_river_blocking(subject, scenario, obj):
		print("***** Adjacent river is blocking.")
		return
	'''
	if mek.is_not_enough_movement(subject, scenario, direction):
		print("***** Not enough movement points.")
		return


	print("Moving...\n")
	nID = hx.get_neighborHexID(chit.get_currHexID(subject, scenario), direction)
	nRiver = map0.get_riverStat(nID)
	nLoc = hx.convert_id2loc(nID)
	movement = chit.get_curr_movement(subject, scenario)
	cost = map0.get_terrain_cost(
		chit.get_currHexID(subject, scenario),
		subject,
		nID,
		scenario
		)
	print("0 --- nID, nLoc, nRiver, movement, cost, subject:", nID, nLoc, nRiver, movement, cost, subject)
	stmt = "update gameData set j = JSON_REPLACE(j, '$.hexLoc[0]', " \
		+ str(nLoc[0]) + ", '$.hexLoc[1]'," + str(nLoc[1]) + ") where name = '" + subject + "'" \
		+ " and scenario = '" + scenario + "'"
	print("1:", stmt)
	my.sql_insert_update(stmt)

	if nRiver==0:
		stmt = "update gameData set j = JSON_SET(j, '$.riverHexPlace', 0)"   \
			+ " where name = '" + subject + "' and scenario = '" + scenario + "'"
		print("2:", stmt)
		my.sql_insert_update(stmt)
		return
	
	print("**********", placement, "**********")
	stmt = "update gameData set j = JSON_SET(j, '$.riverHexPlace', " + str(placement) \
		+ ") where name = '" + subject + "' and scenario = '" + scenario + "'"
	print("3:", stmt)
	my.sql_insert_update(stmt)
	
	
	
	
	
	
	
	
	'''
	rivPlaceFrom = chit.get_riverPlace(subject, scenario)
	currHexID = chit.get_currHexID(subject, scenario)
	oRiver = map0.get_riverStat(currHexID)
	print("rivPlaceFrom, oRiver:", rivPlaceFrom, oRiver)
	nID = hx.get_neighborHexID(chit.get_currHexID(subject, scenario), obj)
	nRiver = map0.get_riverStat(nID)
	nLoc = hx.convert_id2loc(nID)
	movement = chit.get_curr_movement(subject, scenario)
	cost = map0.get_terrain_cost(
		chit.get_currHexID(subject, scenario),
		subject,
		nID,
		scenario
		)
	print("0 --- nID, nLoc, nRiver, movement, cost, subject:", nID, nLoc, nRiver, movement, cost, subject)
	stmt = "update gameData set j = JSON_REPLACE(j, '$.hexLoc[0]', " \
		+ str(nLoc[0]) + ", '$.hexLoc[1]'," + str(nLoc[1]) + ") where name = '" + subject + "'" \
		+ " and scenario = '" + scenario + "'"
	print("1:", stmt)
	my.sql_insert_update(stmt)

	if nRiver==0:
		stmt = "update gameData set j = JSON_SET(j, '$.riverHexPlace', 0)"   \
			+ " where name = '" + subject + "' and scenario = '" + scenario + "'"
		print("2:", stmt)
		my.sql_insert_update(stmt)
		return

	riverPlace = chit.get_riverPlace(subject, scenario)
	slot = map0.get_slot(nRiver, obj, riverPlace)
	slot2 = map0.get_slot(oRiver, obj, rivPlaceFrom)
	print("riverPlace, slot, slot2:", riverPlace, slot, slot2)
	slot2 = slot2<<2
	print("riverPlace, slot, slot2:", riverPlace, slot, slot2)
	stmt = "update gameData set j = JSON_SET(j, '$.riverHexPlace', " + str(slot2) \
		+ ") where name = '" + subject + "' and scenario = '" + scenario + "'"
	print("3:", stmt)
	my.sql_insert_update(stmt)
	'''
















	'''


	# print("---", slot, nRiver, obj, "---", slot>>2)
	#print(nID, nLoc, nRiver, movement, cost)
	# update gameData set j = JSON_SET(j, '$.riverHexPlace', 333)
	# where name = 'u2' and scenario = '01-Day8';

	# 
	'''





'''
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


