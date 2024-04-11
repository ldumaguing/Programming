#!/usr/bin/python3
import json
import pygame

scrn_w = 0
scrn_h = 0
screen = None
running = True
board_map_w = 0
board_map_h = 0

pygame.init()
clock = pygame.time.Clock()

f = open('config.json')
data = json.load(f)
scale = data["scale"]
if scale>1.0:
	print("1.0 scale is max")
	exit()

board_map_w = data["board_map_w"]
board_map_h = data["board_map_h"]

board_map = pygame.image.load(data["board_map"])

pygame.display.set_caption(data["gameName"])

screen = pygame.display.set_mode((0,0))
x, y = screen.get_size()
x = x * scale
y = y * scale

if y<200:
	print("Too small scale")
	exit()

if data["isFullscreen"]:
	screen = pygame.display.set_mode((x, y), pygame.FULLSCREEN)
else:
	screen = pygame.display.set_mode((x, y))

f.close()

# ****************************************************************************************
drag_x = 0
drag_y = 0
drag_spd = 25
zoom = 100
counter = 0
while running:
	for event in pygame.event.get():
		if event.type == pygame.QUIT: running = False

		if event.type == pygame.MOUSEWHEEL:
			if event.y > 0: zoom += 5
			else: zoom -= 5
		if zoom < 5: zoom = 5

	keys = pygame.key.get_pressed()
	if keys[pygame.K_RSHIFT]:
		drag_spd = 1
	else:
		drag_spd = 25
	if keys[pygame.K_a]:
		drag_x += 1*drag_spd
	if keys[pygame.K_d]:
		drag_x -= 1*drag_spd
	if keys[pygame.K_w]:
		drag_y += 1*drag_spd
	if keys[pygame.K_s]:
		drag_y -= 1*drag_spd

	if keys[pygame.K_LCTRL]:
		if keys[pygame.K_LALT]:
			if keys[pygame.K_q]: running = False

	if keys[pygame.K_q]:
		drag_x = 0
		drag_y = 0
	if keys[pygame.K_e]:
		zoom = 100

	z = zoom / 100.0
	screen.fill("purple")
	fish = pygame.transform.scale(board_map, (board_map_w*z, board_map_h*z))
	screen.blit(fish, (drag_x, drag_y))

	pygame.display.flip()
	clock.tick(24)





pygame.quit()
