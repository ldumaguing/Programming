const rl = @import("raylib");
const std = @import("std");
const print = std.debug.print;

const sqlite3 = @import("Database.zig");

pub const Card = struct {
    pxX: i32,
    pxY: i32,
    texture: rl.Texture,
    rotation: f32,

    // ********************************************************************************************
    pub fn init(pxX: i32, pxY: i32, rotation: f32, fname: []const u8) !Card {
        var buff: [60]u8 = undefined;
        const filename = try std.fmt.bufPrintZ(&buff, "{s}", .{fname});
        const texture = try rl.loadTexture(filename);

        return Card{
            .pxX = pxX,
            .pxY = pxY,
            .texture = texture,
            .rotation = rotation,
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
    curr_turn: i32,

    // ********************************************************************************************
    pub fn init(pxX: i32, pxY: i32, fname: []const u8, m: []const u8, db: sqlite3.Database) !PlayerAid {
        var buff: [60]u8 = undefined;

        const filename = try std.fmt.bufPrintZ(&buff, "{s}", .{fname});
        const plate = try rl.loadTexture(filename);

        const mrk = try std.fmt.bufPrintZ(&buff, "{s}", .{m});
        const marker = try rl.loadTexture(mrk);

        var turns: i32 = db.get_int_vals_session("turns").@"0";
        turns -= 1;

        const upper_left: [2]i32 = [_]i32{ 17, 333 };
        const grid_dim: [2]i32 = [_]i32{ 978, 781 };
        const rect_dim: [2]i32 = [_]i32{ @divTrunc(grid_dim[0], 5), @divTrunc(grid_dim[1], 4) };

        const turn_X: i32 = @mod(turns, 5);
        const turn_Y: i32 = @divTrunc(turns, 4);

        const grid_X: i32 = rect_dim[0] * turn_X;
        const grid_Y: i32 = rect_dim[1] * turn_Y;

        const loc_X: i32 = grid_X + upper_left[0];
        const loc_Y: i32 = grid_Y + upper_left[1];

        const card_dim: [2]i32 = [_]i32{ 1504, 1131 };
        const adj_X: i32 = loc_X - card_dim[0] + 15;
        const adj_Y: i32 = loc_Y + pxY + 18;

        return PlayerAid{
            .pxX = pxX,
            .pxY = pxY,
            .plate = plate,
            .marker = marker,
            .mrk_X = adj_X,
            .mrk_Y = adj_Y,
            .curr_turn = 1,
        };
    }
};
