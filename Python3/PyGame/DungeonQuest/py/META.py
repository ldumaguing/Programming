#!/usr/bin/python3
import json
import pygame
import sys
import os
import engine as e

def get_corridor(x, y):
	cols = "is_corridor"
	conditions = " x="+str(x) + " and y="+str(y)
	tbl = "board"
	try:
		val = e.sql_select(cols, conditions, tbl)[0]
	except:
		val = 0

	return val

def get_doors(x, y):
	cols = "doors"
	conditions = " x="+str(x) + " and y="+str(y)
	tbl = "board"
	try:
		val = e.sql_select(cols, conditions, tbl)[0]
	except:
		val = 0

	return val

def get_portcullis(x, y):
	cols = "portcullis"
	conditions = " x="+str(x) + " and y="+str(y)
	tbl = "board"
	try:
		val = e.sql_select(cols, conditions, tbl)[0]
	except:
		val = 0

	return val

def get_tile(x, y):
	cols = "openings"
	conditions = " x="+str(x) + " and y="+str(y)
	tbl = "board"
	try:
		val = e.sql_select(cols, conditions, tbl)[0]
	except:
		val = -1

	return val

def view_map():
	board_w = 320
	board_h = 240
	floorTile = pygame.image.load('images/floor.png')
	corridors = (pygame.image.load('images/c0.png'),
		pygame.image.load('images/c1.png'),
		pygame.image.load('images/c2.png'),
		pygame.image.load('images/c3.png'),
		pygame.image.load('images/c4.png'),
		pygame.image.load('images/c5.png'),
		pygame.image.load('images/c6.png'),
		pygame.image.load('images/c7.png'),
		pygame.image.load('images/c8.png'),
		pygame.image.load('images/c9.png'),
		pygame.image.load('images/c10.png'),
		pygame.image.load('images/c11.png'),
		pygame.image.load('images/c12.png'),
		pygame.image.load('images/c13.png'),
		pygame.image.load('images/c14.png'),
		)
	portcullis = (pygame.image.load('images/d0.png'),
		pygame.image.load('images/p1.png'),
		pygame.image.load('images/p2.png'),
		pygame.image.load('images/p3.png'),
		pygame.image.load('images/p4.png'),
		pygame.image.load('images/p5.png'),
		pygame.image.load('images/p6.png'),
		pygame.image.load('images/p7.png'),
		pygame.image.load('images/p8.png'),
		pygame.image.load('images/p9.png'),
		pygame.image.load('images/p10.png'),
		pygame.image.load('images/p11.png'),
		pygame.image.load('images/p12.png'),
		pygame.image.load('images/p13.png'),
		pygame.image.load('images/p14.png'),
		pygame.image.load('images/p15.png'),
		)
	doors = (pygame.image.load('images/d0.png'),
		pygame.image.load('images/d1.png'),
		pygame.image.load('images/d2.png'),
		pygame.image.load('images/d3.png'),
		pygame.image.load('images/d4.png'),
		pygame.image.load('images/d5.png'),
		pygame.image.load('images/d6.png'),
		pygame.image.load('images/d7.png'),
		pygame.image.load('images/d8.png'),
		pygame.image.load('images/d9.png'),
		pygame.image.load('images/d10.png'),
		pygame.image.load('images/d11.png'),
		pygame.image.load('images/d12.png'),
		pygame.image.load('images/d13.png'),
		pygame.image.load('images/d14.png'),
		pygame.image.load('images/d15.png'),
		)
	tiles = (pygame.image.load('images/t0.png'),
		pygame.image.load('images/t1.png'),
		pygame.image.load('images/t2.png'),
		pygame.image.load('images/t3.png'),
		pygame.image.load('images/t4.png'),
		pygame.image.load('images/t5.png'),
		pygame.image.load('images/t6.png'),
		pygame.image.load('images/t7.png'),
		pygame.image.load('images/t8.png'),
		pygame.image.load('images/t9.png'),
		pygame.image.load('images/t10.png'),
		pygame.image.load('images/t11.png'),
		pygame.image.load('images/t12.png'),
		pygame.image.load('images/t13.png'),
		pygame.image.load('images/t14.png'),
		)
	meeple = pygame.image.load('images/meeple.png')
	meeple_pos = e.sql_select("x, y", "flags & 1", "characters")
	# print(meeple_pos)
	screen = pygame.display.set_mode((board_w, board_h))

	pygame.init()
	clock = pygame.time.Clock()

	board = [
		[1, 0, 0, 0, 0, 0, 0, 0, 0, 2],
		[0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
		[0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
		[0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
		[0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
		[0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
		[0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
		[0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
		[0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
		[0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
		[0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
		[0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
		[3, 0, 0, 0, 0, 0, 0, 0, 0, 4],
	]

	for x in range(10):
		for y in range(13):
			t = get_tile(x, y)
			#print(">", x, y, t)
			if t<0:
				board[y][x] = t
				continue
			d = get_doors(x, y)
			p = get_portcullis(x, y)
			c = get_corridor(x, y)
			d_t = t | (d<<4)
			p_d_t = d_t | (p<<8)
			c_p_d_t = p_d_t | (c<<12)
			board[y][x] = c_p_d_t

	running = True
	counter=0
	while running:
		for event in pygame.event.get():
			if event.type == pygame.QUIT: running = False

		keys = pygame.key.get_pressed()
		if keys[pygame.K_LCTRL]:
			if keys[pygame.K_LALT]:
				if keys[pygame.K_q]: running = False
		
		# update board
		if counter>30:
			#print(counter)
			for x in range(10):
				for y in range(13):
					t = get_tile(x, y)
					if t<0:
						board[y][x] = t
						continue
					d = get_doors(x, y)
					p = get_portcullis(x, y)
					c = get_corridor(x, y)
					d_t = t | (d<<4)
					p_d_t = d_t | (p<<8)
					c_p_d_t = p_d_t | (c<<12)
					board[y][x] = c_p_d_t
			meeple_pos = e.sql_select("x, y", "flags & 1", "characters")
			
			counter = 0

		# draw screen
		# screen.fill((64,64,64))
		screen.fill("black")
		for x in range(10):
			for y in range(13):
				raw = board[y][x]
				tile = raw & 15
				door = (raw & (15<<4))>>4
				portcul = (raw & (15<<8))>>8
				corrid = (raw & (15<<12))>>12
				# print(">", x, y, ":", raw, tile, door, portcul)
				if tile>14: continue
				screen.blit(floorTile, ((x*16)+5, (y*16)+5))
				screen.blit(tiles[tile], ((x*16)+5, (y*16)+5))
				screen.blit(doors[door], ((x*16)+5, (y*16)+5))
				screen.blit(portcullis[portcul], ((x*16)+5, (y*16)+5))
				if corrid>0:
					screen.blit(corridors[tile], ((x*16)+5, (y*16)+5))
				#print(">", raw, corrid, tile)
		screen.blit(meeple, ((meeple_pos[0]*16)+5, (meeple_pos[1]*16)+5   )  )		

		pygame.display.flip()
		clock.tick(30)
		counter += 1

	pygame.quit()

view_map()


