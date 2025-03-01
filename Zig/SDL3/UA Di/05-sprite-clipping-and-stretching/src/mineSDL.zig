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
    _ = c.SDL_SetRenderDrawColor(m.gRenderer, 0xff, 0xff, 0xff, 0xff);
    _ = c.SDL_RenderClear(m.gRenderer);

    m.redDot.render(0.0, 0.0);
    m.greenDot.render_stretch(320.0, 0.0, [_]f32{ 50.0, 50.0 });
    m.yellowDot.render_stretch(0.0, 240.0, [_]f32{ 200.0, 200.0 });
    m.blueDot.render_stretch(320.0, 240.0, [_]f32{ 100.0, 50.0 });

    m.redDot.render_scale(320.0, 320.0, [_]f32{ 2.0, 0.5 });

    _ = c.SDL_RenderPresent(m.gRenderer);
}
