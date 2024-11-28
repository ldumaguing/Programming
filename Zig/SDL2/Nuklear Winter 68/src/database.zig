// ***** database.zig
const std = @import("std");
const print = @import("std").debug.print;
const main = @import("main.zig");
const Texture = @import("texture.zig").Texture;

pub fn populate_db() !void {
    print("yo\n", .{});

    try main.MB.image_db.append(Texture.new("resource/Vassal/NW68/A6 front.png"));
    try main.MB.image_db.append(Texture.new("resource/Vassal/NW68/SG2 Saucer front.png"));
}
