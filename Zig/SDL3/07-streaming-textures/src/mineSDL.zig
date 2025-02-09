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
    var surface: [*c]c.SDL_Surface = undefined;

    // we'll have some textures move around over a few seconds.
    const direction = blk: {
        var val: f32 = -1.0;
        if (@mod(now, 2000) >= 1000) val = 1.0;
        break :blk val;
    };
    const scale: f32 = ((@mod(now, 1000) - 500.0) / 500.0) * direction;

    // To update a streaming texture, you need to lock it first. This gets you access to the pixels.
    // Note that this is considered a _write-only_ operation: the buffer you get from locking
    // might not acutally have the existing contents of the texture, and you have to write to every
    // locked pixel!

    // You can use SDL_LockTexture() to get an array of raw pixels, but we're going to use
    // SDL_LockTextureToSurface() here, because it wraps that array in a temporary SDL_Surface,
    // letting us use the surface drawing functions instead of lighting up individual pixels.
    if (c.SDL_LockTextureToSurface(m.texture, null, &surface)) {
        var r: c.SDL_Rect = undefined;
        _ = c.SDL_FillSurfaceRect(surface, null, c.SDL_MapRGB(c.SDL_GetPixelFormatDetails(surface.*.format), null, 0, 0, 0));
        r.w = m.TEXTURE_SIZE;
        r.h = m.TEXTURE_SIZE / 10;
        r.x = 0;
        var foo = (scale + 1.0) / 2.0;
        foo *= @floatFromInt(m.TEXTURE_SIZE - r.h);
        r.y = @intFromFloat(foo);
        _ = c.SDL_FillSurfaceRect(surface, &r, c.SDL_MapRGB(c.SDL_GetPixelFormatDetails(surface.*.format), null, 0, 255, 0));
        _ = c.SDL_UnlockTexture(m.texture);
    }

    // as you can see from this, rendering draws over whatever was drawn before it.
    _ = c.SDL_SetRenderDrawColor(renderer, 66, 66, 66, c.SDL_ALPHA_OPAQUE);
    _ = c.SDL_RenderClear(renderer);

    // **************************
    // Just draw the static texture a few times. You can think of it like a
    // stamp, there isn't a limit to the number of times you can draw with it.

    // Center this one. It'll draw the latest version of the texture we drew while it was locked.
    // dst_rect.x = ((float) (WINDOW_WIDTH - TEXTURE_SIZE)) / 2.0f;
    dst_rect.x = (m.WINDOW_WIDTH - m.TEXTURE_SIZE);
    dst_rect.x /= 2.0;
    // dst_rect.y = ((float) (WINDOW_HEIGHT - TEXTURE_SIZE)) / 2.0f;
    dst_rect.y = (m.WINDOW_HEIGHT - m.TEXTURE_SIZE);
    dst_rect.y /= 2.0;
    // dst_rect.w = dst_rect.h = (float) TEXTURE_SIZE;
    dst_rect.w = m.TEXTURE_SIZE;
    dst_rect.h = m.TEXTURE_SIZE;
    _ = c.SDL_RenderTexture(renderer, m.texture, null, &dst_rect);
    // **************************

    _ = c.SDL_RenderPresent(renderer);
}
