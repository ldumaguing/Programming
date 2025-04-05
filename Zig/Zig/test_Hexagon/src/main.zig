// ***** main.zig
const std = @import("std");
const print = @import("std").debug.print;
const hexagon = @import("Hexagon.zig");

pub fn main() !void {
    // _ = hexagon.Hexagon.new("F5");
    // print("*************\n", .{});
    // _ = hexagon.Hexagon.new("F4");
    // _ = hexagon.Hexagon.new("G5");
    // _ = hexagon.Hexagon.new("G6");
    // _ = hexagon.Hexagon.new("F6");
    // _ = hexagon.Hexagon.new("E6");
    // _ = hexagon.Hexagon.new("E5");
    // print("*************\n", .{});
    // _ = hexagon.Hexagon.new("E1");
    // _ = hexagon.Hexagon.new("F1");

    // const hex0 = hexagon.Hexagon.new("L5");
    // // //print("hex dist: {}\n", .{hex0.hex_distance(hexagon.Hexagon.new("S5"))});
    // // // const hex1 = hexagon.Hexagon.new("R7");
    // hex0.crawl_to_hex(hexagon.Hexagon.new("L4"));
    // hex0.crawl_to_hex(hexagon.Hexagon.new("M5"));
    // hex0.crawl_to_hex(hexagon.Hexagon.new("M6"));
    // hex0.crawl_to_hex(hexagon.Hexagon.new("L6"));
    // hex0.crawl_to_hex(hexagon.Hexagon.new("K6"));
    // hex0.crawl_to_hex(hexagon.Hexagon.new("K5"));

    const hex0 = hexagon.Hexagon.new("L5");
    print("dist: {}\n", .{hex0.hex_distance(hexagon.Hexagon.new("M9"))});

    // hex0.crawl_to_hex(hexagon.Hexagon.new("M9"));
    // hex0.crawl_to_hex(hexagon.Hexagon.new("N9"));
    // hex0.crawl_to_hex(hexagon.Hexagon.new("N10"));
    // hex0.crawl_to_hex(hexagon.Hexagon.new("M11"));
    // hex0.crawl_to_hex(hexagon.Hexagon.new("L10"));
    // hex0.crawl_to_hex(hexagon.Hexagon.new("L9"));

    // hex0.crawl_to_hex(hexagon.Hexagon.new("S6"));
    // hex0.crawl_to_hex(hexagon.Hexagon.new("K15"));
    // hex0.crawl_to_hex(hexagon.Hexagon.new("W10")); // 0
    // hex0.crawl_to_hex(hexagon.Hexagon.new("W9"));
    // hex0.crawl_to_hex(hexagon.Hexagon.new("W11")); // ************ broken
    // hex0.crawl_to_hex(hexagon.Hexagon.new("W14"));
    // hex0.crawl_to_hex(hexagon.Hexagon.new("W13"));
    // hex0.crawl_to_hex(hexagon.Hexagon.new("W12"));
    // hex0.crawl_to_hex(hexagon.Hexagon.new("X11")); // ************ broken
    // // // // ************

    // hex0.crawl_to_hex(hexagon.Hexagon.new("O5")); // 90
    // hex0.crawl_to_hex(hexagon.Hexagon.new("N5"));
    // hex0.crawl_to_hex(hexagon.Hexagon.new("P5"));

    // hex0.crawl_to_hex(hexagon.Hexagon.new("I10")); // 180
    // hex0.crawl_to_hex(hexagon.Hexagon.new("I9"));
    // hex0.crawl_to_hex(hexagon.Hexagon.new("I11"));
    // hex0.crawl_to_hex(hexagon.Hexagon.new("F9")); // ************ broken

    // hex0.crawl_to_hex(hexagon.Hexagon.new("O15")); // 270
    // hex0.crawl_to_hex(hexagon.Hexagon.new("N15"));
    // hex0.crawl_to_hex(hexagon.Hexagon.new("P15"));

    // hex0.crawl_to_hex(hexagon.Hexagon.new("O9"));
    // hex0.crawl_to_hex(hexagon.Hexagon.new("P9"));
    // hex0.crawl_to_hex(hexagon.Hexagon.new("P10"));
    // hex0.crawl_to_hex(hexagon.Hexagon.new("O11"));
    // hex0.crawl_to_hex(hexagon.Hexagon.new("N10"));
    // hex0.crawl_to_hex(hexagon.Hexagon.new("N9"));

    // const h0: hexagon.Hexagon = hex0.adjacent(0);
    // const h1: hexagon.Hexagon = hex0.adjacent(1);
    // const h2: hexagon.Hexagon = hex0.adjacent(2);
    // const h3: hexagon.Hexagon = hex0.adjacent(3);
    // const h4: hexagon.Hexagon = hex0.adjacent(4);
    // const h5: hexagon.Hexagon = hex0.adjacent(5);

    // std.debug.print("{}, {}, {}\n", .{ h0.x, h1.x, h2.x });
    // std.debug.print("{}, {}, {}\n", .{ h3.x, h4.x, h5.x });
    // std.debug.print("---\n{}, {}, {}\n", .{ h0.y, h1.y, h2.y });
    // std.debug.print("{}, {}, {}\n", .{ h3.y, h4.y, h5.y });
    // const hex1 = hexagon.Hexagon.new("I5");
    // hex0.crawl_to_hex(hex1);
    // std.debug.print("\n", .{});
    // var hex_foo: hexagon.Hexagon = undefined;
    // std.debug.print("{s}, {}, {}\n", .{ hex0.id, hex0.x, hex0.y });
    // std.debug.print("   ({}, {})\n", .{ hex0.carti_X, hex0.carti_Y });
    // const deg: f64 = hex0.degrees(hex1);
    // std.debug.print("deg: {}\n", .{deg});
    // std.debug.print("distance: {}\n", .{hex0.distance(hex1)});
    // std.debug.print("hex dir: {}\n", .{hex0.hex_direction(hex1)});

    // hex_foo = hexagon.Hexagon.new_XYZ(7, 3, 0);
    // std.debug.print("{s} --- ({}, {}) ({},{})\n", .{ hex_foo.id, hex_foo.x, hex_foo.y, hex_foo.carti_X, hex_foo.carti_Y });

    // const hex_adj = hex1.adjacent(1);
    // std.debug.print("{s}: ({}, {}) --- {s}: ({}, {})\n", .{ hex1.id, hex1.x, hex1.y, hex_adj.id, hex_adj.x, hex_adj.y });
}
