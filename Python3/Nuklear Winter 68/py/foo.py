#!/usr/bin/python3

def oneBitShiftRotateRight(position):
	x = position>>1
	if x==0:
		return 2048   # 12 bits position
	return x

def oneBitShiftRotateLeft(position):
	x = position<<1
	if x>2048:
		return 1   # 12 bits position
	return x





num = 256
#for x in range(12):
#	num = oneBitShiftRotateRight(num)
#	print(num)

for x in range(12):
	num = oneBitShiftRotateLeft(num)
	print(num)

