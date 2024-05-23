import pygame

def show_Screen(showMenu, screen, map_surface, rez_surface, rez,
		scaled_surface, scaled_rez, upper_left_loc,
		map_img, frame_img, menu_img):

	if show_Screen.showMenu == showMenu: return

	if showMenu:
		map_surface.blit(map_img, (0,0))
		map_surface.blit(frame_img, (0,0))
		map_surface.blit(menu_img, (0,0))
	else:
		map_surface.blit(map_img, (0,0))
		map_surface.blit(frame_img, (0,0))

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





