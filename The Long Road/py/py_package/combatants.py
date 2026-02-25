import re


def sql_exec_stmt(conn, stmt):
    cursor = conn.cursor()
    cursor.execute(stmt)
    conn.commit()
    cursor.close()


# *****************************************************************************
def place(conn, faction, line, scenario_id):
    if re.search("^$", faction):
        return

    X = line.split(";")

    # element = ""
    infos = get_unit_infos(conn, X[1], faction)
    # print(infos)

    stmt = "INSERT INTO instance (id, scenario_id, unit_id, unit_name, "
    stmt += "img_id, faction) VALUES ("
    stmt += f"{X[0]}, {scenario_id}, {infos[0]}, '{X[1]}', {infos[1]}, "
    stmt += f"'{faction}')"
    sql_exec_stmt(conn, stmt)


# *************************************
def get_unit_infos(conn, unit_name, faction):
    infos = ()
    stmt = ""
    if re.search("Infantry", unit_name):
        stmt = get_stmt_infantry_faction_id(conn, faction)
        print(stmt)
    else:
        stmt = f"SELECT id, front FROM unit WHERE name = '{unit_name}'"

    cursor = conn.cursor()
    cursor.execute(stmt)
    conn.commit()
    row = cursor.fetchone()
    infos = row
    cursor.close()

    return infos


# *****************
def get_stmt_infantry_faction_id(conn, faction):
    stmt = ""
    bit = ""
    if re.search("^Americ", faction):
        bit = "(flag1 & (1<<0))"
    else:
        bit = "(flag1 & (1<<1))"
    stmt = f"SELECT id, front FROM unit WHERE name = 'Infantry' AND "
    stmt += f"{bit}"

    return stmt




