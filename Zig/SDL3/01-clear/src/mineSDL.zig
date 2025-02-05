const std = @import("std");
const print = @import("std").debug.print;
const m = @import("main.zig");

const c = @cImport({
    @cDefine("SDL_DISABLE_OLD_NAMES", {});
    @cInclude("SDL3/SDL.h");
    @cInclude("SDL3/SDL_revision.h");
    @cDefine("SDL_MAIN_HANDLED", {});
    @cInclude("SDL3/SDL_main.h");
});

pub fn AppIterate(renderer: *c.SDL_Renderer) !void {
    try m.errify(c.SDL_SetRenderDrawColor(renderer, 0xff, 0x00, 0xff, 0xff));
    try m.errify(c.SDL_RenderClear(renderer));
    try m.errify(c.SDL_RenderPresent(renderer));
}
