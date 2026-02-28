import re


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


def get_combatants(conn, stmt):
    stuffs = []
    cursor = conn.cursor()
    cursor.execute(stmt)
    rows = cursor.fetchall()
    for row in rows:
        stuffs.append((row[0], row[1], row[2], row[3]))
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
