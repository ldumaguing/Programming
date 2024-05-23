import pygame

pygame.init()
clock = pygame.time.Clock()

# NeoRetro aspect
rez = (640, 480)   # VGA 

# Screen surface
screen = pygame.display.set_mode((0,0), pygame.FULLSCREEN)
screen_dim = screen.get_size()

# Load a map
board_map = pygame.image.load("../../../IMAGES/aaa.png")
chunk = (640*.5, 480*.5) # chunk of the board

# Map surface (a place to draw)
map_surface = pygame.Surface(chunk)
#    Draw stuff on Map surface
map_surface.blit(board_map, (0,0))
pygame.draw.rect(map_surface, (128, 128, 128), pygame.Rect(0, 0, 10, 10))
pygame.draw.rect(map_surface, (255, 0, 255), pygame.Rect(1, 1, 10, 10))
pygame.draw.rect(map_surface, (0, 0, 255), pygame.Rect(2, 2, 10, 10))

# Scaled surface
scale = min(screen_dim[0]/rez[0], screen_dim[1]/rez[1]) * 1.0
scaled_rez = (rez[0]*scale, rez[1]*scale)
scaled_surface = pygame.Surface(scaled_rez)

pygame.transform.scale(
	map_surface,
	scaled_rez,
	scaled_surface)

# Finally Screen gets scaled surface data
upper_left_loc = (
	(screen_dim[0] - scaled_rez[0]) - ((screen_dim[0] - scaled_rez[0])/2),
	(screen_dim[1] - scaled_rez[1]) - ((screen_dim[1] - scaled_rez[1])/2)
	)

screen.blit(
	scaled_surface,
	upper_left_loc
	)

pygame.display.flip()

running = True
while running:
	pygame.event.get()
	keys = pygame.key.get_pressed()
	if keys[pygame.K_LCTRL]:
		if keys[pygame.K_LALT]:
			if keys[pygame.K_q]: running = False

	clock.tick(24)

pygame.quit()

