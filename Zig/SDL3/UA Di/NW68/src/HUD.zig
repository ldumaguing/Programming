const std = @import("std");
const gv = @import("GlobalVariables.zig");
const print = @import("std").debug.print;
const m = @import("main.zig");

const c = @cImport({
    @cDefine("SDL_DISABLE_OLD_NAMES", {});
    @cInclude("SDL3/SDL.h");
    @cInclude("SDL3/SDL_revision.h");
    @cDefine("SDL_MAIN_HANDLED", {});
    @cInclude("SDL3/SDL_main.h");
    @cInclude("SDL3_image/SDL_image.h");
});

pub fn mode() void {
    const clipped = c.SDL_Rect{ .x = 0, .y = 60, .w = 260, .h = 340 }; // clipped

    // ***** create a surface
    const a_surf: *c.SDL_Surface = c.SDL_CreateSurface(260, 340, c.SDL_PIXELFORMAT_RGBA8888);
    defer c.SDL_DestroySurface(a_surf);

    // ***** clip the frame and put it on the surface
    _ = c.SDL_BlitSurface(@ptrCast(m.frames_surface), &clipped, a_surf, null);

    // convert the surface to a texture
    const a_texture = c.SDL_CreateTextureFromSurface(@ptrCast(m.renderer), a_surf);
    defer c.SDL_DestroyTexture(a_texture);

    if (false) { // not using viewport
        // *** render texture
        const fishness = c.SDL_FRect{ .x = 30.0, .y = 30.0, .w = 260.0, .h = 340.0 };
        _ = c.SDL_RenderTexture(@ptrCast(m.renderer), a_texture, null, &fishness);
    } else { // trying to use viewport; lol

    }
}
