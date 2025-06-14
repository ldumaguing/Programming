const std = @import("std");
const NW68 = @import("NW68");
const gv = @import("GlobalVariables.zig");
const jstk = @import("joystick.zig");
const print = @import("std").debug.print;

const c = @cImport({
    @cDefine("SDL_DISABLE_OLD_NAMES", {});
    @cInclude("SDL3/SDL.h");
    @cInclude("SDL3/SDL_revision.h");
    @cDefine("SDL_MAIN_HANDLED", {});
    @cInclude("SDL3/SDL_main.h");
    @cInclude("SDL3_image/SDL_image.h");
});

var window: ?*c.SDL_Window = undefined;
var renderer: ?*c.SDL_Renderer = undefined;

// *************** Surface
var mapboard_surface: ?*c.SDL_Surface = undefined;

// *************** Joystick
var joystick: ?*c.SDL_Joystick = null;

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

    try errify(c.SDL_Init(c.SDL_INIT_VIDEO | c.SDL_INIT_AUDIO | c.SDL_INIT_GAMEPAD | c.SDL_INIT_JOYSTICK));
    defer c.SDL_Quit();

    std.log.debug("SDL video drivers: {}", .{fmtSdlDrivers(
        c.SDL_GetCurrentVideoDriver().?,
        c.SDL_GetNumVideoDrivers(),
        c.SDL_GetVideoDriver,
    )});
    std.log.debug("SDL audio drivers: {}", .{fmtSdlDrivers(
        c.SDL_GetCurrentAudioDriver().?,
        c.SDL_GetNumAudioDrivers(),
        c.SDL_GetAudioDriver,
    )});

    errify(c.SDL_SetHint(c.SDL_HINT_RENDER_VSYNC, "1")) catch {};

    // [ set window and renderer ================================================================ ]
    // const window_dim = c.SDL_GetCurrentDisplayMode(c.SDL_GetPrimaryDisplay());
    // window_w = @as(f32, @floatFromInt(window_dim.*.w));
    // window_h = @as(f32, @floatFromInt(window_dim.*.h));
    // window = c.SDL_CreateWindow("Nuklear Winter '68", @intFromFloat(window_w), @intFromFloat(window_h), 0);
    window = c.SDL_CreateWindow("Nuklear Winter '68", @intFromFloat(gv.window_w), @intFromFloat(gv.window_h), 0);
    renderer = c.SDL_CreateRenderer(window, null);
    defer c.SDL_DestroyRenderer(renderer);
    defer c.SDL_DestroyWindow(window);

    // [ store images on surfaces =============================================================== ]
    var stream: ?*c.SDL_IOStream = undefined;

    stream = c.SDL_IOFromFile("img/Map.jpg", "r");
    mapboard_surface = c.IMG_LoadJPG_IO(stream);

    // [ misc =================================================================================== ]

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
        record_joystick_events();
        draw_world();
    }
} // pub fn main()

// ************************************************************************************************
fn record_joystick_events() void {
    // ********** clear bits & d_pad info
    jstk.button_bits_old = jstk.button_bits;
    jstk.button_bits = 0;
    jstk.d_pad = 0;

    // ********** set info bits
    for (0..jstk.num_buttons) |i| {
        if (c.SDL_GetJoystickButton(joystick, @intCast(i))) {
            const val = jstk.map_button[i];
            if (val >= 0) { // valid buttons are 0+. Unused buttons have the value of -1
                const bits: u16 = std.math.pow(u16, 2, @as(u16, @intCast(val)));
                jstk.button_bits |= bits;
            }
        }
    }

    // ********** set d_pad info
    const hat = c.SDL_GetJoystickHat(joystick, 0);
    if (hat != 0) {
        jstk.d_pad = hat;
    }
}

// ************************************************************************************************
fn draw_world() void {
    // ***** clear window with color
    _ = c.SDL_SetRenderDrawColor(renderer, 255, 5, 255, c.SDL_ALPHA_OPAQUE);
    _ = c.SDL_RenderClear(renderer);

    // ***** drawing
    _ = draw_mapboard();
    // _ = draw_chits();

    // ***** draw X on window
    _ = c.SDL_RenderLine(renderer, 0, 0, gv.window_w, gv.window_h);
    _ = c.SDL_RenderLine(renderer, 0, gv.window_h, gv.window_w, 0);

    // ***** show
    _ = c.SDL_RenderPresent(renderer);
}

// ------------------------------------------------------------------------------------------------
fn draw_mapboard() void {
    // ********** D-Pad
    if (jstk.d_pad != 0) { // no inputs, don't bother going in; this should save time
        if ((jstk.d_pad & gv.bit_0) != 0) {
            gv.map_loc[1] += 1;
            //print("up: {}\n", .{gv.map_loc[1]});
        }
        if ((jstk.d_pad & gv.bit_1) != 0) {
            gv.map_loc[0] -= 1;
            //print("right: {}\n", .{gv.map_loc[0]});
        }
        if ((jstk.d_pad & gv.bit_2) != 0) {
            gv.map_loc[1] -= 1;
            //print("down: {}\n", .{gv.map_loc[1]});
        }
        if ((jstk.d_pad & gv.bit_3) != 0) {
            gv.map_loc[0] += 1;
            //print("left: {}\n", .{gv.map_loc[0]});
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

// ************************************************************************************************
fn fmtSdlDrivers(
    current_driver: [*:0]const u8,
    num_drivers: c_int,
    getDriver: *const fn (c_int) callconv(.C) ?[*:0]const u8,
) std.fmt.Formatter(formatSdlDrivers) {
    return .{ .data = .{
        .current_driver = current_driver,
        .num_drivers = num_drivers,
        .getDriver = getDriver,
    } };
}

fn formatSdlDrivers(
    context: struct {
        current_driver: [*:0]const u8,
        num_drivers: c_int,
        getDriver: *const fn (c_int) callconv(.C) ?[*:0]const u8,
    },
    comptime _: []const u8,
    _: std.fmt.FormatOptions,
    writer: anytype,
) !void {
    var i: c_int = 0;
    while (i < context.num_drivers) : (i += 1) {
        if (i != 0) {
            try writer.writeAll(", ");
        }
        const driver = context.getDriver(i).?;
        try writer.writeAll(std.mem.span(driver));
        if (std.mem.orderZ(u8, context.current_driver, driver) == .eq) {
            try writer.writeAll(" (current)");
        }
    }
}

/// Converts the return value of an SDL function to an error union.
pub inline fn errify(value: anytype) error{SdlError}!switch (@import("shims").typeInfo(@TypeOf(value))) {
    .bool => void,
    .pointer, .optional => @TypeOf(value.?),
    .int => |info| switch (info.signedness) {
        .signed => @TypeOf(@max(0, value)),
        .unsigned => @TypeOf(value),
    },
    else => @compileError("unerrifiable type: " ++ @typeName(@TypeOf(value))),
} {
    return switch (@import("shims").typeInfo(@TypeOf(value))) {
        .bool => if (!value) error.SdlError,
        .pointer, .optional => value orelse error.SdlError,
        .int => |info| switch (info.signedness) {
            .signed => if (value >= 0) @max(0, value) else error.SdlError,
            .unsigned => if (value != 0) value else error.SdlError,
        },
        else => comptime unreachable,
    };
}
