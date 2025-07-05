const std = @import("std");
const print = @import("std").debug.print;
const test_boolean = @import("test_boolean");

pub fn main() !void {
    var X: u16 = 1;
    print("{d}\n", .{X});
    X = ~X;
    print("{d}\n", .{X});
}
