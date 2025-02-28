const std = @import("std");
const print = @import("std").debug.print;
const m = @import("main.zig");

const c = @cImport({
    @cDefine("SDL_DISABLE_OLD_NAMES", {});
    @cInclude("SDL3/SDL.h");
    @cInclude("SDL3/SDL_revision.h");
    @cDefine("SDL_MAIN_HANDLED", {});
    @cInclude("SDL3/SDL_main.h");
    @cInclude("SDL3_image/SDL_image.h");
});

pub fn AppIterate() !void {
    _ = c.SDL_SetRenderDrawColor(m.gRenderer, 0xff, 0x00, 0xff, 0xff);
    _ = c.SDL_RenderClear(m.gRenderer);

    m.diTexture.render(10.0, 10.0);

    _ = c.SDL_RenderPresent(m.gRenderer);
}
