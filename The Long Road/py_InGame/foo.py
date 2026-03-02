#!/usr/bin/env python3
# import py_package.SQL as SQL
import py_package.COMMANDS as cmd
# import sys
# import re
import sqlite3


scenario_id = 1
unit_id = 1000
loc_x = 8
loc_y = 8
CONN = sqlite3.connect("db/TLR.db")

cmd.place(CONN, scenario_id, (unit_id, loc_x, loc_y))
cmd.place(CONN, scenario_id, (unit_id + 1, loc_x, loc_y))
cmd.place(CONN, scenario_id, (unit_id + 2, loc_x, loc_y))
cmd.place(CONN, scenario_id, (unit_id + 3, loc_x, loc_y))
# cmd.remove_combatant(CONN, scenario_id, (unit_id + 1))

CONN.close()
