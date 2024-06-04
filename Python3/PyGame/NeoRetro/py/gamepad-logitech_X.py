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
			if pygame.joystick.Joystick(0).get_button(0): print("A")
			if pygame.joystick.Joystick(0).get_button(1): print("B")
			if pygame.joystick.Joystick(0).get_button(2): print("X")
			if pygame.joystick.Joystick(0).get_button(3): print("Y")
			if pygame.joystick.Joystick(0).get_button(4): print("LB")
			if pygame.joystick.Joystick(0).get_button(5): print("RB")
			if pygame.joystick.Joystick(0).get_button(6): print("BACK")
			if pygame.joystick.Joystick(0).get_button(7): print("START")
			if pygame.joystick.Joystick(0).get_button(9): print("Left Axis Button")
			if pygame.joystick.Joystick(0).get_button(10): print("Right Axis as Button")
		if event.type == pygame.JOYAXISMOTION:
			print ("Left Axis X:", pygame.joystick.Joystick(0).get_axis(0))
			print ("Left Axis Y:", pygame.joystick.Joystick(0).get_axis(1))
			print ("LT:", pygame.joystick.Joystick(0).get_axis(2))
			print ("RT:", pygame.joystick.Joystick(0).get_axis(5))
			print ("Right Axis X", pygame.joystick.Joystick(0).get_axis(3))
			print ("Right Axis Y", pygame.joystick.Joystick(0).get_axis(4))
		if event.type == pygame.JOYHATMOTION:
			print ("Hat:", pygame.joystick.Joystick(0).get_hat(0))   # (x, y); Down-Left(-1,-1); Up-Right(1,1)

pygame.quit()



