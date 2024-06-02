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
			if pygame.joystick.Joystick(0).get_button(0): print("0: Square")
			if pygame.joystick.Joystick(0).get_button(1): print("1: X")
			if pygame.joystick.Joystick(0).get_button(2): print("2: Circle")
			if pygame.joystick.Joystick(0).get_button(3): print("3: Triangle")
			if pygame.joystick.Joystick(0).get_button(4): print("4: L1")
			if pygame.joystick.Joystick(0).get_button(5): print("5: R1")
			if pygame.joystick.Joystick(0).get_button(8): print("8: Share")
			if pygame.joystick.Joystick(0).get_button(9): print("9: Options")
			if pygame.joystick.Joystick(0).get_button(10): print("10: Left Axis as Button")
			if pygame.joystick.Joystick(0).get_button(11): print("11: Right Axis as Button")
			if pygame.joystick.Joystick(0).get_button(12): print("12: Home")
		if event.type == pygame.JOYAXISMOTION:
			print ("Left Axis X:", pygame.joystick.Joystick(0).get_axis(0))   # X: -1, 0, 1; left/right
			print ("Left Axis Y:", pygame.joystick.Joystick(0).get_axis(1))   # Y: -1, 0, 1; up/down
			print ("Right Axis X:", pygame.joystick.Joystick(0).get_axis(2))   # X: -1, 0, 1; left/right
			print ("Right Axis Y:", pygame.joystick.Joystick(0).get_axis(5))   # Y: -1, 0, 1; up/down
			print ("L2", pygame.joystick.Joystick(0).get_axis(3))   # not pressed: -1; pressed: 1
			print ("R2", pygame.joystick.Joystick(0).get_axis(4))   # not pressed: -1; pressed: 1
		if event.type == pygame.JOYHATMOTION:
			print ("Hat:", pygame.joystick.Joystick(0).get_hat(0))   # (x, y); Down-Left(-1,-1); Up-Right(1,1)

pygame.quit()



