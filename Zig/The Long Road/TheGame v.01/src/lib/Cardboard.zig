const rl = @import("raylib");
const std = @import("std");
const print = std.debug.print;

pub const Cardboard = struct {
    id: usize,
    index: usize, // position in the arena

    // ********************************************************************************************
    pub fn init(allocator: std.mem.Allocator, Assets: *std.ArrayList(rl.Image), tname: [:0]const u8, id: usize) Cardboard {
        const index = Assets.items.len;
        Assets.append(allocator, rl.loadImage(tname) catch undefined) catch undefined;

        print(".......{d}\n", .{index});
        // ======================================================
        return Cardboard{
            .id = id,
            .index = index,
        };
    }
};
