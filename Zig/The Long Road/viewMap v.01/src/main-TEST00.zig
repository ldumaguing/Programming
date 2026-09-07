const std = @import("std");
const print = std.debug.print;

const hexagon = @import("lib/Hexagon.zig");
const terrain = @import("lib/Terrain.zig");

pub fn main() !void {
    var arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    defer arena.deinit();
    const allocator = arena.allocator();

    var Paths = std.ArrayList(terrain.Path).empty;
    defer Paths.deinit(allocator);

    const A = hexagon.Hexagon.init(0, 0);
    const B = hexagon.Hexagon.init(10, 10);
    try A.print_path(allocator, A, &Paths);
    try A.print_path(allocator, B, &Paths);
    print("{d}\n\n", .{Paths.items.len});
    for (0..Paths.items.len) |i| {
        print("{d},{d}\n", .{ Paths.items.ptr[i].x, Paths.items.ptr[i].y });
    }
    print("\n", .{});
    Paths.items[3].x = 691;
    for (0..Paths.items.len) |i| {
        print("{d},{d}\n", .{ Paths.items.ptr[i].x, Paths.items.ptr[i].y });
    }
}
