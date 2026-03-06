import sys
import sqlite3
import py_package.SQL as SQL


if len(sys.argv) < 2:
    print("append <x,y>")
    exit()

foo = sys.argv[1].split(",")
x = int(foo[0])
y = int(foo[1])

CONN = sqlite3.connect("db/TLR.db")

stmt = "SELECT num1 FROM scenario WHERE "
stmt += "key = 'unitFocus'"
unit_id = SQL.get_field_value(CONN, stmt)

stmt = "SELECT num1 FROM scenario WHERE "
stmt += "key = 'currScenario'"
scenario_id = SQL.get_field_value(CONN, stmt)

stmt = "UPDATE instance SET "
stmt += f"loc_x = {x}, "
stmt += f"loc_y = {y} WHERE "
stmt += f"id = {unit_id} AND "
stmt += f"scenario_id = {scenario_id}"
SQL.execute_sql(CONN, stmt)

CONN.close()

print("done")
