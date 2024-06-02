import pygame

pygame.init()
clock = pygame.time.Clock()

pygame.joystick.init()
joysticks = [pygame.joystick.Joystick(x) for x in range(pygame.joystick.get_count())]


screen = pygame.display.set_mode((320,200))  # required for focusing on the program

running = True
while running:
	for event in pygame.event.get():
		keys = pygame.key.get_pressed()
		if keys[pygame.K_LCTRL]:
			if keys[pygame.K_LALT]:
				if keys[pygame.K_q]: running = False

		if event.type == pygame.JOYBUTTONDOWN:
			print("Button", event)
		if event.type == pygame.JOYAXISMOTION:
			print("Axis", event)
		if event.type == pygame.JOYHATMOTION:
			print("Hat", event)

pygame.quit()



