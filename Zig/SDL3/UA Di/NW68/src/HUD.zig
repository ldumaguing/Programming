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

    // ***** "paste" the texture on the window
    const rect_0ness = c.SDL_FRect{ .x = gv.window_w - frame_dim[0], .y = 0.0, .w = frame_dim[0], .h = frame_dim[1] };
    _ = c.SDL_SetRenderViewport(@ptrCast(m.renderer), null); // null; use the whole window for viewport
    _ = c.SDL_RenderTexture(@ptrCast(m.renderer), a_texture, null, &rect_0ness); // put texture on viewport area

    main_menu(rect_0ness, frame_dim);
}

// ************************************************************************************************
fn main_menu(rect_0ness: c.SDL_FRect, frame_dim: [2]i32) void {
    const viewport_rect = c.SDL_Rect{ .x = @intFromFloat(rect_0ness.x + 11.0), .y = @intFromFloat(rect_0ness.y + 11.0), .w = frame_dim[0] - 22, .h = frame_dim[1] - 22 };
    const scale: f32 = 2.0;

    _ = c.SDL_SetRenderDrawColor(@ptrCast(m.renderer), 5, 200, 5, c.SDL_ALPHA_OPAQUE); // font color
    _ = c.SDL_SetRenderViewport(@ptrCast(m.renderer), &viewport_rect); // define a viewport area within the window
    _ = c.SDL_RenderDebugText(@ptrCast(m.renderer), 0, 0, "-123456789-123456789-123456789-123456789-123456789");
    _ = c.SDL_RenderDebugText(@ptrCast(m.renderer), 0, 8, "Moe.");

    const X: i32 = @intFromFloat((gv.window_w - @as(f32, @floatFromInt(frame_dim[0]))) / scale);
    const test_viewport = c.SDL_Rect{ .x = X + 5, .y = 5, .w = frame_dim[0] - 196, .h = frame_dim[1] };
    _ = c.SDL_SetRenderScale(@ptrCast(m.renderer), scale, scale);
    _ = c.SDL_SetRenderViewport(@ptrCast(m.renderer), &test_viewport);
    _ = c.SDL_RenderDebugText(@ptrCast(m.renderer), 0, 0, "Curly -123456789-123456789-123456789-123456789-123456789");
    _ = c.SDL_RenderDebugText(@ptrCast(m.renderer), 0, 24, "Curly -123456789-123456789-123456789-123456789-123456789");

    _ = c.SDL_SetRenderScale(@ptrCast(m.renderer), 1.0, 1.0);
    _ = c.SDL_SetRenderViewport(@ptrCast(m.renderer), &viewport_rect);
    _ = c.SDL_RenderDebugText(@ptrCast(m.renderer), 0, 300, "Larry.");
    _ = c.SDL_RenderDebugText(@ptrCast(m.renderer), 0, 320, "Shemp.");

    _ = c.SDL_SetRenderViewport(@ptrCast(m.renderer), null); // null; the whole window become the viewport
}
