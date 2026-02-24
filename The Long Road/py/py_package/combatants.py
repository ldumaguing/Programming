import re


def sql_exec_stmt(conn, stmt):
    cursor = conn.cursor()
    cursor.execute(stmt)
    conn.commit()
    cursor.close()


def place(conn, faction, line):
    if re.search("^$", faction):
        return

    stmt = f"{faction} - {line}"
    print(stmt)
