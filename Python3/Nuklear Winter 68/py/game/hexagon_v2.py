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
def get_neighbor(currLoc, direction):
	return step_to_direction(currLoc, direction)
	
# ----------------------------------------------------------------------------------------
def Ia(currLoc, hexLoc_b, ANGLE):
	print("ia", currLoc, hexLoc_b, ANGLE)
	return get_neighbor(currLoc, "B")

# ----------------------------------------------------------------------------------------
def Ib(currLoc, hexLoc_b, ANGLE):
	print("ib",currLoc, hexLoc_b, ANGLE)

# ----------------------------------------------------------------------------------------
def IIa(currLoc, hexLoc_b, ANGLE):
	print("iia", currLoc, hexLoc_b, ANGLE)

# ----------------------------------------------------------------------------------------
def IIb(currLoc, hexLoc_b, ANGLE):
	print("iib", currLoc, hexLoc_b, ANGLE)
	return get_neighbor(currLoc, "F")

# ----------------------------------------------------------------------------------------
def IIIa(currLoc, hexLoc_b, ANGLE):
	print("iiia", currLoc, hexLoc_b, ANGLE)
	return get_neighbor(currLoc, "E")

# ----------------------------------------------------------------------------------------
def IIIb(currLoc, hexLoc_b, ANGLE):
	#print("iiib", currLoc, hexLoc_b, ANGLE)
	nA = get_neighbor(currLoc, "E")
	nB = get_neighbor(currLoc, "D")
	if hexLoc_b==nA:
		return nA
	if hexLoc_b==nB:
		return nB
	print("n:", nA, nB)
	angle_A = abs(get_angle(nA, hexLoc_b) - ANGLE)
	angle_B = abs(get_angle(nB, hexLoc_b) - ANGLE)
	print("angles:", angle_A, angle_B)
	if angle_A<angle_B:
		return nA
	return nB

# ----------------------------------------------------------------------------------------
def IVa(currLoc, hexLoc_b, ANGLE):
	#print("iva", currLoc, hexLoc_b, ANGLE)
	nA = get_neighbor(currLoc, "C")
	nB = get_neighbor(currLoc, "D")
	if hexLoc_b==nA:
		return nA
	if hexLoc_b==nB:
		return nB
	print("n:", nA, nB)
	angle_A = abs(get_angle(nA, hexLoc_b) - ANGLE)
	angle_B = abs(get_angle(nB, hexLoc_b) - ANGLE)
	print("angles:", angle_A, angle_B)
	if angle_A<angle_B:
		return nA
	return nB

# ----------------------------------------------------------------------------------------
def IVb(currLoc, hexLoc_b, ANGLE):
	#print("ivb", currLoc, hexLoc_b, ANGLE)
	return get_neighbor(currLoc, "C")

# ****************************************************************************************
def get_path(hexLoc_a, hexLoc_b):
	if hexLoc_a==hexLoc_b:
		return None
	path = []
	ANGLE = get_angle(hexLoc_a, hexLoc_b)
	currLoc = hexLoc_a
	print(currLoc)
	#for x in range(20):
	while True:
		if currLoc==hexLoc_b:
			break
		angle = get_angle(currLoc, hexLoc_b)
		print("a:", angle)
		if angle>=0 and angle<30:
			currLoc = Ia(currLoc, hexLoc_b, ANGLE)
		if angle>=30 and angle<90:
			currLoc = Ib(currLoc, hexLoc_b, ANGLE)
		if angle>=90 and angle<150:
			currLoc = IIa(currLoc, hexLoc_b, ANGLE)
		if angle>=150 and angle<180:
			currLoc = IIb(currLoc, hexLoc_b, ANGLE)
		if angle>=180 and angle<210:
			currLoc = IIIa(currLoc, hexLoc_b, ANGLE)
		if angle>=210 and angle<270:
			currLoc = IIIb(currLoc, hexLoc_b, ANGLE)
		if angle>=270 and angle<330:
			currLoc = IVa(currLoc, hexLoc_b, ANGLE)
		if angle>=330 and angle<360:
			currLoc = IVb(currLoc, hexLoc_b, ANGLE)
		print(">>>>>>>>>>>>>>>>>>>>>>>", currLoc)
		path.append(currLoc)
	#print(currLoc, "<<<<")
	return path



















# *****y
