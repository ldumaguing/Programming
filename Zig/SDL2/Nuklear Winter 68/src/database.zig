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
        var v: SDL.SDL_Rect = undefined;
        v.x = 0;
        v.y = 0;
        v.w = @intFromFloat(@as(f64, @floatFromInt(MB.image_db.items[self.array_index].w)) * MB.scale);
        v.h = @intFromFloat(@as(f64, @floatFromInt(MB.image_db.items[self.array_index].h)) * MB.scale);

        var unit_x: i32 = @intFromFloat(@as(f64, @floatFromInt(self.x)) * MB.scale);
        unit_x += MB.image_db.items[self.array_index].x;
        unit_x += MB.map_image.x;

        var unit_y: i32 = @intFromFloat(@as(f64, @floatFromInt(self.y)) * MB.scale);
        unit_y += MB.image_db.items[self.array_index].y;
        unit_y += MB.map_image.y;

        // mb.image_db.items[0].render(unit_x, unit_y, null, &v, 0.0, null, SDL.SDL_FLIP_NONE);

        // print("array: {}---{},{}\n", .{ self.array_index, self.x, self.y });
        // print("... {s}\n", .{self.image_db.items[self.array_index].name});
        self.image_db.items[self.array_index].render(unit_x, unit_y, null, &v, 0.0, null, SDL.SDL_FLIP_NONE);
    }
};

pub fn populate_db() !void {
    print("yo\n", .{});

    try MB.image_db.append(Texture.new("resource/Vassal/NW68/A6 front.png"));
    try MB.image_db.append(Texture.new("resource/Vassal/NW68/SG2 Saucer front.png"));

    try MB.unit_db.append(Unit.new(0));
    MB.unit_db.items[0].x = 292;
    MB.unit_db.items[0].y = 141;

    try MB.unit_db.append(Unit.new(1));
    MB.unit_db.items[1].x = 5021;
    MB.unit_db.items[1].y = 141;

    try MB.unit_db.append(Unit.new(1));
    MB.unit_db.items[2].x = 5021;
    MB.unit_db.items[2].y = 3846;

    try MB.unit_db.append(Unit.new(1));
    MB.unit_db.items[3].x = 292;
    MB.unit_db.items[3].y = 3846;
}
