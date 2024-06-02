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
			if pygame.joystick.Joystick(0).get_button(0): print("X")
			if pygame.joystick.Joystick(0).get_button(1): print("Circle")
			if pygame.joystick.Joystick(0).get_button(2): print("Square")
			if pygame.joystick.Joystick(0).get_button(3): print("Triangle")
			if pygame.joystick.Joystick(0).get_button(4): print("Share")
			if pygame.joystick.Joystick(0).get_button(5): print("Home")
			if pygame.joystick.Joystick(0).get_button(6): print("Options")
			if pygame.joystick.Joystick(0).get_button(7): print("Left Axis as Button")
			if pygame.joystick.Joystick(0).get_button(8): print("Right Axis as Button")
			if pygame.joystick.Joystick(0).get_button(9): print("L1")
			if pygame.joystick.Joystick(0).get_button(10): print("R1")
			if pygame.joystick.Joystick(0).get_button(11): print("D-Pad Up")
			if pygame.joystick.Joystick(0).get_button(12): print("D-Pad Down")
			if pygame.joystick.Joystick(0).get_button(13): print("D-Pad Left")
			if pygame.joystick.Joystick(0).get_button(14): print("D-Pad Right")
		if event.type == pygame.JOYAXISMOTION:
			print ("L2", pygame.joystick.Joystick(0).get_axis(4))   # -1 to 1
			print ("L2", pygame.joystick.Joystick(0).get_axis(5))   # -1 to 1
			print ("Left Axis X", pygame.joystick.Joystick(0).get_axis(0))   # -1 to 1; left to right
			print ("Left Axis Y", pygame.joystick.Joystick(0).get_axis(1))   # -1 to 1; up to down
			print ("Right Axis X", pygame.joystick.Joystick(0).get_axis(2))   # -1 to 1; left to right
			print ("Right Axis Y", pygame.joystick.Joystick(0).get_axis(3))   # -1 to 1; up to down

pygame.quit()



