import pyodbc

#conn_string = r"DSN=fooness;" r"UID=tenchi;" r"PWD=Ilovethem123"
conn_string = "DSN=fooness;UID=tenchi;PWD=Ilovethem123"

try:
    conn = pyodbc.connect(conn_string)
    print("Successfully connected using DSN-less connection string.")
    # ... (execute queries and close connection as above) ...

except pyodbc.Error as ex:
    print(f"Database error: {ex}")
