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

const frame_dim = [_]i32{ 372, 596, 0, 60 }; // frame & corner
const mesa_dim = [_]i32{ 352, 576, 10, 10 }; // mesa & shifts

pub fn mode() void {
    const clipped = c.SDL_Rect{ .x = frame_dim[2], .y = frame_dim[3], .w = frame_dim[0], .h = frame_dim[1] }; // clipped

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

    main_menu();
}

// ************************************************************************************************
fn main_menu() void {
    var X: i32 = 0;
    var Xness: f32 = 0.0;
    var Y: i32 = 0;
    var Yness: f32 = 0.0;
    var W: i32 = 0;
    var Wness: f32 = 0.0;
    var H: i32 = 0;
    var Hness: f32 = 0.0;
    const scale: f32 = 2.0;

    // ******************************************
    X = @intFromFloat(gv.window_w);
    X = X - (frame_dim[0] - mesa_dim[2]); // shift left adjustment
    const viewport_rect = c.SDL_Rect{ .x = X, .y = mesa_dim[3], .w = mesa_dim[0], .h = mesa_dim[1] };

    _ = c.SDL_SetRenderDrawColor(@ptrCast(m.renderer), 5, 200, 5, c.SDL_ALPHA_OPAQUE); // font color
    _ = c.SDL_SetRenderViewport(@ptrCast(m.renderer), &viewport_rect); // define a viewport area within the window
    _ = c.SDL_RenderDebugText(@ptrCast(m.renderer), 0, 0, "-123456789-123456789-123456789-123456789-123456789");
    _ = c.SDL_RenderDebugText(@ptrCast(m.renderer), 0, 8, "Moe.");

    // ***** 2x scale
    _ = c.SDL_SetRenderScale(@ptrCast(m.renderer), scale, scale);
    Xness = @floatFromInt(X);
    Xness /= scale;
    X = @intFromFloat(Xness);
    Yness = @floatFromInt(mesa_dim[2]);
    Yness /= scale;
    Y = @intFromFloat(Yness);
    Wness = @floatFromInt(mesa_dim[0]);
    Wness /= scale;
    W = @intFromFloat(Wness);
    Hness = @floatFromInt(mesa_dim[1]);
    Hness /= scale;
    H = @intFromFloat(Hness);
    const scaled_viewport = c.SDL_Rect{ .x = X, .y = Y, .w = W, .h = H };
    _ = c.SDL_SetRenderViewport(@ptrCast(m.renderer), &scaled_viewport);
    _ = c.SDL_RenderDebugText(@ptrCast(m.renderer), 0, 16, "Curly -123456789-123456789-123456789-123456789-123456789");
    _ = c.SDL_RenderDebugText(@ptrCast(m.renderer), 0, 24, "Curly -123456789-123456789-123456789-123456789-123456789");
    _ = c.SDL_RenderDebugText(@ptrCast(m.renderer), 0, (8 * 34), "Curly -123456789-123456789-123456789-123456789-123456789");
    _ = c.SDL_RenderDebugText(@ptrCast(m.renderer), 0, (8 * 35), "Curly -123456789-123456789-123456789-123456789-123456789");

    // ***** back to normal
    _ = c.SDL_SetRenderScale(@ptrCast(m.renderer), 1.0, 1.0);
    _ = c.SDL_SetRenderViewport(@ptrCast(m.renderer), &viewport_rect);
    _ = c.SDL_RenderDebugText(@ptrCast(m.renderer), 0, 16, "Larry.");
    _ = c.SDL_RenderDebugText(@ptrCast(m.renderer), 0, 24, "Shemp.");

    _ = c.SDL_SetRenderViewport(@ptrCast(m.renderer), null); // null; the whole window become the viewport
}
