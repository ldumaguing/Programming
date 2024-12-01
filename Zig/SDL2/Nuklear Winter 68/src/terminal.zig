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
    print("blaa\n", .{});
    mb.terminal.render(10, 10, null, null, 0.0, null, SDL.SDL_FLIP_NONE);

    var textColor: SDL.SDL_Color = undefined;
    textColor.r = 0;
    textColor.g = 255;
    textColor.b = 0;
    const gTextTexture: Texture = Texture.newText("1234567890123456789012345678901234567890123456789012345678901234567890", textColor);
    //pub var gTextTexture: Texture = undefined;
    //pub var gFont: *SDL.TTF_Font = undefined;
    //pub var flipType: SDL.SDL_RendererFlip = SDL.SDL_FLIP_NONE;
    // pub var degrees: f64 = 0.0;

    //GV.gFont = SDL.TTF_OpenFont("resource/font/NotoSansMono-ExtraCondensedThin.ttf", 16) orelse sdlPanic();
    //var textColor: SDL.SDL_Color = undefined;
    //textColor.r = 0;
    //textColor.g = 255;
    //textColor.b = 0;
    //GV.gTextTexture = Texture.newText("1234567890123456789012345678901234567890123456789012345678901234567890", textColor);
    const x: i32 = 90;
    const y: i32 = 74;
    gTextTexture.render(x, y, null, null, 0.0, null, SDL.SDL_FLIP_NONE);
    //gv.gTextTexture.render(x, y, null, null, 0.0, null, SDL.SDL_FLIP_NONE);
    //gv.gTextTexture.render(x, y + 16, null, null, 0.0, null, SDL.SDL_FLIP_NONE);
    //gv.gTextTexture.render(x, y + (16 * 24), null, null, 0.0, null, SDL.SDL_FLIP_NONE);
}

// ***********************************************************************************
pub fn sdlPanic() noreturn {
    const str = @as(?[*:0]const u8, SDL.SDL_GetError()) orelse "unknown error";
    @panic(std.mem.sliceTo(str, 0));
}
