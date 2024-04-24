import sqlite3

class Engine:
	def __init__(self, db):
		self.db = db

	def get_rows(self, stmt):
		print(stmt)
		print(self.db)
