import sqlite3


print ("""<!DOCTYPE html>
<html>
\t<head>
\t\t<meta charset="UTF-8">
\t\t<title>The Long Road</title>
\t</head>
\t<body>
\t\t<table>"""
)

CONN = sqlite3.connect("db/TLR.db")

stmt = "SELECT * FROM img WHERE (flag1 & 1) or (flag3 & (1<<6)) ORDER BY id"
cursor = CONN.cursor()
cursor.execute(stmt)
rows = cursor.fetchall()
for row in rows:
    html_row = f"\t\t\t<tr><td>{row[0]}</td>"
    # html_row += f"<td>{row[1]}</td>" # file
    html_row += f"<td><img src=\"TLR/{row[1]}\"></td>"
    html_row += f"<td>{hex(row[2])}</td>"
    html_row += f"<td>{hex(row[9])}</td>"
    html_row += f"<td>{hex(row[11])}</td>"
    html_row += f"<td>{hex(row[12])}</td>"
    html_row += f"<td>{hex(row[13])}</td>"
    html_row += "</tr>"
    print(html_row)

CONN.close()

print("""\t\t</table>
\t</body>
</html>
"""
)
