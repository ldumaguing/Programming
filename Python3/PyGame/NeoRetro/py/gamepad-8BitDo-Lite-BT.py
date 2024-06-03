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
			if pygame.joystick.Joystick(0).get_button(9): print("L")
			if pygame.joystick.Joystick(0).get_button(10): print("R")
			if pygame.joystick.Joystick(0).get_button(4): print("-")
			if pygame.joystick.Joystick(0).get_button(6): print("+")
			if pygame.joystick.Joystick(0).get_button(5): print("heart")
			if pygame.joystick.Joystick(0).get_button(15): print("star")
			if pygame.joystick.Joystick(0).get_button(11): print("Up")
			if pygame.joystick.Joystick(0).get_button(12): print("Down")
			if pygame.joystick.Joystick(0).get_button(13): print("Left")
			if pygame.joystick.Joystick(0).get_button(14): print("Right")
			if pygame.joystick.Joystick(0).get_button(0): print("A")
			if pygame.joystick.Joystick(0).get_button(1): print("B")
			if pygame.joystick.Joystick(0).get_button(2): print("X")
			if pygame.joystick.Joystick(0).get_button(3): print("Y")
		if event.type == pygame.JOYAXISMOTION:
			print("Axis", event)
			print ("L2", pygame.joystick.Joystick(0).get_axis(4))   # positive
			print ("R2", pygame.joystick.Joystick(0).get_axis(5))   # positive
			print ("Left D-Pad X", pygame.joystick.Joystick(0).get_axis(0))   # <0 or >0; left to right
			print ("Left D-Pad Y", pygame.joystick.Joystick(0).get_axis(1))   # <0 or >0; up to down
			print ("Right D-Pad X", pygame.joystick.Joystick(0).get_axis(2))   # <0 or >0; left to right
			print ("Right D-Pad Y", pygame.joystick.Joystick(0).get_axis(3))   # <0 or >0; up to down
		if event.type == pygame.JOYHATMOTION:
			print("Hat", event)

pygame.quit()



