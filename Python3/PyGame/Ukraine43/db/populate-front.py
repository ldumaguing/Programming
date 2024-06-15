import sqlite3
#import re

con = sqlite3.connect("ukraine43.sqlite")
con.enable_load_extension(True)
con.execute("select load_extension('/usr/lib/sqlite3/pcre.so')")
# con.execute("select load_extension('/usr/local/libexec/sqlite-ext/pcre.so')")


cur0 = con.cursor()
cur1 = con.cursor()
cur2 = con.cursor()



for row0 in cur0.execute("select * from chits"):
	name = row0[0]
	print(name)
	row1 = cur1.execute("select * from images where name regexp '" \
		+ name + "' and name regexp '-f.'"
		)
	res = row1.fetchone()
	if res:
		print(res[0])
		print("update chits set front=" + str(res[0]) + " where name='" + name + "'")
		stmt = "update chits set front=" + str(res[0]) + " where name='" + name + "'"
		cur2.execute(stmt)

con.commit()

con.enable_load_extension(False)
