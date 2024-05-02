import random

def get_random_1(x):
	num  = (random.random() * 1000)
	return int(num%x) + 1

def get_fixed_roll(lk):
	# lk: (1,1,1,1,1,1,1,1,1,1)
	# Higher number increases the likelyhood of the appearance of the face.
	# Don't assign any faces to be lower than 1.
	faces = len(lk)
	counter = 0
	for i in range(faces):
		counter += lk[i]

	rolled = get_random_1(counter)

	c = 0
	for i in range(faces):
		c += lk[i]
		if c>=rolled:
			return i+1

def get_random(x):
	num  = (random.random() * 1000)
	return int(num%x)
	
def roll_d100():
	num  = (random.random() * 1000)
	return int(num%100) + 1

def roll_d10():
	num  = (random.random() * 100)
	return int(num%10) + 1

def roll_d8():
	num  = (random.random() * 100)
	return int(num%8) + 1

def roll_d20():
	num  = (random.random() * 100)
	return int(num%20) + 1

def roll_d6():
	num  = (random.random() * 100)
	return int(num%6) + 1

def roll_3d6():
	num = roll_d6()
	num += roll_d6()
	num += roll_d6()
	return num

def door_event():
	rolled = roll_d10()
	if rolled>5: return 0
	if rolled>2: return 1
	return 2

	
