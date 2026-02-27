#!/usr/bin/env python3
import py_package.SQL as SQL
import py_package.HTML as HTML
import sys
import re
import sqlite3


SCENARIO_ID = 0
html_0 = """<!DOCTYPE html>
<html>

<head>
\t<meta charset="UTF-8">
\t<title>The Long Road</title>
\t<style type="text/css">
\t\tbody {
\t\t\tmargin: 0;
\t\t}
\t</style>
</head>

<body onload="pageLoad();">
\t<div style="display:none;"> """
html_maps = """\t\t<img src="TLR/TRL_Map_A_Final.jpg" id="mapA">
\t\t<img src="TLR/TRL_Map_B_Final.jpg" id="mapB">
\t\t<img src="TLR/TRL_Map_C_Final.jpg" id="mapC">
\t\t<img src="TLR/TLR_Map_D_Final.jpg" id="mapD">"""
html_script = """
\t<script type="text/javascript">
\t\tfunction pageLoad() {
\t\t\tconst canvas = document.getElementById("myCanvas");
\t\t\tconst ctx = canvas.getContext("2d");"""


def get_scenario_id(line):
    X = line.split(":")
    return int(X[1])


# ************************************************************************ main
if len(sys.argv) < 2:
    print("append <scenario file>")
    exit()

CONN = sqlite3.connect("db/TLR.db")

with open(sys.argv[1], "r") as file:
    for line in file:
        line = line.strip()
        if re.search("^END", line):
            CONN.close()
            exit()
        if re.search("^id", line):
            SCENARIO_ID = get_scenario_id(line)
            break

fields = "id, scenario_id, faction"
table = "instance"
where = "id = 1014"
row = SQL.get_row(CONN, SCENARIO_ID, fields, table, where)
# print(row[2])
print(html_0)
print(html_maps)
imgs = SQL.get_imgs(CONN, SCENARIO_ID)
for img in imgs:
    X = img.split(":")
    line = f"\t\t<img src=\"TLR/{X[0]}\" id=\"img{X[1]}\">"
    print(line)
print("\t</div>")
print(html_script)

fields = "num1, num2"
table = "scenario"

where = f"key = 'plateMap_dim' AND id = 0"
plateMap_dim = SQL.get_row(CONN, 0, fields, table, where)

where = f"key = 'upperLeft' AND id = 0"
upperLeft = SQL.get_row(CONN, 0, fields, table, where)

where = f"key = 'lowerRight' AND id = 0"
lowerRight = SQL.get_row(CONN, 0, fields, table, where)

where = f"key = 'hexCount' AND id = 0"
hexCount = SQL.get_row(CONN, 0, fields, table, where)

hexW = (lowerRight[0] - upperLeft[0]) / (hexCount[0] - 1)
hexH = (lowerRight[1] - upperLeft[1]) / (hexCount[1] - 1)

fields = "txt_val"
where = f"key = 'maps' AND id = {SCENARIO_ID}"
maps = SQL.get_row(CONN, 0, fields, table, where)[0]
rows = maps.split("_")
rowNum = len(rows)
colNum = 0
for y in range(rowNum):
    cols = rows[y].split(",")
    if colNum < len(cols):
        colNum = len(cols)
    for x in range(colNum):
        letter = cols[x]
        HTML.print_map(f"{letter}", x, y, plateMap_dim, rowNum, colNum)
HTML.print_html_end(rowNum, colNum, plateMap_dim)
