import sqlite3
a1 = """
<!DOCTYPE html>
<html>
<head>
<title>Ukraine '43</title>
<!-- <meta http-equiv="refresh" content="3"> -->
</head>
<body onload="">
"""

a2 = """
</body>
</html>
"""

b1 = "../../../../../IMAGES/Ukraine43/"



print(a1)




con = sqlite3.connect("ukraine43.sqlite")
cur = con.cursor()

# res = cur.execute("SELECT * from ukraine43")
# print(res.fetchone())

for row in cur.execute("SELECT * from images where flags = 1 order by name"):
	print("<img id=\"i" + str(row[0]) + "\" src=\"" + b1 + row[1] + "\">" + str(row[0]) + "; " + row[1] + "<br>")

print(a2)
