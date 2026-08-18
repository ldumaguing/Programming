const std = @import("std");
const print = std.debug.print;

pub fn main() !void {
    const ref_A = 'A';
    const ref_a = 'a';

    print("{d}, {d}\n", .{ ref_A, ref_a });
}
