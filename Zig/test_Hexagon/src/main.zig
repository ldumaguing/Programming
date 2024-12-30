// ***** main.zig
const std = @import("std");
const hexagon = @import("hexagon.zig");

pub fn main() !void {
    const hex0 = hexagon.Hexagon.new("AA3", 0);
    const hex1 = hexagon.Hexagon.new("G4", 0);
    std.debug.print("{s}, {}, {}, {}\n", .{ hex0.id, hex0.x, hex0.y, hex0.z });

    hex0.foo(hex1);
}
