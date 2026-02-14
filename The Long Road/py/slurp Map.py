#!/usr/bin/env python3
import sys
import re

# ***************************************************************************************
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

    hexagons = line.split(",")
    print(hexagons)
    X = re.search("[0-9]+", hexagons[0])
    print(X[0])

# ***************************************************************************************
if len(sys.argv) < 2:
    print("py/'slurp Map.py'  db/'Map A.txt'")
    exit()

map_mode = ""
with open(sys.argv[1], 'r') as file:
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

