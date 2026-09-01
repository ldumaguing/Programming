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
};

// ************************************************************************************************
pub fn cartesian_dist(A: Hexagon, B: Hexagon) f64 {
    const deltaX: f64 = @abs(A.x - B.x) * cos30;
    const deltaY: f64 = @abs(A.y - B.y);

    if (@mod(@abs(A.x - B.x), 2) > 0) {
        //print("modify y\n", .{});
        var adjY = deltaY;
        if (A.y > B.y)
            adjY += 0.5
        else
            adjY -= 0.5;
        return std.math.sqrt((deltaX * deltaX) + (adjY * adjY));
    } else {
        return std.math.sqrt((deltaX * deltaX) + (deltaY * deltaY));
    }
}
