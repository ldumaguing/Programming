import sqlite3
import py_package.SQL as SQL


CONN = sqlite3.connect("db/TLR.db")

stmt = "SELECT num1 FROM scenario WHERE key = 'currScenario' AND "
stmt += "id = 0"
scenario_id = SQL.get_field_value(CONN, stmt)

stmt = "SELECT id, unit_name, faction, loc_x, loc_y FROM instance "
stmt += f"WHERE scenario_id = {scenario_id} ORDER BY faction, "
stmt += "unit_name"
cursor = CONN.cursor()
cursor.execute(stmt)
rows = cursor.fetchall()
for row in rows:
    print(f"{row[2]: <10}{row[1]: <13}{row[0]: <5}")

CONN.close()
