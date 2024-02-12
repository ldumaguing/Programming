#!/usr/bin/python3
import mysql.connector
import sys

mydb = mysql.connector.connect(
  host="localhost",
  user="ayeka",
  password="",
  database="NuklearWinter68"
)

part1 = """<!DOCTYPE html>
<html>
<head>
<title>Nuklear Winter '68</title>
<!-- <meta http-equiv="refresh" content="3"> -->
<link rel="stylesheet" href="css/style.css">
</head>
<body onload="">
<img id="map" src="images/Map.jpg" hidden>
"""

part2 = """<canvas id="canvas0" width="6372" height="4139"></canvas>
<script>"""

part3 = """</script>
</body>
</html>"""

imgString = ""
img0 = """<img"""
img1 = """ src="images/"""



mycursor = mydb.cursor()
mycursor.execute("select * from v_unit_back_data order by formation, name")
myresult = mycursor.fetchall()

for x in myresult:
	imgString += img0
	imgString += img1 + x[18] + "\">"
	
	imgString += "<span class=\"whitefont\">" + str(x[1]) + "; </span>"

	Ar = x[2]
	Ab = x[3]
	Br = x[4]
	Bw = x[5]
	if Ar>0 and Ab>0:
		imgString += "<span class=\"purplefont\">" + str(Ar) + "</span>"
		if x[4] > 0:
			imgString += "<sup><span class=\"redfont\">" + str(Br) + "</span></sup>"
		else:
			imgString += "<sup><span class=\"whitefont\">" + str(Bw) + "</span></sup>"
	if Ar>0 and Ab==0:
		imgString += "<span class=\"redfont\">" + str(Ar) + "</span>"
		if Br > 0:
			imgString += "<sup><span class=\"redfont\">" + str(Br) + "</span></sup>"
		else:
			if Bw > 0:
				imgString += "<sup><span class=\"whitefont\">" + str(Bw) + "</span></sup>"
	if Ab>0 and Ar==0:
		imgString += "<span class=\"bluefont\">" + str(Ab) + "</span>"
		imgString += "<sup><span class=\"whitefont\">" + str(Bw) + "</span></sup>"
	if Ar==0 and Ab==0:
		imgString += "<span class=\"whitefont\">-<sup>-</sup></span>"
	C = x[6]
	Dw = x[7]
	Dy = x[8]
	imgString += "<span class=\"yellowfont\"> " + str(C) + "</span>"
	if Dw>0 or Dy>0:
		if Dw>0:
			imgString += "<sup><span class=\"whitefont\">" + str(Dw) + "</span></sup>"
		else:
			imgString += "<sup><span class=\"yellowfont\">" + str(Dy) + "</span></sup>"

	Er = x[9]
	Eb = x[10]
	Ey = x[11]
	if Er>0:
		imgString += "<span class=\"redfont\"> " + str(Er) + "</span>"
	if Eb>0:
		imgString += "<span class=\"bluefont\"> " + str(Eb) + "</span>"
	if Ey>0:
		imgString += "<span class=\"yellowfont\"> " + str(Ey) + "</span>"

	F = x[12]
	G = x[13]
	imgString += "<span class=\"whitefont\">; " + str(F) + "</span>"
	if G>0:
		imgString += "<sup><span class=\"whitefont\">" + str(G) + "</span></sup>"

	H = x[14]
	I = x[15]
	J = x[16]
	K = x[17]
	if (H+I+J+K)>0:
		imgString += "<span class=\"whitefont\">; </span>"
		if H>0:
			imgString += "<span class=\"whitefont\">Huge</span>"
			if (I+J+K)>0:
				imgString += "<span class=\"whitefont\">, </span>"
		if I>0:
			imgString += "<span class=\"whitefont\">APC</span>"
			if (J+K)>0:
				imgString += "<span class=\"whitefont\">, </span>"
		if J>0:
			imgString += "<span class=\"whitefont\">NOE</span>"
			if K>0:
				imgString += "<span class=\"whitefont\">, </span>"
		if K>0:
			imgString += "<span class=\"whitefont\">Recon</span>"

	imgString += "<br>"
	imgString += "\n"












f = open("index.html", "w")
f.write(part1 + imgString + part2 + part3)
f.close()

