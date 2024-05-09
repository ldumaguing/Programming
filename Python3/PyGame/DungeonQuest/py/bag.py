import engine as e
import misc

def foo():
	print(misc.get_random_1(1))

def refill():
	print("refill...")
	stmt = "update tilepile set bag=num"
	e.sql_set(stmt)

def get_tile():
	# def sql_select(cols, conditions, tbl):
	tile_type_count = e.sql_select("count(*)", "bag>0", "tilepile")[0]
	tile_count = e.sql_select("sum(bag)", "true", "tilepile")[0]
	if tile_count<=0: return 0

	print(">", tile_type_count, tile_count)
	aNum = misc.get_random_1(tile_type_count)
	tileID = e.get_tile_row(aNum)
	print(aNum, tileID)









	return 13

