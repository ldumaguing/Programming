const std = @import("std");
const print = std.debug.print;

pub fn main() !void {
    const foo_0 = @mod(0, 2); // even
    const foo_1 = @mod(1, 2); // odd
    print("{d}, {d}\n", .{ foo_0, foo_1 });

    if (@mod(0, 2) == 0) print("even\n", .{}) else print("odd\n", .{});
}
