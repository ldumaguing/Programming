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
    stmt = f"UPDATE instance SET curr_MF = {X} WHERE id = {instanceID} AND "
    stmt += f"scenario_id = {scenario_id}"
    sql_exec_stmt(conn, stmt)


def embark(conn, line, scenario_id):
    X = re.sub("\\ +", ";", line)
    X = X.split(";")
    unit_type = is_infantry_or_recon(conn, scenario_id, X[1])
    if unit_type == 0:
        return
    if is_occupied(conn, scenario_id, X[2]):
        print("occupied")
        return
    carrier_type = get_carrier_type(conn, scenario_id, X[2])
    stmt = ""
    if carrier_type == 1:
        if unit_type == 1:
            stmt = "UPDATE instance SET loc_x = -1001 WHERE "
            stmt += f"id = {X[1]} AND scenario_id = {scenario_id}"
    else:
        if unit_type == 2:
            print("embark recon")
    if re.search("^$", stmt):
        return
    sql_exec_stmt(conn, stmt)  # moved the carried to loc_x -1001

    stmt = "SELECT COUNT(*) FROM relation WHERE "
    stmt += f"Aye = {X[1]} AND "
    stmt += f"Bee = {X[2]} AND "
    stmt += "rType = 1 AND "
    stmt += f"scenario_id = {scenario_id}"
    if get_one_val(conn, stmt) > 0:
        print("already have relation")
        return

    # create relation
    stmt = "INSERT INTO relation (Aye, Bee, rType, scenario_id) "
    stmt += "VALUES ("
    stmt += f"{X[1]}, "
    stmt += f"{X[2]}, "
    stmt += "1, "
    stmt += f"{scenario_id})"
    sql_exec_stmt(conn, stmt)

    # set carrier status
    stmt = "UPDATE instance SET status = (status | (1<<10)) "
    stmt += f"WHERE scenario_id = {scenario_id} AND "
    stmt += f"id = {X[2]}"
    sql_exec_stmt(conn, stmt)


def get_carrier_type(CONN, scenario_id, carrier):
    stmt = f"SELECT img_id FROM instance WHERE id = {carrier} AND "
    stmt += f"scenario_id = {scenario_id}"
    img_id = get_one_val(CONN, stmt)

    stmt = "SELECT count(*) FROM img WHERE (flag1 & (3<<13)) = (1<<13) AND "
    stmt += f"id = {img_id}"
    if get_one_val(CONN, stmt) > 0:
        return 1  # infantry
    stmt = "SELECT count(*) FROM img WHERE (flag1 & (3<<13)) = (3<<13) AND "
    stmt += f"id = {img_id}"
    if get_one_val(CONN, stmt) > 0:
        return 2  # Recon
    return 0


def is_occupied(CONN, scenario_id, carrier):
    stmt = f"SELECT unit_name FROM instance WHERE id = {carrier} AND "
    stmt += f"scenario_id = {scenario_id} AND "
    stmt += "(status & (1<<10))"
    X = get_one_val(CONN, stmt)
    if X is None:
        return 0
    return 1


def is_infantry_or_recon(CONN, scenario_id, unit_id):
    stmt = f"SELECT unit_name FROM instance WHERE id = {unit_id} AND "
    stmt += f"scenario_id = {scenario_id}"
    X = get_one_val(CONN, stmt)
    if X is None:
        return 0
    if re.search("Infantry", X):
        return 1
    if re.search("Recon", X):
        return 2


# *****************************************************************************
def get_one_val(conn, stmt):
    cursor = conn.cursor()
    cursor.execute(stmt)
    X = cursor.fetchone()
    cursor.close()
    if X is None:
        return None
    return X[0]


def sql_exec_stmt(conn, stmt):
    cursor = conn.cursor()
    cursor.execute(stmt)
    conn.commit()
    cursor.close()
