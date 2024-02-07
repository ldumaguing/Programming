#!/usr/bin/python3
import hexagon as hx

A = "A1"
B = "CC19"

A_loc = hx.convert_id2loc(A)
B_loc = hx.convert_id2loc(B)

path = hx.get_path(A_loc, B_loc)

print(path)



