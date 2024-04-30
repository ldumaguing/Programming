#!/usr/bin/python3
import json
import pygame
import sys
import os
import engine as e

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
	board_w = 640
	board_h = 400
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
	print(meeple_pos)
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
			board[y][x] = get_tile(x, y)

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
			print(counter)
			for x in range(10):
				for y in range(13):
					board[y][x] = get_tile(x, y)
			meeple_pos = e.sql_select("x, y", "flags & 1", "characters")
			
			counter = 0

		# draw screen
		screen.fill((64,64,64))
		for x in range(10):
			for y in range(13):
				tile = board[y][x]
				if tile<0: continue
				screen.blit(tiles[tile], ((x*16)+5, (y*16)+5))
		screen.blit(meeple, ((meeple_pos[0]*16)+5, (meeple_pos[1]*16)+5   )  )		

		pygame.display.flip()
		clock.tick(30)
		counter += 1

	pygame.quit()

view_map()


