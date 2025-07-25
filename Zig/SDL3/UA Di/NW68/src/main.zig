const std = @import("std");
const print = @import("std").debug.print;
const gv = @import("GlobalVariables.zig");
const jstk = @import("joystick.zig");
const chit = @import("Chit.zig");
const hud = @import("HUD.zig");

const c = @cImport({
    @cDefine("SDL_DISABLE_OLD_NAMES", {});
    @cInclude("SDL3/SDL.h");
    @cInclude("SDL3/SDL_revision.h");
    @cDefine("SDL_MAIN_HANDLED", {});
    @cInclude("SDL3/SDL_main.h");
    @cInclude("SDL3_image/SDL_image.h");
});

var window: ?*c.SDL_Window = undefined;
pub var renderer: ?*c.SDL_Renderer = undefined;

// *************** Surface
var mapboard_surface: ?*c.SDL_Surface = undefined;
pub var chits_surface: ?*c.SDL_Surface = undefined;
pub var frames_surface: ?*c.SDL_Surface = undefined;

// *************** Joystick
pub var joystick: ?*c.SDL_Joystick = null;

// *************** Chits
var fish: chit.Chit = undefined;

// ************************************************************************************************
pub fn main() !void {
    errdefer |err| if (err == error.SdlError) std.log.err("SDL error: {s}", .{c.SDL_GetError()});

    std.log.debug("SDL build time version: {d}.{d}.{d}", .{
        c.SDL_MAJOR_VERSION,
        c.SDL_MINOR_VERSION,
        c.SDL_MICRO_VERSION,
    });

    const version = c.SDL_GetVersion();
    std.log.debug("SDL runtime version: {d}.{d}.{d}", .{
        c.SDL_VERSIONNUM_MAJOR(version),
        c.SDL_VERSIONNUM_MINOR(version),
        c.SDL_VERSIONNUM_MICRO(version),
    });

    c.SDL_SetMainReady();

    _ = c.SDL_Init(c.SDL_INIT_VIDEO | c.SDL_INIT_AUDIO | c.SDL_INIT_GAMEPAD | c.SDL_INIT_JOYSTICK);
    defer c.SDL_Quit();

    _ = c.SDL_SetHint(c.SDL_HINT_RENDER_VSYNC, "1");

    // [ set window and renderer ================================================================ ]
    if (false) { // true: windowed without borders
        const window_dim = c.SDL_GetCurrentDisplayMode(c.SDL_GetPrimaryDisplay());
        const window_w = @as(f32, @floatFromInt(window_dim.*.w));
        const window_h = @as(f32, @floatFromInt(window_dim.*.h));
        const percent = 0.92;
        gv.window_w = window_w * percent;
        gv.window_h = window_h * percent;
        window = c.SDL_CreateWindow("Nuklear Winter '68", @intFromFloat(gv.window_w), @intFromFloat(gv.window_h), c.SDL_WINDOW_BORDERLESS);
    } else if (true) { // true: windowed
        gv.window_w = 1280.0;
        gv.window_h = 720.0;
        window = c.SDL_CreateWindow("Nuklear Winter '68", @intFromFloat(gv.window_w), @intFromFloat(gv.window_h), 0);
    } else { // false: fullscreen
        const window_dim = c.SDL_GetCurrentDisplayMode(c.SDL_GetPrimaryDisplay());
        gv.window_w = @as(f32, @floatFromInt(window_dim.*.w));
        gv.window_h = @as(f32, @floatFromInt(window_dim.*.h));
        window = c.SDL_CreateWindow("Nuklear Winter '68", @intFromFloat(gv.window_w), @intFromFloat(gv.window_h), c.SDL_WINDOW_FULLSCREEN);
    }
    renderer = c.SDL_CreateRenderer(window, null);
    defer c.SDL_DestroyRenderer(renderer);
    defer c.SDL_DestroyWindow(window);

    // [ store images on surfaces =============================================================== ]
    var stream: ?*c.SDL_IOStream = undefined;

    stream = c.SDL_IOFromFile("img/Map.jpg", "r");
    //stream = c.SDL_IOFromFile("img2/fish2.jpg", "r");
    mapboard_surface = c.IMG_LoadJPG_IO(stream);

    stream = c.SDL_IOFromFile("img2/NW68-chits.png", "r");
    chits_surface = c.IMG_LoadPNG_IO(stream);

    stream = c.SDL_IOFromFile("img2/frames-1.png", "r");
    frames_surface = c.IMG_LoadPNG_IO(stream);

    // [ misc =================================================================================== ]
    fish = chit.new(12, 13, .{ 0, 1 });

    // [ game loop ============================================================================== ]
    main_loop: while (true) {
        var event: c.SDL_Event = undefined;
        while (c.SDL_PollEvent(&event)) {
            switch (event.type) {
                // [ Joystick =================================================================== ]
                c.SDL_EVENT_JOYSTICK_ADDED => {
                    if (joystick == null) {
                        joystick = c.SDL_OpenJoystick(event.jdevice.which);
                        print("open: {s}\n", .{c.SDL_GetJoystickName(joystick)});
                        try jstk.bind_buttons(c.SDL_GetJoystickName(joystick));
                        jstk.num_buttons = @as(u32, @intCast(c.SDL_GetNumJoystickButtons(joystick)));
                    }
                },
                c.SDL_EVENT_JOYSTICK_REMOVED => {
                    if ((joystick != null) and (c.SDL_GetJoystickID(joystick) == event.jdevice.which)) {
                        print("close: {s}\n", .{c.SDL_GetJoystickName(joystick)});
                        c.SDL_CloseJoystick(joystick);
                        joystick = null;
                        gv.joystick_type = 0;
                        jstk.num_buttons = 0;
                    }
                },
                // [ GUI window events ========================================================== ]
                c.SDL_EVENT_QUIT => {
                    break :main_loop;
                },
                // [ Key down =================================================================== ]
                c.SDL_EVENT_KEY_DOWN => {
                    switch (event.key.scancode) {
                        c.SDL_SCANCODE_ESCAPE => {
                            break :main_loop;
                        },
                        else => {},
                    }
                },
                else => {},
            }
        }
        jstk.record_events();

        if ((jstk.button_bits & gv.bit_1) != 0) { // HUD mode
            draw_world();
            hud.mode();
        } else {
            draw_world();
        }

        // ***** show
        _ = c.SDL_RenderPresent(renderer);

        if (gv.flags == 1) break :main_loop;
    } // game loop
} // pub fn main()

// ************************************************************************************************
fn draw_world() void {
    // ***** clear window with color
    _ = c.SDL_SetRenderDrawColor(renderer, 255, 5, 255, c.SDL_ALPHA_OPAQUE);
    _ = c.SDL_RenderClear(renderer);

    // ***** drawing
    _ = draw_mapboard();
    _ = draw_chit1();
    _ = draw_chit2();
    _ = draw_chit3();
    fish.render();

    // ***** draw X on window
    _ = c.SDL_RenderLine(renderer, 0, 0, gv.window_w, gv.window_h);
    _ = c.SDL_RenderLine(renderer, 0, gv.window_h, gv.window_w, 0);
}

// ------------------------------------------------------------------------------------------------
fn draw_chit3() void {
    // ***** chit info
    const hex_ID = [_]i32{ 28, 0 };
    const chit_index = 7;

    // ***** create a surface
    const a_surf: *c.SDL_Surface = c.SDL_CreateSurface(gv.chit_square_dim, gv.chit_square_dim, c.SDL_PIXELFORMAT_RGBA8888);
    defer c.SDL_DestroySurface(a_surf);

    // ***** clip one chit and put it on the surface
    var a_rect: c.SDL_Rect = undefined;
    a_rect.x = 0;
    a_rect.y = chit_index * gv.chit_square_dim;
    a_rect.w = gv.chit_square_dim;
    a_rect.h = gv.chit_square_dim;
    _ = c.SDL_BlitSurface(chits_surface, &a_rect, a_surf, null); // no scaling. the target surface truncates.

    // convert the surface to a texture
    const a_texture = c.SDL_CreateTextureFromSurface(renderer, a_surf);
    defer c.SDL_DestroyTexture(a_texture);

    // define a silly puddy rectangle and render it
    var a_rectness: c.SDL_FRect = undefined;
    const hex_ID_x: i32 = @intFromFloat(@as(f64, @floatFromInt(hex_ID[0])) * gv.Hex_Dim_ness[0]);
    const hex_ID_y: i32 = @intFromFloat(@as(f64, @floatFromInt(hex_ID[1])) * gv.Hex_Dim_ness[1]);
    const x: f32 = @as(f32, @floatFromInt(gv.Zero_Zero[0] - gv.map_loc[0] + hex_ID_x)) / gv.scaleness;
    var y: f32 = 0.0;
    if (@mod(hex_ID[0], 2) == 0) {
        y = @as(f32, @floatFromInt(gv.Zero_Zero[1] - gv.map_loc[1] + hex_ID_y)) / gv.scaleness;
    } else {
        y = @as(f32, @floatFromInt(gv.Zero_Zero[1] - gv.map_loc[1] + hex_ID_y + @as(i32, @intFromFloat(gv.Half_Hex_Y_ness)))) / gv.scaleness;
    }

    const w_h_ness: f32 = @as(f32, @floatFromInt(gv.chit_square_dim)) / gv.scaleness;
    a_rectness.x = x;
    a_rectness.y = y;
    a_rectness.w = w_h_ness;
    a_rectness.h = w_h_ness;
    if ((x + w_h_ness) < 0) return;
    if (x > gv.window_w) return;
    if ((y + w_h_ness) < 0) return;
    if (y > gv.window_h) return;
    _ = c.SDL_RenderTexture(renderer, a_texture, null, &a_rectness);
}

// ------------------------------------------------------------------------------------------------
fn draw_chit2() void {
    // ***** chit info
    const hex_ID = [_]i32{ 2, 0 };
    const chit_index = 4;

    // ***** create a surface
    const a_surf: *c.SDL_Surface = c.SDL_CreateSurface(gv.chit_square_dim, gv.chit_square_dim, c.SDL_PIXELFORMAT_RGBA8888);
    defer c.SDL_DestroySurface(a_surf);

    // ***** clip one chit and put it on the surface
    var a_rect: c.SDL_Rect = undefined;
    a_rect.x = 0;
    a_rect.y = chit_index * gv.chit_square_dim;
    a_rect.w = gv.chit_square_dim;
    a_rect.h = gv.chit_square_dim;
    _ = c.SDL_BlitSurface(chits_surface, &a_rect, a_surf, null); // no scaling. the target surface truncates.

    // convert the surface to a texture
    const a_texture = c.SDL_CreateTextureFromSurface(renderer, a_surf);
    defer c.SDL_DestroyTexture(a_texture);

    // define a silly puddy rectangle and render it
    var a_rectness: c.SDL_FRect = undefined;
    const hex_ID_x: i32 = @intFromFloat(@as(f64, @floatFromInt(hex_ID[0])) * gv.Hex_Dim_ness[0]);
    const hex_ID_y: i32 = @intFromFloat(@as(f64, @floatFromInt(hex_ID[1])) * gv.Hex_Dim_ness[1]);
    const x: f32 = @as(f32, @floatFromInt(gv.Zero_Zero[0] - gv.map_loc[0] + hex_ID_x)) / gv.scaleness;
    const y: f32 = @as(f32, @floatFromInt(gv.Zero_Zero[1] - gv.map_loc[1] + hex_ID_y)) / gv.scaleness;
    const w_h_ness: f32 = @as(f32, @floatFromInt(gv.chit_square_dim)) / gv.scaleness;
    a_rectness.x = x;
    a_rectness.y = y;
    a_rectness.w = w_h_ness;
    a_rectness.h = w_h_ness;
    _ = c.SDL_RenderTexture(renderer, a_texture, null, &a_rectness);
}

// ------------------------------------------------------------------------------------------------
fn draw_chit1() void {
    // ***** chit info
    //const hex_loc = [_]i32{ 0, 0 };
    const chit_index = 2;

    // ***** create a surface
    const a_surf: *c.SDL_Surface = c.SDL_CreateSurface(gv.chit_square_dim, gv.chit_square_dim, c.SDL_PIXELFORMAT_RGBA8888);
    defer c.SDL_DestroySurface(a_surf);

    // ***** clip one chit and put it on the surface
    var a_rect: c.SDL_Rect = undefined;
    a_rect.x = 0;
    a_rect.y = chit_index * gv.chit_square_dim;
    a_rect.w = gv.chit_square_dim;
    a_rect.h = gv.chit_square_dim;
    _ = c.SDL_BlitSurface(chits_surface, &a_rect, a_surf, null); // no scaling. the target surface truncates.

    // convert the surface to a texture
    const a_texture = c.SDL_CreateTextureFromSurface(renderer, a_surf);
    defer c.SDL_DestroyTexture(a_texture);

    // define a silly puddy rectangle and render it
    var a_rectness: c.SDL_FRect = undefined;
    a_rectness.x = @as(f32, @floatFromInt(gv.Zero_Zero[0] - gv.map_loc[0])) / gv.scaleness;
    a_rectness.y = @as(f32, @floatFromInt(gv.Zero_Zero[1] - gv.map_loc[1])) / gv.scaleness;
    a_rectness.w = @as(f32, @floatFromInt(gv.chit_square_dim)) / gv.scaleness;
    a_rectness.h = @as(f32, @floatFromInt(gv.chit_square_dim)) / gv.scaleness;
    _ = c.SDL_RenderTexture(renderer, a_texture, null, &a_rectness);
}

// ------------------------------------------------------------------------------------------------
fn draw_mapboard() void {
    var spd: i32 = 1;
    if (gv.joystick_type == 1) { // using RumblePad
        if ((jstk.button_bits & gv.bit_12) != 0) {
            spd = 200;
        }
    } else {
        spd = @intFromFloat(((@as(f32, @floatFromInt(jstk.axis_vals[1] + 32769)) / 65536.0) * 200.0) + 1.0);
    }

    // ********** D-Pad
    if (gv.joystick_type == 4) { // using Sega; converting axis to d-pad infos
        if (jstk.axis_vals[0] < -5000) jstk.d_pad = 8;
        if (jstk.axis_vals[0] > 5000) jstk.d_pad = 2;
        if (jstk.axis_vals[1] < -5000) jstk.d_pad |= 1;
        if (jstk.axis_vals[1] > 5000) jstk.d_pad |= 4;
        spd = 1;
        if ((jstk.button_bits & gv.bit_8) != 0) {
            spd = 100;
        }
    }
    if ((gv.OS_platform == 1) and (gv.joystick_type != 4)) { // FreeBSD
        if (jstk.axis_vals[2] < -10000) jstk.d_pad = 8;
        if (jstk.axis_vals[2] > 10000) jstk.d_pad = 2;
        if (jstk.axis_vals[3] < -10000) jstk.d_pad |= 1;
        if (jstk.axis_vals[3] > 10000) jstk.d_pad |= 4;
    }

    if (jstk.d_pad != 0) { // no inputs, don't bother going in; this should save time
        if ((jstk.d_pad & gv.bit_0) != 0) {
            gv.map_loc[1] += spd;
        }
        if ((jstk.d_pad & gv.bit_1) != 0) {
            gv.map_loc[0] -= spd;
        }
        if ((jstk.d_pad & gv.bit_2) != 0) {
            gv.map_loc[1] -= spd;
        }
        if ((jstk.d_pad & gv.bit_3) != 0) {
            gv.map_loc[0] += spd;
        }
    }

    // ********** Left & Right sholder bind_buttons. If continued pressing, don't change scale.
    gv.scale_old = gv.scale;
    gv.scaleness_old = gv.scaleness;
    if ((jstk.button_bits & gv.bit_4) != 0) {
        if ((jstk.button_bits_old & gv.bit_4) == 0) {
            gv.scale -= 1;
        }
    }
    if ((jstk.button_bits & gv.bit_5) != 0) {
        if ((jstk.button_bits_old & gv.bit_5) == 0) {
            gv.scale += 1;
        }
    }
    if (gv.scale_old != gv.scale) {
        if (gv.scale > 0) { // zoom in
            gv.scaleness = 1.0 / ((1.0 + @as(f32, @floatFromInt(gv.scale))) * 0.6);
        } else if (gv.scale < 0) { // zoom out
            gv.scaleness = 1.0 - (@as(f32, @floatFromInt(gv.scale)) * 0.5);
        } else {
            gv.scaleness = 1.0;
        }
    }

    // ********** clip map surface and save it on a_surf; convert a_surf to texture; render the texture
    const clip_w: f32 = gv.window_w * gv.scaleness;
    const clip_h: f32 = gv.window_h * gv.scaleness;
    const a_surf: *c.SDL_Surface = c.SDL_CreateSurface(@intFromFloat(clip_w), @intFromFloat(clip_h), c.SDL_PIXELFORMAT_RGBA8888);
    defer c.SDL_DestroySurface(a_surf);

    var a_rect: c.SDL_Rect = undefined; // clip square
    if (gv.scale_old != gv.scale) { // shift clip square
        const delta_x_half: f32 = ((gv.window_w * gv.scaleness) - (gv.window_w * gv.scaleness_old)) / 2.0;
        const delta_y_half: f32 = ((gv.window_h * gv.scaleness) - (gv.window_h * gv.scaleness_old)) / 2.0;
        gv.map_loc[0] -= @intFromFloat(delta_x_half);
        gv.map_loc[1] -= @intFromFloat(delta_y_half);
    }
    a_rect.x = gv.map_loc[0];
    a_rect.y = gv.map_loc[1];
    a_rect.w = @intFromFloat(clip_w);
    a_rect.h = @intFromFloat(clip_h);
    _ = c.SDL_BlitSurface(mapboard_surface, &a_rect, a_surf, null); // no scaling. the target surface truncates.

    const a_texture = c.SDL_CreateTextureFromSurface(renderer, a_surf);
    defer c.SDL_DestroyTexture(a_texture);

    _ = c.SDL_RenderTexture(renderer, a_texture, null, null);
}
