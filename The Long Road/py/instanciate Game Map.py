#!/usr/bin/env python3
import sys
import re
import sqlite3

missionName = ""


def sql_exec_stmt(conn, stmt):
    cursor = conn.cursor()
    cursor.execute(stmt)
    conn.commit()


def populate_terrain_temp(map_plate, conn):
    # ***** rotate plate
    stmt = "INSERT INTO terrain_temp "
    stmt += "(loc_x, loc_y, flag1, flag2) "
    stmt += "SELECT 18 - loc_x, 10 - loc_y, flag1, flag2 FROM terrain "
    stmt += "WHERE mapFile = '" + map_plate + "' AND "
    stmt += "(loc_x % 2) = 0"
    sql_exec_stmt(conn, stmt)
    stmt = "INSERT INTO terrain_temp "
    stmt += "(loc_x, loc_y, flag1, flag2) "
    stmt += "SELECT 18 - loc_x, 11 - loc_y, flag1, flag2 FROM terrain "
    stmt += "WHERE mapFile = '" + map_plate + "' AND "
    stmt += "(loc_x % 2) = 1"
    sql_exec_stmt(conn, stmt)
    # ***** rotate each hexes
    stmt = """
        update terrain_temp set flag1 =
        (flag1 & 57345) |
        ((((((flag1 & 16510) >> 1) >> 3) |
        (((flag1 & 16510) >> 1) << 3)) & 63) << 1) |
        ((((((flag1 & 8064) >> 7) >> 3) |
        (((flag1 & 8064) >> 7) << 3)) & 63) << 7)
        """
    sql_exec_stmt(conn, stmt)


def plate_0x0(map_plate, row, col, conn, r):
    print("0x0")
    populate_terrain_temp(map_plate, conn)
    stmt = "INSERT INTO terrain_instance "
    stmt += "(gameName, loc_x, loc_y, flag1, flag2) "
    stmt += "SELECT '" + missionName + "', "
    if r:
        stmt += "loc_x, loc_y, flag1, flag2 "
        stmt += "FROM terrain_temp"
        sql_exec_stmt(conn, stmt)
    else:
        stmt += "loc_x, loc_y, flag1, flag2 "
        stmt += "FROM terrain "
        stmt += "WHERE mapFile = '" + map_plate + "'"
        sql_exec_stmt(conn, stmt)


def seam_0x1(map_plate, row_shift, col_shift, conn, r):
    stmt = ""
    for y in range(12):
        if r:
            stmt = f"""
                UPDATE terrain_instance AS aaa
                SET flag1 = (
                select aaa.flag1 | flag1 FROM terrain_temp
                WHERE
                loc_x = 0
                AND
                loc_y = {y+row_shift}
                )
                WHERE
                loc_x = {col_shift}
                AND
                loc_y = {y+row_shift}
                """
        else:
            stmt = f"""
                UPDATE terrain_instance AS aaa
                SET flag1 = (
                select aaa.flag1 | flag1 FROM terrain
                WHERE
                loc_x = 0
                AND
                loc_y = {y+row_shift}
                AND
                mapFile = '{map_plate}'
                )
                WHERE
                loc_x = {col_shift}
                AND
                loc_y = {y+row_shift}
                """
        sql_exec_stmt(conn, stmt)


def plate_0x1(map_plate, row, col, conn, r):
    print("0x1")
    populate_terrain_temp(map_plate, conn)
    col_shift = 18 * col
    stmt = "INSERT INTO terrain_instance "
    stmt += "(gameName, loc_x, loc_y, flag1, flag2) "
    stmt += "SELECT '" + missionName + "', "
    if r:
        stmt += "loc_x + " + str(col_shift) + ", "
        stmt += "loc_y, flag1, flag2 "
        stmt += "FROM terrain_temp "
        stmt += "WHERE loc_x > 0"
        sql_exec_stmt(conn, stmt)
    else:
        stmt += "loc_x + " + str(col_shift) + ", "
        stmt += "loc_y, flag1, flag2 "
        stmt += "FROM terrain "
        stmt += "WHERE mapFile = '" + map_plate + "' "
        stmt += "AND loc_x > 0"
        sql_exec_stmt(conn, stmt)
    seam_0x1(map_plate, 0, col_shift, conn, r)


def seam_1x0(map_plate, row_shift, col_shift, conn, r):
    print("yo: " + str(row_shift))
    stmt = ""
    for x in range(0, 20, 2):
        if r:
            stmt = f"""
                UPDATE terrain_instance AS aaa
                SET flag1 = (
                select aaa.flag1 | flag1 FROM terrain_temp
                WHERE
                loc_x = {x+col_shift}
                AND
                loc_y = -1
                )
                WHERE
                loc_x = {x+col_shift}
                AND
                loc_y = {row_shift}
                """
        else:
            stmt = f"""
                UPDATE terrain_instance AS aaa
                SET flag1 = (
                select aaa.flag1 | flag1 FROM terrain
                WHERE
                loc_x = {x+col_shift}
                AND
                loc_y = -1
                AND
                mapFile = '{map_plate}'
                )
                WHERE
                loc_x = {x+col_shift}
                AND
                loc_y = {row_shift}
                """


def plate_1x0(map_plate, row, col, conn, r):
    print("1x0")
    populate_terrain_temp(map_plate, conn)
    row_shift = 12 * row
    stmt = "INSERT INTO terrain_instance "
    stmt += "(gameName, loc_x, loc_y, flag1, flag2) "
    stmt += "SELECT '" + missionName + "', "
    if r:
        stmt += "loc_x, "
        stmt += "loc_y + " + str(row_shift) + ", "
        stmt += "flag1, flag2 "
        stmt += "FROM terrain_temp "
        stmt += "WHERE loc_y >= 0"
        sql_exec_stmt(conn, stmt)
    else:
        stmt += "loc_x, "
        stmt += "loc_y + " + str(row_shift) + ", "
        stmt += "flag1, flag2 "
        stmt += "FROM terrain "
        stmt += "WHERE mapFile = '" + map_plate + "' "
        stmt += "AND loc_y >= 0"
        sql_exec_stmt(conn, stmt)
    seam_1x0(map_plate, row_shift, 0, conn, r)


def seam_1x1(map_plate, row_shift, col_shift, conn, r):
    print("yo: " + str(row_shift) + "," + str(col_shift))
    seam_0x1(map_plate, row_shift, col_shift, conn, r)
    seam_1x0(map_plate, row_shift, col_shift, conn, r)


def plate_1x1(map_plate, row, col, conn, r):
    print("1x1")
    populate_terrain_temp(map_plate, conn)
    col_shift = 18 * col
    row_shift = 12 * row
    stmt = "INSERT INTO terrain_instance "
    stmt += "(gameName, loc_x, loc_y, flag1, flag2) "
    if r:
        stmt += "SELECT '" + missionName + "', "
        stmt += "loc_x + " + str(col_shift) + ", "
        stmt += "loc_y + " + str(row_shift) + ", "
        stmt += "flag1, flag2 FROM terrain_temp "
        stmt += "WHERE loc_x > 0 AND loc_y >= 0"
        sql_exec_stmt(conn, stmt)
    else:
        stmt += "SELECT '" + missionName + "', "
        stmt += "loc_x + " + str(col_shift) + ", "
        stmt += "loc_y + " + str(row_shift) + ", "
        stmt += "flag1, flag2 FROM terrain "
        stmt += "WHERE mapFile = '" + map_plate + "' "
        stmt += "AND loc_x > 0 AND loc_y >= 0"
        sql_exec_stmt(conn, stmt)
    seam_1x1(map_plate, row_shift, col_shift, conn, r)


def put_plate(letter, row, col, conn):
    rotate180 = 0
    if re.search("[a-z]+", letter):
        sql_exec_stmt(conn, "DELETE FROM terrain_temp")
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
                stmt = (
                    "DELETE FROM terrain_instance WHERE gameName = '"
                    + missionName
                    + "'"
                )
                # print(stmt)
                sql_exec_stmt(conn, stmt)
            if re.search("maps", line):
                instanciate_terrain(line, conn)
                conn.close()
                exit()
            # print(line)
