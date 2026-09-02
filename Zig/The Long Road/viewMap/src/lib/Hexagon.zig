const std = @import("std");
const print = std.debug.print;

const cos30: f64 = 0.86602540378; // degree base

pub const Hexagon = struct {
    x: i32,
    y: i32,
    cartX: f64,
    cartY: f64,

    pub fn init(x: i32, y: i32) Hexagon {
        const X: f64 = x * cos30;
        var Y: f64 = 0.0;
        if (@mod(x, 2) > 0)
            Y = @as(f64, @floatFromInt(y)) - 0.5
        else
            Y = @as(f64, @floatFromInt(y));

        return Hexagon{
            .x = x,
            .y = y,
            .cartX = X,
            .cartY = Y,
        };
    }

    pub fn degrees(self: Hexagon, other: Hexagon) f64 {
        const deltaX: f64 = other.cartX - self.cartX;
        const deltaY: f64 = other.cartY - self.cartY;
        const angle_rad = std.math.atan2(deltaY, deltaX);
        var deg = 360.0 - std.math.radiansToDegrees(angle_rad);
        if (deg >= 360.0) deg -= 360.0;
        return deg;
    }

    pub fn cartesian_dist(self: Hexagon, other: Hexagon) f64 {
        const deltaX: f64 = @abs(self.cartX - other.cartX);
        const deltaY: f64 = @abs(self.cartY - other.cartY);
        return std.math.sqrt((deltaX * deltaX) + (deltaY * deltaY));
    }
};
