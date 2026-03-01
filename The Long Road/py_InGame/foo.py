#!/usr/bin/env python3
# import py_package.SQL as SQL
import py_package.commands as cmd
# import sys
# import re
import sqlite3


CONN = sqlite3.connect("db/TLR.db")
hex_loc = (3, 4)
X = cmd.get_combatants_in_hex(CONN, 1, hex_loc)
print(X)

CONN.close()
