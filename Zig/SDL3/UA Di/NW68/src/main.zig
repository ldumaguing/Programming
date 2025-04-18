const std = @import("std");
const print = @import("std").debug.print;

const mvzr = @import("mvzr.zig");
const inits = @import("inits.zig");
const g = @import("GameVariables.zig");
const gL = @import("gameLoop.zig");
const Sheet = @import("Sheet.zig");
const Sprite = @import("Sprite.zig");

const c = @cImport({
    @cDefine("SDL_DISABLE_OLD_NAMES", {});
    @cInclude("SDL3/SDL.h");
    @cInclude("SDL3/SDL_revision.h");
    @cDefine("SDL_MAIN_HANDLED", {});
    @cInclude("SDL3/SDL_main.h");
    @cInclude("SDL3_image/SDL_image.h");
});

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

    // ============================================================================================
    inits.load_surfaces();
    defer c.SDL_DestroySurface(g.mapboard_surface);
    defer c.SDL_DestroySurface(g.chits_surface);
    defer c.SDL_DestroySurface(g.arrow_surface);

    inits.desktop_screen();
    defer c.SDL_DestroyRenderer(g.renderer);
    defer c.SDL_DestroyWindow(g.window);

    inits.mapboard();

    g.mapboard_sheet = Sheet.bind_Surface_Sheet(0, g.mapboard_surface);

    g.aSprite = Sprite.bind_Surface_Sprite(0, g.chits_surface, 2, 150);
    g.aSprite.set_HexID(1, 1);
    // ============================================================================================

    main_loop: while (true) {
        var event: c.SDL_Event = undefined;
        while (c.SDL_PollEvent(&event)) {
            switch (event.type) {
                c.SDL_EVENT_QUIT => {
                    break :main_loop;
                },
                c.SDL_EVENT_JOYSTICK_ADDED => {
                    if (g.joystick == null) {
                        g.joystick = c.SDL_OpenJoystick(event.jdevice.which);
                        print("open: {s}\n", .{c.SDL_GetJoystickName(g.joystick)});
                        try inits.define_button_mods(c.SDL_GetJoystickName(g.joystick));
                    }
                },
                c.SDL_EVENT_JOYSTICK_REMOVED => {
                    if ((g.joystick != null) and (c.SDL_GetJoystickID(g.joystick) == event.jdevice.which)) {
                        print("close: {s}\n", .{c.SDL_GetJoystickName(g.joystick)});
                        c.SDL_CloseJoystick(g.joystick);
                        g.joystick = null;
                    }
                },
                c.SDL_EVENT_KEY_DOWN => {
                    switch (event.key.scancode) {
                        c.SDL_SCANCODE_ESCAPE => {
                            break :main_loop;
                        },
                        c.SDL_SCANCODE_I => {
                            print("{d}\n", .{g.scale});
                            print("map: {d}, {d}\n", .{ g.mapboard_sheet.x, g.mapboard_sheet.y });
                            print("sprite: {d}, {d}\n", .{ g.aSprite.x, g.aSprite.y });
                            print("map clip: {d}, {d}\n", .{ g.mapboard_clip_w, g.mapboard_clip_h });
                            c.SDL_WarpMouseInWindow(g.window, 10.0, 10.0);
                        },
                        c.SDL_SCANCODE_DELETE => {
                            // boardgame_sheet.loc_x = 0.0;
                            // boardgame_sheet.loc_y = 0.0;
                            // boardgame_sheet.render(renderer);
                        },
                        // **********
                        c.SDL_SCANCODE_SEMICOLON => {
                            g.keybrd_bits |= 1;
                        },
                        c.SDL_SCANCODE_P => {
                            g.keybrd_bits |= 2;
                        },
                        c.SDL_SCANCODE_APOSTROPHE => {
                            g.keybrd_bits |= 8;
                        },
                        c.SDL_SCANCODE_L => {
                            g.keybrd_bits |= 4;
                        },
                        c.SDL_SCANCODE_LEFTBRACKET => {
                            g.keybrd_bits |= 32;
                        },
                        c.SDL_SCANCODE_O => {
                            g.keybrd_bits |= 4096;
                        },
                        // ***
                        c.SDL_SCANCODE_W => {
                            g.keybrd_dpad |= 1;
                        },
                        c.SDL_SCANCODE_D => {
                            g.keybrd_dpad |= 2;
                        },
                        c.SDL_SCANCODE_S => {
                            g.keybrd_dpad |= 4;
                        },
                        c.SDL_SCANCODE_A => {
                            g.keybrd_dpad |= 8;
                        },
                        c.SDL_SCANCODE_Q => {
                            g.keybrd_bits |= 16;
                        },
                        c.SDL_SCANCODE_E => {
                            g.keybrd_bits |= 2048;
                        },
                        // ***
                        c.SDL_SCANCODE_G => {
                            g.keybrd_bits |= 64;
                        },
                        c.SDL_SCANCODE_H => {
                            g.keybrd_bits |= 128;
                        },
                        c.SDL_SCANCODE_B => {
                            g.keybrd_bits |= 1024;
                        },
                        else => {},
                    }
                },
                c.SDL_EVENT_KEY_UP => {
                    switch (event.key.scancode) {
                        c.SDL_SCANCODE_SEMICOLON => {
                            g.keybrd_bits ^= 1;
                        },
                        c.SDL_SCANCODE_P => {
                            g.keybrd_bits ^= 2;
                        },
                        c.SDL_SCANCODE_APOSTROPHE => {
                            g.keybrd_bits ^= 8;
                        },
                        c.SDL_SCANCODE_L => {
                            g.keybrd_bits ^= 4;
                        },
                        c.SDL_SCANCODE_LEFTBRACKET => {
                            g.keybrd_bits ^= 32;
                        },
                        c.SDL_SCANCODE_O => {
                            g.keybrd_bits ^= 4096;
                        },
                        // ***
                        c.SDL_SCANCODE_W => {
                            g.keybrd_dpad ^= 1;
                        },
                        c.SDL_SCANCODE_D => {
                            g.keybrd_dpad ^= 2;
                        },
                        c.SDL_SCANCODE_S => {
                            g.keybrd_dpad ^= 4;
                        },
                        c.SDL_SCANCODE_A => {
                            g.keybrd_dpad ^= 8;
                        },
                        c.SDL_SCANCODE_Q => {
                            g.keybrd_bits ^= 16;
                        },
                        c.SDL_SCANCODE_E => {
                            g.keybrd_bits ^= 2048;
                        },
                        // ***
                        c.SDL_SCANCODE_G => {
                            g.keybrd_bits ^= 64;
                        },
                        c.SDL_SCANCODE_H => {
                            g.keybrd_bits ^= 128;
                        },
                        c.SDL_SCANCODE_B => {
                            g.keybrd_bits ^= 1024;
                        },
                        else => {},
                    }
                },
                else => {},
            }

            if (g.joystick != null) {
                // sample_g.joystick_events();
                record_button_events();
            }
            g.all_bits = g.keybrd_bits | g.button_bits;
            g.all_dpad = g.keybrd_dpad | g.d_pad;
            // print("{} -- {} -- {} .. {} *** {}, {}\n", .{ g.d_pad, g.button_bits, g.keybrd_bits, g.keybrd_dpad, g.all_bits, g.all_dpad });
            // print("{d} -- {d}\n", .{g.scale_rank, g.scale});
        }

        gL.update_world();
        gL.draw_world();

        // ****************************************************** updates
        if (g.scale_rank != g.scale_rank_prev) { // scale change
            g.scale_rank_prev = g.scale_rank;
            g.scale_prev = g.scale;
        }

        g.d_pad = 0;
    } // *** main_loop
}

// ************************************************************************************************
fn record_button_events() void {
    //print("yo\n", .{});
    g.button_bits = 0;
    const total = @as(u32, @intCast(c.SDL_GetNumJoystickButtons(g.joystick)));
    for (0..total) |i| {
        if (c.SDL_GetJoystickButton(g.joystick, @intCast(i))) {
            const val = g.button_mods[i];
            if (val >= 0) {
                const bits: u16 = std.math.pow(u16, 2, @as(u16, @intCast(val)));
                g.button_bits |= bits;
                // print("Button {} --- button_mod: {} -- {}\n", .{ i, val, button_bits });
            }
        }
    }

    const hat = c.SDL_GetJoystickHat(g.joystick, 0);
    if (hat != 0) {
        g.d_pad = hat;
        // print("d_pad: {} --- {}\n", .{ d_pad, button_bits });
    }
    //    print("{} -- {} -- {} .. {} *** {}\n", .{ d_pad, button_bits, keybrd_bits, keybrd_dpad, all_bits });
}

// ************************************************************************************************
fn sample_joystick_events() void {
    {
        const total: u32 = @as(u32, @intCast(c.SDL_GetNumJoystickAxes(g.joystick)));
        for (0..total) |i| {
            print("Axis {}: {}\n", .{ i, c.SDL_GetJoystickAxis(g.joystick, @intCast(i)) });
        }
    }

    print("\n", .{});

    {
        const total = @as(u32, @intCast(c.SDL_GetNumJoystickButtons(g.joystick)));
        for (0..total) |i| {
            print("Button {}: {}\n", .{ i, c.SDL_GetJoystickButton(g.joystick, @intCast(i)) });
        }
    }

    print("\n", .{});

    {
        const total = @as(u32, @intCast(c.SDL_GetNumJoystickHats(g.joystick)));
        for (0..total) |i| {
            print("Hat {}: {}\n", .{ i, c.SDL_GetJoystickHat(g.joystick, @intCast(i)) });
        }
    }
    print("{s}\n", .{c.SDL_GetJoystickName(g.joystick)});
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
