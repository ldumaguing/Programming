#!/usr/bin/python3
import sys
import engine as e
import movement as m

def list_cmds():
	print("Options:")
	print("   init")
	print("   createCharacter")
	print("   setActiveCharacter")
	print("   deleteCharacter")
	print("   whoIsActive")
	print()
	print("   whereAmI")
	print("   move [nesw]")

if len(sys.argv) == 1:
	list_cmds()
	exit()

if sys.argv[1]=='foo':
	print(e.sql_select("id, name, class", "id=3", "characters"))
	exit()

if sys.argv[1]=='init':
	e.init()
	exit()

if sys.argv[1]=='whereAmI':
	e.whereAmI()
	exit()

if sys.argv[1]=='move':
	m.move(sys.argv)
	exit()

if sys.argv[1]=='whoIsActive':
	e.whoIsActive()
	exit()

if sys.argv[1]=='setActiveCharacter':
	e.setActiveCharacter()
	exit()

if sys.argv[1]=='deleteCharacter':
	e.deleteCharacter()
	exit()

if sys.argv[1]=='createCharacter':
	e.createCharacter()
	exit()

print('"'+sys.argv[1]+'"', "is not an option.")
list_cmds()
print()
