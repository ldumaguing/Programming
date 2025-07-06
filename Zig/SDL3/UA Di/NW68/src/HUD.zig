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
    const dst_rect = c.SDL_Rect{ .x = 0, .y = 60, .w = 260, .h = 340 }; // cutter
    const dst_rectness = c.SDL_FRect{ .x = 60.0, .y = 60.0, .w = 260.0, .h = 340.0 }; // silly putty
    var viewport: c.SDL_Rect = undefined;

    // ***** create a surface
    const a_surf: *c.SDL_Surface = c.SDL_CreateSurface(260, 340, c.SDL_PIXELFORMAT_RGBA8888);
    defer c.SDL_DestroySurface(a_surf);

    // ***** clip the frame and put it on the surface
    _ = c.SDL_BlitSurface(@ptrCast(m.frames_surface), &dst_rect, a_surf, null);

    // convert the surface to a texture
    const a_texture = c.SDL_CreateTextureFromSurface(@ptrCast(m.renderer), a_surf);
    defer c.SDL_DestroyTexture(a_texture);

    //_ = c.SDL_SetRenderDrawColor(@ptrCast(m.renderer), 0, 0, 0, c.SDL_ALPHA_OPAQUE);
    //_ = c.SDL_RenderClear(@ptrCast(m.renderer));

    _ = c.SDL_SetRenderViewport(@ptrCast(m.renderer), &viewport);
    _ = c.SDL_RenderTexture(@ptrCast(m.renderer), a_texture, null, &dst_rectness);

    //_ = c.SDL_RenderPresent(@ptrCast(m.renderer));
}
