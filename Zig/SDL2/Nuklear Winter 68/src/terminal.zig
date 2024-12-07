// ***** terminal.zig
const std = @import("std");
const print = @import("std").debug.print;
const SDL = @cImport({
    @cInclude("SDL2/SDL.h");
    @cInclude("SDL2/SDL_image.h");
    @cInclude("SDL2/SDL_ttf.h");
});

const mb = @import("main.zig").MB;
const gv = @import("main.zig").GV;
const Texture = @import("Texture.zig").Texture;

pub fn doTerminal() void {
    print("arrow: ({},{})\n", .{ mb.arrow.x, mb.arrow.y });
    print("map: ({},{})\n", .{ mb.map_image.x, mb.map_image.y });
    const arrow_loc_x: i32 = mb.arrow.x - mb.map_image.x;
    const arrow_loc_y: i32 = mb.arrow.y - mb.map_image.y;
    print("arrow loc: ({},{})\n", .{ arrow_loc_x, arrow_loc_y });

    print("\n", .{});
    mb.terminal.render(10, 10, null, null, 0.0, null, SDL.SDL_FLIP_NONE);

    var textColor: SDL.SDL_Color = undefined;
    textColor.r = 0;
    textColor.g = 255;
    textColor.b = 0;
    var gTextTexture: Texture = Texture.newText("1234567890123456789012345678901234567890123456789012345678901234567890", textColor, gv.gFont);

    const x: i32 = 90;
    const y: i32 = 73;
    gTextTexture.render(x, y, null, null, 0.0, null, SDL.SDL_FLIP_NONE);

    gTextTexture = Texture.newText("1234567890123456789012345678901234567890123456789012345678901234567890", textColor, gv.gFont2);
    gTextTexture.render(x, y + (16 * 12), null, null, 0.0, null, SDL.SDL_FLIP_NONE);

    gTextTexture = Texture.newText("123456789.123456789.123456789.123456789.123456789.123456789.1234567890", textColor, gv.gFont);
    gTextTexture.render(x, y + (16 * 1), null, null, 0.0, null, SDL.SDL_FLIP_NONE);
    gTextTexture = Texture.newText("123456789.123456789.123456789.123456789.123456789.123456789.1234567890", textColor, gv.gFont);
    gTextTexture.render(x + 1, y + (16 * 1), null, null, 0.0, null, SDL.SDL_FLIP_NONE);
}
