import sqlite3
import py_package.SQL as SQL


def is_in_focus(unit_id):
    stmt = "SELECT num1 FROM scenario WHERE key = 'unitFocus'"
    X = SQL.get_field_value(CONN, stmt)
    if unit_id == X:
        return 1
    return 0


def get_status(status):
    stts = ""
    if status & (1<<7):
        stts += "F"
    else:
        stts += "."

    if status & (1<<8):
        stts += "M"
    else:
        stts += "."

    if status & (1<<9):
        stts += "D"
    else:
        stts += "."

    if status & (1<<1):
        stts += "R"
    else:
        stts += "."

    return stts


CONN = sqlite3.connect("db/TLR.db")

stmt = "SELECT num1 FROM scenario WHERE key = 'currScenario' AND "
stmt += "id = 0"
scenario_id = SQL.get_field_value(CONN, stmt)

stmt = "SELECT id, unit_name, faction, loc_x, loc_y, status FROM instance "
stmt += f"WHERE scenario_id = {scenario_id} ORDER BY faction, "
stmt += "unit_name"
cursor = CONN.cursor()
cursor.execute(stmt)
rows = cursor.fetchall()
for row in rows:
    locs = "(" + str(row[3]) + "," + str(row[4]) + ")"
    status = get_status(row[5])
    inFocus = is_in_focus(row[0])
    if inFocus:
        status += "*"
    else:
        status += " "
    print(f"{row[2]: <10}{row[1]: <13}{row[0]: <5}{locs: <8}{status: <3}")

CONN.close()
