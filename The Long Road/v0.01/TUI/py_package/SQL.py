import re


def activate_unit(CONN, unit_id):
    stmt = f"UPDATE scenario SET num1 = {unit_id} "
    stmt += "WHERE key = 'unitFocus'"
    cursor = CONN.cursor()
    cursor.execute(stmt)
    CONN.commit()
    cursor.close()


def generate_instance_table(CONN, table):
    stmt = "SELECT num1 FROM scenario WHERE "
    stmt += "key = 'unitFocus'"
    unit_id = get_field_value(CONN, stmt)

    stmt = "SELECT num1 FROM scenario WHERE "
    stmt += "key = 'currScenario'"
    scenario_id = get_field_value(CONN, stmt)

    stmt = "SELECT id, scenario_id, unit_name, faction, loc_x, loc_y "
    stmt += "FROM instance WHERE "
    stmt += f"scenario_id = {scenario_id} "
    stmt += "ORDER BY faction, unit_name"
    cursor = CONN.cursor()
    cursor.execute(stmt)
    rows = cursor.fetchall()
    is_focused = ""
    for row in rows:
        if row[0] == unit_id:
            is_focused = "*"
        else:
            is_focused = ""
        table.add_row(row[0], row[2], row[3], row[4], row[5], is_focused)
    cursor.close()


def get_field_value(CONN, stmt):
    cursor = CONN.cursor()
    cursor.execute(stmt)
    CONN.commit()
    rs = cursor.fetchone()
    cursor.close()
    return rs[0]


def is_same_place(conn, scenario_id, unit):
    stmt = "SELECT count(*) FROM instance WHERE "
    stmt += f"id = {unit[0]} "
    stmt += f"AND loc_x = {unit[1]} "
    stmt += f"AND loc_y = {unit[2]} "
    stmt += f"AND scenario_id = {scenario_id}"
    cursor = conn.cursor()
    cursor.execute(stmt)
    conn.commit()
    rs = cursor.fetchone()
    cursor.close()
    return rs[0]


def is_visible(conn, scenario_id, iid):
    stmt = "SELECT * FROM instance WHERE "
    stmt += f"scenario_id = {scenario_id} AND "
    stmt += f"id = {iid} AND "
    stmt += "(status & 1)"
    cursor = conn.cursor()
    cursor.execute(stmt)
    rs = cursor.fetchone()
    if rs is None:
        cursor.close()
        return 0
    cursor.close()
    return 1


def get_3columns(conn, stmt):
    stuffs = []
    cursor = conn.cursor()
    cursor.execute(stmt)
    rows = cursor.fetchall()
    for row in rows:
        stuffs.append((row[0], row[1], row[2]))
    cursor.close()
    return stuffs


def get_2columns(conn, stmt):
    stuffs = []
    cursor = conn.cursor()
    cursor.execute(stmt)
    rows = cursor.fetchall()
    for row in rows:
        stuffs.append((row[0], row[1]))
    cursor.close()
    return stuffs


def get_combatants(conn, stmt):
    stuffs = []
    cursor = conn.cursor()
    cursor.execute(stmt)
    rows = cursor.fetchall()
    for row in rows:
        stuffs.append((row[0], row[1], row[2], row[3], row[4], row[5]))
    cursor.close()
    return stuffs


def get_row(conn, scenario_id, fields, table, where):
    stmt = f"SELECT {fields} FROM {table} WHERE scenario_id = {scenario_id}"
    if scenario_id <= 0:
        stmt = f"SELECT {fields} FROM {table} WHERE {where}"
    elif re.search(".", where):
        stmt += f" AND {where}"
    cursor = conn.cursor()
    cursor.execute(stmt)
    conn.commit()
    rs = cursor.fetchone()
    cursor.close()
    return rs


def execute_sql(conn, stmt):
    cursor = conn.cursor()
    cursor.execute(stmt)
    conn.commit()
    cursor.close()


def get_imgs(conn, scenario_id):
    # get imgs used in the game
    stuffs = []
    stmt = f"SELECT unit_id FROM instance WHERE scenario_id = {scenario_id}"
    cursor = conn.cursor()
    cursor.execute(stmt)
    rows = cursor.fetchall()
    for row in rows:
        stmt2 = "SELECT front, back, front1, back1 FROM unit WHERE "
        stmt2 += f"id = {row[0]}"
        cursor1 = conn.cursor()
        cursor1.execute(stmt2)
        conn.commit()
        rs = cursor1.fetchone()
        # print(rs)
        fields = "name"
        table = "img"
        X = get_row(conn, -1, fields, table, f"id = {rs[0]}")
        front = f"{X[0]}:{rs[0]}"
        X = get_row(conn, -1, fields, table, f"id = {rs[1]}")
        back = f"{X[0]}:{rs[1]}"
        X = get_row(conn, -1, fields, table, f"id = {rs[2]}")
        front1 = f"{X[0]}:{rs[2]}"
        X = get_row(conn, -1, fields, table, f"id = {rs[3]}")
        back1 = f"{X[0]}:{rs[3]}"
        # print(front + back + front1 + back1)
        stuffs.append(front)
        stuffs.append(back)
        stuffs.append(front1)
        stuffs.append(back1)

        cursor1.close()

    uniqs = list(set(stuffs))

    cursor.close()

    return uniqs
