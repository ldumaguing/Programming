import re
# import sqlite3


def foo(conn, faction, line):
    if re.search("^$", faction):
        return

    stmt = f"{faction} - {line}"
    print(stmt)
