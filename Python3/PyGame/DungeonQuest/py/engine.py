import sqlite3
import json

def sql_get(col, conditions):
	f = open('configs.json')
	configs = json.load(f)
	f.close()

	stmt = "select " + col + " from characters where " + conditions
	val = 0
	try:
		conn = sqlite3.connect(configs["database"])
		cur = conn.cursor()
		cur.execute(stmt)
		res = cur.fetchone()
		val = res[0]
		cur.close()
	except sqlite3.Error as error:
		print('Error occurred - ', error)
	finally:
		if conn:
			conn.close()

	return val

def sql_set(stmt):
	f = open('configs.json')
	configs = json.load(f)
	f.close()

	try:
		conn = sqlite3.connect(configs["database"])
		cur = conn.cursor()
		cur.execute(stmt)
		conn.commit()
		cur.close()
	except sqlite3.Error as error:
		print('Error occurred - ', error)
	finally:
		if conn:
			conn.close()
			print('Done.')

def is_Any(stmt):
	f = open('configs.json')
	configs = json.load(f)
	f.close()

	is_any = False
	try:
		conn = sqlite3.connect(configs["database"])
		cur = conn.cursor()
		cur.execute(stmt)
		res = cur.fetchall()
		if len(res)>0: is_any = True
		cur.close()
	except sqlite3.Error as error:
		print('Error occurred - ', error)
	finally:
		if conn:
			conn.close()

	return is_any

def is_not_deleted(ID):
	stmt = "select * from v_chars where id=" + str(ID)
	return is_Any(stmt)

def is_character_exists(charName):
	stmt = "select * from characters where name = '" + charName + "'"
	return is_Any(stmt)

def deleteCharacter():
	f = open('configs.json')
	configs = json.load(f)
	f.close()

	stmt = "select id, name from v_chars order by name"

	try:
		conn = sqlite3.connect(configs["database"])
		cur = conn.cursor()
		cur.execute(stmt)
		res = cur.fetchall()
		print("Remove by ID:")
		for row in res:
			print("   "+str(row[0])+":", row[1])
		cur.close()
	except sqlite3.Error as error:
		print('Error occurred - ', error)
	finally:
		if conn:
			conn.close()

	ID = input("   ?: ")
	if is_not_deleted(ID):
		stmt = "update characters set flags=(~(flags&2))&(flags|2) where id="
		stmt += str(ID)
		sql_set(stmt)
	else:
		print("Already deleted or doesn't exists.")

def createCharacter():
	charName = input("Character's name: ")
	print()
	print("Class:")
	print("   1: Fighter")
	print("   2: Magic User")
	print("   3: Cleric")
	print("   4: Theif")
	X = input("   ?: ")
	charClass = "Theif"
	if int(X)==1: charClass = "Fighter"
	if int(X)==2: charClass = "Magic User"
	if int(X)==3: charClass = "Cleric"
	print()

	print("Starting location:")
	print("   1: NW corner")
	print("   2: NE corner")
	print("   3: SE corner")
	print("   4: SW corner")
	X = input("   ?: ")
	charLoc = (0, 12)
	if int(X)==1: charLoc = (0, 0)
	if int(X)==2: charLoc = (9, 0)
	if int(X)==3: charLoc = (9, 12)
	print()

	if is_character_exists(charName):
		# update
		stmt = "update characters set class = '" + charClass + "'"
		stmt += " where name = '" + charName + "'"
		sql_set(stmt)
		stmt = "update characters set x = " + str(charLoc[0])
		stmt += " where name = '" + charName + "'"
		sql_set(stmt)
		stmt = "update characters set y = " + str(charLoc[1])
		stmt += " where name = '" + charName + "'"
		sql_set(stmt)
	else:
		# insert
		stmt = "insert into characters (name, class, x, y, j) values ("
		stmt += "'" + charName + "', '" + charClass + "',"
		stmt += " " + str(charLoc[0]) + ", " + str(charLoc[1]) + ","
		stmt += " " + "json('{}'))"
		sql_set(stmt)

def init():
	print("Initializing...")
	f = open('configs.json')
	configs = json.load(f)
	f.close()

	try:
		conn = sqlite3.connect(configs["database"])
		cur = conn.cursor()

		stmt = "delete from board"
		cur.execute(stmt)
		stmt = "delete from characters"
		cur.execute(stmt)
		stmt = "insert into board (x, y, openings) values (0, 0, 9)"
		cur.execute(stmt)
		stmt = "insert into board (x, y, openings) values (9, 0, 12)"
		cur.execute(stmt)
		stmt = "insert into board (x, y, openings) values (9, 12, 6)"
		cur.execute(stmt)
		stmt = "insert into board (x, y, openings) values (0, 12, 3)"
		cur.execute(stmt)
		stmt = "insert into board (x, y, openings) values (4, 6, 0)"
		cur.execute(stmt)
		stmt = "insert into board (x, y, openings) values (5, 6, 0)"
		cur.execute(stmt)

		conn.commit()
		cur.close()
	except sqlite3.Error as error:
		print('Error occurred - ', error)
	finally:
		if conn:
			conn.close()
			print('Done.')

