import sys
import re
import mariadb as my
import hexagon as hx

def is_hill(hexID):
	stmt = "select flags & (1<<1) from map where hexID = '" + hexID + "'"
	result = my.sql_fetchone(stmt)
	if result==None:
		return False
	if int(result[0])==0:
		return False
	return True





	
