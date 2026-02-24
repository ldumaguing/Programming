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
    infos = get_unit_infos(conn, X[1])

    stmt = "INSERT INTO instance (id, scenario_id, unit_id, unit_name, "
    stmt += "img_id, faction) VALUES ("
    stmt += f"{X[0]}, {scenario_id}, {infos[0]}, '{X[1]}', {infos[1]}, "
    stmt += f"'{faction}')"
    print(stmt)


# *************************************
def get_unit_infos(conn, unit_name):
    infos = ()
    # print(unit_name)
    stmt = f"SELECT id, front FROM unit WHERE name = '{unit_name}'"
    # print(stmt)
    cursor = conn.cursor()
    cursor.execute(stmt)
    conn.commit()
    row = cursor.fetchone()
    infos = row
    cursor.close()

    return infos
