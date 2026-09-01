const std = @import("std");
const print = std.debug.print;

const cos30: f64 = 0.86602540378; // degree base

pub const Hexagon = struct {
    x: i32,
    y: i32,

    pub fn init(x: i32, y: i32) Hexagon {
        return Hexagon{
            .x = x,
            .y = y,
        };
    }

    pub fn cartesian_dist(self: Hexagon, other: Hexagon) f64 {
        const deltaX: f64 = @abs(self.x - other.x) * cos30;
        const deltaY: f64 = @abs(self.y - other.y);

        if (@mod(@abs(self.x - other.x), 2) > 0) {
            var adjY = deltaY;
            if (self.y > other.y)
                adjY += 0.5
            else
                adjY -= 0.5;
            return std.math.sqrt((deltaX * deltaX) + (adjY * adjY));
        } else {
            return std.math.sqrt((deltaX * deltaX) + (deltaY * deltaY));
        }
    }
};
