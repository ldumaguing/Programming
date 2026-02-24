#!/usr/bin/env python3
import py_package.combatants as cmbat
import sys
import re
import sqlite3


scenario_id = 0


def get_scenario_id(line):
    X = line.split(":")
    return int(X[1])


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

        if re.search("^id", line):
            scenario_id = get_scenario_id(line)
            print(scenario_id)
            stmt = f"DELETE FROM instance WHERE scenario_id = {scenario_id}"
            cmbat.sql_exec_stmt(conn, stmt)
            continue

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
            cmbat.place(conn, faction, line)
