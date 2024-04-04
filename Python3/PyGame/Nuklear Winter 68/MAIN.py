#!/usr/bin/python3
import json
import pygame

scrn_w = 0
scrn_h = 0
screen = None
running = True

pygame.init()
clock = pygame.time.Clock()

f = open('config.json')
data = json.load(f)
scrn_w = data["screen_w"]
scrn_h = data["screen_h"]

board_map = pygame.image.load(data["board_map"])

pygame.display.set_caption(data["gameName"])

if data["isFullscreen"]:
	screen = pygame.display.set_mode((scrn_w, scrn_h), pygame.FULLSCREEN)
else:
	screen = pygame.display.set_mode((scrn_w, scrn_h))

f.close()

# ****************************************************************************************
drag_x = 0
drag_y = 0
drag_spd = 1
while running:
	for event in pygame.event.get():
		if event.type == pygame.QUIT:
			running = False

	keys = pygame.key.get_pressed()
	if keys[pygame.K_RSHIFT]:
		drag_spd = 20
	else:
		drag_spd = 1
	if keys[pygame.K_a]:
		drag_x += 1*drag_spd
	if keys[pygame.K_d]:
		drag_x -= 1*drag_spd
	if keys[pygame.K_w]:
		drag_y += 1*drag_spd
	if keys[pygame.K_s]:
		drag_y -= 1*drag_spd








	screen.blit(board_map, (drag_x, drag_y))

	pygame.display.flip()
	clock.tick(25)





pygame.quit()
