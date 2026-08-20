const std = @import("std");
const print = std.debug.print;

const gamemap = @import("lib/GameMap.zig");

pub fn main() !void {
    const tileLetters = "A,b_c_,D";
    const gMap = gamemap.GameMap.init(tileLetters);
    gMap.foo();
    print("{d}\n", .{gMap.GMap[0][0]});
    print("{d}\n", .{gMap.GMap[1][1]});
    print("{d}\n", .{gMap.GMap[2][2]});
}
