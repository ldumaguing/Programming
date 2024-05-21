import pygame

pygame.init()
clock = pygame.time.Clock()

pygame.joystick.init()
joysticks = [pygame.joystick.Joystick(x) for x in range(pygame.joystick.get_count())]


screen = pygame.display.set_mode((320,200))  # required for focusing on the program

running = True
while running:
	keys = pygame.key.get_pressed()
	for event in pygame.event.get():
		if keys[pygame.K_LCTRL]:
			if keys[pygame.K_LALT]:
				if keys[pygame.K_q]: running = False
		if event.type == pygame.JOYBUTTONDOWN:
			if pygame.joystick.Joystick(0).get_button(0): print("1")
			if pygame.joystick.Joystick(0).get_button(1): print("2")
			if pygame.joystick.Joystick(0).get_button(2): print("3")
			if pygame.joystick.Joystick(0).get_button(3): print("4")
			if pygame.joystick.Joystick(0).get_button(4): print("left upper trigger")
			if pygame.joystick.Joystick(0).get_button(5): print("right upper trigger")
			if pygame.joystick.Joystick(0).get_button(6): print("left lower trigger")
			if pygame.joystick.Joystick(0).get_button(7): print("right lower trigger")
			if pygame.joystick.Joystick(0).get_button(8): print("9")
			if pygame.joystick.Joystick(0).get_button(9): print("10")
			if pygame.joystick.Joystick(0).get_button(10): print("left button")
			if pygame.joystick.Joystick(0).get_button(11): print("right button")
		if event.type == pygame.JOYAXISMOTION:
			print("Axis", event)
		if event.type == pygame.JOYBALLMOTION:
			print("Ball", event)
		if event.type == pygame.JOYHATMOTION:
			print("Hat", event)

pygame.quit()



