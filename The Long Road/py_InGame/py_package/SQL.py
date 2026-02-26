import re


def get_row(conn, scenario_id, fields, table, where):
    stmt = f"SELECT {fields} FROM {table} WHERE scenario_id = {scenario_id}"
    if re.search(".", where):
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
