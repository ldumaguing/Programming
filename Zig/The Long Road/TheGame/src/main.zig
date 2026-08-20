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

    print("**************************\n", .{});
    for (0..4) |row| {
        for (0..4) |col| {
            print("({d},{d})", .{ col, row });
            print("{d},", .{gMap.GMap[@intCast(col)][@intCast(row)]});
        }
        print("\n", .{});
    }
}
