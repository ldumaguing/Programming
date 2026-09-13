const std = @import("std");
const print = std.debug.print;

pub const ImgID2index = struct {
    imgID: i32,

    pub fn init(imgID: i32) ImgID2index {
        return ImgID2index{
            .imgID = imgID,
        };
    }
};

pub const Combatant = struct {
    instanceID: i32,
    hex_x: i32,
    hex_y: i32,
    hex_z: i32,
    flag1: i32,
    id: i32, // Combatant ID
    currState: i32, // img ID
    imgIndex: i32,
    // imagefile: [64]u8,
    // imagefile_len: i32,

    pub fn init(instanceID: i32, hex_x: i32, hex_y: i32, id: i32, currState: i32) Combatant {
        return Combatant{
            .instanceID = instanceID,
            .hex_x = hex_x,
            .hex_y = hex_y,
            .hex_z = 0,
            .flag1 = 0,
            .id = id,
            .currState = currState,
            .imgIndex = 0,
            // .imagefile = undefined,
            // .imagefile_len = 0,
        };
    }
};
