const rl = @import("raylib");
const std = @import("std");
const print = std.debug.print;

pub const Tile = struct {
    id: usize,
    index: usize,

    // ********************************************************************************************
    pub fn init(allocator: std.mem.Allocator, GameMap: *std.ArrayList(rl.Image), tname: [:0]const u8, id: usize) Tile {
        const index = GameMap.items.len;
        GameMap.append(allocator, rl.loadImage(tname) catch undefined) catch undefined;

        print(".......{d}\n", .{index});
        // ======================================================
        return Tile{
            .id = id,
            .index = index,
        };
    }
};
