const std = @import("std");
const fruits = [_][]const u8{ "apple", "banana", "cherry" };

pub fn main() void {
    // [_] infers the array size automatically (here, 3)
    // const fruits = [_][]const u8{ "apple", "banana", "cherry" };

    // Loop through the array of strings
    for (fruits) |fruit| {
        std.debug.print("{s}---{s}\n", .{ fruit, fruits[0] });
        std.debug.print("{s}---{s}\n", .{ fruit, fruits[1] });
    }
}
