#!/usr/bin/python3
import mechanics as mek
import map0

# rivStat = 2129920  # destination hex
rivStatFrom = 557152
direction = "F"    # unit's desired edge exit

#get_slot_p2(riv, frm, frmSlot):

def get_slot_p2(rivStat, direction, rivPlace):
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

	#print("-->", rivPlace)
	#print("...cw exit:", mek.get_exitPlace_cw(rivStat, exitEdge, rivPlace))
	#print("...ccw exit:", mek.get_exitPlace_ccw(rivStat, exitEdge, rivPlace))
	CW = mek.get_exitPlace_cw(rivStat, exitEdge, rivPlace)
	CCW =mek.get_exitPlace_ccw(rivStat, exitEdge, rivPlace)
	print("... exitEdgeFrom:", exitEdge)
	print("...", CW, CCW, rivPlace, "< CW, CCW, rivPlace")
	if CW>0:
		return map0.convert_exit2entrancePlace(CW)<<2
	if CCW>0:
		return map0.convert_exit2entrancePlace(CCW)<<2

	return 0

# ****************************************************************************************
print("\n*******************************")
currSlot = 1<<2
for i in range(12):
	print("currSlot<<i:", currSlot<<i)
	print("got slot:", get_slot_p2(rivStatFrom, direction, currSlot<<i))
	print()

