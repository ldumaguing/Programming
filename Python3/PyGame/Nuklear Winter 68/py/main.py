import pygame
import math
import MyScreen as scrn

pygame.init()
clock = pygame.time.Clock()
pygame.joystick.init()
joysticks = [pygame.joystick.Joystick(x) for x in range(pygame.joystick.get_count())]
board_loc = [8,8]
hex_cursor_loc = (
	(1892.0/28.0),
	(1483.0/19.0)
)
hex_cursor_ID = [0, 0]

#rez = (1024, 600)   # WSVGA
#rez = (1280, 768)   # WXGA
rez = (1280, 720)   # HD 720
#rez = (320, 200)    # C=64
#rez = (640, 480)    # VGA
#screen = pygame.display.set_mode((0,0), pygame.FULLSCREEN)
screen = pygame.display.set_mode(rez)
screen_dim = screen.get_size()

# Load images
map_img = pygame.image.load("./img/JustMap-div2.5.png")
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
showMapCursor = False
while running:
	for event in pygame.event.get():
		# Keystrokes
		keys = pygame.key.get_pressed()
		if keys[pygame.K_LCTRL]:
			if keys[pygame.K_LALT]:
				if keys[pygame.K_q]: running = False
		if event.type == pygame.KEYDOWN:
			if keys[pygame.K_m]:
				if showMenu: showMenu = False
				else: showMenu = True

		# Gamepad signals for toggling (SEGA)
		if event.type == pygame.JOYBUTTONDOWN:
			if pygame.joystick.Joystick(0).get_button(8):   # SELECT
				if showMenu: showMenu = False
				else:
					showMenu = True
					showMapCursor = False
		if pygame.joystick.Joystick(0).get_button(9):
			if showMapCursor: showMapCursor = False
			else:
				showMapCursor = True
				if board_loc[0]==8: hex_cursor_ID[0]=0
				hex_cursor_ID[0] = math.ceil(abs(board_loc[0]-8) / hex_cursor_loc[0])

	# Gamepad signals for continuous pressing (SEGA)
	if showMenu==False:
		X = round(pygame.joystick.Joystick(0).get_axis(0))
		Y = round(pygame.joystick.Joystick(0).get_axis(1))
		if showMapCursor:
			print("hex cursor mode:", board_loc, ":", hex_cursor_ID)
			if event.type == pygame.JOYAXISMOTION:
				print(hex_cursor_ID)
		else:
			if event.type == pygame.JOYAXISMOTION:
				if X>0: board_loc[0]-=1
				if X<0: board_loc[0]+=1
				if Y>0: board_loc[1]-=1
				if Y<0: board_loc[1]+=1
			if pygame.joystick.Joystick(0).get_button(7):
				if X>0: board_loc[0]-=19
				if X<0: board_loc[0]+=19
				if Y>0: board_loc[1]-=19
				if Y<0: board_loc[1]+=19

			if board_loc[0]>8: board_loc[0]=8
			if board_loc[0]<-782: board_loc[0]=-782
			if board_loc[1]>8: board_loc[1]=8
			if board_loc[1]<-853: board_loc[1]=-853
			# print(board_loc)

	scrn.show_Screen(showMenu, screen, map_surface, rez_surface, rez,
		scaled_surface, scaled_rez, upper_left_loc,
		map_img, board_loc,
		showMapCursor, cursor_hex_img, hex_cursor_ID, hex_cursor_loc)

	pygame.display.flip()

	clock.tick(30)





pygame.quit()


