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

    // ********************************************************************************************
    pub fn get_hexDir(self: Hexagon, dir: f64) i32 {
        _ = self;
        const d: i32 = @as(i32, @intFromFloat(dir));
        const direction: i32 = switch (d) {
            0...59 => 1,
            60...119 => 0,
            120...179 => 5,
            180...239 => 4,
            240...299 => 3,
            else => 2,
        };
        return direction;
    }

    // ********************************************************************************************
    pub fn get_adj_hexLoc(self: Hexagon, dir: i32) struct { i32, i32 } {
        var x = self.x;
        var y = self.y;

        if (@mod(self.x, 2) == 0) {
            switch (dir) {
                0 => y -= 1,
                1 => x += 1,
                2 => {
                    x += 1;
                    y += 1;
                },
                3 => y += 1,
                4 => {
                    x -= 1;
                    y += 1;
                },
                else => x -= 1,
            }
            return .{ x, y };
        }

        switch (dir) {
            0 => y -= 1,
            1 => {
                x += 1;
                y -= 1;
            },
            2 => x += 1,
            3 => y += 1,
            4 => x -= 1,
            else => {
                x -= 1;
                y -= 1;
            },
        }

        return .{ x, y };
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
