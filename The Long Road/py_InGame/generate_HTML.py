#!/usr/bin/env python3
import py_package.SQL as sql
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

conn = sqlite3.connect("db/TLR.db")

with open(sys.argv[1], "r") as file:
    for line in file:
        line = line.strip()
        if re.search("^END", line):
            conn.close()
            exit()
        if re.search("^id", line):
            scenario_id = get_scenario_id(line)
            break

print(f"yo: {scenario_id}")
fields = "id, scenario_id, faction"
table = "instance"
where = "id = 1014"
rs = sql.get_row(conn, scenario_id, fields, table, where)
print(rs[2])
