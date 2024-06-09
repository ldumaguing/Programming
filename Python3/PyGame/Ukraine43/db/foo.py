import sqlite3

con = sqlite3.connect("ukraine43.sqlite")
cur = con.cursor()

# res = cur.execute("SELECT * from ukraine43")
# print(res.fetchone())

for row in cur.execute("SELECT * from ukraine43"):
	print(row)


