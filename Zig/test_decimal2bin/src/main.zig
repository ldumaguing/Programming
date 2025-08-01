const std = @import("std");
const print = @import("std").debug.print;

const nums = [_]u8{ 169, 188, 141, 48, 3, 169, 2, 141, 49, 3, 169, 195, 141, 50, 3, 169, 2, 141, 51, 3, 96, 162, 8, 134, 186, 76, 165, 244, 162, 8, 134, 186, 76, 237, 245 };

pub fn main() !void {
    for (nums) |val| {
        print("{c}", .{val});
    }
}
