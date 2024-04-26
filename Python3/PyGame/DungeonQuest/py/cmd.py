#!/usr/bin/python3
import sys
import engine as e

def list_cmds():
	print("Options:")
	print("   init")
	print("   createCharacter")

if len(sys.argv) == 1:
	list_cmds()
	exit()

if sys.argv[1]=='init':
	e.init()
	exit()

if sys.argv[1]=='createCharacter':
	e.createCharacter()
	exit()

print('"'+sys.argv[1]+'"', "is not an option.")
list_cmds()
print()
