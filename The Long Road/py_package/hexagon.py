import math
cos30 = 0.86602540378


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
