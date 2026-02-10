import pyodbc

#conn_string = r"DSN=fooness;" r"UID=tenchi;" r"PWD=xxx"
conn_string = "DSN=fooness;UID=tenchi;PWD=123"

try:
    conn = pyodbc.connect(conn_string)
    #print("Successfully connected using DSN-less connection string.")
    # ... (execute queries and close connection as above) ...
    print("Connection successful!")

    cursor = conn.cursor()
    cursor.execute("SELECT * FROM transcripts")
    for row in cursor.fetchall():
        print(row)
    conn.close()
except pyodbc.Error as ex:
    print(f"Database error: {ex}")

