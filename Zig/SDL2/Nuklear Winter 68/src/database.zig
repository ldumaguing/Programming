// ***** database.zig
const std = @import("std");
const print = @import("std").debug.print;
const main = @import("main.zig");
const Texture = @import("texture.zig").Texture;

pub const Unit = struct {
    x: i32,
    y: i32,
    array_index: u32,

    pub fn new(id: u32) Unit {
        return Unit{
            .x = 0,
            .y = 0,
            .array_index = id,
        };
    }
};

pub fn populate_db() !void {
    print("yo\n", .{});

    try main.MB.image_db.append(Texture.new("resource/Vassal/NW68/A6 front.png"));
    try main.MB.image_db.append(Texture.new("resource/Vassal/NW68/SG2 Saucer front.png"));
}
