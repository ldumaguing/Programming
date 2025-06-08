const std = @import("std");
const NW68 = @import("NW68");

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
var desktop_w: f32 = 640.0;
var desktop_h: f32 = 480.0;

// *************** Surface
var mapboard_surface: ?*c.SDL_Surface = undefined;

// *************** Mapboard info
const Zero_Zero = [_]i32{ 293, 141 };
const Lower_Right = [_]i32{ 5020, 3846 };
const Hex_Dim = [_]f64{ @as(f64, @floatFromInt((Lower_Right[0] - Zero_Zero[0]))) / 28.0, @as(f64, @floatFromInt((Lower_Right[1] - Zero_Zero[1]))) / 19.0 };
const Half_Hex_Y: f32 = @floatCast(Hex_Dim[1] / 2.0);

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

    // [ set window and renderer ==================================================================
    // const desktop_dim = c.SDL_GetCurrentDisplayMode(c.SDL_GetPrimaryDisplay());
    // desktop_w = @as(f32, @floatFromInt(desktop_dim.*.w));
    // desktop_h = @as(f32, @floatFromInt(desktop_dim.*.h));
    // window = c.SDL_CreateWindow("Nuklear Winter '68", @intFromFloat(desktop_w), @intFromFloat(desktop_h), 0);
    window = c.SDL_CreateWindow("Nuklear Winter '68", @intFromFloat(desktop_w), @intFromFloat(desktop_h), 0);
    renderer = c.SDL_CreateRenderer(window, null);
    defer c.SDL_DestroyRenderer(renderer);
    defer c.SDL_DestroyWindow(window);
    // ] set window and renderer

    // [ store images on surfaces =================================================================
    var stream: ?*c.SDL_IOStream = undefined;

    stream = c.SDL_IOFromFile("img/Map.jpg", "r");
    mapboard_surface = c.IMG_LoadJPG_IO(stream);
    // ] store images on surfaces

    // [ game loop ================================================================================
    main_loop: while (true) {
        var event: c.SDL_Event = undefined;
        while (c.SDL_PollEvent(&event)) {
            switch (event.type) {
                c.SDL_EVENT_KEY_DOWN, c.SDL_EVENT_KEY_UP => {
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
        draw_world();
    }
    // ] game loop
}

// ************************************************************************************************
fn draw_world() void {
    _ = c.SDL_SetRenderDrawColor(renderer, 255, 5, 255, c.SDL_ALPHA_OPAQUE);
    _ = c.SDL_RenderClear(renderer);

    _ = draw_background();

    _ = c.SDL_RenderPresent(renderer);
}

// ------------------------------------------------------------------------------------------------
fn draw_background() void {
    const a_surf: *c.SDL_Surface = c.SDL_CreateSurface(@intFromFloat(desktop_w), @intFromFloat(desktop_h), c.SDL_PIXELFORMAT_RGBA8888);
    defer c.SDL_DestroySurface(a_surf);

    var a_rect: c.SDL_Rect = undefined;
    a_rect.x = 0;
    a_rect.y = 0;
    a_rect.w = @intFromFloat(desktop_w);
    a_rect.h = @intFromFloat(desktop_h);
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
