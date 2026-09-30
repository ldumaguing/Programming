const std = @import("std");
const print = std.debug.print;

pub fn main() void {
    const curr = [_]i32{ 0, 0 };
    var prev = [_]i32{ 0, 0 };

    print("{}\n", .{std.mem.eql(i32, &curr, &prev)});

    const foo = [_]i32{ 69, 70 };
    print("{}\n", .{std.mem.eql(i32, &foo, &prev)});

    prev = foo;
    print("{}\n", .{std.mem.eql(i32, &foo, &prev)});
}
