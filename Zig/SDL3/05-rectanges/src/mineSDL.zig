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
    var rects: [16]c.SDL_FRect = undefined;
    const now: f32 = @floatFromInt(c.SDL_GetTicks());

    // we'll have the rectangles grow and shrink over a few seconds.
    const direction = blk: {
        var val: f32 = -1.0;
        if (@mod(now, 2000) >= 1000) val = 1.0;
        break :blk val;
    };
    const scale = ((@mod(now, 1000) - 500.0) / 500.0) * direction;

    // as you can see from this, rendering draws over whatever was drawn before it.
    _ = c.SDL_SetRenderDrawColor(renderer, 0, 0, 0, c.SDL_ALPHA_OPAQUE);
    _ = c.SDL_RenderClear(renderer);

    // Let's draw a single rectangle (square, really).
    rects[0].x = 100;
    rects[0].y = 100;
    rects[0].w = 100 + (100 * scale);
    rects[0].h = 100 + (100 * scale);
    _ = c.SDL_SetRenderDrawColor(renderer, 255, 0, 0, c.SDL_ALPHA_OPAQUE);
    _ = c.SDL_RenderRect(renderer, &rects[0]);

    // Now let's draw several rectangles with one function call.
    for (0..3) |i| {
        const i_f: f32 = @floatFromInt(i);
        const size: f32 = (i_f + 1.0) * 50.0;
        rects[i].w = size + (size * scale);
        rects[i].h = size + (size * scale);
        rects[i].x = (m.WINDOW_WIDTH - rects[i].w) / 2;
        rects[i].y = (m.WINDOW_HEIGHT - rects[i].h) / 2;
    }
    _ = c.SDL_SetRenderDrawColor(renderer, 0, 255, 0, c.SDL_ALPHA_OPAQUE);
    _ = c.SDL_RenderRects(renderer, &rects, 3);

    // those were rectangle _outlines_, really. You can also draw _filled_ rectangles!
    rects[0].x = 400;
    rects[0].y = 50;
    rects[0].w = 100 + (100 * scale);
    rects[0].h = 50 + (50 * scale);
    _ = c.SDL_SetRenderDrawColor(renderer, 0, 0, 255, c.SDL_ALPHA_OPAQUE);
    _ = c.SDL_RenderFillRect(renderer, &rects[0]);

    // ...and also fill a bunch of rectangles at once...
    for (0..rects.len) |i| {
        const i_f: f32 = @floatFromInt(i);
        const w: f32 = (m.WINDOW_WIDTH / rects.len);
        const h: f32 = i_f * 8.0;
        rects[i].x = i_f * w;
        rects[i].y = m.WINDOW_HEIGHT - h;
        rects[i].w = w;
        rects[i].h = h;
    }
    _ = c.SDL_SetRenderDrawColor(renderer, 255, 255, 255, c.SDL_ALPHA_OPAQUE);
    _ = c.SDL_RenderFillRects(renderer, &rects, rects.len);

    _ = c.SDL_RenderPresent(renderer);
}
