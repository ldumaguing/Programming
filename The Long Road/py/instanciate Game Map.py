#!/usr/bin/env python3
import sys
import re
import sqlite3

missionName = ""


def put_plate(letter, row, col, conn):
    map_plate = "Map " + letter
    print("---" + map_plate + "," + str(row) + "," + str(col))

    for i in range(19):
        print(i)
        if i % 2:
            for j in range(12):
                print(" " + str(j))
        else:
            for j in range(13):
                print(" " + str(j-1))


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
                cursor = conn.cursor()
                cursor.execute(stmt)
                conn.commit()
            if re.search("maps", line):
                instanciate_terrain(line, conn)
                conn.close()
                exit()
            # print(line)
