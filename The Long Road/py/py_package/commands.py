import re


def place(conn, line, scenario_id):
    X = re.sub("\\ +", ";", line)
    X = X.split(";")
    stmt = "UPDATE instance SET "
    stmt += f"loc_x = {X[2]}, "
    stmt += f"loc_y = {X[3]} WHERE "
    stmt += f"scenario_id = {scenario_id} AND "
    stmt += f"id = {X[1]}"
    sql_exec_stmt(conn, stmt)


def visible(conn, line, scenario_id):
    X = re.sub("\\ +", ";", line)
    X = X.split(";")
    stmt = "UPDATE instance SET status = (status | (1<<0)) "
    stmt += f"WHERE id = {X[1]} AND "
    stmt += f"scenario_id = {scenario_id}"
    sql_exec_stmt(conn, stmt)


def invisible(conn, line, scenario_id):
    X = re.sub("\\ +", ";", line)
    X = X.split(";")
    stmt = "UPDATE instance SET status = "
    stmt += "((status | (1<<0)) & ~(status & (1<<0))) "
    stmt += f"WHERE id = {X[1]} AND "
    stmt += f"scenario_id = {scenario_id}"
    sql_exec_stmt(conn, stmt)


def reset_MF(conn, line, scenario_id):
    X = re.sub("\\ +", ";", line)
    X = X.split(";")
    instanceID = X[1]
    stmt = f"SELECT img_id FROM instance WHERE id = {instanceID} AND "
    stmt += f"scenario_id = {scenario_id}"
    X = get_one_val(conn, stmt)
    stmt = f"SELECT mf_val FROM img WHERE id = {X}"
    X = get_one_val(conn, stmt)
    stmt = f"UPDATE instance SET curr_MF = {X} WHERE id = {instanceID}"
    sql_exec_stmt(conn, stmt)


# *****************************************************************************
def get_one_val(conn, stmt):
    cursor = conn.cursor()
    cursor.execute(stmt)
    X = cursor.fetchone()
    cursor.close()
    return X[0]


def sql_exec_stmt(conn, stmt):
    cursor = conn.cursor()
    cursor.execute(stmt)
    conn.commit()
    cursor.close()
