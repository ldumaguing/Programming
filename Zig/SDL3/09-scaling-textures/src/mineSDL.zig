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
    _ = c.SDL_SetRenderDrawColor(renderer, 66, 66, 66, c.SDL_ALPHA_OPAQUE);
    _ = c.SDL_RenderClear(renderer);

    // center this one and make it grow and shrink.
    dst_rect.w = @floatFromInt(m.texture_width);
    dst_rect.w *= scale;
    dst_rect.w += @floatFromInt(m.texture_width);
    dst_rect.h = @floatFromInt(m.texture_height);
    dst_rect.h *= scale;
    dst_rect.h += @floatFromInt(m.texture_height);
    dst_rect.x = (m.WINDOW_WIDTH - dst_rect.w) / 2.0;
    dst_rect.y = (m.WINDOW_HEIGHT - dst_rect.h) / 2.0;
    _ = c.SDL_RenderTexture(renderer, m.texture, null, &dst_rect);

    _ = c.SDL_RenderPresent(renderer);
}
