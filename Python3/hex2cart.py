#!/usr/bin/python3
import math

pixel_H = 150
sin60 = 0.86602540378

X = 1
Y = 2


x = X*sin60
print("x:", x)

y = (Y*pixel_H) + ((X%2)*(pixel_H/2.0))
print("y:", y)




