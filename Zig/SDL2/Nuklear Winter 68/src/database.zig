// ***** database.zig
const std = @import("std");
const print = @import("std").debug.print;
const MB = @import("main.zig").MB;
const Texture = @import("texture.zig").Texture;
const SDL = @cImport({
    @cInclude("SDL2/SDL.h");
    @cInclude("SDL2/SDL_image.h");
    @cInclude("SDL2/SDL_ttf.h");
});

pub const Unit = struct {
    x: i32,
    y: i32,
    array_index: u32,
    image_db: std.ArrayListAligned(Texture, null),

    pub fn new(array_index: u32) Unit {
        return Unit{
            .x = 0,
            .y = 0,
            .array_index = array_index, // index of image_db
            .image_db = MB.image_db, // read only
        };
    }

    pub fn render(self: Unit) void {
        // print("array: {}---{},{}\n", .{ self.array_index, self.x, self.y });
        // print("... {s}\n", .{self.image_db.items[self.array_index].name});
        self.image_db.items[self.array_index].render(self.x, self.y, null, null, 0.0, null, SDL.SDL_FLIP_NONE);
    }
};

pub fn populate_db() !void {
    print("yo\n", .{});

    try MB.image_db.append(Texture.new("resource/Vassal/NW68/A6 front.png"));
    try MB.image_db.append(Texture.new("resource/Vassal/NW68/SG2 Saucer front.png"));

    try MB.unit_db.append(Unit.new(0));
    MB.unit_db.items[0].x = 100;
    MB.unit_db.items[0].y = 100;

    try MB.unit_db.append(Unit.new(1));
    MB.unit_db.items[1].x = 200;
    MB.unit_db.items[1].y = 200;

    try MB.unit_db.append(Unit.new(1));
    MB.unit_db.items[2].x = 300;
    MB.unit_db.items[2].y = 300;
}
