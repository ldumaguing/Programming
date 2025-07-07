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
    const frame_TopLeft = [_]i32{ 0, 60 };
    const frame_dim = [_]i32{ 372, 596 };
    const clipped = c.SDL_Rect{ .x = frame_TopLeft[0], .y = frame_TopLeft[1], .w = frame_dim[0], .h = frame_dim[1] }; // clipped

    // ***** create a surface
    const a_surf: *c.SDL_Surface = c.SDL_CreateSurface(frame_dim[0], frame_dim[1], c.SDL_PIXELFORMAT_RGBA8888);
    defer c.SDL_DestroySurface(a_surf);

    // ***** clip the frame and put it on the surface
    _ = c.SDL_BlitSurface(@ptrCast(m.frames_surface), &clipped, a_surf, null);

    // convert the surface to a texture
    const a_texture = c.SDL_CreateTextureFromSurface(@ptrCast(m.renderer), a_surf);
    defer c.SDL_DestroyTexture(a_texture);

    const rect_0ness = c.SDL_FRect{ .x = gv.window_w - frame_dim[0], .y = 0.0, .w = frame_dim[0], .h = frame_dim[1] };
    if (false) { // not using viewport
        // *** render texture
        const fishness = c.SDL_FRect{ .x = 30.0, .y = 30.0, .w = 260.0, .h = 340.0 };
        _ = c.SDL_RenderTexture(@ptrCast(m.renderer), a_texture, null, &fishness);
    } else { // trying to use viewport; lol
        //const rect_0 = c.SDL_Rect{ .x = 0, .y = 0, .w = 260, .h = 340 };
        _ = c.SDL_SetRenderViewport(@ptrCast(m.renderer), null);
        _ = c.SDL_RenderTexture(@ptrCast(m.renderer), a_texture, null, &rect_0ness);
    }

    main_menu(rect_0ness);
}

// ************************************************************************************************
fn main_menu(rect_0ness: c.SDL_FRect) void {
    const rect_0 = c.SDL_Rect{ .x = @intFromFloat(rect_0ness.x), .y = 0, .w = @intFromFloat(rect_0ness.w), .h = @intFromFloat(rect_0ness.h) };

    if (false) {
        _ = c.SDL_SetRenderDrawColor(@ptrCast(m.renderer), 5, 200, 5, c.SDL_ALPHA_OPAQUE);
        const font_scale: f32 = 2.0;
        const top_left_corner = [_]f32{ (rect_0ness.x / font_scale) + (11 / font_scale), (11 / font_scale) };

        _ = c.SDL_SetRenderScale(@ptrCast(m.renderer), font_scale, font_scale); // this will affect a lot

        _ = c.SDL_RenderDebugText(@ptrCast(m.renderer), top_left_corner[0], top_left_corner[1] + (8 * 15), "       New Game");
        _ = c.SDL_RenderDebugText(@ptrCast(m.renderer), top_left_corner[0], top_left_corner[1] + (8 * 16), "       Load Game");
        _ = c.SDL_RenderDebugText(@ptrCast(m.renderer), top_left_corner[0], top_left_corner[1] + (8 * 17), "       Save Game");

        _ = c.SDL_SetRenderScale(@ptrCast(m.renderer), 1.0, 1.0); // normalize overall scale
    } else {
        _ = c.SDL_SetRenderDrawColor(@ptrCast(m.renderer), 5, 200, 5, c.SDL_ALPHA_OPAQUE);
        _ = c.SDL_SetRenderViewport(@ptrCast(m.renderer), &rect_0);
        _ = c.SDL_RenderDebugText(@ptrCast(m.renderer), 0, 0, "Hello world.");
        _ = c.SDL_SetRenderViewport(@ptrCast(m.renderer), null);
    }
}
