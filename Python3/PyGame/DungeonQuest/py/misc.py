import random

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

	
