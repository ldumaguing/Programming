import pygame
import math
import MyScreen as scrn

pygame.init()
clock = pygame.time.Clock()

board_loc = [0,0]
hex_cursor_dim = (2188.0/28.0, 1715.0/19.0)
hex_cursor_loc = [0, 0]
hex_cursor_ID = [0, 0]

#rez = (1024, 600)   # WSVGA
#rez = (1280, 768)   # WXGA
#rez = (1280, 800)   # WXGA
#rez = (1600, 900)   # WSXGA
rez = (1366, 768)   # FWXGA
#rez = (1280, 720)   # HD 720
#rez = (320, 200)    # C=64
#rez = (640, 480)    # VGA
#rez = (800, 480)    # WVGA
#rez = (400, 240)    # WQVGA
#rez = (853, 480)    # my VGA 16:9
#rez = (356, 200)    # mine2
#rez = (426, 240)    # mine3
#rez = (712, 400)    # mine4
#rez = (320, 240)    # ILI9341
#rez = (480, 320)    # HX8357D
#rez = (512, 384)    # Agon Lite 2

# Agon Lite 2
# 320x200; 64 colors
# 512x384; 16 colors
# 1024x768; 2 colors

#screen = pygame.display.set_mode((0,0), pygame.FULLSCREEN)
screen = pygame.display.set_mode(rez)
screen_dim = screen.get_size()

# Load images
map_img = pygame.image.load("./img/Map.png")
cursor_hex_img = pygame.image.load("./img/cursor-hex.png")

# Map Surface (a place to draw)
map_surface = pygame.Surface(rez)
#    Draw stuff on Map surface
map_surface.blit(map_img, board_loc)
scrn.drawFrame(map_surface, rez, False)

# Rez Surface
rez_surface = pygame.Surface(rez)
#    Shove the map onto the Rez surface
pygame.transform.scale(
	map_surface,
	rez,
	rez_surface)

# Scaled surface
scale = min(screen_dim[0]/rez[0], screen_dim[1]/rez[1])   # * 0.99
#scale = 1
scaled_rez = (rez[0]*scale, rez[1]*scale)
scaled_surface = pygame.Surface(scaled_rez)
pygame.transform.scale(
	rez_surface,
	scaled_rez,
	scaled_surface)

# Shove the Scaled surface onto the Screen surface
upper_left_loc = (
	(screen_dim[0] - scaled_rez[0]) - ((screen_dim[0] - scaled_rez[0])/2),
	(screen_dim[1] - scaled_rez[1]) - ((screen_dim[1] - scaled_rez[1])/2))

screen.blit(
	scaled_surface,
	upper_left_loc)

pygame.display.flip()

# ****************************************************************************************
running = True
showMenu = False
scrn.show_Screen.showMenu = False
showMapCursor = True
while running:
	for event in pygame.event.get():
		# Keystrokes
		keys = pygame.key.get_pressed()
		if keys[pygame.K_LCTRL]:
			if keys[pygame.K_LALT]:
				if keys[pygame.K_q]: running = False

		# Toggle menu screen
		if event.type == pygame.KEYDOWN:
			if keys[pygame.K_m]:
				if showMenu: showMenu = False
				else: showMenu = True

			if showMenu==False:
				if keys[pygame.K_d]: hex_cursor_ID[0]+=1
				if keys[pygame.K_a]: hex_cursor_ID[0]-=1
				if keys[pygame.K_w]: hex_cursor_ID[1]-=1
				if keys[pygame.K_s]: hex_cursor_ID[1]+=1

				if hex_cursor_ID[0]<0: hex_cursor_ID[0]=0
				if hex_cursor_ID[0]>29: hex_cursor_ID[0]=29
				if hex_cursor_ID[1]<0: hex_cursor_ID[1]=0
				if hex_cursor_ID[1]>19: hex_cursor_ID[1]=19

				# Horizontal
				if (hex_cursor_ID[0]==15) & (board_loc[0]==0):
					board_loc[0] = -1140
				if (hex_cursor_ID[0]==29) & (board_loc[0]==-1140):
					board_loc[0] = -1598
				if (hex_cursor_ID[0]==18) & (board_loc[0]==-1598):
					board_loc[0] = -1140
				if (hex_cursor_ID[0]==13) & (board_loc[0]==-1140):
					board_loc[0] = 0

				# Vertical
				if (hex_cursor_ID[1]==7) & (board_loc[1]==0):
					board_loc[1] = -686
				if (hex_cursor_ID[1]==15) & (board_loc[1]==-686):
					board_loc[1] = -1163
				if (hex_cursor_ID[1]==12) & (board_loc[1]==-1163):
					board_loc[1] = -686
				if (hex_cursor_ID[1]==6) & (board_loc[1]==-686):
					board_loc[1] = 0

				if (hex_cursor_ID[0]%2) & (hex_cursor_ID[1]>18): hex_cursor_ID[1]=18
				hex_cursor_loc[0] = round((hex_cursor_ID[0]*hex_cursor_dim[0])+board_loc[0])
				hex_cursor_loc[1] = round((hex_cursor_ID[1]*hex_cursor_dim[1])+board_loc[1])
				if hex_cursor_ID[0]%2:
					hex_cursor_loc[1] += (hex_cursor_dim[1]/2.0)

			print(hex_cursor_ID)

	scrn.show_Screen(showMenu, screen, map_surface, rez_surface, rez,
		scaled_surface, scaled_rez, upper_left_loc,
		map_img, board_loc,
		showMapCursor, cursor_hex_img, hex_cursor_ID, hex_cursor_loc)

	pygame.display.flip()

	clock.tick(60)





pygame.quit()


