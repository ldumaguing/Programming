const rl = @import("raylib");
const std = @import("std");
const print = std.debug.print;

const sqlite3 = @import("Database.zig");

pub const Card = struct {
    pxX: i32,
    pxY: i32,
    texture: rl.Texture,

    // ********************************************************************************************
    pub fn init(pxX: i32, pxY: i32, fname: []const u8) !Card {
        var buff: [60]u8 = undefined;
        const filename = try std.fmt.bufPrintZ(&buff, "{s}", .{fname});
        const texture = try rl.loadTexture(filename);

        return Card{
            .pxX = pxX,
            .pxY = pxY,
            .texture = texture,
        };
    }
};

pub const PlayerAid = struct {
    pxX: i32,
    pxY: i32,
    plate: rl.Texture,
    marker: rl.Texture,
    mrk_X: i32,
    mrk_Y: i32,

    // ********************************************************************************************
    pub fn init(pxX: i32, pxY: i32, fname: []const u8, m: []const u8, db: sqlite3.Database) !PlayerAid {
        var buff: [60]u8 = undefined;

        const filename = try std.fmt.bufPrintZ(&buff, "{s}", .{fname});
        const plate = try rl.loadTexture(filename);

        const mrk = try std.fmt.bufPrintZ(&buff, "{s}", .{m});
        const marker = try rl.loadTexture(mrk);

        const turns = db.get_int_vals_session("turns").@"0";
        print("------------------------ {d}\n", .{turns});

        return PlayerAid{
            .pxX = pxX,
            .pxY = pxY,
            .plate = plate,
            .marker = marker,
            .mrk_X = 0,
            .mrk_Y = 0,
        };
    }
};

// const new_slice = try std.fmt.allocPrintZ(allocator, "{s}", .{old_slice});
