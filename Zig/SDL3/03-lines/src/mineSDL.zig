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
    const points_2d = [_][2]f32{
        [_]f32{ 1.0, 0.0 },
        [_]f32{ 0.0, 1.0 },
        [_]f32{ 0.0, 0.0 },
        [_]f32{ 0.0, 0.0 },
    };
    _ = points_2d;

    const X = [_]c.SDL_Point{
        .{ .x = 0.0, .y = 1.0 },
        .{ .x = 2.0, .y = 3.0 },
    };

    print("{}, {} --- {}, {}\n", .{ X[0].x, X[0].y, X[1].x, X[1].y });

    _ = c.SDL_RenderPresent(renderer);

    // const now: f64 = @as(f64, @floatFromInt(c.SDL_GetTicks())) / 1000.0;

    // const red: f32 = 0.5 + 0.5 * c.SDL_sinf(@floatCast(now));
    // const green: f32 = 0.5 + 0.5 * c.SDL_sinf(@floatCast(now + c.SDL_PI_D * 2.0 / 3.0));
    // const blue: f32 = 0.5 + 0.5 * c.SDL_sinf(@floatCast(now + c.SDL_PI_D * 4.0 / 3.0));
    // try m.errify(c.SDL_SetRenderDrawColorFloat(renderer, red, green, blue, c.SDL_ALPHA_OPAQUE_FLOAT));

    // try m.errify(c.SDL_RenderClear(renderer));
    // try m.errify(c.SDL_RenderPresent(renderer));
}
