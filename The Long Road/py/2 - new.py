#!/usr/bin/env python3
import py_package.commands as cmd
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
scenario_id = 0

conn = sqlite3.connect("db/TLR.db")


with open(sys.argv[1], "r") as file:
    for line in file:
        line = line.strip()
        if re.search("^END", line):
            conn.close()
            exit()

        if re.search("^id", line):
            scenario_id = get_scenario_id(line)
            stmt = f"DELETE FROM instance_unit WHERE scenario_id = {scenario_id}"
            cmd.sql_exec_stmt(conn, stmt)
            continue

        if re.search("^$", line) or re.search("^[\\*/#;\\-=]+", line):
            faction = ""
            continue
        else:
            if re.match("\\[new\\] ", line):
                cmd.new_unit(conn, line.replace("[new] ", ""), scenario_id)
            # cmbat.place(conn, faction, line, scenario_id)

























