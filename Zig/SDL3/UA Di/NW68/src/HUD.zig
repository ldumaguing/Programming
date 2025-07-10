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

const frame_dim = [_]i32{ 372, 596, 0, 60 }; // frame & corner
const mesa_dim = [_]i32{ 352, 576, 10, 10 }; // mesa & shifts
var menu_option: i32 = 0;
var menu_option_old: i32 = -1;
var d_pad_old: u16 = 0;

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
    const silly_putty = c.SDL_FRect{ .x = gv.window_w - frame_dim[0], .y = 0.0, .w = frame_dim[0], .h = frame_dim[1] };
    _ = c.SDL_RenderTexture(@ptrCast(m.renderer), a_texture, null, &silly_putty); // put texture on viewport area

    main_menu(silly_putty);
}

// ************************************************************************************************
fn main_menu(silly: c.SDL_FRect) void {
    // ***** menu number
    const num_choices: i32 = 4;

    if (jstk.d_pad == 1) {
        if (jstk.d_pad != d_pad_old) {
            menu_option -= 1;
            d_pad_old = 1;
        }
    }
    if (jstk.d_pad == 4) {
        if (jstk.d_pad != d_pad_old) {
            menu_option += 1;
            d_pad_old = 4;
        }
    }
    if (menu_option < 0) menu_option += num_choices;
    if (menu_option >= num_choices) menu_option = 0;
    if (jstk.d_pad == 0) d_pad_old = 0;

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
    X = @intFromFloat(silly.x);
    X += mesa_dim[2]; // shift left adjustment

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
    _ = c.SDL_RenderDebugText(@ptrCast(m.renderer), 0, (8 * 13), "         New"); // 0
    _ = c.SDL_RenderDebugText(@ptrCast(m.renderer), 0, (8 * 14), "         Load"); // 1
    _ = c.SDL_RenderDebugText(@ptrCast(m.renderer), 0, (8 * 15), "         Save"); // 2
    _ = c.SDL_RenderDebugText(@ptrCast(m.renderer), 0, (8 * 16), "         Quit"); // 3
    Yness = @floatFromInt(menu_option);
    Yness += 13;
    Yness *= 8;
    _ = c.SDL_RenderDebugText(@ptrCast(m.renderer), 0, Yness, "       *");

    // ***** back to normal
    _ = c.SDL_SetRenderScale(@ptrCast(m.renderer), 1.0, 1.0);

    _ = c.SDL_SetRenderViewport(@ptrCast(m.renderer), null); // null; remove viewport

    // ***** set flags
    if ((jstk.button_bits & gv.bit_0) != 0) { // down button pressed
        if (menu_option == 3) { // 3: quit option
            gv.flags = 1;
        }
        if ((menu_option == 0) and (menu_option_old != 0)) { // 0: new game option
            menu_option = 0;
            hud_0.newGame();
            menu_option_old = 0;
        }
        if ((menu_option == 1) and (menu_option_old != 1)) { // 1: load game option
            menu_option = 1;
            print("one\n", .{});
            menu_option_old = 1;
        }
        if ((menu_option == 2) and (menu_option_old != 2)) { // 2: save game option
            menu_option = 2;
            print("two\n", .{});
            menu_option_old = 2;
        }
    } else {
        menu_option_old = -1;
    }

}
