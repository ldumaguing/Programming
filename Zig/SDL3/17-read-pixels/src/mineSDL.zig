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
    const now: f32 = @floatFromInt(c.SDL_GetTicks());
    var surface: [*c]c.SDL_Surface = undefined;
    var center: c.SDL_FPoint = undefined;
    var dst_rect: c.SDL_FRect = undefined;

    // we'll have a texture rotate around over 2 seconds (2000 milliseconds). 360 degrees in a circle!
    var rotation: f32 = @mod(now, 2000);
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

    // ************************************** part 2
    // *********************************************
    // this next whole thing is _super_ expensive. Seriously, don't do this in real life.

    // Download the pixels of what has just been rendered. This has to wait for the GPU
    // to finish rendering it and everything before it, and then make an expensive copy
    // from the GPU to system RAM!
    surface = c.SDL_RenderReadPixels(renderer, null);

    // This is also expensive, but easier: convert the pixels to a format we want.
    const testA: bool = (surface != null);
    const testB: bool = (surface.*.format != c.SDL_PIXELFORMAT_RGBA8888);
    const testC: bool = (surface.*.format != c.SDL_PIXELFORMAT_BGRA8888);
    if (testA and testB and testC) {
        const converted: [*c]c.SDL_Surface = c.SDL_ConvertSurface(surface, c.SDL_PIXELFORMAT_RGBA8888);
        _ = c.SDL_DestroySurface(surface);
        surface = converted;
    }

    if (surface != null) {
        // Rebuild converted_texture if the dimensions have changed (window resized, etc).
        _ = c.SDL_DestroyTexture(m.converted_texture);
        m.converted_texture = c.SDL_CreateTexture(renderer, c.SDL_PIXELFORMAT_RGBA8888, c.SDL_TEXTUREACCESS_STREAMING, surface.*.w, surface.*.h);

        // **************************************** modifying the surface
        const surface_pixels: [*]u8 = @alignCast(@ptrCast(surface.*.pixels));
        const pitch: u32 = @intCast(surface.*.pitch);
        const w: u32 = 4;
        // for (0..100000) |i| {
        //     pixels[i] = 0xff;
        // }
        for (0..@intCast(surface.*.h)) |y| {
            for (0..@intCast(surface.*.w)) |x| {
                const i = (x * w) + (y * pitch);
                const p: [*]u8 = surface_pixels;
                var average: f32 = @floatFromInt(p[i + 1]);
                average += @floatFromInt(p[i + 2]);
                average += @floatFromInt(p[i + 3]);
                average /= 3.0;
                if (average == 0.0) {
                    p[i] = 0xff;
                    p[i + 3] = 0xff;
                    p[i + 1] = 0x0;
                    p[i + 2] = 0x0;
                } else {
                    if (average > 50.0) {
                        p[i + 1] = 0xff;
                        p[i + 2] = 0xff;
                        p[i + 3] = 0xff;
                    } else {
                        p[i + 1] = 0x0;
                        p[i + 2] = 0x0;
                        p[i + 3] = 0x0;
                    }
                }
                //surface_pixels[i] = 0xff;
                //surface_pixels[i + 1] = 0xff;
                //surface_pixels[i + 2] = 0xff;
                //surface_pixels[i + 3] = 0xff;
            }
        }
        // ****************************************

        // upload the processed pixels back into a texture.
        _ = c.SDL_UpdateTexture(m.converted_texture, null, surface.*.pixels, surface.*.pitch);
        _ = c.SDL_DestroySurface(surface);

        // draw the texture to the top-left of the screen.
        dst_rect.x = 0.0;
        dst_rect.y = 0.0;
        dst_rect.w = m.WINDOW_WIDTH / 4.0;
        dst_rect.h = m.WINDOW_HEIGHT / 4.0;
        _ = c.SDL_RenderTexture(renderer, m.converted_texture, null, &dst_rect);
    }

    _ = c.SDL_RenderPresent(renderer);
}
