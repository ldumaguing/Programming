// ***** main.zig
const std = @import("std");
const hexagon = @import("hexagon.zig");

pub fn main() !void {
    const hex0 = hexagon.Hexagon.new("F3", 30);
    std.debug.print("{s}, {}, {}, {}\n", .{ hex0.id, hex0.x, hex0.y, hex0.z });
}
