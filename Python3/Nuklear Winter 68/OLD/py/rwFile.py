#!/usr/bin/python3
part1 = """
<!DOCTYPE html>
<html>
<head>
<title>Nuklear Winter '68</title>
<!-- <meta http-equiv="refresh" content="3"> -->
</head>
<body onload="main()">

<img id="map" src="images/Map.jpg" hidden>
"""



f = open("index.html", "w")
f.write(part1)
f.close()

#open and read the file after the overwriting:
f = open("demofile3.txt", "r")
print(f.read())
