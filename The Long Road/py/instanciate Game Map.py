#!/usr/bin/env python3
import sys
import re
import sqlite3

missionName = ""


def plate_0x0(map_plate, row, col, conn):
    print("plate 0x0")
    stmt = "INSERT INTO terrain_instance (gameName, loc_x, loc_y, flag1, flag2) "
    stmt += "SELECT '" + missionName + "', loc_x, loc_y, flag1, flag2 FROM "
    stmt += "terrain WHERE mapFile = '" + map_plate + "'"
    cursor = conn.cursor()
    cursor.execute(stmt)
    conn.commit()


def plate_0x1(map_plate, row, col, conn):
    print("plate 0x1")
    col_shift = 18 * col
    stmt = "INSERT INTO terrain_instance (gameName, loc_x, loc_y, flag1, flag2) "
    stmt += "SELECT '" + missionName + "', loc_x + " + str(col_shift) + ", "
    stmt += "loc_y, flag1, flag2 FROM "
    stmt += "terrain WHERE mapFile = '" + map_plate + "' AND loc_x > 0"
    # print(stmt)
    cursor = conn.cursor()
    cursor.execute(stmt)
    conn.commit()


def plate_1x0(map_plate, row, col, conn):
    print("plage 1x0")
    row_shift = 12 * row
    stmt = "INSERT INTO terrain_instance (gameName, loc_x, loc_y, flag1, flag2) "
    stmt += "SELECT '" + missionName + "', loc_x, loc_y + "
    stmt += str(row_shift) + ", flag1, flag2 FROM terrain WHERE mapFile = '"
    stmt += map_plate + "' AND loc_y >= 0"
    # print(stmt)
    cursor = conn.cursor()
    cursor.execute(stmt)
    conn.commit()


def put_plate(letter, row, col, conn):
    map_plate = "Map " + letter

    if row == 0 and col == 0:
        plate_0x0(map_plate, row, col, conn)
        return

    if row == 0 and col >= 1:
        plate_0x1(map_plate, row, col, conn)
        return

    if row >= 1 and col == 0:
        plate_1x0(map_plate, row, col, conn)
        return

    for i in range(19):
        # print(i)
        if i % 2:
            for j in range(12):
                pass
                # print(" " + str(j))
        else:
            for j in range(13):
                pass
                # print(" " + str(j-1))


def instanciate_terrain(line, conn):
    # print(missionName)
    X = (line.split(":"))[1]
    rows = X.split("_")
    # print(len(rows))
    for i in range(len(rows)):
        # print(rows[i])
        X = rows[i].split(",")
        # print(X)
        for j in range(len(X)):
            # print(X[j])
            put_plate(X[j], i, j, conn)


def define_mission_name(line):
    X = line.split(":")
    return X[1]


# ************************************************************************ main
if len(sys.argv) < 2:
    print("append <scenario file>")
    exit()

conn = sqlite3.connect("db/TLR.db")

with open(sys.argv[1], "r") as file:
    for line in file:
        line = line.strip()
        if re.search("^END", line):
            conn.close()
            exit()

        if re.search("^$", line) or re.search("^[\\*/#;\\-=]+", line):
            pass
        else:
            if re.search("^name", line):
                missionName = define_mission_name(line)
                stmt = "DELETE FROM terrain_instance WHERE gameName = '" \
                    + missionName + "'"
                print(stmt)
                cursor = conn.cursor()
                cursor.execute(stmt)
                conn.commit()
            if re.search("maps", line):
                instanciate_terrain(line, conn)
                conn.close()
                exit()
            # print(line)
