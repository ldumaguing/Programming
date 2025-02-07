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
    //var rects: [16]c.SDL_FRect = undefined;
    const now: f32 = @floatFromInt(c.SDL_GetTicks());
    _ = now;

    // we'll have the rectangles grow and shrink over a few seconds
    // const float direction = ((now % 2000) >= 1000) ? 1.0f : -1.0f;
    // const float scale = ((float) (((int) (now % 1000)) - 500) / 500.0f) * direction;

    // const now: f64 = @as(f64, @floatFromInt(c.SDL_GetTicks())) / 1000.0;

    // const red: f32 = 0.5 + 0.5 * c.SDL_sinf(@floatCast(now));
    // const green: f32 = 0.5 + 0.5 * c.SDL_sinf(@floatCast(now + c.SDL_PI_D * 2.0 / 3.0));
    // const blue: f32 = 0.5 + 0.5 * c.SDL_sinf(@floatCast(now + c.SDL_PI_D * 4.0 / 3.0));
    // try m.errify(c.SDL_SetRenderDrawColorFloat(renderer, red, green, blue, c.SDL_ALPHA_OPAQUE_FLOAT));

    // try m.errify(c.SDL_RenderClear(renderer));
    try m.errify(c.SDL_RenderPresent(renderer));
}
