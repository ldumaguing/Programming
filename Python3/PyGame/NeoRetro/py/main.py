import pygame

pygame.init()
clock = pygame.time.Clock()
pygame.display.set_caption("NewRetro")
screen = pygame.display.set_mode((0,0), pygame.FULLSCREEN)
scrn_x, scrn_y = screen.get_size()
scrn_center_x, scrn_center_y = (scrn_x/2, scrn_y/2)




lcd_x, lcd_y = (320,240)
print("lcd:", lcd_x, lcd_y)
scale = 0.99
if (scrn_x/lcd_x)<(scrn_y/lcd_y):
	scale = (scrn_x/lcd_x)*scale
else:
	scale = (scrn_y/lcd_y)*scale

lcd_scale_x, lcd_scale_y = (lcd_x*scale, lcd_y*scale)
print(scale)
print("lcd scale:", lcd_scale_x, lcd_scale_y)
print("---")
lcd_scale_center_x, lcd_scale_center_y = (lcd_scale_x/2, lcd_scale_y/2)
print("lcd_center:", lcd_scale_center_x, lcd_scale_center_y)

corner_x, corner_y = (
	int(scrn_center_x - lcd_scale_center_x),
	int(scrn_center_y - lcd_scale_center_y)
	)
print("corner:", corner_x, corner_y)






running = True
while running:
	for event in pygame.event.get():
		if event.type == pygame.QUIT: running = False

	keys = pygame.key.get_pressed()
	if keys[pygame.K_LCTRL]:
		if keys[pygame.K_LALT]:
			if keys[pygame.K_q]: running = False


	color = (255,0,0)
	pygame.draw.rect(screen, color, pygame.Rect(corner_x, corner_y,
		lcd_scale_x, lcd_scale_y
		))
	pygame.display.flip()



	clock.tick(24)

pygame.quit()
