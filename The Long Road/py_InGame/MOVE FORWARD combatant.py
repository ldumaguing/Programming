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

stmt = "SELECT img_id, loc_x, loc_y, id, stack_lvl, status "
stmt += "FROM instance WHERE "
stmt += f"id = {unit_id} AND scenario_id = {scenario_id}"
print(stmt)
combatants = SQL.get_combatants(CONN, stmt)[0]
x = combatants[1]
y = combatants[2]
status = combatants[5]
facing = status >> 13
print(facing)

CONN.close()

print("done")
