#!/usr/bin/python3
import mechanics as mek

# slot = map0.get_slot(riverStat, direction, rivPlace)

rivStat = 2129920  # destination hex
direction = "C"    # unit's desired edge exit
# rivPlace = 8192    # unit's current river-place
# rivPlace = 8


def get_slot(rivStat, direction, rivPlace):
	rivPlace = rivPlace>>2   # remove the bridge bits
	exitEdge = 0
	if direction=="A":
		exitEdge = 3<<10
	if direction=="B":
		exitEdge = 3<<8
	if direction=="C":
		exitEdge = 3<<6
	if direction=="D":
		exitEdge = 3<<4
	if direction=="E":
		exitEdge = 3<<2
	if direction=="F":
		exitEdge = 3<<0

	print("-->", rivPlace)
	print("...cw exit:", mek.get_exitPlace_cw(rivStat, exitEdge, rivPlace))
	print("...ccw exit:", mek.get_exitPlace_ccw(rivStat, exitEdge, rivPlace))
	return 0

# ****************************************************************************************
print("\n*******************************")
currSlot = 1<<2
for i in range(12):
	#print(currSlot<<i)
	print(get_slot(rivStat, direction, currSlot<<i))

