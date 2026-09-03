const std = @import("std");
const print = std.debug.print;

const terrain = @import("Terrain.zig");

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
    pub fn get_path(self: Hexagon, allocator: std.mem.Allocator, target: Hexagon, ph: *std.ArrayList(terrain.Path)) !void {
        if (self.x == target.x) {
            if (self.y == target.y) {
                print("same\n", .{});
                return;
            }
        }

        const refAngle: f64 = self.degrees(target);

        const hexDir = get_hexDir(self, degrees(self, target));
        var adjDirs = [_]i32{ 0, 0, 0 };
        adjDirs[1] = hexDir;
        adjDirs[0] = hexDir - 1;
        if (adjDirs[0] < 0) adjDirs[0] = 5;
        adjDirs[2] = hexDir + 1;
        if (adjDirs[2] > 5) adjDirs[2] = 0;
        print("...{d},{d},{d}\n", .{ adjDirs[0], adjDirs[1], adjDirs[2] });
        try the_path(allocator, self, target, adjDirs, refAngle, ph);
    }

    // --------------------------------------------------------------------------------------------
    pub fn the_path(allocator: std.mem.Allocator, wlk: Hexagon, target: Hexagon, adjDirs: [3]i32, refAngle: f64, ph: *std.ArrayList(terrain.Path)) !void {
        if (wlk.x == target.x) {
            if (wlk.y == target.y) {
                print("same\n", .{});
                return;
            }
        }

        const hexLoc = get_adj_hexLoc(wlk, adjDirs[0]);
        if (hexLoc[0] == target.x) {
            if (hexLoc[1] == target.y) {
                print("same\n", .{});
                return;
            }
        }
        var aHexagon = Hexagon.init(hexLoc[0], hexLoc[1]);
        var angle = @abs(aHexagon.degrees(target) - refAngle);
        for (1..3) |i| {
            const hexLoc1 = get_adj_hexLoc(wlk, adjDirs[i]);
            if (hexLoc1[0] == target.x) {
                if (hexLoc1[1] == target.y) {
                    print("{d},{d}\n", .{ target.x, target.y });
                    const aPath = terrain.Path.init(target.x, target.y);
                    _ = try ph.append(allocator, aPath);
                    return;
                }
            }
            const aHexagon1 = Hexagon.init(hexLoc1[0], hexLoc1[1]);
            const angle1 = @abs(aHexagon1.degrees(target) - refAngle);
            if (angle > angle1) {
                aHexagon = aHexagon1;
                angle = angle1;
            }
        }

        print("> {d},{d}\n", .{ aHexagon.x, aHexagon.y });
        const aPath = terrain.Path.init(aHexagon.x, aHexagon.y);
        _ = try ph.append(allocator, aPath);
        try the_path(allocator, aHexagon, target, adjDirs, refAngle, ph); // recursing
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
    pub fn get_adj_hexLoc(self: Hexagon, hexDir: i32) struct { i32, i32 } {
        var x = self.x;
        var y = self.y;

        if (@mod(self.x, 2) == 0) {
            switch (hexDir) {
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

        switch (hexDir) {
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
