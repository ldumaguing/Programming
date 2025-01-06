// ***** hexagon.zig
const std = @import("std");
const print = @import("std").debug.print;

const mvzr = @import("mvzr.zig");
const String = @import("zig-string.zig").String;

const letter_A: u8 = 'A';
const alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";

pub const Hexagon = struct {
    // id: []const u8,
    x: i32,
    y: i32,
    z: i32,
    carti_X: f64,
    carti_Y: f64,

    pub fn foo(self: Hexagon, target_hex: Hexagon) void {
        _ = self;
        print("foo: {}\n", .{target_hex.x});
    }

    pub fn crawl_to_hex(self: Hexagon, target_hex: Hexagon) void {
        print("crawling\n***** {}, {} ---> {}, {}\n", .{ self.x, self.y, target_hex.x, target_hex.y });
        const ref_angle = acute_angle(self, target_hex);
        // print("ref_angle: {}\n", .{ref_angle});
        // print("\n", .{});
        // const angle_to_target = self.degrees(target_hex);
        // print("angle_to_target: {}\n", .{angle_to_target});
        const target_dir: i32 = self.hex_direction(target_hex);
        var valid_dirs: [3]i32 = undefined;
        valid_dirs[1] = target_dir;
        valid_dirs[2] = @mod(target_dir + 1, 6);
        valid_dirs[0] = @mod(target_dir - 1, 6);
        // print("valid dirs: {}, {}, {}\n", .{ valid_dirs[0], valid_dirs[1], valid_dirs[2] });

        var hex_runner: Hexagon = self;
        var dist: f64 = hex_runner.distance(target_hex);
        if (dist == 0.0) {
            print("Already here.\n", .{});
            return;
        }

        if (@as(i32, @intFromFloat(@round(dist))) == 1) {
            print("***** {}, {}\n\n", .{ target_hex.x, target_hex.y });
            return;
        }

        //        // **************
        //        var countdown: i32 = 25;
        while (true) {
            //        while (countdown > 0) {
            const hx0 = hex_runner.adjacent(valid_dirs[0]);
            const hx1 = hex_runner.adjacent(valid_dirs[1]);
            const hx2 = hex_runner.adjacent(valid_dirs[2]);
            //
            //            //            const angle0 = acute_angle(angle_to_target, hx0.degrees(target_hex));
            const angle0 = @abs(acute_angle(hx0, target_hex) - ref_angle);
            const angle1 = @abs(acute_angle(hx1, target_hex) - ref_angle);
            const angle2 = @abs(acute_angle(hx2, target_hex) - ref_angle);

            //            // print("angles: {}, {}, {}\n", .{
            //            //     hx0.degrees(target_hex),
            //            //     hx1.degrees(target_hex),
            //            //     hx2.degrees(target_hex),
            //            // });
            //
            // print("........angles: {}, {}, {}\n", .{
            //     angle0,
            //     angle1,
            //     angle2,
            // });
            //
            var indx: usize = 0;
            if (angle0 > angle1) indx = 1;
            if (angle1 > angle2) indx = 2;
            // print("index:{}; dir: {}\n", .{ indx, valid_dirs[indx] });
            //
            hex_runner = hex_runner.adjacent(valid_dirs[indx]);
            print("new position: {}, {}\n", .{ hex_runner.x, hex_runner.y });
            dist = @round(hex_runner.distance(target_hex));
            if (dist <= 1.0) break;
            // print("\n", .{});
            //            countdown -= 1;
        }
        //
        print("\nnew position: {}, {}\n\n", .{ target_hex.x, target_hex.y });
    }

    pub fn acute_angle(from: Hexagon, to: Hexagon) i32 {
        const X: f64 = from.carti_X - to.carti_X;
        const Y: f64 = from.carti_Y - to.carti_Y;
        //print("carti Y: {},{}\n", .{ from.carti_Y, to.carti_Y });
        //print("X,Y: {}, {}\n", .{ X, Y });
        // if (std.math.hypot(X, Y) <= 0) return -1.0;

        const DEGS: f64 = std.math.radiansToDegrees(std.math.atan(Y / X));
        //print("--------------.-----------> {}, {}\n", .{ DEGS, @abs(@round(DEGS)) });

        const deg: i32 = @intFromFloat(@round(DEGS));
        // if (deg < 0) return (0 - deg);
        return deg;
    }

    pub fn distance(self: Hexagon, target_hex: Hexagon) f64 {
        const X: f64 = target_hex.carti_X - self.carti_X;
        const Y: f64 = target_hex.carti_Y - self.carti_Y;
        if ((target_hex.carti_X == self.carti_X) and (self.carti_Y == target_hex.carti_Y)) return 0.0;
        return std.math.hypot(X, Y);
    }

    pub fn hex_direction(self: Hexagon, target_hex: Hexagon) i32 {
        // 0 = N, 1 = NE, 2 = SE, 3 = S, 4 = SW, 5 = NW
        var dir: i32 = -1;
        const degs = self.degrees(target_hex);

        if ((degs >= 0.0) and (degs < 60.0)) {
            dir = 1;
        }
        if ((degs >= 60.0) and (degs < 120.0)) {
            dir = 0;
        }
        if ((degs >= 120.0) and (degs < 180.0)) {
            dir = 5;
        }
        if ((degs >= 180.0) and (degs < 240.0)) {
            dir = 4;
        }
        if ((degs >= 240.0) and (degs < 300.0)) {
            dir = 3;
        }
        if ((degs >= 300.0) and (degs < 360.0)) {
            dir = 2;
        }

        return dir;
    }

    pub fn degrees(self: Hexagon, target_hex: Hexagon) i32 {
        const X: f64 = target_hex.carti_X - self.carti_X;
        const Y: f64 = target_hex.carti_Y - self.carti_Y;
        if (std.math.hypot(X, Y) <= 0) return -1.0;

        var DEGS: f64 = std.math.radiansToDegrees(std.math.atan(Y / X));
        if ((X >= 0) and (Y < 0)) {
            DEGS = @abs(DEGS);
        }
        if ((X < 0) and (Y < 0)) {
            DEGS = 180.0 - DEGS;
        }
        if ((X < 0) and (Y >= 0)) {
            DEGS = 180.0 - DEGS;
        }
        if ((X >= 0) and (Y >= 0)) {
            DEGS = 360.0 - DEGS;
            if (DEGS >= 360.0) DEGS = 0.0;
        }

        return @as(i32, @intFromFloat(DEGS));
    }

    pub fn adjacent(self: Hexagon, d: i32) Hexagon {
        var X: i32 = self.x;
        var Y: i32 = self.y;
        if (@mod(X, 2) == 0) {
            switch (d) {
                0 => {
                    Y = self.y - 1;
                },
                1 => {
                    X = self.x + 1;
                    Y = self.y - 1;
                },
                2 => {
                    X = self.x + 1;
                },
                3 => {
                    Y = self.y + 1;
                },
                4 => {
                    X = self.x - 1;
                },
                5 => {
                    X = self.x - 1;
                    Y = self.y - 1;
                },
                else => {},
            }
        } else {
            switch (d) {
                0 => {
                    Y = self.y - 1;
                },
                1 => {
                    X = self.x + 1;
                },
                2 => {
                    X = self.x + 1;
                    Y = self.y + 1;
                },
                3 => {
                    Y = self.y + 1;
                },
                4 => {
                    X = self.x - 1;
                    Y = self.y + 1;
                },
                5 => {
                    X = self.x - 1;
                },
                else => {},
            }
        }

        var fY: f64 = 0.0;
        if (@mod(X, 2) == 0) {
            fY = @as(f64, @floatFromInt(Y));
        } else {
            fY = @as(f64, @floatFromInt(Y)) + 0.5;
        }
        return Hexagon{
            .x = X,
            .y = Y,
            .z = 0,
            .carti_X = (std.math.cos(30.0 * std.math.pi / 180.0)) * @as(f64, @floatFromInt(X)),
            .carti_Y = fY,
        };
    }

    pub fn new_XYZ(x: i32, y: i32, z: i32) Hexagon {
        var X = x;
        var Y = y;
        if (X < 0) X = 0;
        if (X > 29) X = 29;
        if (Y < 1) Y = 1;
        if (Y > 20) Y = 20;

        var fY: f64 = 0.0;
        if (@mod(X, 2) == 0) {
            fY = @as(f64, @floatFromInt(Y));
        } else {
            fY = @as(f64, @floatFromInt(Y)) + 0.5;
        }

        return Hexagon{
            .x = x,
            .y = y,
            .z = z,
            .carti_X = (std.math.cos(30.0 * std.math.pi / 180.0)) * @as(f64, @floatFromInt(x)),
            .carti_Y = fY,
        };
    }

    pub fn new_Z(id: []const u8, z: i32) Hexagon {
        var arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
        defer arena.deinit();

        var X: i32 = 0;
        var Y: i32 = 0;
        var regex: mvzr.Regex = undefined;
        var match: mvzr.Match = undefined;

        regex = mvzr.compile("^[A-Z][A-Z]").?;
        if (regex.isMatch(id)) {
            match = regex.match(id).?;
            X = @as(i32, match.slice[0]) - letter_A + 26;
        } else {
            regex = mvzr.compile("^[A-Z]").?;
            if (regex.isMatch(id)) {
                match = regex.match(id).?;
                X = @as(i32, match.slice[0]) - letter_A;
            }
        }

        regex = mvzr.compile("[0-9]+").?;
        if (regex.isMatch(id)) {
            match = regex.match(id).?;
            Y = std.fmt.parseInt(i32, match.slice, 10) catch 0;
        }

        var fY: f64 = 0.0;
        if (@mod(X, 2) == 0) {
            fY = @as(f64, @floatFromInt(Y));
        } else {
            fY = @as(f64, @floatFromInt(Y)) + 0.5;
        }

        return Hexagon{
            .x = X,
            .y = Y,
            .z = z,
            .carti_X = (std.math.cos(30.0 * std.math.pi / 180.0)) * @as(f64, @floatFromInt(X)),
            .carti_Y = fY,
        };
    }

    pub fn new(id: []const u8) Hexagon {
        var arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
        defer arena.deinit();

        var X: i32 = 0;
        var Y: i32 = 0;
        var regex: mvzr.Regex = undefined;
        var match: mvzr.Match = undefined;

        regex = mvzr.compile("^[A-Z][A-Z]").?;
        if (regex.isMatch(id)) {
            match = regex.match(id).?;
            X = @as(i32, match.slice[0]) - letter_A + 26;
        } else {
            regex = mvzr.compile("^[A-Z]").?;
            if (regex.isMatch(id)) {
                match = regex.match(id).?;
                X = @as(i32, match.slice[0]) - letter_A;
            }
        }

        regex = mvzr.compile("[0-9]+").?;
        if (regex.isMatch(id)) {
            match = regex.match(id).?;
            Y = std.fmt.parseInt(i32, match.slice, 10) catch 0;
        }

        var fY: f64 = 0.0;
        if (@mod(X, 2) == 0) {
            fY = @as(f64, @floatFromInt(Y));
        } else {
            fY = @as(f64, @floatFromInt(Y)) + 0.5;
        }

        // print("new: {}, {}/{}\n", .{ X, Y, fY });

        return Hexagon{
            .x = X,
            .y = Y,
            .z = 0,
            .carti_X = (std.math.cos(30.0 * std.math.pi / 180.0)) * @as(f64, @floatFromInt(X)),
            .carti_Y = fY,
        };
    }
};
