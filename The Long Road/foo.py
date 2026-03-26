import sqlite3


print ("""<!DOCTYPE html>
<html>
   <head>
      <meta charset="UTF-8">
      <title>The Long Road</title>
   </head>
   <body>
      <table>"""
)

CONN = sqlite3.connect("db/TLR.db")

stmt = "SELECT * FROM img WHERE flag1 = 0"
cursor = CONN.cursor()
cursor.execute(stmt)
rows = cursor.fetchall()
for row in rows:
    html_row = f"\t\t<tr><td>{row[0]}</td>"
    html_row += f"<td>{row[1]}</td>"
    html_row += f"<td><img src=\"TLR/{row[1]}\"></td>"
    html_row += "</tr>"
    print(html_row)

CONN.close()

print("""      </table>
   </body>
</html>
"""
)
