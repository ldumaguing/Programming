import pygame

pygame.init()
clock = pygame.time.Clock()

screen = pygame.display.set_mode((0,0), pygame.FULLSCREEN)
screen_dim = screen.get_size()

# Draw stuff on the LCD surface
lcd_dim = (320, 200)
lcd_surface = pygame.Surface(lcd_dim)
lcd_surface.fill((255, 255, 255))
pygame.draw.rect(lcd_surface, (255, 0, 255), pygame.Rect(50, 50, 269, 20))

scale = min(screen_dim[0]/lcd_dim[0], screen_dim[1]/lcd_dim[1])
scale *= .85

scale_lcd_dim = (lcd_dim[0]*scale, lcd_dim[1]*scale)

scale_surface = pygame.Surface(scale_lcd_dim)
pygame.transform.scale(
	lcd_surface,
	scale_lcd_dim,
	scale_surface)

#x = screen_dim[0] - (scale_lcd_dim[0])
#x = x - (x/2)
x = (screen_dim[0] - scale_lcd_dim[0]) - ((screen_dim[0] - scale_lcd_dim[0])/2)
y = (screen_dim[1] - scale_lcd_dim[1]) - ((screen_dim[1] - scale_lcd_dim[1])/2)
screen.blit(
	scale_surface,
	(x,y)
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


