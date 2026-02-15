#!/usr/bin/env python3
import sys
import re
import sqlite3


def save_info(line, map_mode):
    if re.search("\\*", line):
        return

    if re.search("^TUNNEL ROAD", map_mode):
        return
    if re.search("^ROAD", map_mode):
        return
    if re.search("^RIVER", map_mode):
        return
    if re.search("^BRIDGE", map_mode):
        return

    line = line.upper()
    hexagons = line.split(",")
    A_ref = ord("A")
    for hexagon in hexagons:
        alpha = re.search("[A-Z]+", hexagon)
        X = ord(alpha[0]) - A_ref
        Y = re.search("[0-9]+", hexagon)

        print(str(X) + " " + Y[0])

    # print(hexagons)
    # X = re.search("[0-9]+", hexagons[0])
    # print(X[0])


# ************************************************************************
def put_empty_hexagon(loc_x, loc_y, filename):
    stmt = "INSERT INTO terrain (mapFile, hexID, loc_x, loc_y) VALUES ('" \
        + filename + "', " \
        + "'" + chr(ord('A') + loc_x) + str(loc_y + 1) + "', " \
        + str(loc_x) + ", " + str(loc_y) + ")"

    conn = sqlite3.connect("db/TLR.db")
    cursor = conn.cursor()
    cursor.execute(stmt)
    conn.commit()
    conn.close()


# ************************************************************************ main
if len(sys.argv) < 2:
    print("py/'slurp Map.py'  db/'Map A.txt'")
    exit()


conn = sqlite3.connect("db/TLR.db")
cursor = conn.cursor()

filename = sys.argv[1]
filename = filename.replace("db/", "")
filename = filename.replace(".txt", "")
stmt = "DELETE FROM terrain WHERE mapFile = '" + filename + "'"
cursor.execute(stmt)
conn.commit()


for loc_x in range(19):
    for y in range(13):
        loc_y = y - 1
        if (loc_x % 2) & (loc_y < 0):
            pass
        else:
            put_empty_hexagon(loc_x, loc_y, filename)

conn.close()


map_mode = ""
with open(sys.argv[1], "r") as file:
    for line in file:
        line = line.strip()
        if re.search("^$", line):
            pass
        else:
            if re.search("^HILL", line):
                map_mode = "HILL"
            if re.search("^ROLLING", line):
                map_mode = "ROLLING"
            if re.search("^FOREST", line):
                map_mode = "FOREST"
            if re.search("^TOWN", line):
                map_mode = "TOWN"
            if re.search("^CITY", line):
                map_mode = "CITY"
            if re.search("^LAKE", line):
                map_mode = "LAKE"
            if re.search("^CULTIVATED", line):
                map_mode = "CULTIVATED"

            if re.search("^TUNNEL ROAD", line):
                map_mode = "TUNNEL ROAD"
            if re.search("^ROAD", line):
                map_mode = "ROAD"
            if re.search("^RIVER", line):
                map_mode = "RIVER"
            if re.search("^BRIDGE", line):
                map_mode = "BRIDGE"

            save_info(line, map_mode)
