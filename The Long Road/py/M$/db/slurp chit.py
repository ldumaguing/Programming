#!/usr/bin/env python3
import sys
import pymssql
import csv
import io
import re

# ***************************************************************************************
if len(sys.argv) == 1:
    print("./slurp.py   file.csv")
    exit()

try:
    connection = pymssql.connect(
        server='vssqldmb01.bmcc.cuny.edu',
        user='tenchi',
        password='Ilovethem123',
        database='Tenchi',
        port=1433 # Optional, default is 1433
    )
    cursor = connection.cursor()

    stmt = "DELETE FROM chit"
    cursor.execute(stmt)
    connection.commit()

    stmt = """
    INSERT INTO chit (id, name, front, back, flag1) VALUES (%d, %s, %d, %d, %d)
    """
    with open(sys.argv[1]) as aLine:
        for csv_string in aLine:
            data_in = csv_string.split(',')
            data_in[4] = re.sub(r'\n', '', data_in[4])
            cursor.execute(stmt, data_in)
            connection.commit()

    print("Data inserted successfully.")
except pymssql.OperationalError as e:
    print(f"Connection failed: {e}")





cursor.close()
connection.close()





