// ***** database.zig
const std = @import("std");
const print = @import("std").debug.print;
const main = @import("main.zig");
const Texture = @import("texture.zig").Texture;

pub const Unit = struct {
    id: u32,
    x: i32,
    y: i32,
    array_index: u32,

    pub fn new(id: u32, array_index: u32) Unit {
        return Unit{
            .id = id,
            .x = 0,
            .y = 0,
            .array_index = array_index,
        };
    }
};

pub fn populate_db() !void {
    print("yo\n", .{});

    try main.MB.image_db.append(Texture.new("resource/Vassal/NW68/A6 front.png"));
    try main.MB.unit_db.append(Unit.new(100, 0));

    try main.MB.image_db.append(Texture.new("resource/Vassal/NW68/SG2 Saucer front.png"));
    try main.MB.unit_db.append(Unit.new(101, 1));
    try main.MB.unit_db.append(Unit.new(102, 1));
}
