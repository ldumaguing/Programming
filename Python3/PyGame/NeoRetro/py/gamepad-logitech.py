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
			if pygame.joystick.Joystick(0).get_button(0): print("1")
			if pygame.joystick.Joystick(0).get_button(1): print("2")
			if pygame.joystick.Joystick(0).get_button(2): print("3")
			if pygame.joystick.Joystick(0).get_button(3): print("4")
			if pygame.joystick.Joystick(0).get_button(4): print("5")
			if pygame.joystick.Joystick(0).get_button(5): print("6")
			if pygame.joystick.Joystick(0).get_button(6): print("7")
			if pygame.joystick.Joystick(0).get_button(7): print("8")
			if pygame.joystick.Joystick(0).get_button(8): print("9")
			if pygame.joystick.Joystick(0).get_button(9): print("10")
			if pygame.joystick.Joystick(0).get_button(10): print("Left Axis Button")
			if pygame.joystick.Joystick(0).get_button(11): print("Right Axis as Button")
		if event.type == pygame.JOYAXISMOTION:
			print ("Left Axis X:", pygame.joystick.Joystick(0).get_axis(0))   # X: -1, 0, 1; left/right
			print ("Left Axis Y:", pygame.joystick.Joystick(0).get_axis(1))   # Y: -1, 0, 1; up/down
			print ("Right Axis X:", pygame.joystick.Joystick(0).get_axis(2))   # X: -1, 0, 1; left/right
			print ("Right Axis Y:", pygame.joystick.Joystick(0).get_axis(3))   # Y: -1, 0, 1; up/down
		if event.type == pygame.JOYHATMOTION:
			print ("Hat:", pygame.joystick.Joystick(0).get_hat(0))   # (x, y); Down-Left(-1,-1); Up-Right(1,1)

pygame.quit()



