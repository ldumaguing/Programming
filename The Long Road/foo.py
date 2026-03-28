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

# stmt = "select * from img where flag1 & (1 << 6)" # HEF -1
# stmt = "select * from img where flag1 & (1 << 7)" # HEF +1
# stmt = """
# select * from img
# where
# flag1 & (1 << 6)
# or
# flag1 & (1 << 7)
# or
# flag1 & (1 << 8)
# or
# flag1 & (1 << 9)
# or
# flag1 & (1 << 10)
# """
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
    # if row[2] & (1 << 9):
    #     html_row += f"<td>HEF white frame</td>"
    # if row[2] & (1 << 10):
    #     html_row += f"<td>HEF white font</td>"
    # html_row += f"<td>HEF range ({row[6]})</td>"
    bit_3n4 = ""
    if int(row[2]) & (1 << 3):
        bit_3n4 = "-1"
    if int(row[2]) & (1 << 4):
        bit_3n4 = "+1"
    bit_6n7 = ""
    if int(row[2]) & (1 << 6):
        bit_6n7 = "-1"
    if int(row[2]) & (1 << 7):
        bit_6n7 = "+1"
    bit_2 = ""
    if int(row[2]) & (1 << 2):
        bit_2 = "wire guided missile<br>"
    bit_5 = ""
    if int(row[2]) & (1 << 5):
        bit_5 = "range effects doesn't apply<br>"
    bit_10 = ""
    if int(row[2]) & (1 << 10):
        bit_10 = "<br>range effects doesn't apply"
    apf = ""
    if int(row[3]) >= 0:
        apf = f"APF: {row[4]} {row[3]}<sup>{bit_3n4}</sup><br>";
    apf2 = ""
    if int(row[14]) >= 0:
        apf2 = f"APF<sub>2</sub>: {row[15]} {row[14]}<br>";
    hef = ""
    if int(row[5]) >= 0:
        hef = f"HEF: {row[6]} {row[5]}<sup>{bit_6n7}</sup>"
    hef2 = ""
    if int(row[16]) >= 0:
        hef2 = f"<br>HEF<sub>2</sub>: {row[17]} {row[16]}"
    bit_8 = ""
    if int(row[2]) & (1 << 8):
        bit_8 = "<br>may attack Armor 4 or less"
    bit_9 = ""
    if int(row[2]) & (1 << 9):
        bit_9 = "<br>cannot fire into adjacent hex"
    html_row += f"<td>{bit_2}{bit_5}{apf}{apf2}{hef}{bit_8}{bit_9}{bit_10}{hef2}</td>"
    # *****
    if int(row[7]) >= 0:
        mov = f"MF: {row[7]}"
        html_row += f"<td>{mov}</td>"
    else:
        html_row += "<td></td>"
    # html_row += f"<td>HEF val ({row[5]})</td>"
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
