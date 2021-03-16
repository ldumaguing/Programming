import math
import pygame
import subprocess
from subprocess import Popen

p = Popen('hexagonCol getpoints 50.0 0.0 0.0', shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE, universal_newlines=True)
output, errors = p.communicate()
X = output.split('\n')
p1 = (int(float(X[0])), int(float(X[1])))
p2 = (int(float(X[2])), int(float(X[3])))
p3 = (int(float(X[4])), int(float(X[5])))
p4 = (int(float(X[6])), int(float(X[7])))
p5 = (int(float(X[8])), int(float(X[9])))
p6 = (int(float(X[10])), int(float(X[11])))
p7 = (int(float(X[12])), int(float(X[13])))



pygame.init()

window = pygame.display.set_mode((500, 400))
print(p7)
while True:
   pygame.draw.lines(window, (255,255,255), False, (p1, p2, p3, p4, p5, p6), 1)
   pygame.draw.line(window, (255,255,255), p5, p7, 1)
   pygame.display.update()

