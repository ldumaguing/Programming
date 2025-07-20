const std = @import("std");
const gv = @import("GlobalVariables.zig");
const print = @import("std").debug.print;
const m = @import("main.zig");
const jstk = @import("joystick.zig");
const hud_0 = @import("hud_new.zig");

const c = @cImport({
    @cDefine("SDL_DISABLE_OLD_NAMES", {});
    @cInclude("SDL3/SDL.h");
    @cInclude("SDL3/SDL_revision.h");
    @cDefine("SDL_MAIN_HANDLED", {});
    @cInclude("SDL3/SDL_main.h");
    @cInclude("SDL3_image/SDL_image.h");
});

const frame_dim = [_]i32{ 500, 660, 0, 0 }; // frame & corner
const mesa_dim = [_]i32{ 480, 640, 10, 10 }; // mesa & shifts
var menu_option: i32 = 0;
var menu_option_old: i32 = -1;
var d_pad_old: u16 = 0;

var HUD_texture: ?*c.SDL_Texture = undefined;
var frame_viewportness: c.SDL_FRect = undefined;
var mesa_viewport: c.SDL_Rect = undefined;
const scale: f32 = 2.0;
var scaled_viewport: c.SDL_Rect = undefined;

pub fn mode() void {
    const clipped = c.SDL_Rect{ .x = frame_dim[2], .y = frame_dim[3], .w = frame_dim[0], .h = frame_dim[1] }; // clipped

    // ***** create a surface
    const a_surf: *c.SDL_Surface = c.SDL_CreateSurface(frame_dim[0], frame_dim[1], c.SDL_PIXELFORMAT_RGBA8888);
    defer c.SDL_DestroySurface(a_surf);

    // ***** clip the frame and put it on the surface
    _ = c.SDL_BlitSurface(@ptrCast(m.frames_surface), &clipped, a_surf, null);

    // convert the surface to a texture
    HUD_texture = c.SDL_CreateTextureFromSurface(@ptrCast(m.renderer), a_surf);
    defer c.SDL_DestroyTexture(HUD_texture);

    frame_viewportness = c.SDL_FRect{ .x = gv.window_w - frame_dim[0], .y = 0.0, .w = frame_dim[0], .h = frame_dim[1] };

    // ********** mesa_viewport
    var X: i32 = @intFromFloat(frame_viewportness.x);
    X += 11;
    mesa_viewport = c.SDL_Rect{ .x = X, .y = 10, .w = mesa_dim[0], .h = mesa_dim[1] };

    // ********** scaled_viewport
    var Xness: f32 = @as(f32, @floatFromInt(X));
    Xness /= scale;
    X = @intFromFloat(Xness);
    var Wness: f32 = @as(f32, @floatFromInt(mesa_viewport.w));
    Wness /= scale;
    const W: i32 = @intFromFloat(Wness);
    scaled_viewport = c.SDL_Rect{ .x = X + 1, .y = 5, .w = W, .h = 500 };

    main_menu();

    //_ = c.SDL_SetRenderDrawColor(@ptrCast(m.renderer), 255, 5, 255, c.SDL_ALPHA_OPAQUE);
}

// ************************************************************************************************
fn main_menu() void {
    var FLG_render_texture: bool = true;
    _ = c.SDL_SetRenderDrawColor(@ptrCast(m.renderer), 5, 200, 5, c.SDL_ALPHA_OPAQUE);
    defer _ = c.SDL_SetRenderDrawColor(@ptrCast(m.renderer), 255, 5, 255, c.SDL_ALPHA_OPAQUE);

    jstk.d_pad = d_pad_old;

    main_loop: while (true) {
        var event: c.SDL_Event = undefined;
        while (c.SDL_PollEvent(&event)) {
            switch (event.type) {
                c.SDL_EVENT_KEY_DOWN => {
                    switch (event.key.scancode) {
                        c.SDL_SCANCODE_ESCAPE => {
                            _ = c.SDL_SetRenderViewport(@ptrCast(m.renderer), null);
                            break :main_loop;
                        },
                        else => {},
                    }
                },
                else => {},
            }
        }
        jstk.record_events();

        // ********** D-Pad
        if (jstk.d_pad == 1) {
            if (jstk.d_pad != d_pad_old) {
                menu_option -= 1;
                d_pad_old = 1;
                FLG_render_texture = true;
            }
        }
        if (jstk.d_pad == 4) {
            if (jstk.d_pad != d_pad_old) {
                menu_option += 1;
                d_pad_old = 4;
                FLG_render_texture = true;
            }
        }

        if (menu_option < 0) menu_option += 4;
        if (menu_option >= 4) menu_option = 0;
        if (jstk.d_pad == 0) d_pad_old = 0;

        // ********** Rendering
        if (FLG_render_texture) {
            _ = c.SDL_RenderTexture(@ptrCast(m.renderer), HUD_texture, null, &frame_viewportness);

            _ = c.SDL_SetRenderViewport(@ptrCast(m.renderer), &scaled_viewport);
            _ = c.SDL_SetRenderScale(@ptrCast(m.renderer), 2.0, 2.0);
            _ = c.SDL_RenderDebugText(@ptrCast(m.renderer), 0, (8 * 10), "            New");
            _ = c.SDL_RenderDebugText(@ptrCast(m.renderer), 0, (8 * 11), "            Save");
            _ = c.SDL_RenderDebugText(@ptrCast(m.renderer), 0, (8 * 12), "            Load");
            _ = c.SDL_RenderDebugText(@ptrCast(m.renderer), 0, (8 * 13), "            Quit");
            var Y: f32 = @floatFromInt(menu_option);
            Y += 10.0;
            Y *= 8.0;
            _ = c.SDL_RenderDebugText(@ptrCast(m.renderer), 0, Y, "          *");

            _ = c.SDL_RenderPresent(@ptrCast(m.renderer));
            FLG_render_texture = false;

            // ********** back to normal
            _ = c.SDL_SetRenderViewport(@ptrCast(m.renderer), null);
            _ = c.SDL_SetRenderScale(@ptrCast(m.renderer), 1.0, 1.0);
        }

        if ((jstk.button_bits & gv.bit_3) != 0) {
            break :main_loop;
        }
    }
}
