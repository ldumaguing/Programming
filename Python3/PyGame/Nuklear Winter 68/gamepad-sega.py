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
			print("Buttons:", event)
			if pygame.joystick.Joystick(0).get_button(0): print("0: X")
			if pygame.joystick.Joystick(0).get_button(1): print("1: A")
			if pygame.joystick.Joystick(0).get_button(2): print("2: B")
			if pygame.joystick.Joystick(0).get_button(3): print("3: Y")
			if pygame.joystick.Joystick(0).get_button(4): print("4: C")
			if pygame.joystick.Joystick(0).get_button(5): print("5: Z")
			if pygame.joystick.Joystick(0).get_button(6): print("6: Left Trigger")
			if pygame.joystick.Joystick(0).get_button(7): print("7: Right Trigger")
			if pygame.joystick.Joystick(0).get_button(8): print("8: Select")
			if pygame.joystick.Joystick(0).get_button(9): print("9: Start")
		if event.type == pygame.JOYAXISMOTION:
			print("Axis", event)
			print (pygame.joystick.Joystick(0).get_axis(0))   # X: -1, 0, 1; left/right
			print (pygame.joystick.Joystick(0).get_axis(1))   # Y: -1, 0, 1; up/down

pygame.quit()



