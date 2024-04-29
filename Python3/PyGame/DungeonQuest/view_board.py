#!/usr/bin/python3
import json
import pygame
import sys
import os

board_w = 10*18
board_h = 13*18
foo = pygame.image.load('images/t0.png')
screen = pygame.display.set_mode((board_w, board_h))

pygame.init()
clock = pygame.time.Clock()

running = True
while running:
	for event in pygame.event.get():
		if event.type == pygame.QUIT: running = False

	screen.fill("black")
	for i in range(10):
		screen.blit(foo, (8*i, 8*i))
	'''
	screen.blit(foo, (0, 0))
	screen.blit(foo, (8, 8))
	screen.blit(foo, (16, 0))
	'''

	pygame.display.flip()
	clock.tick(24)





pygame.quit()
