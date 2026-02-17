#!/usr/bin/env python3
import sys
import re
# import sqlite3

missionName = ""


def instanciate_terrain(line):
    print(missionName + "..." + line)


def define_mission_name(line):
    X = line.split(":")
    return X[1]


# ************************************************************************ main
if len(sys.argv) < 3:
    print("Need <scenario file> and <ID>.")
    exit()

with open(sys.argv[1], "r") as file:
    for line in file:
        line = line.strip()
        if re.search("^END", line):
            exit()

        if re.search("^$", line) or re.search("^[\\*/#;\\-=]+", line):
            pass
        else:
            if re.search("^name", line):
                missionName = define_mission_name(line)
            if re.search("maps", line):
                instanciate_terrain(line)
                exit()
            print(line)
