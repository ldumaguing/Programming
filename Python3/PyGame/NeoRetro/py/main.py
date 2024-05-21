import pygame

pygame.init()
clock = pygame.time.Clock()

wantFullScreen = True

# NeoRetro aspect
#rez = (640, 480)    # VGA 
#rez = (800, 600)    # SVGA
#rez = (800, 480)    # WVGA
#rez = (854, 480)    # FWVGA
#rez = (320, 200)    # Commodore 64
#rez = (640, 400)    # C= x2
#rez = (640, 350)    # EGA
rez = (1024, 600)   # WSVGA
#rez = (1280, 720)   # HD 720
#rez = (1280, 800)   # WXGA

# Screen Surface
if wantFullScreen: screen = pygame.display.set_mode((0,0), pygame.FULLSCREEN)
else: screen = pygame.display.set_mode(rez)
screen_dim = screen.get_size()

# Load a map
board_map = pygame.image.load("../../../IMAGES/Nuklear Winter 68/Map.jpg")
scoop = 2   # size of the spoon
chunk = (rez[0]*scoop, rez[1]*scoop) # rez*scoop

# Map Surface (a place to draw)
map_surface = pygame.Surface(chunk)
#    Draw stuff on Map surface
map_surface.blit(board_map, (0,0))
pygame.draw.rect(map_surface, (128, 128, 128), pygame.Rect(0, 0, 10, 10))
pygame.draw.rect(map_surface, (255, 0, 255), pygame.Rect(1, 1, 10, 10))
pygame.draw.rect(map_surface, (0, 0, 255), pygame.Rect(2, 2, 10, 10))


# Rez Surface
rez_surface = pygame.Surface(rez)
#    Shove the map onto the Rez surface
pygame.transform.scale(
	map_surface,
	rez,
	rez_surface)

# Scaled surface
if wantFullScreen: scale = min(screen_dim[0]/rez[0], screen_dim[1]/rez[1]) # * 0.99
else: scale = 1
scaled_rez = (rez[0]*scale, rez[1]*scale)
scaled_surface = pygame.Surface(scaled_rez)

	

pygame.draw.rect(rez_surface, (128, 128, 128), pygame.Rect(10, 10, 10, 10))
pygame.draw.rect(rez_surface, (255, 0, 255), pygame.Rect(11, 11, 10, 10))
pygame.draw.rect(rez_surface, (0, 0, 255), pygame.Rect(12, 12, 10, 10))



pygame.transform.scale(
	rez_surface,
	scaled_rez,
	scaled_surface)

# Shove the Scaled surface onto the Screen surface
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



# ---

