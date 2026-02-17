#!/usr/bin/env python3
import sys
import re
import sqlite3

missionName = ""


def clear_temp(conn):
    stmt = "DELETE FROM terrain_temp"
    cursor = conn.cursor()
    cursor.execute(stmt)
    conn.commit()


def plate_0x0(map_plate, row, col, conn, r):
    stmt = ""
    if r:
        stmt = "INSERT INTO terrain_temp "
        stmt += "(loc_x, loc_y, flag1, flag2) "
        stmt += "SELECT 18 - loc_x, 10 - loc_y, flag1, flag2 FROM terrain "
        stmt += "WHERE mapFile = '" + map_plate + "'"
    else:
        stmt = "INSERT INTO terrain_instance "
        stmt += "(gameName, loc_x, loc_y, flag1, flag2) "
        stmt += "SELECT '" + missionName
        stmt += "', loc_x, loc_y, flag1, flag2 FROM "
        stmt += "terrain WHERE mapFile = '" + map_plate + "'"
    # cursor = conn.cursor()
    # cursor.execute(stmt)
    # conn.commit()
    print(stmt)


def plate_0x1(map_plate, row, col, conn, r):
    col_shift = 18 * col
    stmt = "INSERT INTO terrain_instance "
    stmt += "(gameName, loc_x, loc_y, flag1, flag2) "
    stmt += "SELECT '" + missionName + "', loc_x + " + str(col_shift) + ", "
    stmt += "loc_y, flag1, flag2 FROM "
    stmt += "terrain WHERE mapFile = '" + map_plate + "' AND loc_x > 0"
    cursor = conn.cursor()
    cursor.execute(stmt)
    conn.commit()


def plate_1x0(map_plate, row, col, conn, r):
    row_shift = 12 * row
    stmt = "INSERT INTO terrain_instance "
    stmt += "(gameName, loc_x, loc_y, flag1, flag2) "
    stmt += "SELECT '" + missionName + "', loc_x, loc_y + "
    stmt += str(row_shift) + ", flag1, flag2 FROM terrain WHERE mapFile = '"
    stmt += map_plate + "' AND loc_y >= 0"
    cursor = conn.cursor()
    cursor.execute(stmt)
    conn.commit()


def plate_1x1(map_plate, row, col, conn, r):
    col_shift = 18 * col
    row_shift = 12 * row
    stmt = "INSERT INTO terrain_instance "
    stmt += "(gameName, loc_x, loc_y, flag1, flag2) "
    stmt += "SELECT '" + missionName + "', "
    stmt += "loc_x + " + str(col_shift) + ", "
    stmt += "loc_y + " + str(row_shift) + ", flag1, flag2 FROM terrain WHERE "
    stmt += "mapFile = '" + map_plate + "' "
    stmt += " AND loc_x > 0 AND loc_y >= 0"
    cursor = conn.cursor()
    cursor.execute(stmt)
    conn.commit()


def put_plate(letter, row, col, conn):
    rotate180 = 0
    if re.search("[a-z]+", letter):
        print("lower case")
        clear_temp(conn)
        rotate180 = 1

    map_plate = "Map " + letter.upper()

    if row == 0 and col == 0:
        plate_0x0(map_plate, row, col, conn, rotate180)
        return

    if row == 0 and col >= 1:
        plate_0x1(map_plate, row, col, conn, rotate180)
        return

    if row >= 1 and col == 0:
        plate_1x0(map_plate, row, col, conn, rotate180)
        return

    if row >= 1 and col >= 1:
        plate_1x1(map_plate, row, col, conn, rotate180)
        return


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
                # print(stmt)
                cursor = conn.cursor()
                cursor.execute(stmt)
                conn.commit()
            if re.search("maps", line):
                instanciate_terrain(line, conn)
                conn.close()
                exit()
            # print(line)
