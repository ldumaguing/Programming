import pyodbc

#conn_string = r"DSN=fooness;" r"UID=tenchi;" r"PWD=xxxx"
conn_string = "DSN=fooness;UID=tenchi;PWD=xxxxxx"

try:
    conn = pyodbc.connect(conn_string)
    print("Successfully connected using DSN-less connection string.")
    # ... (execute queries and close connection as above) ...

except pyodbc.Error as ex:
    print(f"Database error: {ex}")
