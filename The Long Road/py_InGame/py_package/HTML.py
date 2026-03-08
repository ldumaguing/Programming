import re
import py_package.SQL as SQL


def get_place_combatants(conn, scenario_id, upperLeft, lowerRight, hexW, hexH):
    hview = ""
    stmt = "SELECT img_id, loc_x, loc_y, id, stack_lvl "
    stmt += "FROM instance WHERE scenario_id = "
    stmt += f"{scenario_id}"
    combatants = SQL.get_combatants(conn, stmt)
    half = hexH / 2.0
    for i in combatants:
        if SQL.is_visible(conn, scenario_id, i[3]):
            img = f"img{i[0]}"
            x = i[1] - 1
            y = i[2]
            x = (x * hexW) + upperLeft[0]
            x += (i[4] * 10)
            y = (y * hexH) + upperLeft[1]
            y -= (i[4] * 10)
            if i[1] % 2 == 0:
                y += half
            hview += f"\t\t\tctx.drawImage({img}, {x}, {y})\n"
            hview += f"\t\t\tctx.drawImage(bev, {x}, {y})\n"
    return hview


def get_print_map(plate, x, y, plateMap_dim, rowNum, colNum):
    hview = ""
    if re.search("[a-z]", plate):
        hview = get_upsidedown_plate(plate, x, y, plateMap_dim, rowNum, colNum)
        return hview

    hview = f"\t\t\tctx.drawImage(map{plate}, {x * plateMap_dim[0]}, "
    hview += f"{y * plateMap_dim[1]})"
    return hview


def get_upsidedown_plate(plate, x, y, plateMap_dim, rowNum, colNum):
    map_img = f"map{plate.upper()}"
    hview = "\t\t\tctx.save();\n"
    hview += f"\t\t\tctx.translate({(x * plateMap_dim[0]) + plateMap_dim[0]}, "
    hview += f"{(y * plateMap_dim[1]) + plateMap_dim[1]});\n"
    hview += "\t\t\tctx.rotate(180*Math.PI/180);\n"
    hview += f"\t\t\tctx.drawImage({map_img}, 0, 0);\n"
    hview += "\t\t\tctx.restore();"
    return hview


def get_print_html_end(rowNum, colNum, plateMap_dim):
    hview = "\t\t}\n"
    hview += "\t</script>\n\n"
    hview += f"\t<canvas id=\"myCanvas\" width={colNum * plateMap_dim[0]} "
    hview += f"height={rowNum * plateMap_dim[1]}>\n"
    hview += "\t\tSorry, your browser does not support canvas.\n"
    hview += "\t</canvas>\n\n"
    hview += "</body>\n</html>\n"
    return hview
