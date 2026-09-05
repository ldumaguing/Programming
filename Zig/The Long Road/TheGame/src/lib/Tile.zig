const rl = @import("raylib");
const std = @import("std");
const print = std.debug.print;

pub const Tile = struct {
    index: usize, // position in the arena
    id: usize, // map ID
    rotation: f32,

    // ********************************************************************************************
    pub fn init(index: usize, id: usize, rotation: f32) Tile {
        return Tile{
            .index = index,
            .id = id,
            .rotation = rotation,
        };
    }
};

//   id
// ******
// 0: map A
// 1: map B
// 2: map C
// 3: map D
// 4: map E
