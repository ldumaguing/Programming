// ***** hexagon.zig
const std = @import("std");
const mvzr = @import("mvzr.zig");
const String = @import("zig-string.zig").String;

const letter_A: u8 = 'A';
const alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";

pub const Hexagon = struct {
    id: []const u8,
    x: i32,
    y: i32,
    z: i32,
    carti_X: f64,
    carti_Y: f64,

    pub fn foo(self: Hexagon, hex: Hexagon) void {
        _ = self;
        std.debug.print("foo: {}\n", .{hex.x});
    }

    pub fn crawl_to_hex(self: Hexagon, hex: Hexagon) void {
        var valid_hexes: [3]i32 = undefined;
        const hex_dir = self.hex_direction(hex);
        valid_hexes[0] = @mod(hex_dir - 1, 6);
        valid_hexes[1] = hex_dir;
        valid_hexes[2] = @mod(hex_dir + 1, 6);
        std.debug.print("{}, {}, {}:  {u}\n", .{ valid_hexes[0], valid_hexes[1], valid_hexes[2], '\u{6753}' });
        // var hexagon_tmp: Hexagon = undefined;
    }

    pub fn distance(self: Hexagon, hex: Hexagon) f64 {
        const X: f64 = hex.carti_X - self.carti_X;
        const Y: f64 = hex.carti_Y - self.carti_Y;
        if ((hex.carti_X == self.carti_X) and (self.carti_Y == hex.carti_Y)) return 0.0;
        return std.math.hypot(X, Y);
    }

    pub fn hex_direction(self: Hexagon, hex: Hexagon) i32 {
        // 0 = N, 1 = NE, 2 = SE, 3 = S, 4 = SW, 5 = NW
        var dir: i32 = 2;
        const degs = self.degrees(hex);

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

        return dir;
    }

    pub fn degrees(self: Hexagon, hex: Hexagon) f64 {
        const X: f64 = hex.carti_X - self.carti_X;
        const Y: f64 = hex.carti_Y - self.carti_Y;
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

        return DEGS;
    }

    pub fn adjacent(self: Hexagon, d: i32) Hexagon {
        var X: i32 = 0;
        var Y: i32 = 0;
        if (@mod(X, 2) == 0) {
            switch (d) {
                0 => {
                    X = self.x;
                    Y = self.y - 1;
                },
                1 => {
                    X = self.x + 1;
                    Y = self.y - 1;
                },
                2 => {
                    X = self.x + 1;
                    Y = self.y;
                },
                3 => {
                    X = self.x;
                    Y = self.y + 1;
                },
                4 => {
                    X = self.x - 1;
                    Y = self.y;
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
                    X = self.x;
                    Y = self.y - 1;
                },
                1 => {
                    X = self.x + 1;
                    Y = self.y;
                },
                2 => {
                    X = self.x + 1;
                    Y = self.y + 1;
                },
                3 => {
                    X = self.x;
                    Y = self.y + 1;
                },
                4 => {
                    X = self.x - 1;
                    Y = self.y + 1;
                },
                5 => {
                    X = self.x - 1;
                    Y = self.y;
                },
                else => {},
            }
        }

        // Use your favorite allocator
        var arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
        defer arena.deinit();

        // Create your String
        var myString = String.init(arena.allocator());
        defer myString.deinit();

        var buff: [32]u8 = undefined;
        if (X < 26) {
            _ = std.fmt.bufPrintZ(&buff, "{c}{}", .{ alphabet[@abs(X)], Y }) catch undefined;
        } else {
            X -= 26;
            _ = std.fmt.bufPrintZ(&buff, "{c}{c}{}", .{ alphabet[@abs(X)], alphabet[@abs(X)], Y }) catch undefined;
        }
        const String_len: usize = @abs(std.mem.indexOf(u8, &buff, "\x00").?);
        const slice = buff[0..String_len :0];

        var fY: f64 = 0.0;
        if (@mod(X, 2) == 0) {
            fY = @as(f64, @floatFromInt(Y));
        } else {
            fY = @as(f64, @floatFromInt(Y)) + 0.5;
        }

        return Hexagon{
            .id = slice,
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

        // Use your favorite allocator
        var arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
        defer arena.deinit();

        // Create your String
        var myString = String.init(arena.allocator());
        defer myString.deinit();

        var buff: [32]u8 = undefined;
        if (X < 26) {
            _ = std.fmt.bufPrintZ(&buff, "{c}{}", .{ alphabet[@abs(X)], Y }) catch undefined;
        } else {
            X = x - 26;
            _ = std.fmt.bufPrintZ(&buff, "{c}{c}{}", .{ alphabet[@abs(X)], alphabet[@abs(X)], Y }) catch undefined;
        }
        const String_len: usize = @abs(std.mem.indexOf(u8, &buff, "\x00").?);
        const slice = buff[0..String_len :0];

        var fY: f64 = 0.0;
        if (@mod(X, 2) == 0) {
            fY = @as(f64, @floatFromInt(Y));
        } else {
            fY = @as(f64, @floatFromInt(Y)) + 0.5;
        }

        return Hexagon{
            .id = slice,
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
        // std.debug.print("id: {s}\n", .{id});

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
            .id = id,
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
        // std.debug.print("id: {s}\n", .{id});

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
            .id = id,
            .x = X,
            .y = Y,
            .z = 0,
            .carti_X = (std.math.cos(30.0 * std.math.pi / 180.0)) * @as(f64, @floatFromInt(X)),
            .carti_Y = fY,
        };
    }
};
