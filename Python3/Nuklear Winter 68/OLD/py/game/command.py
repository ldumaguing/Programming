#!/usr/bin/python3
import sys
import re
import mariadb as sql
import commands as cmds

# ****************************************************************************************
def instructions():
	print("Issue a command string.")

# ****************************************************************************************
# ***** MAIN *****************************************************************************
if len(sys.argv)<2:
	instructions()
	exit()

cmd = sys.argv[1].split()
print(cmd)
scenario = sql.get_current_scenario()
print(scenario)

obj = ""
subject = cmd[0]
verb = cmd[1]
if len(cmd)>2:
	obj = cmd[2]

if verb=="embark":
	cmds.embark(subject, obj, scenario)

if verb=="disembark":
	cmds.disembark(subject, scenario)

if verb=="move":
	cmds.move(subject, obj, scenario)






