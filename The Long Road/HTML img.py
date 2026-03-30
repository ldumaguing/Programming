import sqlite3


def col_1(row):
    html_row = f"\t\t\t<tr><td>{row[0]}</td>"
    # html_row += f"<td>{row[1]}</td>" # file
    html_row += f"<td><img src=\"TLR/{row[1]}\"></td>"
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

    return html_row


# ******************************************************************************
def mov_mods(row):
    mov = f"MF: {row[7]}"
    html_row = f"<td>{mov}"
    if int(row[2]) & (1 << 11):
        html_row += "<br>1-column shift"
    if int(row[2]) & (1 << 12):
        html_row += "<br>2-column shift"
    if int(row[2]) & (3 << 13):
        if int(row[2]) & (1 << 14):
            html_row += "<br>transporter (recon only)"
        else:
            html_row += "<br>transporter"
    if int(row[2]) & (1 << 15):
        html_row += "<br>&emsp;unit inside may fire"
    html_row += "</td>"

    return html_row


# ******************************************************************************
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
stmt += "ORDER BY id"
cursor = CONN.cursor()
cursor.execute(stmt)
rows = cursor.fetchall()
for row in rows:
    html_row = col_1(row)
    if int(row[7]) >= 0:
        html_row += mov_mods(row)
    else:
        html_row += "<td></td>"
    html_row += "</tr>"
    print(html_row)

CONN.close()

print("""\t\t</table>
\t</body>
</html>
"""
)
