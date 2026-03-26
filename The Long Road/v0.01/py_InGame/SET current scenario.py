import sys
import sqlite3
import py_package.SQL as SQL


if len(sys.argv) < 2:
    print("append <scenario id>")
    exit()

CONN = sqlite3.connect("db/TLR.db")

stmt = f"UPDATE scenario SET num1 = {sys.argv[1]} WHERE "
stmt += "key = 'currScenario'"
SQL.execute_sql(CONN, stmt)

CONN.close()

print(stmt)
