const std = @import("std");
const print = std.debug.print;

pub fn main() void {
    var X: i32 = 0;
    for (0..1) |_| {
        print("X: 0\n", .{});
        if (X == 0) break;
        print("foo\n", .{});
        print("bar\n", .{});
    }

    print("\n", .{});

    X = 1;
    for (0..1) |_| {
        print("X: 1\n", .{});
        if (X == 0) break;
        print("foo 1\n", .{});
        print("bar 1\n", .{});
    }
}
