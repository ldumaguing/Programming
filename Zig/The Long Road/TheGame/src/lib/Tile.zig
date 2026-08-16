const rl = @import("raylib");
const std = @import("std");
const print = std.debug.print;

pub const Tile = struct {
    index: usize,

    // ********************************************************************************************
    pub fn init(allocator: std.mem.Allocator, GameMap: *std.ArrayList(rl.Image), tname: [:0]const u8, index: usize) Tile {
        GameMap.append(allocator, rl.loadImage(tname) catch undefined) catch undefined;

        // ======================================================
        return Tile{
            .index = index,
        };
    }
};
