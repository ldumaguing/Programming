#!/usr/bin/env python3
import py_package.hexagon as hx


from_hex = [0, 0]
to_hex = [2, 0]

dist = hx.get_distance(from_hex, to_hex)
print(dist)

degs = hx.get_degrees(from_hex, to_hex)
print(degs)

for i in range(6):
    h_adj = hx.get_adj_hex(from_hex, i+1)
    print(str(h_adj[0]) + "," + str(h_adj[1]))
