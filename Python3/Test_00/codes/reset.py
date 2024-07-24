import sqlite3 as sql

print("yo from reset.py")
print("yo from reset.py 2")

conn = sql.connect("./Test_00.db")
curs = conn.cursor()
rows = curs.execute("SELECT * from units").fetchall()
# print(rows)
for row in rows:
	print(row)
