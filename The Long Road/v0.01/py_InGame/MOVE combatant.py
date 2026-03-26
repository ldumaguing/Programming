import sys
import sqlite3
import py_package.SQL as SQL


if len(sys.argv) < 2:
    print("append <direction>")
    print("       1 - N")
    print("       2 - NE")
    print("       3 - SE")
    print("       4 - S")
    print("       5 - SW")
    print("       6 - NW")
    exit()

CONN = sqlite3.connect("db/TLR.db")

stmt = "SELECT num1 FROM scenario WHERE "
stmt += "key = 'unitFocus'"
unit_id = SQL.get_field_value(CONN, stmt)

stmt = "SELECT num1 FROM scenario WHERE "
stmt += "key = 'currScenario'"
scenario_id = SQL.get_field_value(CONN, stmt)

stmt = "SELECT loc_x, loc_y FROM instance WHERE "
stmt += f"scenario_id = {scenario_id} AND "
stmt += f"id = {unit_id}"
rs = SQL.get_2columns(CONN, stmt)[0]
x = int(rs[0])
y = int(rs[1])
direction = int(sys.argv[1])
if x%2: # x is odd
    print("odd")
    if direction == 1:
        y -= 1
    elif direction == 2:
        x += 1
        y -= 1
    elif direction == 3:
        x += 1
    elif direction == 4:
        y += 1
    elif direction == 5:
        x -= 1
    else:
        x -= 1
        y -= 1
else:
    print("even")
    if direction == 1:
        y -= 1
    elif direction == 2:
        x += 1
    elif direction == 3:
        x += 1
        y += 1
    elif direction == 4:
        y += 1
    elif direction == 5:
        x -= 1
        y += 1
    else:
        x -= 1

stmt = "UPDATE instance SET "
stmt += f"loc_x = {x}, "
stmt += f"loc_y = {y} WHERE "
stmt += f"id = {unit_id} AND "
stmt += f"scenario_id = {scenario_id}"
SQL.execute_sql(CONN, stmt)

CONN.close()

print("done")
