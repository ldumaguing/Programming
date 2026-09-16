const std = @import("std");
const print = std.debug.print;

pub const Card = struct {
    name: []const u8,
    pxX: i32,
    pxY: i32,
    width: i32,
    height: i32,

    // ********************************************************************************************
    pub fn init(name: []const u8, pxX: i32, pxY: i32, width: i32, height: i32) Card {
        return Card{
            .name = name,
            .pxX = pxX,
            .pxY = pxY,
            .width = width,
            .height = height,
        };
    }
};
