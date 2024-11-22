// ***** PHASE_render.zig
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

    var viewport: SDL.SDL_Rect = undefined;
    viewport.x = 0;
    viewport.y = 0;
    viewport.w = @intFromFloat(@as(f64, @floatFromInt(mb.img.w)) * 0.5);
    viewport.h = @intFromFloat(@as(f64, @floatFromInt(mb.img.h)) * 0.5);
    mb.img.render(mb.img.x, mb.img.y, null, &viewport, 0.0, null, SDL.SDL_FLIP_NONE);

    mb.arrow.render(mb.arrow.x, mb.arrow.y, null, null, 0.0, null, SDL.SDL_FLIP_NONE);
}
