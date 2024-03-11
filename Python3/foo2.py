#!/usr/bin/python3
import math

r = 7/12
print("SPD", r*12)
old_y = 0
y = 0
for i in range(12):
    x = i+1
    y = math.ceil(r*x)
    if old_y != y:
        if i != 0:
            print("---", i)
        old_y=y
    # print(x, r*x, ":", y)
    if x==12:
        print("--- 12")
