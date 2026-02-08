#!/usr/bin/env python3
import sys
import random

d100 = random.randrange(100) + 1
modifier = 0
rank = 1


# ***************************************************************************************
def rank_A():
    d = int(d100) + modifier
    if d == 100:
        print("RED")
    elif d == 99:
        print("Green")
    elif d >= 74 and d <= 98:
        print("Blue")
    elif d <= 17:
        print("BLACK")
    else:
        print("White")


# ***********************************************
def rank_B():
    d = int(d100) + modifier
    if d == 100:
        print("RED")
    elif d == 99:
        print("Yellow")
    elif d == 98:
        print("Green")
    elif d >= 73 and d <= 97:
        print("Blue")
    elif d <= 16:
        print("BLACK")
    else:
        print("White")


# ***********************************************
def rank_C():
    d = int(d100) + modifier
    if d == 100:
        print("RED")
    elif d == 99:
        print("Yellow")
    elif d == 98 or d == 97:
        print("Green")
    elif d <= 96 and d >= 72:
        print("Blue")
    elif d <= 15:
        print("BLACK")
    else:
        print("White")


# ***********************************************
def rank_X():
    d = int(d100) + modifier
    if d <= 100 and d >= 96:
        print("RED")
    elif d <= 95 and d >= 80:
        print("Orange")
    elif d <= 79 and d >= 59:
        print("Yellow")
    elif d <= 58 and d >= 27:
        print("Green")
    elif d <= 26 and d >= 20:
        print("Blue")
    elif d <= 1:
        print("BLACK")
    else:
        print("White")


# ***********************************************
def rank_Y():
    d = int(d100) + modifier
    if d <= 100 and d >= 95:
        print("RED")
    elif d <= 94 and d >= 78:
        print("Orange")
    elif d <= 77 and d >= 56:
        print("Yellow")
    elif d <= 55 and d >= 22:
        print("Green")
    elif d <= 21 and d >= 17:
        print("Blue")
    elif d <= 1:
        print("BLACK")
    else:
        print("White")


# ***********************************************
def rank_Z():
    d = int(d100) + modifier
    if d <= 100 and d >= 94:
        print("RED")
    elif d <= 93 and d >= 76:
        print("Orange")
    elif d <= 75 and d >= 51:
        print("Yellow")
    elif d <= 50 and d >= 16:
        print("Green")
    elif d <= 15 and d >= 13:
        print("Blue")
    elif d <= 1:
        print("BLACK")
    else:
        print("White")


# ***********************************************
def rank_default(rr):
    d = int(d100) + int(modifier)
    nested_list = [
        [0, 0, 0, 0, 0, 0, 0],
        [100, 99, 98, 97, 95, 70, 14],
        [100, 99, 98, 96, 93, 68, 13],
        [100, 99, 98, 96, 92, 67, 12],
        [100, 99, 98, 95, 90, 65, 11],
        [100, 98, 96, 92, 86, 61, 10],
        [100, 98, 96, 91, 84, 59, 9],
        [100, 98, 96, 90, 82, 57, 8],
        [100, 98, 95, 88, 79, 55, 7],
        [100, 98, 95, 87, 77, 53, 6],
        [100, 98, 94, 85, 74, 51, 5],
        [100, 97, 92, 82, 70, 48, 4],
        [100, 97, 91, 80, 67, 46, 4],  # x
        [100, 97, 90, 78, 64, 43, 3],
        [100, 97, 89, 76, 61, 41, 3],
        [100, 97, 88, 74, 57, 39, 3],
        [100, 96, 86, 71, 52, 36, 2],
        [100, 96, 85, 69, 48, 34, 2],
        [100, 96, 84, 67, 44, 32, 2],
        [100, 96, 83, 65, 40, 29, 2],
        [100, 95, 81, 62, 35, 25, 1],
        [100, 95, 80, 60, 31, 22, 1],
    ]

    r = int(rr)
    if d > nested_list[r][1]:
        print("     ..     ..    ..     ..      ..      ..RED")
        print("                                           RF: x5")
    elif d > nested_list[r][2]:
        print("     ..     ..    ..     ..      ..Orange..   ")
        print("                                   RF: x4")
    elif d > nested_list[r][3]:
        print("     ..     ..    ..     ..Yellow..      ..   ")
        print("                           RF: x3")
    elif d > nested_list[r][4]:
        print("     ..     ..    ..Green..      ..      ..   ")
        print("                    RF: x2")
    elif d > nested_list[r][5]:
        print("     ..     ..Blue..     ..      ..      ..   ")
        print("              RF: x1")
    elif d > nested_list[r][6]:
        print("     ..White..    ..     ..      ..      ..   ")
        print("       RF: x0")
    else:
        print("BLACK..     ..    ..     ..      ..      ..   ")
        print("RF: x0")

    print("rolled:", d)


# ***************************************************************************************
if len(sys.argv) == 1:
    print("'ACT Table.py'   rank   [d100|0]   [modifier]")
    exit()

if len(sys.argv) >= 2:
    rank = sys.argv[1]
if len(sys.argv) >= 3:
    if int(sys.argv[2]) > 0:
        d100 = sys.argv[2]
if len(sys.argv) >= 4:
    modifier = sys.argv[3]

# print("rank:", rank)
# print("roll:", d100)
# print("mod:", modifier)

r = int(rank)
if r <= -26:
    rank_A()
elif r >= -25 and r <= -6:
    rank_B()
elif r >= -5 and r <= 0:
    rank_C()
elif r >= 22 and r <= 120:
    rank_X()
elif r >= 121 and r <= 600:
    rank_Y()
elif r > 600:
    rank_Z()
else:
    rank_default(r)
