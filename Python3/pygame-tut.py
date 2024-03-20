import pygame

pygame.init()
screen_w = 1120
screen_h = 700
screen = pygame.display.set_mode((screen_w, screen_h))   # display Surface
pygame.display.set_caption('bla')
clock = pygame.time.Clock()

board_map = pygame.image.load('Pictures/Map.jpg')

a_surface = pygame.Surface((150,150))
a_surface.fill('Red')

running = True
while running:
	for event in pygame.event.get():
		if event.type == pygame.QUIT:
			running = False

	screen.blit(board_map, (-300, -300))   # Block Image Transfer (BLIT)
	screen.blit(a_surface, (10,10))
	pygame.display.update()
	clock.tick(60)

pygame.quit()


