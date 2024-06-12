import sqlite3

con = sqlite3.connect("ukraine43.sqlite")
cur = con.cursor()

f = open("aaa.txt", "r")

for line in f:
	x = line.split('|')
	print("update chits set unitID='" + x[1].strip() + "' where id=" + str(x[0]))
	stmt = "update chits set unitID='" + x[1].strip() + "' where id=" + str(x[0])
	cur.execute(stmt)

f.close()
con.commit()
