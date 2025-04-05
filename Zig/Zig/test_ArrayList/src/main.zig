const std = @import("std");
const print = @import("std").debug.print;

const ArrayList = std.ArrayList;
// const test_allocator = std.testing.allocator;
const test_allocator = std.heap.page_allocator;

pub fn main() !void {
    var list = ArrayList(u8).init(test_allocator);
    defer list.deinit();
    try list.append('H');
    try list.append('e');
    try list.append('l');
    try list.append('l');
    try list.append('o');
    try list.appendSlice(" World!");

    print("{s}\n", .{list.items});
    print("{s}\n", .{list.items[3..7]});
}
