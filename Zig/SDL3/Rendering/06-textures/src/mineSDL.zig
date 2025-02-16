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
    var dst_rect: c.SDL_FRect = undefined;
    const now: f32 = @floatFromInt(c.SDL_GetTicks());

    // we'll have some textures move around over a few seconds.
    const direction = blk: {
        var val: f32 = -1.0;
        if (@mod(now, 2000) >= 1000) val = 1.0;
        break :blk val;
    };
    const scale = ((@mod(now, 1000) - 500.0) / 500.0) * direction;

    // as you can see from this, rendering draws over whatever was drawn before it.
    _ = c.SDL_SetRenderDrawColor(renderer, 0, 0, 0, c.SDL_ALPHA_OPAQUE);
    _ = c.SDL_RenderClear(renderer);

    // Just draw the static texture a few times. You can think of it like a
    // stamp, there isn't a limit to the number of times you can draw with it.

    // top left
    dst_rect.x = (100.0 * scale);
    dst_rect.y = 0.0;
    dst_rect.w = @floatFromInt(m.texture_width);
    dst_rect.h = @floatFromInt(m.texture_height);
    _ = c.SDL_RenderTexture(renderer, m.texture, null, &dst_rect);

    // center this one.
    dst_rect.x = @floatFromInt(m.WINDOW_WIDTH - m.texture_width);
    dst_rect.x /= 2.0;
    dst_rect.y = @floatFromInt(m.WINDOW_HEIGHT - m.texture_height);
    dst_rect.y /= 2.0;
    dst_rect.w = @floatFromInt(m.texture_width);
    dst_rect.h = @floatFromInt(m.texture_height);
    _ = c.SDL_RenderTexture(renderer, m.texture, null, &dst_rect);

    // bottom right.
    dst_rect.x = @floatFromInt(m.WINDOW_WIDTH - m.texture_width);
    dst_rect.x -= (100.0 * scale);
    dst_rect.y = @floatFromInt(m.WINDOW_HEIGHT - m.texture_height);
    dst_rect.w = @floatFromInt(m.texture_width);
    dst_rect.h = @floatFromInt(m.texture_height);
    _ = c.SDL_RenderTexture(renderer, m.texture, null, &dst_rect);

    _ = c.SDL_RenderPresent(renderer);
}
