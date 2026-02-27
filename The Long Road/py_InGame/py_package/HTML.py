def print_map(plate, x, y, plateMap_dim):
    stmt = f"         ctx.drawImage(map{plate}, {x * plateMap_dim[0]}, "
    stmt += f"{y * plateMap_dim[1]})"
    print(stmt)
    # ctx.drawImage(img1335, 7184.82352941177, 855.772727272726);


def print_html_end(rowNum, colNum, plateMap_dim):
    stmt = "      }\n"
    stmt += "   </script>\n\n"
    stmt += f"   <canvas id=\"myCanvas\" width={colNum * plateMap_dim[0]} "
    stmt += f"height={rowNum * plateMap_dim[1]}>\n"
    stmt += "      Sorry, your browser does not support canvas.\n"
    stmt += "   </canvas>\n\n"
    stmt += "</body>\n</html>\n"
    print(stmt)
