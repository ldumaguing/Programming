#!/usr/bin/env python3
import sys
import re
import sqlite3


def save_spine_info(line, terrain_type, conn, filename):
    line = line.upper()
    print(line)
    hexagons = line.split(",")
    A_ref = ord("A")
    for hexagon in hexagons:
        alpha = re.search("[A-Z]+", hexagon)
        X = ord(alpha[0]) - A_ref
        y = re.search("[0-9]+", hexagon)
        Y = int(y[0]) - 1
        print(str(X) + "," + str(Y))


# *****************************************************************************
def save_info(line, terrain_type, conn, filename):
    if re.search("\\*", line):
        return

    if re.search("^TUNNEL ROAD", terrain_type):
        save_spine_info(line, "TUNNEL ROAD", conn, filename)
        return
    if re.search("^ROAD", terrain_type):
        save_spine_info(line, "ROAD", conn, filename)
        return
    if re.search("^RIVER", terrain_type):
        save_spine_info(line, "RIVER", conn, filename)
        return
    if re.search("^BRIDGE", terrain_type):
        save_spine_info(line, "BRIDGE", conn, filename)
        return

    line = line.upper()
    hexagons = line.split(",")
    A_ref = ord("A")
    for hexagon in hexagons:
        stmt = "UPDATE terrain SET "
        alpha = re.search("[A-Z]+", hexagon)
        X = ord(alpha[0]) - A_ref
        Y = re.search("[0-9]+", hexagon)

        if terrain_type == "HILL":
            stmt += "flag1 = (flag1 | (1 << 0)) "
        if terrain_type == "ROLLING":
            stmt += "flag1 = (flag1 | (1 << 13)) "
        if terrain_type == "FOREST":
            stmt += "flag1 = (flag1 | (1 << 14)) "
        if terrain_type == "TOWN":
            stmt += "flag1 = (flag1 | (1 << 15)) "
        if terrain_type == "CITY":
            stmt += "flag2 = (flag2 | (1 << 0)) "
        if terrain_type == "CULTIVATED":
            stmt += "flag2 = (flag2 | (1 << 1)) "
        if terrain_type == "LAKE":
            stmt += "flag2 = (flag2 | (1 << 2)) "
        stmt += "WHERE loc_x = " + str(X) + " AND "
        stmt += "loc_y = " + str(int(Y[0]) - 1) + " AND "
        stmt += "mapFile = '" + filename + "'"

        cursor = conn.cursor()
        cursor.execute(stmt)
    conn.commit()


# *****************************************************************************
def put_empty_hexagon(loc_x, loc_y, filename, conn):
    stmt = "INSERT INTO terrain (mapFile, hexID, loc_x, loc_y) VALUES ('" \
        + filename + "', " \
        + "'" + chr(ord('A') + loc_x) + str(loc_y + 1) + "', " \
        + str(loc_x) + ", " + str(loc_y) + ")"

    cursor = conn.cursor()
    cursor.execute(stmt)
    conn.commit()


# ************************************************************************ main
if len(sys.argv) < 2:
    print("py/'slurp Map.py'  db/'Map A.txt'")
    exit()

conn = sqlite3.connect("db/TLR.db")
cursor = conn.cursor()

filename = sys.argv[1]
filename = filename.replace("db/", "")
filename = filename.replace(".txt", "")

# stmt = "DELETE FROM terrain WHERE mapFile = '" + filename + "'"
# cursor.execute(stmt)
# conn.commit()

for loc_x in range(19):
    for y in range(13):
        loc_y = y - 1
        if (loc_x % 2) & (loc_y < 0):
            pass
        else:
            pass
            # put_empty_hexagon(loc_x, loc_y, filename, conn)


terrain_type = ""
with open(sys.argv[1], "r") as file:
    for line in file:
        line = line.strip()
        if re.search("^$", line):
            pass
        else:
            if re.search("^HILL", line):
                terrain_type = "HILL"
            if re.search("^ROLLING", line):
                terrain_type = "ROLLING"
            if re.search("^FOREST", line):
                terrain_type = "FOREST"
            if re.search("^TOWN", line):
                terrain_type = "TOWN"
            if re.search("^CITY", line):
                terrain_type = "CITY"
            if re.search("^LAKE", line):
                terrain_type = "LAKE"
            if re.search("^CULTIVATED", line):
                terrain_type = "CULTIVATED"

            if re.search("^TUNNEL ROAD", line):
                terrain_type = "TUNNEL ROAD"
            if re.search("^ROAD", line):
                terrain_type = "ROAD"
            if re.search("^RIVER", line):
                terrain_type = "RIVER"
            if re.search("^BRIDGE", line):
                terrain_type = "BRIDGE"

            save_info(line, terrain_type, conn, filename)

conn.close()
