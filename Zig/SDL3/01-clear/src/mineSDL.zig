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
    //try m.errify(c.SDL_SetRenderDrawColor(renderer, 0xff, 0x00, 0xff, 0xff));
    const now: f64 = @as(f64, @floatFromInt(c.SDL_GetTicks())) / 1000.0;

    const red: f32 = 0.5 + 0.5 * c.SDL_sinf(@floatCast(now));
    const green: f32 = 0.5 + 0.5 * c.SDL_sinf(@floatCast(now + c.SDL_PI_D * 2.0 / 3.0));
    const blue: f32 = 0.5 + 0.5 * c.SDL_sinf(@floatCast(now + c.SDL_PI_D * 4.0 / 3.0));
    try m.errify(c.SDL_SetRenderDrawColorFloat(renderer, red, green, blue, c.SDL_ALPHA_OPAQUE_FLOAT));

    try m.errify(c.SDL_RenderClear(renderer));
    try m.errify(c.SDL_RenderPresent(renderer));
}
