#!/usr/bin/env python3
import py_package.hexagon as hx


from_hex = [10, 0]
to_hex = [10, 10]

dist = hx.get_distance(from_hex, to_hex)
print(dist)

degs = hx.get_degrees(from_hex, to_hex)
print(degs)

for i in range(6):
    h_adj = hx.get_adj_hex(from_hex, i+1)
    print(str(h_adj[0]) + "," + str(h_adj[1]))

print("----------")
delta_degs = hx.get_delta_degs(359, 355)
print(delta_degs)
delta_degs = hx.get_delta_degs(359, 2)
print(delta_degs)
delta_degs = hx.get_delta_degs(180, 185)
print(delta_degs)
delta_degs = hx.get_delta_degs(180, 175)
print(delta_degs)
print("----------")
# threeAdjs = hx.get_3adjs(from_hex, to_hex)
# print(threeAdjs)

hx.generate_path(from_hex, to_hex, -1, [])
