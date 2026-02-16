import math

cos30 = 0.86602540378


def get_delta_degs(ref_degs, degs):
    delta = abs(ref_degs - degs)
    delta = delta * 1.0
    if delta >= 180.0:
        delta = 360.0 - delta

    return delta


# *****************************************************************************
def get_adj_hex(f_hx, direction):
    # 1: N
    # 2: NE
    # 3: SE
    # 4: S
    # 5: SW
    # 6: NW
    hex_loc = [f_hx[0], f_hx[1]]
    if f_hx[0] % 2:
        if direction == 1:
            hex_loc[1] -= 1
        if direction == 2:
            hex_loc[0] += 1
            hex_loc[1] -= 1
        if direction == 3:
            hex_loc[0] += 1
        if direction == 4:
            hex_loc[1] += 1
        if direction == 5:
            hex_loc[0] -= 1
        if direction == 6:
            hex_loc[0] -= 1
            hex_loc[1] -= 1
    else:
        if direction == 1:
            hex_loc[1] -= 1
        if direction == 2:
            hex_loc[0] += 1
        if direction == 3:
            hex_loc[0] += 1
            hex_loc[1] += 1
        if direction == 4:
            hex_loc[1] += 1
        if direction == 5:
            hex_loc[0] -= 1
            hex_loc[1] += 1
        if direction == 6:
            hex_loc[0] -= 1

    return hex_loc


# *****************************************************************************
def get_degrees(f_hx, t_hx):
    if f_hx == t_hx:
        return -1.0

    x0 = f_hx[0] * cos30
    y0 = f_hx[1] * 1.0
    if f_hx[0] % 2:
        y0 -= 0.5

    x1 = t_hx[0] * cos30
    y1 = t_hx[1] * 1.0
    if t_hx[0] % 2:
        y1 -= 0.5

    dx = x1 - x0
    dy = y0 - y1
    rads = math.atan2(dy, dx)
    degs = math.degrees(rads)
    if degs < 0:
        degs += 360.0

    return round(degs)


# *****************************************************************************
def get_distance(f_hx, t_hx):
    if f_hx == t_hx:
        return 0.0

    x0 = f_hx[0] * cos30
    y0 = f_hx[1] * 1.0
    if f_hx[0] % 2:
        y0 -= 0.5

    x1 = t_hx[0] * cos30
    y1 = t_hx[1] * 1.0
    if t_hx[0] % 2:
        y1 -= 0.5

    deltaX = abs(x0 - x1)
    deltaY = abs(y0 - y1)
    return (math.hypot(deltaX, deltaY))


# *****************************************************************************
def get_3adjs(f_hx, t_hx):
    threeHexes = []
    degs = get_degrees(f_hx, t_hx)

    if degs >= 300.0:
        threeHexes = [2, 3, 4]
    elif degs >= 240.0:
        threeHexes = [3, 4, 5]
    elif degs >= 180.0:
        threeHexes = [4, 5, 6]
    elif degs >= 120.0:
        threeHexes = [5, 6, 1]
    elif degs >= 60.0:
        threeHexes = [6, 1, 2]
    else:
        threeHexes = [1, 2, 3]

    return threeHexes


# *****************************************************************************
def generate_path(f_hx, t_hx, ref_degs, threeHexes):
    if ref_degs < 0:
        ref_degs = get_degrees(f_hx, t_hx)
        threeHexes = get_3adjs(f_hx, t_hx)

    if f_hx == t_hx:
        print("end")
        return

    # print(str(f_hx) + " " + str(ref_degs) + " " + str(threeHexes))

    curr_degs = 360.0
    curr_arry = 0
    curr_hex = []
    for i in range(3):
        adj_hex = get_adj_hex(f_hx, threeHexes[i])
        degs = get_degrees(adj_hex, t_hx)
        delta_degs = get_delta_degs(ref_degs, degs)
        if curr_degs > delta_degs:
            curr_degs = delta_degs
            curr_arry = i
            curr_hex = adj_hex
        # print(str(threeHexes[i]) + " >" + str(adj_hex)
        #      + " " + str(degs) + " " + str(delta_degs))
    # print("...")
    print(str(curr_arry) + ": " + str(curr_hex))
    generate_path(curr_hex, t_hx, ref_degs, threeHexes)














