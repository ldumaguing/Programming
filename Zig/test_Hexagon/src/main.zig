// ***** main.zig
const std = @import("std");
const hexagon = @import("hexagon.zig");

pub fn main() !void {
    const hex0 = hexagon.Hexagon.new("G5");
    const hex1 = hexagon.Hexagon.new("Z18");
    hex0.crawl_to_hex(hex1);
    std.debug.print("\n", .{});
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
