import pygame

pygame.init()
clock = pygame.time.Clock()

screen = pygame.display.set_mode((0,0), pygame.FULLSCREEN)
screen_dim = screen.get_size()

# Map surface
board_map = pygame.image.load("../../../IMAGES/Nuklear Winter 68/Map.jpg")
chunk = (640*2, 400*2) # chunk of the board
map_surface = pygame.Surface(chunk)
map_surface.blit(board_map, (-200,-200))





# LCD surface
lcd_dim = (640, 400)
lcd_surface = pygame.Surface(lcd_dim)

pygame.transform.scale(  # scale the map to the LCD
	map_surface,
	lcd_dim,
	lcd_surface)

pygame.draw.rect(lcd_surface, (128, 128, 128), pygame.Rect(0, 0, 10, 10))
pygame.draw.rect(lcd_surface, (255, 0, 255), pygame.Rect(1, 1, 10, 10))
pygame.draw.rect(lcd_surface, (0, 0, 255), pygame.Rect(2, 2, 10, 10))




# Scaling surface based on LCD and Screen
scale = min(screen_dim[0]/lcd_dim[0], screen_dim[1]/lcd_dim[1])
scale *= 0.99

scale_lcd_dim = (lcd_dim[0]*scale, lcd_dim[1]*scale)

scale_surface = pygame.Surface(scale_lcd_dim)
pygame.transform.scale(
	lcd_surface,
	scale_lcd_dim,
	scale_surface)


upper_left_loc = (
	(screen_dim[0] - scale_lcd_dim[0]) - ((screen_dim[0] - scale_lcd_dim[0])/2),
	(screen_dim[1] - scale_lcd_dim[1]) - ((screen_dim[1] - scale_lcd_dim[1])/2)
	)

# Finally Screen gets Scaling surface data
screen.blit(
	scale_surface,
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


