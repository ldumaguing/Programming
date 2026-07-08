const std = @import("std");
const print = std.debug.print;

const ints = [_]i32{ 1, 2, 3, 4 };

pub fn main() void {
    print("yo-->{d}\n", .{ints[2]});
}
