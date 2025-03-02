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

    const degs = @mod(c.SDL_GetTicks(), 360);
    const deg2 = @mod(c.SDL_GetTicks(), 90);
    m.redDot.render_scale_rotate(160.0, 160.0, [_]f32{ 2.0, 0.5, @as(f32, @floatFromInt(degs)) });

    const center: c.SDL_FPoint = .{ .x = 50.0, .y = 50.0 };
    m.gSpriteSheet.render_scale_rotate_center(250, 250, [_]f32{ 1.0, 1.0, @as(f32, @floatFromInt(degs)) }, center);

    const center1: c.SDL_FPoint = .{ .x = 20.0, .y = 20.0 };
    m.greenDot.render_scale_rotate_center(50, 50, [_]f32{ 1.0, 1.0, @as(f32, @floatFromInt(deg2)) }, center1);

    _ = c.SDL_RenderPresent(m.gRenderer);
}
