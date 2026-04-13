import sqlite3
import re


# ******************************************************************************
print ("""<!DOCTYPE html>
<html>
\t<head>
\t\t<meta charset="UTF-8">
\t\t<title>Unit</title>
\t</head>
\t<body>
\t\t<table>"""
)

CONN = sqlite3.connect("db/TLR.db")

stmt = "SELECT * FROM v_unit "
stmt += "ORDER BY descrip, version"
cursor = CONN.cursor()
cursor.execute(stmt)
rows = cursor.fetchall()
for row in rows:
    html_row = "\t\t\t<tr>"
    html_row += f"<td>{row[0]}</td>"
    html_row += f"<td><img src=\"../TLR/{row[2]}\"</td>"
    html_row += f"<td><img src=\"../TLR/{row[3]}\"</td>"
    html_row += f"<td><img src=\"../TLR/{row[4]}\"</td>"
    html_row += f"<td><img src=\"../TLR/{row[5]}\"</td>"
    html_row += f"<td>{row[6]}</td>"
    html_row += f"<td>{row[1]}</td>"
    html_row += f"<td>v{row[7]}</td>"
    html_row += "</tr>"
    print(html_row)

CONN.close()

print("""\t\t</table>
\t</body>
</html>
"""
)
