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

def is_block_right(riverStat, want, currPlace):
	blocking = riverStat>>14
	print("is_block_right>>>", riverStat, want, currPlace, blocking)
	for x in range(12):
		print(".", currPlace)
		if currPlace&want:
			return False
		if currPlace&blocking:
			return True
		currPlace = oneBitShiftRotateRight(currPlace)

	return False

def is_block_left(riverStat, want, currPlace):
	blocking = riverStat>>14
	print(">>>", riverStat, want, currPlace, blocking)
	currPlace = oneBitShiftRotateLeft(currPlace)
	for x in range(12):
		print(".", currPlace)
		if currPlace&blocking:
			return True
		if currPlace&want:
			return False
		currPlace = oneBitShiftRotateLeft(currPlace)

	return False

print("***")
print(is_block_right(35659776, 12, 128))
print(is_block_left(35659776, 12, 128))


