#!/usr/bin/python3
import hexagon as hx

A = "CC10"
B = "G5"

A_loc = hx.convert_id2loc(A)
B_loc = hx.convert_id2loc(B)

hx.get_path(A_loc, B_loc)




