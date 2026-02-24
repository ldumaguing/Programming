#!/usr/bin/env python3
import py_package.combatants as cmbat
import sys
import re
import sqlite3


# ************************************************************************ main
if len(sys.argv) < 2:
    print("append <scenario file>")
    exit()

faction = ""

conn = sqlite3.connect("db/TLR.db")

with open(sys.argv[1], "r") as file:
    for line in file:
        line = line.strip()
        if re.search("^END", line):
            conn.close()
            exit()

        if re.search("^$", line) or re.search("^[\\*/#;\\-=]+", line):
            faction = ""
            continue
        else:
            if re.search("^American", line):
                if re.search(faction, line) != 0:
                    faction = "American"
                    continue
            if re.search("^Soviet", line):
                if re.search(faction, line) != 0:
                    faction = "Soviet"
                    continue
            cmbat.foo(conn, faction, line)
