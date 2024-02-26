import re
import math

# ****************************************************************************************
def convert_id2loc(hexID):
	# returns a coordination in tuple form
	if re.search("^[A-Z]", hexID):
		X = int(ord(hexID[0]) - ord("A"))
		numLocation = re.search("[0-9]", hexID).start()
		if numLocation==2:
			X += 26
		Y = int(hexID[numLocation:]) - 1  # A1 is 0,0
		return (X,Y)
	return (int(hexID[0:2]), int(hexID[2:]))

# ****************************************************************************************
def convert_loc2id(hexLoc):
	id = ""
	if int(hexLoc[0])<26:
		id = chr(int(hexLoc[0]) + ord("A"))
	else:
		id = chr(int(hexLoc[0])-26 + ord("A"))
		id += id
	y = int(hexLoc[1]) + 1

	return id + str(y)

# ****************************************************************************************
def get_cartisianDist(hexLoc_a, hexLoc_b):
	if hexLoc_a==hexLoc_b:
		return 0;

	# radius is 1 unit; hex height is 2
	Xa = hexLoc_a[0];
	Ya = hexLoc_a[1];
	Xb = hexLoc_b[0];
	Yb = hexLoc_b[1];

	cartisian_X = math.cos(math.radians(30)) * 2.0;

	real_Xa = cartisian_X * Xa;
	real_Ya = Ya*2;
	if Xa%2:
		real_Ya = real_Ya+1;

	real_Xb = cartisian_X * Xb;
	real_Yb = Yb*2;
	if Xb%2:
		real_Yb = real_Yb+1;

	a = real_Xa - real_Xb;
	a = a**2;

	b = real_Ya - real_Yb;
	b = b**2;

	c = math.sqrt(a+b);

	return c;

# ****************************************************************************************
def get_angle(hexLoc_a, hexLoc_b):
	if hexLoc_a==hexLoc_b:
		return 0
	Xa = hexLoc_a[0];
	Ya = hexLoc_a[1];
	Xb = hexLoc_b[0];
	Yb = hexLoc_b[1];

	cartisian_X = math.cos(math.radians(30)) * 2.0;

	real_Xa = cartisian_X * Xa;
	real_Ya = Ya*2;
	if Xa%2:
		real_Ya = real_Ya+1;

	real_Xb = cartisian_X * Xb;
	real_Yb = Yb*2;
	if Xb%2:
		real_Yb = real_Yb+1;

	X = real_Xb - real_Xa;
	Y = real_Yb - real_Ya;
	
	if X==0:
		if Y<0:
			return 90;
		return 270;
	
	angle = (math.atan(Y/X)*180.0)/math.pi;
	angle = round(angle, ndigits=4);
	if X<0 and Y<0:
		return 180 - angle;
	if X<0 and Y>=0:
		return abs(angle - 180);
	if X>=0 and Y>=0:
		return (360 - angle)%360;

	return abs(angle)%360;

# ****************************************************************************************
def get_spineID(hexLoc, spine):
	if hexLoc[0]%2==0:
		if spine=="D":
			spineID = convert_loc2id((hexLoc[0],hexLoc[1]+1))
			spineID += "-A"
			return spineID
		spineID = convert_loc2id(hexLoc)
		spineID += "-" + spine
		return spineID
	# ********************
	if spine=="A":
		spineID = convert_loc2id((hexLoc[0]-1,hexLoc[1]))
		spineID += "-D"
		return spineID
	if spine=="B":
		spineID = convert_loc2id((hexLoc[0]+1,hexLoc[1]))
		spineID += "-E"
		return spineID
	if spine=="C":
		spineID = convert_loc2id((hexLoc[0]+1,hexLoc[1]+1))
		spineID += "-F"
		return spineID
	if spine=="D":
		spineID = convert_loc2id((hexLoc[0]-1,hexLoc[1]+1))
		spineID += "-D"
		return spineID
	if spine=="E":
		spineID = convert_loc2id((hexLoc[0]-1,hexLoc[1]+1))
		spineID += "-B"
		return spineID
	spineID = convert_loc2id((hexLoc[0]-1,hexLoc[1]))
	spineID += "-C"
	return spineID

# ----------------------------------------------------------------------------------------
def evenXcol(X, Y, direction):
	match direction:
		case "A":
			Y = Y-1;
		case "B":
			X = X+1;
			Y = Y-1;
		case "C":
			X = X+1;
		case "D":
			Y = Y+1;
		case "E":
			X = X-1;
		case "F":
			X = X-1;
			Y = Y-1;

	return (X,Y)

# ----------------------------------------------------------------------------------------
def oddXcol(X, Y, direction):
	match direction:
		case "A":
			Y = Y-1;
		case "B":
			X = X+1;
		case "C":
			X = X+1;
			Y = Y+1;
		case "D":
			Y = Y+1;
		case "E":
			X = X-1;
			Y = Y+1;
		case "F":
			X = X-1;

	return (X,Y)

# ----------------------------------------------------------------------------------------
def step_to_direction(hexLoc, direction):
	X = hexLoc[0];
	Y = hexLoc[1];
	if X%2:
		return oddXcol(X, Y, direction);
	else:
		return evenXcol(X, Y, direction);

# ****************************************************************************************
def get_hexDist(hexLoc_a, hexLoc_b):
	if hexLoc_a==hexLoc_b:
		return 0

	direction = "";
	count = 0;

	while True:
		if hexLoc_a == hexLoc_b:
			return count;

		angle = get_angle(hexLoc_a, hexLoc_b);
		if angle>0 and angle<=60:
			direction = "B";
		if angle>60 and angle<=120:
			direction = "A";
		if angle>120 and angle<=180:
			direction = "F";
		if angle>180 and angle<=240:
			direction = "E";
		if angle>240 and angle<=300:
			direction = "D";
		if angle>300:
			direction = "C";
		hexLoc_a = step_to_direction(hexLoc_a, direction);
		count = count+1;

# ****************************************************************************************
def get_neighborLoc(currLoc, direction):
	return step_to_direction(currLoc, direction)  # a tuple

# ****************************************************************************************
def get_neighborHexID(hexID, direction):
	return convert_loc2id(get_neighborLoc(convert_id2loc(hexID), direction))

# ----------------------------------------------------------------------------------------
def EN(hexLoc_a, hexLoc_b, ANGLE):
	#print("EN:", hexLoc_a, hexLoc_b, ANGLE)
	path = []
	currLoc = hexLoc_a
	#for x in range(20):
	while True:
		nA = get_neighbor(currLoc, "B")
		nB = get_neighbor(currLoc, "C")
		if nA==hexLoc_b or nB==hexLoc_b:
			break
		#print(nA, nB)
		angle_A = abs(get_angle(nA, hexLoc_b) - ANGLE)
		angle_B = abs(get_angle(nB, hexLoc_b) - ANGLE)
		#print(">>>", angle_A, angle_B, "<<<")
		currLoc = nA
		if angle_A>angle_B:
			currLoc = nB
		path.append(currLoc)
	path.append(hexLoc_b)
	#print(path)
	return path

# ----------------------------------------------------------------------------------------
def NE(hexLoc_a, hexLoc_b, ANGLE):
	#print("NE:", hexLoc_a, hexLoc_b, ANGLE)
	path = []
	currLoc = hexLoc_a
	#for x in range(20):
	while True:
		nA = get_neighbor(currLoc, "A")
		nB = get_neighbor(currLoc, "B")
		if nA==hexLoc_b or nB==hexLoc_b:
			break
		#print(nA, nB)
		angle_A = abs(get_angle(nA, hexLoc_b) - ANGLE)
		angle_B = abs(get_angle(nB, hexLoc_b) - ANGLE)
		#print(">>>", angle_A, angle_B, "<<<")
		currLoc = nA
		if angle_A>angle_B:
			currLoc = nB
		path.append(currLoc)
	path.append(hexLoc_b)
	#print(path)
	return path

# ----------------------------------------------------------------------------------------
def NW(hexLoc_a, hexLoc_b, ANGLE):
	print("NW:", hexLoc_a, hexLoc_b, ANGLE)
	path = []
	currLoc = hexLoc_a
	#for x in range(20):
	while True:
		nA = get_neighbor(currLoc, "A")
		nB = get_neighbor(currLoc, "F")
		if nA==hexLoc_b or nB==hexLoc_b:
			break
		#print(nA, nB)
		angle_A = abs(get_angle(nA, hexLoc_b) - ANGLE)
		angle_B = abs(get_angle(nB, hexLoc_b) - ANGLE)
		#print(">>>", angle_A, angle_B, "<<<")
		currLoc = nA
		if angle_A>angle_B:
			currLoc = nB
		path.append(currLoc)
	path.append(hexLoc_b)
	#print(path)
	return path

# ----------------------------------------------------------------------------------------
def WN(hexLoc_a, hexLoc_b, ANGLE):
	#print("WN:", hexLoc_a, hexLoc_b, ANGLE)
	path = []
	currLoc = hexLoc_a
	#for x in range(20):
	while True:
		nA = get_neighbor(currLoc, "F")
		nB = get_neighbor(currLoc, "E")
		if nA==hexLoc_b or nB==hexLoc_b:
			break
		#print(nA, nB)
		angle_A = abs(get_angle(nA, hexLoc_b) - ANGLE)
		angle_B = abs(get_angle(nB, hexLoc_b) - ANGLE)
		#print(">>>", angle_A, angle_B, "<<<")
		currLoc = nA
		if angle_A>angle_B:
			currLoc = nB
		path.append(currLoc)
	path.append(hexLoc_b)
	#print(path)
	return path

# ----------------------------------------------------------------------------------------
def WS(hexLoc_a, hexLoc_b, ANGLE):
	#print("WS:", hexLoc_a, hexLoc_b, ANGLE)
	path = []
	currLoc = hexLoc_a
	#for x in range(20):
	while True:
		nA = get_neighbor(currLoc, "F")
		nB = get_neighbor(currLoc, "E")
		if nA==hexLoc_b or nB==hexLoc_b:
			break
		#print(nA, nB)
		angle_A = abs(get_angle(nA, hexLoc_b) - ANGLE)
		angle_B = abs(get_angle(nB, hexLoc_b) - ANGLE)
		if angle_B==ANGLE:
			angle_B=0
		#print(">>>", angle_A, angle_B, "<<<")
		currLoc = nA
		if angle_A>angle_B:
			currLoc = nB
		path.append(currLoc)
	path.append(hexLoc_b)
	#print(path)
	return path

# ----------------------------------------------------------------------------------------
def SW(hexLoc_a, hexLoc_b, ANGLE):
	#print("SW:", hexLoc_a, hexLoc_b, ANGLE)
	path = []
	currLoc = hexLoc_a
	#for x in range(20):
	while True:
		nA = get_neighbor(currLoc, "D")
		nB = get_neighbor(currLoc, "E")
		if nA==hexLoc_b or nB==hexLoc_b:
			break
		#print(nA, nB)
		angle_A = abs(get_angle(nA, hexLoc_b) - ANGLE)
		angle_B = abs(get_angle(nB, hexLoc_b) - ANGLE)
		#print(">>>", angle_A, angle_B, "<<<")
		currLoc = nA
		if angle_A>angle_B:
			currLoc = nB
		path.append(currLoc)
	path.append(hexLoc_b)
	#print(path)
	return path

# ----------------------------------------------------------------------------------------
def SE(hexLoc_a, hexLoc_b, ANGLE):
	#print("SE:", hexLoc_a, hexLoc_b, ANGLE)
	path = []
	currLoc = hexLoc_a
	#for x in range(20):
	while True:
		nA = get_neighbor(currLoc, "C")
		nB = get_neighbor(currLoc, "D")
		if nA==hexLoc_b or nB==hexLoc_b:
			break
		#print(nA, nB)
		angle_A = abs(get_angle(nA, hexLoc_b) - ANGLE)
		angle_B = abs(get_angle(nB, hexLoc_b) - ANGLE)
		#print(">>>", angle_A, angle_B, "<<<")
		currLoc = nA
		if angle_A>angle_B:
			currLoc = nB
		path.append(currLoc)
	path.append(hexLoc_b)
	#print(path)
	return path

# ----------------------------------------------------------------------------------------
def ES(hexLoc_a, hexLoc_b, ANGLE):
	#print("ES:", hexLoc_a, hexLoc_b, ANGLE)
	path = []
	currLoc = hexLoc_a
	#for x in range(20):
	while True:
		nA = get_neighbor(currLoc, "B")
		nB = get_neighbor(currLoc, "C")
		if nA==hexLoc_b or nB==hexLoc_b:
			break
		#print(">", nA, nB)
		angle_A = abs(get_angle(nA, hexLoc_b) - ANGLE)
		angle_B = abs(get_angle(nB, hexLoc_b) - ANGLE)


		#print(".>>", get_angle(nA, hexLoc_b), get_angle(nB, hexLoc_b), "<<<")
		#print(">>>", angle_A, angle_B, "<<<")
		if angle_B==ANGLE:
			angle_B=0
		currLoc = nB
		if angle_B>angle_A:
			currLoc = nA
		#print("---------------------", currLoc)
		path.append(currLoc)
	path.append(hexLoc_b)
	#print(path)
	return path

# ****************************************************************************************
def get_path(hexLoc_a, hexLoc_b):
	if hexLoc_a==hexLoc_b:
		return None

	ANGLE = get_angle(hexLoc_a, hexLoc_b)
	if ANGLE>=0 and ANGLE<=30:
		path = EN(hexLoc_a, hexLoc_b, ANGLE)
	if ANGLE>30 and ANGLE<=90:
		path = NE(hexLoc_a, hexLoc_b, ANGLE)
	if ANGLE>90 and ANGLE<150:
		path = NW(hexLoc_a, hexLoc_b, ANGLE)
	if ANGLE>=150 and ANGLE<=180:
		path = WN(hexLoc_a, hexLoc_b, ANGLE)
	if ANGLE>180 and ANGLE<=210:
		path = WS(hexLoc_a, hexLoc_b, ANGLE)
	if ANGLE>210 and ANGLE<=270:
		path = SW(hexLoc_a, hexLoc_b, ANGLE)
	if ANGLE>270 and ANGLE<330:
		path = SE(hexLoc_a, hexLoc_b, ANGLE)
	if ANGLE>=330 and ANGLE<360:
		path = ES(hexLoc_a, hexLoc_b, ANGLE)
	return path



















# *****y
