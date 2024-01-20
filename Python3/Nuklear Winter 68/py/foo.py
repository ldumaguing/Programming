#!/usr/bin/python3
import mysql.connector

mydb = mysql.connector.connect(
  host="localhost",
  user="ayeka",
  password="",
  database="NuklearWinter68"
)

mycursor = mydb.cursor()

mycursor.execute("SELECT * FROM images")

myresult = mycursor.fetchall()

for x in myresult:
  print(x)


print(mydb)
