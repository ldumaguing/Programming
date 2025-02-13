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

    // this next whole thing is _super_ expensive. Seriously, don't do this in real life.

    // Download the pixels of what has just been rendered. This has to wait for the GPU to finish rendering it and everything before it,
    // and then make an expensive copy from the GPU to system RAM!
    surface = c.SDL_RenderReadPixels(renderer, null);
    print("        {}, {}\n", .{ surface.*.w, surface.*.h });
    // This is also expensive, but easier: convert the pixels to a format we want.
    if ((surface != null) and (surface.*.format != c.SDL_PIXELFORMAT_RGBA8888) and (surface.*.format != c.SDL_PIXELFORMAT_BGRA8888)) {
        // SDL_Surface *converted = SDL_ConvertSurface(surface, SDL_PIXELFORMAT_RGBA8888);
        const converted: [*c]c.SDL_Surface = c.SDL_ConvertSurface(surface, c.SDL_PIXELFORMAT_RGBA8888);
        defer c.SDL_DestroySurface(surface);
        surface = converted;
    }

    if (surface != null) {
        // Rebuild converted_texture if the dimensions have changed (window resized, etc).

        const s_w: i32 = surface.*.w;
        const s_h: i32 = surface.*.h;
        // print("{}, {}\n", .{ s_w, s_h });
        if ((s_w != m.converted_texture_width) or (s_h != m.converted_texture_height)) {
            _ = c.SDL_DestroyTexture(m.converted_texture);
            m.converted_texture = c.SDL_CreateTexture(renderer, c.SDL_PIXELFORMAT_RGBA8888, c.SDL_TEXTUREACCESS_STREAMING, surface.*.w, surface.*.h);
            if (m.converted_texture == null) {
                c.SDL_Log("Couldn't (re)create conversion texture: %s", c.SDL_GetError());
                return;
            }
            m.converted_texture_width = surface.*.w;
            m.converted_texture_height = surface.*.h;
        }

        // Turn each pixel into either black or white. This is a lousy technique but it works here.
        // In real life, something like Floyd-Steinberg dithering might work
        // better: https://en.wikipedia.org/wiki/Floyd%E2%80%93Steinberg_dithering
        // const s_w: u32 = @intCast(surface.*.w);
        // const s_h: u32 = @intCast(surface.*.h);
        // for (0..s_h) |y| {
        //     _ = y;
        //     for (0..s_w) |x| {
        //         _ = x;
        //     }
        // }
    }

    _ = c.SDL_RenderPresent(renderer);
}
