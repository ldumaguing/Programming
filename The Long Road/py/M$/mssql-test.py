import pymssql

try:
    connection = pymssql.connect(
        server='vssqldmb01.bmcc.cuny.edu',
        user='tenchi',
        password='Ilovethem123',
        database='Tenchi',
        port=1433 # Optional, default is 1433
    )
    cursor = connection.cursor()
#    cursor.execute("SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_TYPE = 'BASE TABLE';")
    cursor.execute("select * from transcripts")
    for row in cursor:
        # print(row)
        print(row[0])
    connection.close()
except pymssql.OperationalError as e:
    print(f"Connection failed: {e}")

