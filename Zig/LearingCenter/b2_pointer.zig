const std = @import("std");
const print = std.debug.print;

pub fn main() void {
    var X: u64 = 0;
    var Y: u64 = 1000;
    print("{d},{d}\n", .{ X, Y });
    foo(&X, &Y);
    print("in main: {d},{d}\n", .{ X, Y });
}

fn foo(X: *u64, Y: *u64) void {
    print("in foo\n", .{});
    print("{d},{d}\n", .{ X.*, Y.* });
    X.* = 69;
    Y.* += X.*;
}
