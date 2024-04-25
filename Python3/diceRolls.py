#!/usr/bin/python3
import random

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

def roll_3d6_v2():
	# roll 4d6 drop low
	nums = [0,0,0,0]
	nums[0] = roll_d6()
	nums[1] = roll_d6()
	nums[2] = roll_d6()
	nums[3] = roll_d6()
	nums.sort()
	return nums[1] + nums[2] + nums[3]

# ****************************************************************************************
attributes = ["STR", "INT", "WIS", "CON", "DEX", "CHA"]

for x in range(6):
	print(attributes[x] + ":", roll_3d6())

print()

for x in range(6):
	print(attributes[x] + ":", roll_3d6_v2())





