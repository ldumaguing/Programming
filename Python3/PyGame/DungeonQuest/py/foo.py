#!/usr/bin/python3
import sys
import bag

def list_cmds():
	print("Commands:")
	print("   foo")
	print("   init")
	print("   get")

if len(sys.argv) == 1:
	list_cmds()
	exit()

if sys.argv[1]=='foo':
	bag.get_tile()
	exit()

if sys.argv[1]=='init':
	bag.refill()
	exit()

if sys.argv[1]=='get':
	x = bag.get_tile()
	print("got", x)
	exit()

print('"'+sys.argv[1]+'"', "is not an option.")
list_cmds()
print()





