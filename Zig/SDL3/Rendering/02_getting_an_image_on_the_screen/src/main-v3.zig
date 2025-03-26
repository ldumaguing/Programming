const std = @import("std");

pub const std_options: std.Options = .{
    .log_level = .debug,
};

const c = @cImport({
    @cDefine("SDL_DISABLE_OLD_NAMES", {});
    @cInclude("SDL3/SDL.h");
    @cInclude("SDL3/SDL_revision.h");
    @cDefine("SDL_MAIN_HANDLED", {});
    @cInclude("SDL3/SDL_main.h");
});

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

    try errify(c.SDL_Init(c.SDL_INIT_VIDEO | c.SDL_INIT_AUDIO));
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

    const window_w = 640;
    const window_h = 480;
    errify(c.SDL_SetHint(c.SDL_HINT_RENDER_VSYNC, "1")) catch {};

    // const window: *c.SDL_Window, const renderer: *c.SDL_Renderer = create_window_and_renderer: {
    //     var window: ?*c.SDL_Window = null;
    //     var renderer: ?*c.SDL_Renderer = null;
    //     try errify(c.SDL_CreateWindowAndRenderer("01_hello", window_w, window_h, 0, &window, &renderer));
    //     errdefer comptime unreachable;

    //     break :create_window_and_renderer .{ window.?, renderer.? };
    // };
    // defer c.SDL_DestroyRenderer(renderer);
    // defer c.SDL_DestroyWindow(window);

    const window = try errify(c.SDL_CreateWindow("02_getting_an_image_on_the_screen", window_w, window_h, c.SDL_EVENT_WINDOW_SHOWN));
    defer c.SDL_DestroyWindow(window);

    var renderer: ?*c.SDL_Renderer = undefined;
    defer c.SDL_DestroyRenderer(renderer);
    renderer = c.SDL_CreateRenderer(window, null);

    //const win_surf = c.SDL_GetWindowSurface(window);
    //defer c.SDL_DestroySurface(win_surf);

    const bmp = @embedFile("hello_world.bmp");
    const stream: *c.SDL_IOStream = try errify(c.SDL_IOFromConstMem(bmp, bmp.len));
    const hello_surf: *c.SDL_Surface = try errify(c.SDL_LoadBMP_IO(stream, true));
    defer c.SDL_DestroySurface(hello_surf);

    const hello_texture = c.SDL_CreateTextureFromSurface(renderer, hello_surf);

    main_loop: while (true) {
        var event: c.SDL_Event = undefined;
        while (c.SDL_PollEvent(&event)) {
            switch (event.type) {
                c.SDL_EVENT_QUIT => {
                    break :main_loop;
                },
                else => {},
            }
        }

        _ = c.SDL_CreateTextureFromSurface(renderer, hello_surf);
        _ = c.SDL_RenderTexture(renderer, hello_texture, null, null);
        _ = c.SDL_RenderPresent(renderer);
        // try errify(c.SDL_BlitSurface(hello_surf, null, win_surf, null));
        // try errify(c.SDL_UpdateWindowSurface(window));
    }
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
inline fn errify(value: anytype) error{SdlError}!switch (@import("shims").typeInfo(@TypeOf(value))) {
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
