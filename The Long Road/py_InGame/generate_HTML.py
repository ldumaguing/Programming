#!/usr/bin/env python3
import py_package.SQL as SQL
import sys
import re
import sqlite3


SCENARIO_ID = 0
html_0 = """
<!DOCTYPE html>
<html>

<head>
   <meta charset="UTF-8">
   <title>The Long Road</title>
   <style type="text/css">
      body {
         margin: 0;
      }
   </style>
</head>

<body onload="pageLoad();">
   <div style="display:none;"> """
html_maps = """      <img src="TLR/TRL_Map_A_Final.jpg" id="map0">
      <img src="TLR/TRL_Map_B_Final.jpg" id="map1">
      <img src="TLR/TRL_Map_C_Final.jpg" id="map2">
      <img src="TLR/TLR_Map_D_Final.jpg" id="map3">"""


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
print(row[2])
print(html_0)
print(html_maps)
imgs = SQL.get_imgs(CONN, SCENARIO_ID)
for img in imgs:
    X = img.split(":")
    line = f"      <img src=\"TLR/{X[0]}\" id=\"img{X[1]}\">"
    print(line)
print("   </div>")
