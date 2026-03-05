import sqlite3
import py_package.SQL as SQL


CONN = sqlite3.connect("db/TLR.db")

stmt = "SELECT num1 FROM scenario WHERE key = 'currScenario' AND "
stmt += "id = 0"
scenario_id = SQL.get_field_value(CONN, stmt)

stmt = "SELECT id, unit_name"



CONN.close()
