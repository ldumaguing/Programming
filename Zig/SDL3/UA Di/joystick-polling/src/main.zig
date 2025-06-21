const std = @import("std");
const print = @import("std").debug.print;
const mvzr = @import("mvzr.zig");

const c = @cImport({
    @cDefine("SDL_DISABLE_OLD_NAMES", {});
    @cInclude("SDL3/SDL.h");
    @cInclude("SDL3/SDL_revision.h");
    @cDefine("SDL_MAIN_HANDLED", {});
    @cInclude("SDL3/SDL_main.h");
});

pub const WINDOW_WIDTH = 640;
pub const WINDOW_HEIGHT = 480;

// *************** Joystick
var joystick: ?*c.SDL_Joystick = null;
var button_bits: u16 = 0;
var button_mods = [_]i32{0} ** 14;
// ***************

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

    const window: *c.SDL_Window, const renderer: *c.SDL_Renderer = create_window_and_renderer: {
        var window: ?*c.SDL_Window = null;
        var renderer: ?*c.SDL_Renderer = null;
        try errify(c.SDL_CreateWindowAndRenderer("01_hello", WINDOW_WIDTH, WINDOW_HEIGHT, 0, &window, &renderer));
        errdefer comptime unreachable;

        break :create_window_and_renderer .{ window.?, renderer.? };
    };
    defer c.SDL_DestroyRenderer(renderer);
    defer c.SDL_DestroyWindow(window);

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
                        try define_button_mods(c.SDL_GetJoystickName(joystick));
                    }
                },
                c.SDL_EVENT_JOYSTICK_REMOVED => {
                    if ((joystick != null) and (c.SDL_GetJoystickID(joystick) == event.jdevice.which)) {
                        print("close: {s}\n", .{c.SDL_GetJoystickName(joystick)});
                        c.SDL_CloseJoystick(joystick);
                        joystick = null;
                    }
                },
                else => {},
            }
        }
        if (joystick != null) {
            sample_joystick_events();
            // record_button_events();
        }

        try AppIterate(renderer);
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
                print("Button {} --- button_mod: {} -- {}\n", .{ i, val, button_bits });
            }
        }
    }
}

// ************************************************************************************************
fn define_button_mods(aText: [*c]const u8) !void {
    print("yo: {s}\n", .{aText});
    var joystick_type: i32 = 0;

    var buffer = [_]u8{0} ** 100;
    _ = try std.fmt.bufPrintZ(&buffer, "{s}\n", .{aText});

    var regex: mvzr.Regex = mvzr.compile("RumblePad").?;
    if (regex.isMatch(&buffer)) {
        joystick_type = 1;
    }

    regex = mvzr.compile("ZEROPLUS").?;
    if (regex.isMatch(&buffer)) {
        joystick_type = 1;
    }

    regex = mvzr.compile("F710").?;
    if (regex.isMatch(&buffer)) {
        print("f710\n", .{});
        joystick_type = 2;
    }

    regex = mvzr.compile("PS4").?;
    if (regex.isMatch(&buffer)) {
        joystick_type = 3;
    }

    regex = mvzr.compile("SWITCH CO").?;
    if (regex.isMatch(&buffer)) {
        joystick_type = 4;
    }

    // ****************************************************
    if (joystick_type == 1) {
        // ***** Logi-D and Snake W
        button_mods[0] = 2;
        button_mods[1] = 0;
        button_mods[2] = 3;
        button_mods[3] = 1;
        button_mods[4] = 4;
        button_mods[5] = 5;
        button_mods[6] = 11;
        button_mods[7] = 12;
        button_mods[8] = 6;
        button_mods[9] = 7;
        button_mods[10] = 8;
        button_mods[11] = 9;
        button_mods[12] = 10;
        button_mods[13] = -1;
    }

    if (joystick_type == 2) {
        // ***** Logi-X and 8BitDo
        button_mods[0] = 0;
        button_mods[1] = 3;
        button_mods[2] = 2;
        button_mods[3] = 1;
        button_mods[4] = 4;
        button_mods[5] = 5;
        button_mods[6] = 6;
        button_mods[7] = 7;
        button_mods[8] = 10;
        button_mods[9] = 8;
        button_mods[10] = 9;
        button_mods[11] = -1;
        button_mods[12] = -1;
        button_mods[13] = -1;
    }

    if (joystick_type == 3) {
        // ***** Snake (wireless version)
        button_mods[0] = 0;
        button_mods[1] = 3;
        button_mods[2] = 2;
        button_mods[3] = 1;
        button_mods[4] = 6;
        button_mods[5] = 10;
        button_mods[6] = 7;
        button_mods[7] = 8;
        button_mods[8] = 9;
        button_mods[9] = 4;
        button_mods[10] = 5;
        button_mods[11] = -1;
        button_mods[12] = -1;
        button_mods[13] = -1;
    }

    if (joystick_type == 4) {
        // ***** Sega
        button_mods[0] = 2;
        button_mods[1] = 0;
        button_mods[2] = 3;
        button_mods[3] = 1;
        button_mods[4] = 9;
        button_mods[5] = 8;
        button_mods[6] = 4;
        button_mods[7] = 5;
        button_mods[8] = 7;
        button_mods[9] = 10;
        button_mods[10] = -1;
        button_mods[11] = -1;
        button_mods[12] = -1;
        button_mods[13] = -1;
    }
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


fn AppIterate(renderer: *c.SDL_Renderer) !void {
    const now: f64 = @as(f64, @floatFromInt(c.SDL_GetTicks())) / 1000.0;

    const red: f32 = 0.5 + 0.5 * c.SDL_sinf(@floatCast(now));
    const green: f32 = 0.5 + 0.5 * c.SDL_sinf(@floatCast(now + c.SDL_PI_D * 2.0 / 3.0));
    const blue: f32 = 0.5 + 0.5 * c.SDL_sinf(@floatCast(now + c.SDL_PI_D * 4.0 / 3.0));
    try errify(c.SDL_SetRenderDrawColorFloat(renderer, red, green, blue, c.SDL_ALPHA_OPAQUE_FLOAT));

    try
    errify(c.SDL_RenderClear(renderer));
    try errify(c.SDL_RenderPresent(renderer));
}
