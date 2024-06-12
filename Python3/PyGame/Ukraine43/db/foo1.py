import sqlite3
HTML_a = """
<!DOCTYPE html>
<html>
<head>
<title>Ukraine '43</title>
<!-- <meta http-equiv="refresh" content="3"> -->
</head>
<body onload="">
"""

HTML_b = """
</body>
</html>
"""

b1 = "../../../../../IMAGES/Ukraine43/"
blank_img = "../img/blank.png"


# **************************************************************************************************
print(HTML_a)




con = sqlite3.connect("ukraine43.sqlite")
cur = con.cursor()
cur1 = con.cursor()

# res = cur.execute("SELECT * from ukraine43")
# print(res.fetchone())

for row in cur.execute("SELECT * from chits order by id, name"):
	#print("<img id=\"i" + str(row[0]) + "\" src=\"" + b1 + row[1] + "\">" + str(row[0]) + "; " + row[1] + "<br>")
	front = blank_img
	rear = blank_img
	rem = blank_img
	if row[2]!=0:
		res = cur1.execute("select name from images where id = " + str(row[2]))
		front = b1 + res.fetchone()[0]
	if row[3]!=0:
		res = cur1.execute("select name from images where id = " + str(row[3]))
		rear = b1 + res.fetchone()[0]
	if row[4]!=0:
		res = cur1.execute("select name from images where id = " + str(row[4]))
		rem = b1 + res.fetchone()[0]



	print('<img src="' + front + '">')
	print('<img src="' + rear + '">')
	print('<img src="' + rem + '">')
	print(row[1], "---", row[0])
	print('<br>')
	#print(front, rear)

print(HTML_b)






