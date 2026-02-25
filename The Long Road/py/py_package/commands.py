import re

def sql_exec_stmt(conn, stmt):
    cursor = conn.cursor()
    cursor.execute(stmt)
    conn.commit()
    cursor.close()


def place(conn, line, scenario_id):
    X = re.sub("\\ +", ";", line)
    X = X.split(";")
    stmt = "UPDATE instance SET "
    stmt += f"loc_x = {X[2]}, "
    stmt += f"loc_y = {X[3]} WHERE "
    stmt += f"scenario_id = {scenario_id} AND "
    stmt += f"id = {X[1]}"
    sql_exec_stmt(conn, stmt)
