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
		pygame.draw.line(s, white, (0, 0), (x, y), 8)

def show_Screen(showMenu, screen, map_surface, rez_surface, rez, scaled_surface,
		scaled_rez, upper_left_loc, map_img):
	if show_Screen.showMenu == showMenu: return

	map_surface.blit(map_img, (0,0))
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



