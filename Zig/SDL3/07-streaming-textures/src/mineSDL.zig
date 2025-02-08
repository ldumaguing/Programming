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
    // var dst_rect: c.SDL_FRect = undefined;
    const now: f32 = @floatFromInt(c.SDL_GetTicks());
    var surface: *c.SDL_Surface = undefined;

    // we'll have some textures move around over a few seconds.
    const direction = blk: {
        var val: f32 = -1.0;
        if (@mod(now, 2000) >= 1000) val = 1.0;
        break :blk val;
    };
    const scale = ((@mod(now, 1000) - 500.0) / 500.0) * direction;

    // To update a streaming texture, you need to lock it first. This gets you access to the pixels.
    // Note that this is considered a _write-only_ operation: the buffer you get from locking
    // might not acutally have the existing contents of the texture, and you have to write to every
    // locked pixel!

    // You can use SDL_LockTexture() to get an array of raw pixels, but we're going to use
    // SDL_LockTextureToSurface() here, because it wraps that array in a temporary SDL_Surface,
    // letting us use the surface drawing functions instead of lighting up individual pixels.
    if (c.SDL_LockTextureToSurface(m.texture, null, &surface)) {
        var r: c.SDL_Rect = undefined;
        c.SDL_FillSurfaceRect(surface, null, c.SDL_MapRGB(c.SDL_GetPixelFormatDetails(surface.format), null, 0, 0, 0)); // make the whole surface black
        r.w = m.TEXTURE_SIZE;
        r.h = m.TEXTURE_SIZE / 10;
        r.x = 0;
        r.y = (m.TEXTURE_SIZE - r.h) * ((scale + 1.0) / 2.0);

        // r.y = (int) (((float) (TEXTURE_SIZE - r.h)) * ((scale + 1.0f) / 2.0f));
        // SDL_FillSurfaceRect(surface, &r, SDL_MapRGB(SDL_GetPixelFormatDetails(surface->format), NULL, 0, 255, 0));  /* make a strip of the surface green */
        // SDL_UnlockTexture(texture);  /* upload the changes (and frees the temporary surface)! */

    }

    _ = c.SDL_RenderPresent(renderer);
}
