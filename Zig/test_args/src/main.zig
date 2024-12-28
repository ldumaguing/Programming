const std = @import("std");

pub fn main() void {
    const allocator = std.heap.page_allocator;
    var argsIterator = try std.process.ArgIterator.initWithAllocator(allocator);
    defer argsIterator.deinit();

    while (argsIterator.next()) |x| {
        std.debug.print("{s}\n", .{x});
    }
}
