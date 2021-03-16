import math
import pygame
import subprocess
from subprocess import Popen

scl = '100.0'
scale = int(float(scl))
Xpx = 1298
Ypx = 730

p = Popen('hexagonCol getpoints ' + scl, shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE, universal_newlines=True)
output, errors = p.communicate()
X = output.split('\n')
p1 = (int(float(X[0])), int(float(X[1])))
p2 = (int(float(X[2])), int(float(X[3])))
p3 = (int(float(X[4])), int(float(X[5])))
p4 = (int(float(X[6])), int(float(X[7])))
p5 = (int(float(X[8])), int(float(X[9])))
p6 = (int(float(X[10])), int(float(X[11])))
p7 = (int(float(X[12])), int(float(X[13])))
w = p7[0]
h = p1[1]

pygame.init()

window = pygame.display.set_mode((Xpx, Ypx))
print(p7)
countX = math.ceil(Xpx / w)
countY = math.ceil(Ypx / h)
while True:
   for x in range(countX):
      for y in range(countY):
         p1a = (p1[0] + (x * w), p1[1] + (y * h))
         p2a = (p2[0] + (x * w), p2[1] + (y * h))
         p3a = (p3[0] + (x * w), p3[1] + (y * h))
         p4a = (p4[0] + (x * w), p4[1] + (y * h))
         p5a = (p5[0] + (x * w), p5[1] + (y * h))
         p6a = (p6[0] + (x * w), p6[1] + (y * h))
         p7a = (p7[0] + (x * w), p7[1] + (y * h))
         pygame.draw.lines(window, (255,255,255), False, (p1a, p2a, p3a, p4a, p5a, p6a), 1)
         pygame.draw.line(window, (255,255,255), p5a, p7a, 1)

   pygame.display.update()

