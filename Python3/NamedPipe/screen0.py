import pygame
import os
import errno


def read_nonblocking(path, bufferSize=100, timeout=0.2):
	import time
	"""
	https://gist.github.com/conrad784
	=================================
	
	implementation of a non-blocking read
	works with a named pipe or file

	errno 11 occurs if pipe is still written too, wait until some data
	is available
	"""
	grace = True
	result = []
	try:
		pipe = os.open(path, os.O_RDONLY | os.O_NONBLOCK)
		while True:
			try:
				buf = os.read(pipe, bufferSize)
				if not buf:
					break
				else:
					content = buf.decode("utf-8")
					line = content.split("\n")
					result.extend(line)
			except OSError as e:
				if e.errno == 11 and grace:
					# grace period, first write to pipe might take some time
					# further reads after opening the file are then successful
					time.sleep(timeout)
					grace = False
				else:
					break

	except OSError as e:
		if e.errno == errno.ENOENT:
			pipe = None
		else:
			raise e
	os.close(pipe)
	return result


rez = (640, 480)    # VGA
screen = pygame.display.set_mode(rez)

counter = 0
running = True
while running:
	X = read_nonblocking("pipe0")
	if len(X)>0:
		print(X)
	
	for event in pygame.event.get():
		counter += 1
		print(counter)
		# Keystrokes
		keys = pygame.key.get_pressed()
		if keys[pygame.K_LCTRL]:
			if keys[pygame.K_LALT]:
				if keys[pygame.K_q]: running = False



pygame.quit()



