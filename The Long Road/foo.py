#!/usr/bin/env python3
import py_package.hexagon as hx


from_hex = [1, 1]
to_hex = [0, 0]

dist = hx.get_distance(from_hex, to_hex)
print(dist)

degs = hx.get_degrees(from_hex, to_hex)
print(degs)
