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
    var center: c.SDL_FPoint = undefined;
    var dst_rect: c.SDL_FRect = undefined;
    const now = c.SDL_GetTicks();

    // we'll have a texture rotate around over 2 seconds (2000 milliseconds). 360 degrees in a circle!
    var rotation: f32 = @floatFromInt(@mod(now, 2000));
    rotation /= 2000.0;
    rotation *= 360.0;

    // as you can see from this, rendering draws over whatever was drawn before it.
    _ = c.SDL_SetRenderDrawColor(renderer, 0, 0, 0, c.SDL_ALPHA_OPAQUE);
    _ = c.SDL_RenderClear(renderer);

    // Center this one, and draw it with some rotation so it spins!
    dst_rect.x = @floatFromInt(m.WINDOW_WIDTH - m.texture_width);
    dst_rect.x /= 2.0;
    dst_rect.y = @floatFromInt(m.WINDOW_HEIGHT - m.texture_height);
    dst_rect.y /= 2.0;
    dst_rect.w = @floatFromInt(m.texture_width);
    dst_rect.h = @floatFromInt(m.texture_height);
    // rotate it around the center of the texture; you can rotate it from a different point, too!
    center.x = @floatFromInt(m.texture_width);
    center.x /= 2.0;
    center.y = @floatFromInt(m.texture_height);
    center.y /= 2.0;
    _ = c.SDL_RenderTextureRotated(renderer, m.texture, null, &dst_rect, rotation, &center, c.SDL_FLIP_NONE);

    _ = c.SDL_RenderPresent(renderer);
}
