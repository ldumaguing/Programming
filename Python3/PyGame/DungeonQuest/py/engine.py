import sqlite3
import json

def createCharacter():
	print("Name")

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


'''
try:

	# Connect to DB and create a cursor
	sqliteConnection = sqlite3.connect('sql.db')
	cursor = sqliteConnection.cursor()
	print('DB Init')

	# Write a query and execute it with cursor
	query = 'select sqlite_version();'
	cursor.execute(query)

	# Fetch and output result
	result = cursor.fetchall()
	print('SQLite Version is {}'.format(result))

	# Close the cursor
	cursor.close()

# Handle errors
except sqlite3.Error as error:
	print('Error occurred - ', error)

# Close DB Connection irrespective of success
# or failure
finally:

	if sqliteConnection:
		sqliteConnection.close()
		print('SQLite Connection closed')
'''

