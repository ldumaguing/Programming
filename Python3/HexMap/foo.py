#!/usr/bin/python3
import hexagon as hx

#A = "A1"
#B = "D19"
#A = "G15"
#B = "CC5"
#A = "Y5"
#B = "CC5"
A = "A10"
B = "M9"

A_loc = hx.convert_id2loc(A)
B_loc = hx.convert_id2loc(B)

hx.get_path(A_loc, B_loc)
