const std = @import("std");
const print = std.debug.print;

const hexagon = @import("lib/Hexagon.zig");

pub fn main() !void {
    //var arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    //defer arena.deinit();
    //const allocator = arena.allocator();

    const A = hexagon.Hexagon.init(0, 0);
    //const B = hexagon.Hexagon.init(1, 1);
    print("{d}\n", .{A.get_hexDir(181.0)});
}
