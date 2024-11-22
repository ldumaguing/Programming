// *****
const std = @import("std");
const print = @import("std").debug.print;
const SDL = @cImport({
    @cInclude("SDL2/SDL.h");
    @cInclude("SDL2/SDL_image.h");
    @cInclude("SDL2/SDL_ttf.h");
});

const mb = @import("main.zig").MB;
const gv = @import("main.zig").GV;

pub fn render() void {
    // ********** clear screen
    _ = SDL.SDL_SetRenderDrawColor(gv.renderer, 0xFF, 0x0, 0xFF, 0xFF);
    _ = SDL.SDL_RenderClear(gv.renderer);

    // GV.gArrowTexture.render(100, 100, null, null, GV.degrees, null, GV.flipType);
    // GV.gTextTexture.render(100, 100, null, null, GV.degrees, null, GV.flipType);
    mb.img.render(mb.img.x, mb.img.y, null, null, 0.0, null, SDL.SDL_FLIP_NONE);
    // GV.gArrowTexture.render(0, 0, null, null, 0.0, null, SDL.SDL_FLIP_NONE);
    mb.arrow.render(mb.arrow.x, mb.arrow.y, null, null, 0.0, null, SDL.SDL_FLIP_NONE);
}
