const std = @import("std");
const print = @import("std").debug.print;

const c = @cImport({
    @cDefine("SDL_DISABLE_OLD_NAMES", {});
    @cInclude("SDL3/SDL.h");
    @cInclude("SDL3/SDL_revision.h");
    @cDefine("SDL_MAIN_HANDLED", {});
    @cInclude("SDL3/SDL_main.h");
    @cInclude("SDL3_image/SDL_image.h");
});

const DiTexture = @import("DiTexture.zig");
const DiSprite = @import("DiSprite.zig");

const iter = @import("mineSDL.zig");

pub var gWindow: ?*c.SDL_Window = undefined;
pub var gRenderer: ?*c.SDL_Renderer = undefined;

pub const WINDOW_WIDTH = 640;
pub const WINDOW_HEIGHT = 480;

pub var gSpriteSheet: DiTexture = undefined;
// pub var mySprite: DiSprite = undefined;
pub var redDot: DiSprite = undefined;

// // ************************************************************************************************
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

    try errify(c.SDL_Init(c.SDL_INIT_VIDEO | c.SDL_INIT_AUDIO | c.SDL_INIT_GAMEPAD));
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

    // ************************************************************************
    gWindow = c.SDL_CreateWindow("04-color-keying", WINDOW_WIDTH, WINDOW_HEIGHT, 0);
    gRenderer = c.SDL_CreateRenderer(gWindow, null);
    defer c.SDL_DestroyRenderer(gRenderer);
    defer c.SDL_DestroyWindow(gWindow);

    // ========================================================================
    gSpriteSheet = DiTexture.new_with_transparency(1, "img/dots.png", 0x0, 0xff, 0xff);
    defer gSpriteSheet.destroy();

    redDot = DiSprite.new(2, &gSpriteSheet, .{ .x = 0.0, .y = 0.0, .h = 100.0, .w = 100.0 });
    // ========================================================================

    main_loop: while (true) {
        var event: c.SDL_Event = undefined;
        while (c.SDL_PollEvent(&event)) {
            switch (event.type) {
                c.SDL_EVENT_QUIT => {
                    break :main_loop;
                },
                c.SDL_EVENT_KEY_DOWN, c.SDL_EVENT_KEY_UP => {
                    switch (event.key.scancode) {
                        c.SDL_EVENT_QUIT => {
                            break :main_loop;
                        },
                        c.SDL_SCANCODE_ESCAPE => {
                            break :main_loop;
                        },
                        c.SDL_SCANCODE_DOWN => {
                            print("down\n", .{});
                        },
                        c.SDL_SCANCODE_UP => {
                            print("up\n", .{});
                        },
                        c.SDL_SCANCODE_LEFT => {
                            print("left\n", .{});
                        },
                        c.SDL_SCANCODE_RIGHT => {
                            print("right\n", .{});
                        },
                        else => {},
                    }
                },
                else => {},
            }
        }

        try iter.AppIterate();
    }
}
//
// // ************************************************************************************************
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
