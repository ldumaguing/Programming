import sys
import sqlite3
import py_package.SQL as SQL


CONN = sqlite3.connect("db/TLR.db")

stmt = "SELECT num1 FROM scenario WHERE "
stmt += "key = 'unitFocus'"
unit_id = SQL.get_field_value(CONN, stmt)

stmt = "SELECT num1 FROM scenario WHERE "
stmt += "key = 'currScenario'"
scenario_id = SQL.get_field_value(CONN, stmt)

stmt = "SELECT status FROM instance WHERE "
stmt += f"id = {unit_id} AND scenario_id = {scenario_id}"
X = int(SQL.get_field_value(CONN, stmt))
status = X & 8191 # 1FFF
facing = X >> 13
facing -= 1
if facing < 0:
    facing = 5
facing = facing << 13
status = facing | status
stmt = f"UPDATE instance SET status = {status} WHERE "
stmt += f"id = {unit_id} AND scenario_id = {scenario_id}"
SQL.execute_sql(CONN, stmt)

CONN.close()

print("done")
