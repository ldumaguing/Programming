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
    const now: u64 = c.SDL_GetTicks();
    const elapsed: f32 = @as(f32, (@floatFromInt(now - m.last_time))) / 1000.0;

    for (0..m.points.len) |i| {
        const distance: f32 = elapsed * m.point_speeds[i];
        m.points[i].x += distance;
        m.points[i].y += distance;

        if ((m.points[i].x >= m.WINDOW_WIDTH) or (m.points[i].y >= m.WINDOW_HEIGHT)) {
            // off the screen; restart it elsewhere!
            if (c.SDL_rand(2) == 0) {
                m.points[i].x = c.SDL_randf() * @as(f32, @floatFromInt(m.WINDOW_WIDTH));
                m.points[i].y = 0.0;
            } else {
                m.points[i].x = 0.0;
                m.points[i].y = c.SDL_randf() * @as(f32, @floatFromInt(m.WINDOW_HEIGHT));
            }
            m.point_speeds[i] = m.MIN_PIXELS_PER_SECOND + (c.SDL_randf() * (m.MAX_PIXELS_PER_SECOND - m.MIN_PIXELS_PER_SECOND));
        }
    }

    m.last_time = now;

    // as you can see from this, rendering draws over whatever was drawn before it.
    _ = c.SDL_SetRenderDrawColor(renderer, 0, 0, 0, c.SDL_ALPHA_OPAQUE);
    _ = c.SDL_RenderClear(renderer);
    _ = c.SDL_SetRenderDrawColor(renderer, 255, 255, 255, c.SDL_ALPHA_OPAQUE);
    _ = c.SDL_RenderPoints(renderer, &m.points, m.points.len);

    _ = c.SDL_RenderPresent(renderer);
}
