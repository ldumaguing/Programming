import re


def print_map(plate, x, y, plateMap_dim, rowNum, colNum):
    if re.search("[a-z]", plate):
        upsidedown_plate(plate, x, y, plateMap_dim, rowNum, colNum)
        return

    stmt = f"\t\t\tctx.drawImage(map{plate}, {x * plateMap_dim[0]}, "
    stmt += f"{y * plateMap_dim[1]})"
    print(stmt)
    # ctx.drawImage(img1335, 7184.82352941177, 855.772727272726);


def upsidedown_plate(plate, x, y, plateMap_dim, rowNum, colNum):
    map_img = f"map{plate.upper()}"
    stmt = "\t\t\tctx.save();\n"
    stmt += f"\t\t\tctx.translate({(x * plateMap_dim[0]) + plateMap_dim[0]}, "
    stmt += f"{(y * plateMap_dim[1]) + plateMap_dim[1]});\n"
    stmt += "\t\t\tctx.rotate(180*Math.PI/180);\n"
    stmt += f"\t\t\tctx.drawImage({map_img}, 0, 0);\n"
    stmt += "\t\t\tctx.restore();"
    print(stmt)


def print_html_end(rowNum, colNum, plateMap_dim):
    stmt = "\t\t}\n"
    stmt += "\t</script>\n\n"
    stmt += f"\t<canvas id=\"myCanvas\" width={colNum * plateMap_dim[0]} "
    stmt += f"height={rowNum * plateMap_dim[1]}>\n"
    stmt += "\t\tSorry, your browser does not support canvas.\n"
    stmt += "\t</canvas>\n\n"
    stmt += "</body>\n</html>\n"
    print(stmt)
