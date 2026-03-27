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

stmt = "SELECT * FROM img WHERE (flag1 & 1) or (flag3 & (1<<6)) " # img
# stmt = "SELECT * FROM img WHERE apf_rng != '' and ((flag1 & 1) or (flag3 & (1<<6)))"
# stmt = "SELECT * FROM img WHERE apf_rng = '' and ((flag1 & 1) or (flag3 & (1<<6)))" # no apf range
# stmt = "SELECT * FROM img WHERE (flag1 & (1<<2))"  # guided missle
stmt += "ORDER BY id"
cursor = CONN.cursor()
cursor.execute(stmt)
rows = cursor.fetchall()
for row in rows:
    html_row = f"\t\t\t<tr><td>{row[0]}</td>"
    # html_row += f"<td>{row[1]}</td>" # file
    html_row += f"<td><img src=\"TLR/{row[1]}\"></td>"
    # if row[2] & (1 << 0):
    #     html_row += f"<td>158x158</td>"
    # if row[2] & (1 << 2):
    #     html_row += f"<td>wired guided missile</td>"
    # if row[2] & (1 << 3):
    #     html_row += f"<td>APF -1</td>"
    # if row[2] & (1 << 4):
    #     html_row += f"<td>APF +1</td>"
    # if row[2] & (1 << 5):
    #     html_row += f"<td>APF white font</td>"
    # html_row += f"<td>APF range ({row[4]})</td>"
    # if row[2] & (1 << 6):
    #     html_row += f"<td>HEF -1</td>"
    # if row[2] & (1 << 7):
    #     html_row += f"<td>HEF +1</td>"
    # if row[2] & (1 << 8):
    #     html_row += f"<td>HEF yellow frame</td>"
    if row[2] & (1 << 9):
        html_row += f"<td>HEF white frame</td>"
    # html_row += f"<td>{hex(row[2])}</td>"
    # html_row += f"<td>{hex(row[9])}</td>"
    # html_row += f"<td>{hex(row[11])}</td>"
    # html_row += f"<td>{hex(row[12])}</td>"
    # html_row += f"<td>{hex(row[13])}</td>"
    html_row += "</tr>"
    print(html_row)

CONN.close()

print("""\t\t</table>
\t</body>
</html>
"""
)
