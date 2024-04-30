import random

def get_random(x):
	num  = (random.random() * 1000)
	return int(num%x)

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
