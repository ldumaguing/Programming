// ***** database.zig
const std = @import("std");
const print = @import("std").debug.print;
const MB = @import("main.zig").MB;
const Texture = @import("texture.zig").Texture;

pub const Unit = struct {
    x: i32,
    y: i32,
    array_index: u32,

    pub fn new(array_index: u32) Unit {
        return Unit{
            .x = 0,
            .y = 0,
            .array_index = array_index,
        };
    }

    pub fn render(self: Unit, imageDB: std.ArrayListAligned(Texture, null)) void {
        print("array: {}---{},{}\n", .{ self.array_index, self.x, self.y });
        print("... {s}\n", .{imageDB.items[self.array_index].name});
    }
};

pub fn populate_db() !void {
    print("yo\n", .{});

    try MB.image_db.append(Texture.new("resource/Vassal/NW68/A6 front.png"));
    try MB.unit_db.append(Unit.new(0));
    MB.unit_db.items[0].x = 100;
    MB.unit_db.items[0].y = 100;

    try MB.image_db.append(Texture.new("resource/Vassal/NW68/SG2 Saucer front.png"));
    try MB.unit_db.append(Unit.new(1));
    try MB.unit_db.append(Unit.new(1));
    MB.unit_db.items[1].x = 200;
    MB.unit_db.items[1].y = 200;
    MB.unit_db.items[2].x = 300;
    MB.unit_db.items[2].y = 300;
}
