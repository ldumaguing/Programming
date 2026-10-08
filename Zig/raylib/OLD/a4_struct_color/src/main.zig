const std = @import("std");
const print = std.debug.print;

const rl = @import("raylib");

const WholeHex = struct {
    x: i32,
    y: i32,
    c: rl.Color,

    pub fn init(x: i32, y: i32, c: rl.Color) WholeHex {
        return WholeHex{
            .x = x,
            .y = y,
            .c = c,
        };
    }
};

pub fn main() !void {
    const wh = WholeHex.init(3, 4, .white);

    print("{d},{d}: {}\n", .{wh.x, wh.y, wh.c});
}
