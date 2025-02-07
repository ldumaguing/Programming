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
    const line_points = [_]c.SDL_FPoint{
        .{ .x = 100.0, .y = 354.0 },
        .{ .x = 220.0, .y = 230.0 },
        .{ .x = 140.0, .y = 230.0 },
        .{ .x = 320.0, .y = 100.0 },
        .{ .x = 500.0, .y = 230.0 },
        .{ .x = 420.0, .y = 230.0 },
        .{ .x = 540.0, .y = 354.0 },
        .{ .x = 400.0, .y = 354.0 },
        .{ .x = 100.0, .y = 354.0 },
    };

    // as you can see from this, rendering draws over whatever was drawn before it.
    _ = c.SDL_SetRenderDrawColor(renderer, 100, 100, 100, c.SDL_ALPHA_OPAQUE);
    _ = c.SDL_RenderClear(renderer);

    // You can draw lines, one at a time, like these brown ones...
    _ = c.SDL_SetRenderDrawColor(renderer, 127, 49, 32, c.SDL_ALPHA_OPAQUE);
    _ = c.SDL_RenderLine(renderer, 240, 450, 400, 450);
    _ = c.SDL_RenderLine(renderer, 240, 356, 400, 356);
    _ = c.SDL_RenderLine(renderer, 240, 356, 240, 450);
    _ = c.SDL_RenderLine(renderer, 400, 356, 400, 450);

    // You can also draw a series of connected lines in a single batch...
    _ = c.SDL_SetRenderDrawColor(renderer, 0, 255, 0, c.SDL_ALPHA_OPAQUE);
    _ = c.SDL_RenderLines(renderer, &line_points, line_points.len);

    // here's a bunch of lines drawn out from a center point in a circle.
    // we randomize the color of each line, so it functions as animation.
    const size: f32 = 30.0;
    const x: f32 = 320.0;
    const y: f32 = 95.0 - (size / 2.0);
    for (0..360) |i| {
        _ = c.SDL_SetRenderDrawColor(renderer, @intCast(c.SDL_rand(256)), @intCast(c.SDL_rand(256)), @intCast(c.SDL_rand(256)), c.SDL_ALPHA_OPAQUE);
        _ = c.SDL_RenderLine(renderer, x, y, x + c.SDL_sinf(@floatFromInt(i)) * size, y + c.SDL_cosf(@floatFromInt(i)) * size);
    }

    _ = c.SDL_RenderPresent(renderer);
}
