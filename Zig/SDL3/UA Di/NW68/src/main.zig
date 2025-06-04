pub fn main() !void {
    var window: ?*c.SDL_Window = undefined;
    var renderer: ?*c.SDL_Renderer = undefined;

    // const dimention = c.SDL_GetCurrentDisplayMode(c.SDL_GetPrimaryDisplay());
    // g.desktop_w = @as(f32, @floatFromInt(dimention.*.w));
    // g.desktop_h = @as(f32, @floatFromInt(dimention.*.h));
    // g.desktop_w = 1280; // High Definition (HD)
    // g.desktop_h = 720;
    // g.desktop_w = 960; // anbernic.com
    // g.desktop_h = 720;
    const desktop_w = 800;
    const desktop_h = 600;
    // g.window = c.SDL_CreateWindow("Nuklear Winter '68", @intFromFloat(g.desktop_w), @intFromFloat(g.desktop_h), c.SDL_WINDOW_BORDERLESS);
    window = c.SDL_CreateWindow("Nuklear Winter '68", @intFromFloat(desktop_w), @intFromFloat(desktop_h), 0);
    // g.window = c.SDL_CreateWindow("Nuklear Winter '68", @intFromFloat(g.desktop_w), @intFromFloat(g.desktop_h), c.SDL_WINDOW_FULLSCREEN);
    renderer = c.SDL_CreateRenderer(window, null);
}

// ************************************************************************************************
const std = @import("std");
const print = @import("std").debug.print;

/// This imports the separate module containing `root.zig`. Take a look in `build.zig` for details.
const lib = @import("NW68_lib");

const c = @cImport({
    @cDefine("SDL_DISABLE_OLD_NAMES", {});
    @cInclude("SDL3/SDL.h");
    @cInclude("SDL3/SDL_revision.h");
    @cDefine("SDL_MAIN_HANDLED", {});
    @cInclude("SDL3/SDL_main.h");
    @cInclude("SDL3_image/SDL_image.h");
});

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
