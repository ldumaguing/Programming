import pygame

def drawFrame(s, rez, withMenu):
	light_grey = (153,153,153)
	black = (0,0,0)
	white = (255,255,255)
	grey = (37,37,37)
	pink = (255,0,255)
	x = rez[0]
	y = rez[1]
	pygame.draw.rect(s, light_grey, [0, 0, x, y], 8)

	pygame.draw.line(s, white, (0, 0), (x-1, 0), 1)
	pygame.draw.line(s, white, (0, 0), (0, y-1), 1)
	pygame.draw.line(s, grey,  (7, 1), (7, y-1), 1)
	pygame.draw.line(s, white,  (8, 1), (8, 6), 1)
	pygame.draw.line(s, grey,  (1, y-1), (x-1, y-1), 1)

	pygame.draw.line(s, white, (x-8, 0), (x-8, y-2), 1)
	pygame.draw.line(s, grey, (x-1, 1), (x-1, y-1), 1)
	pygame.draw.line(s, grey, (8, 7), (x-9, 7), 1)
	pygame.draw.line(s, grey, (x-9, 7), (x-9,1), 1)

	pygame.draw.line(s, white, (8, y-8), (x-8, y-8), 1)
	pygame.draw.line(s, white, (8, y-8), (8, y-2), 1)
	pygame.draw.line(s, grey, (x-9, y-7), (x-9, y-2), 1)
	
	if withMenu:
		pygame.draw.line(s, light_grey, (x-333, 1), (x-333, y-2), 8)
		pygame.draw.line(s, white, (x-336, 1), (x-336, y-2), 1)
		pygame.draw.line(s, grey, (x-337, 1), (x-337, 7), 1)
		pygame.draw.line(s, grey, (x-337, y-7), (x-337, y-1), 1)
		pygame.draw.line(s, grey, (x-329, 1), (x-329, y-2), 1)
		pygame.draw.line(s, white, (x-328, y-7), (x-328, y-2), 1)
		pygame.draw.line(s, white, (x-328, 1), (x-328, 6), 1)
		pygame.draw.rect(s, light_grey, pygame.Rect(x-328, 8, 320, y-17))

def show_Screen(showMenu, screen, map_surface, rez_surface, rez, scaled_surface,
		scaled_rez, upper_left_loc, map_img, board_loc):
	if showMenu:
		if show_Screen.showMenu == showMenu: return

	map_surface.blit(map_img, board_loc)
	drawFrame(map_surface, rez, showMenu)
	
	pygame.transform.scale(
		map_surface,
		rez,
		rez_surface )

	pygame.transform.scale(
		rez_surface,
		scaled_rez,
		scaled_surface )

	screen.blit(
		scaled_surface,
		upper_left_loc )

	show_Screen.showMenu = showMenu



