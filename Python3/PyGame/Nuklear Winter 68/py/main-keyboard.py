import pygame
import MyScreen as scrn

pygame.init()
clock = pygame.time.Clock()
pygame.joystick.init()
joysticks = [pygame.joystick.Joystick(x) for x in range(pygame.joystick.get_count())]
board_loc = [8,8]

#rez = (1024, 600)   # WSVGA
#rez = (1280, 768)   # WXGA
rez = (1280, 720)   # HD 720
#rez = (320, 200)    # C=64
#rez = (640, 480)    # VGA
screen = pygame.display.set_mode((0,0), pygame.FULLSCREEN)
#screen = pygame.display.set_mode(rez)
screen_dim = screen.get_size()

# Load images
map_img = pygame.image.load("./img/JustMap-div2.5.png")

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

		if showMenu==False:
			if keys[pygame.K_a]: board_loc[0]+=1
			if keys[pygame.K_d]: board_loc[0]-=1
			if keys[pygame.K_w]: board_loc[1]+=1
			if keys[pygame.K_s]: board_loc[1]-=1
			if keys[pygame.K_a] & keys[pygame.K_RSHIFT]: board_loc[0]+=20
			if keys[pygame.K_d] & keys[pygame.K_RSHIFT]: board_loc[0]-=20
			if keys[pygame.K_w] & keys[pygame.K_RSHIFT]: board_loc[1]+=20
			if keys[pygame.K_s] & keys[pygame.K_RSHIFT]: board_loc[1]-=20
			if keys[pygame.K_x]:
				board_loc[0] = -387
				board_loc[1] = -423	
	
	if board_loc[0]>8: board_loc[0]=8
	if board_loc[0]<-782: board_loc[0]=-782
	if board_loc[1]>8: board_loc[1]=8
	if board_loc[1]<-853: board_loc[1]=-853
		
	print(board_loc)


	scrn.show_Screen(showMenu, screen, map_surface, rez_surface, rez,
		scaled_surface, scaled_rez, upper_left_loc,
		map_img, board_loc)

	pygame.display.flip()

	clock.tick(30)





pygame.quit()


