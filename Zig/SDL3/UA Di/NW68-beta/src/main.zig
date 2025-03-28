const std = @import("std");
const print = @import("std").debug.print;
const mvzr = @import("mvzr.zig");

const c = @cImport({
    @cDefine("SDL_DISABLE_OLD_NAMES", {});
    @cInclude("SDL3/SDL.h");
    @cInclude("SDL3/SDL_revision.h");
    @cDefine("SDL_MAIN_HANDLED", {});
    @cInclude("SDL3/SDL_main.h");
    @cInclude("SDL3_image/SDL_image.h");
});

const sdl = @import("mineSDL.zig");
const texture = @import("texture.zig");
const inits = @import("inits.zig");
const Sheet = @import("Sheet.zig");
const Chit = @import("Chit.zig");

pub var WINDOW_WIDTH: f32 = 800.0;
pub var WINDOW_HEIGHT: f32 = 600.0;
pub var WINDOW_CENTER_X: f32 = 400.0;
pub var WINDOW_CENTER_Y: f32 = 300.0;

pub var window: ?*c.SDL_Window = undefined;
pub var renderer: ?*c.SDL_Renderer = undefined;

// *************** Joystick
var joystick: ?*c.SDL_Joystick = null;
var button_bits: u16 = 0;
pub var button_mods = [_]i32{0} ** 14;
var d_pad: u16 = 0;

// ***************
var keybrd_bits: u16 = 0;
var keybrd_dpad: u16 = 0;

// ***************
pub var all_bits: u16 = 0;
pub var all_dpad: u16 = 0;

// *************** images
pub var boardgame_texture: ?*c.SDL_Texture = undefined;
pub var boardgame_sheet: Sheet = undefined;

pub var chit_texture: ?*c.SDL_Texture = undefined;
pub var chit_1: Chit = undefined;

pub var gScale: i32 = 0;
pub var gScale_prev: f32 = 1.0;
pub var gScale_mult: f32 = 1.0;

pub const loc0x0 = [_]f32{ 292.0, 142.0 };
const locH_Y = [_]f32{ 3846.0, 19.0 }; // pixel bottom loc, hex count
const locH_X = [_]f32{ 5020.0, 28.0 }; // pixel right-most loc, hex count
pub const Hex_W: f64 = (locH_X[0] - loc0x0[0]) / locH_X[1];
pub const Hex_H: f64 = (locH_Y[0] - loc0x0[1]) / locH_Y[1];

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

    const desktop_dim: [*c]c.SDL_DisplayMode = @constCast(c.SDL_GetCurrentDisplayMode(1));
    // print("{d}, {d}\n", .{ desktop_dim.*.h, desktop_dim.*.w });

    window = c.SDL_CreateWindow("Nuklear Winter '68", desktop_dim.*.w, desktop_dim.*.h, c.SDL_WINDOW_FULLSCREEN);
    renderer = c.SDL_CreateRenderer(window, null);
    defer c.SDL_DestroyRenderer(renderer);
    defer c.SDL_DestroyWindow(window);

    _ = c.SDL_HideCursor();

    // print("{d}, {d}\n", .{ Hex_W, Hex_H });

    // ============================================================================================
    inits.load_images();
    defer c.SDL_DestroyTexture(boardgame_texture);
    defer c.SDL_DestroyTexture(chit_texture);
    // ============================================================================================

    main_loop: while (true) {
        var event: c.SDL_Event = undefined;
        while (c.SDL_PollEvent(&event)) {
            switch (event.type) {
                c.SDL_EVENT_QUIT => {
                    break :main_loop;
                },
                c.SDL_EVENT_JOYSTICK_ADDED => {
                    if (joystick == null) {
                        joystick = c.SDL_OpenJoystick(event.jdevice.which);
                        print("open: {s}\n", .{c.SDL_GetJoystickName(joystick)});
                        try inits.define_button_mods(c.SDL_GetJoystickName(joystick));
                    }
                },
                c.SDL_EVENT_JOYSTICK_REMOVED => {
                    if ((joystick != null) and (c.SDL_GetJoystickID(joystick) == event.jdevice.which)) {
                        print("close: {s}\n", .{c.SDL_GetJoystickName(joystick)});
                        c.SDL_CloseJoystick(joystick);
                        joystick = null;
                    }
                },
                c.SDL_EVENT_KEY_DOWN => {
                    switch (event.key.scancode) {
                        c.SDL_SCANCODE_ESCAPE => {
                            break :main_loop;
                        },
                        c.SDL_SCANCODE_I => {
                            print("\n*** INFO ***\n", .{});
                            print("{d}, {d} : {d}\n", .{ boardgame_sheet.loc_x, boardgame_sheet.loc_y, gScale });
                        },
                        c.SDL_SCANCODE_DELETE => {
                            boardgame_sheet.loc_x = 0.0;
                            boardgame_sheet.loc_y = 0.0;
                            boardgame_sheet.render(renderer);
                        },
                        // **********
                        c.SDL_SCANCODE_SEMICOLON => {
                            keybrd_bits |= 1;
                        },
                        c.SDL_SCANCODE_P => {
                            keybrd_bits |= 2;
                        },
                        c.SDL_SCANCODE_APOSTROPHE => {
                            keybrd_bits |= 8;
                        },
                        c.SDL_SCANCODE_L => {
                            keybrd_bits |= 4;
                        },
                        c.SDL_SCANCODE_LEFTBRACKET => {
                            keybrd_bits |= 32;
                        },
                        c.SDL_SCANCODE_O => {
                            keybrd_bits |= 4096;
                        },
                        // ***
                        c.SDL_SCANCODE_W => {
                            keybrd_dpad |= 1;
                        },
                        c.SDL_SCANCODE_D => {
                            keybrd_dpad |= 2;
                        },
                        c.SDL_SCANCODE_S => {
                            keybrd_dpad |= 4;
                        },
                        c.SDL_SCANCODE_A => {
                            keybrd_dpad |= 8;
                        },
                        c.SDL_SCANCODE_Q => {
                            keybrd_bits |= 16;
                        },
                        c.SDL_SCANCODE_E => {
                            keybrd_bits |= 2048;
                        },
                        // ***
                        c.SDL_SCANCODE_G => {
                            keybrd_bits |= 64;
                        },
                        c.SDL_SCANCODE_H => {
                            keybrd_bits |= 128;
                        },
                        c.SDL_SCANCODE_B => {
                            keybrd_bits |= 1024;
                        },
                        else => {},
                    }
                },
                c.SDL_EVENT_KEY_UP => {
                    switch (event.key.scancode) {
                        c.SDL_SCANCODE_SEMICOLON => {
                            keybrd_bits ^= 1;
                        },
                        c.SDL_SCANCODE_P => {
                            keybrd_bits ^= 2;
                        },
                        c.SDL_SCANCODE_APOSTROPHE => {
                            keybrd_bits ^= 8;
                        },
                        c.SDL_SCANCODE_L => {
                            keybrd_bits ^= 4;
                        },
                        c.SDL_SCANCODE_LEFTBRACKET => {
                            keybrd_bits ^= 32;
                        },
                        c.SDL_SCANCODE_O => {
                            keybrd_bits ^= 4096;
                        },
                        // ***
                        c.SDL_SCANCODE_W => {
                            keybrd_dpad ^= 1;
                        },
                        c.SDL_SCANCODE_D => {
                            keybrd_dpad ^= 2;
                        },
                        c.SDL_SCANCODE_S => {
                            keybrd_dpad ^= 4;
                        },
                        c.SDL_SCANCODE_A => {
                            keybrd_dpad ^= 8;
                        },
                        c.SDL_SCANCODE_Q => {
                            keybrd_bits ^= 16;
                        },
                        c.SDL_SCANCODE_E => {
                            keybrd_bits ^= 2048;
                        },
                        // ***
                        c.SDL_SCANCODE_G => {
                            keybrd_bits ^= 64;
                        },
                        c.SDL_SCANCODE_H => {
                            keybrd_bits ^= 128;
                        },
                        c.SDL_SCANCODE_B => {
                            keybrd_bits ^= 1024;
                        },
                        else => {},
                    }
                },
                else => {},
            }

            if (joystick != null) {
                // sample_joystick_events();
                record_button_events();
            }
            all_bits = keybrd_bits | button_bits;
            all_dpad = keybrd_dpad | d_pad;
            // print("{} -- {} -- {} .. {} *** {}, {}\n", .{ d_pad, button_bits, keybrd_bits, keybrd_dpad, all_bits, all_dpad });
        }

        sdl.AppUpdate(); // game physics
        sdl.AppIterate(); // draw stuff

        // ********** house keeping
        gScale_prev = gScale_mult;
        d_pad = 0;
    }
}

// ************************************************************************************************
fn record_button_events() void {
    //print("yo\n", .{});
    button_bits = 0;
    const total = @as(u32, @intCast(c.SDL_GetNumJoystickButtons(joystick)));
    for (0..total) |i| {
        if (c.SDL_GetJoystickButton(joystick, @intCast(i))) {
            const val = button_mods[i];
            if (val >= 0) {
                const bits: u16 = std.math.pow(u16, 2, @as(u16, @intCast(val)));
                button_bits |= bits;
                // print("Button {} --- button_mod: {} -- {}\n", .{ i, val, button_bits });
            }
        }
    }

    const hat = c.SDL_GetJoystickHat(joystick, 0);
    if (hat != 0) {
        d_pad = hat;
        // print("d_pad: {} --- {}\n", .{ d_pad, button_bits });
    }
    //    print("{} -- {} -- {} .. {} *** {}\n", .{ d_pad, button_bits, keybrd_bits, keybrd_dpad, all_bits });
}

// ************************************************************************************************
fn sample_joystick_events() void {
    {
        const total: u32 = @as(u32, @intCast(c.SDL_GetNumJoystickAxes(joystick)));
        for (0..total) |i| {
            print("Axis {}: {}\n", .{ i, c.SDL_GetJoystickAxis(joystick, @intCast(i)) });
        }
    }

    print("\n", .{});

    {
        const total = @as(u32, @intCast(c.SDL_GetNumJoystickButtons(joystick)));
        for (0..total) |i| {
            print("Button {}: {}\n", .{ i, c.SDL_GetJoystickButton(joystick, @intCast(i)) });
        }
    }

    print("\n", .{});

    {
        const total = @as(u32, @intCast(c.SDL_GetNumJoystickHats(joystick)));
        for (0..total) |i| {
            print("Hat {}: {}\n", .{ i, c.SDL_GetJoystickHat(joystick, @intCast(i)) });
        }
    }
    print("{s}\n", .{c.SDL_GetJoystickName(joystick)});
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
