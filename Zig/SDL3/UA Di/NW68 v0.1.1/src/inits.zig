const std = @import("std");
const print = @import("std").debug.print;
const mvzr = @import("mvzr.zig");
const g = @import("GameVariables.zig");

const c = @cImport({
    @cDefine("SDL_DISABLE_OLD_NAMES", {});
    @cInclude("SDL3/SDL.h");
    @cInclude("SDL3/SDL_revision.h");
    @cDefine("SDL_MAIN_HANDLED", {});
    @cInclude("SDL3/SDL_main.h");
    @cInclude("SDL3_image/SDL_image.h");
});
pub fn mapboard() void {
    const LOWER_RIGHT = [_]i32{ 5020, 3846 };
    g.Hex_Dim[0] = @as(f64, @floatFromInt((LOWER_RIGHT[0] - g.ZERO_ZERO[0]))) / 28.0;
    g.Hex_Dim[1] = @as(f64, @floatFromInt((LOWER_RIGHT[1] - g.ZERO_ZERO[1]))) / 19.0;
    g.Half_Hex_Y = @floatCast(g.Hex_Dim[1] / 2.0);
}

pub fn load_surfaces() void {
    // print("yo\n", .{});
    var stream: ?*c.SDL_IOStream = undefined;

    stream = c.SDL_IOFromFile("img/Map.jpg", "r");
    g.mapboard_surface = c.IMG_LoadJPG_IO(stream);

    stream = c.SDL_IOFromFile("img2/NW68-chits.png", "r");
    g.chits_surface = c.IMG_LoadPNG_IO(stream);

    stream = c.SDL_IOFromFile("img2/arrow.png", "r");
    g.arrow_surface = c.IMG_LoadPNG_IO(stream);
}

pub fn desktop_screen() void {
    // const dimention = c.SDL_GetCurrentDisplayMode(c.SDL_GetPrimaryDisplay());
    // g.desktop_w = @as(f32, @floatFromInt(dimention.*.w));
    // g.desktop_h = @as(f32, @floatFromInt(dimention.*.h));
    // g.desktop_w = 1280; // High Definition (HD)
    // g.desktop_h = 720;
    // g.desktop_w = 960; // anbernic.com
    // g.desktop_h = 720;
    g.desktop_w = 720; // anbernic.com
    g.desktop_h = 720;
    // g.window = c.SDL_CreateWindow("Nuklear Winter '68", @intFromFloat(g.desktop_w), @intFromFloat(g.desktop_h), c.SDL_WINDOW_BORDERLESS);
    g.window = c.SDL_CreateWindow("Nuklear Winter '68", @intFromFloat(g.desktop_w), @intFromFloat(g.desktop_h), 0);
    // g.window = c.SDL_CreateWindow("Nuklear Winter '68", @intFromFloat(g.desktop_w), @intFromFloat(g.desktop_h), c.SDL_WINDOW_FULLSCREEN);
    g.renderer = c.SDL_CreateRenderer(g.window, null);

    g.window_center_x = g.desktop_w / 2.0;
    g.window_center_y = g.desktop_h / 2.0;

    const cursor = c.SDL_CreateColorCursor(g.arrow_surface, 1, 1);
    _ = c.SDL_SetCursor(cursor);
}

// ************************************************************************************************
pub fn define_button_mods(aText: [*c]const u8) !void {
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
    // *** joystick signal to bit
    // *** -1: not in use
    if (joystick_type == 1) {
        // ***** Logi-D and Snake W
        g.button_mods[0] = 2;
        g.button_mods[1] = 0;
        g.button_mods[2] = 3;
        g.button_mods[3] = 1;
        g.button_mods[4] = 4;
        g.button_mods[5] = 5;
        g.button_mods[6] = 11;
        g.button_mods[7] = 12;
        g.button_mods[8] = 6;
        g.button_mods[9] = 7;
        g.button_mods[10] = 8;
        g.button_mods[11] = 9;
        g.button_mods[12] = 10;
        g.button_mods[13] = -1;
    }

    if (joystick_type == 2) {
        // ***** Logi-X and 8BitDo
        g.button_mods[0] = 0;
        g.button_mods[1] = 3;
        g.button_mods[2] = 2;
        g.button_mods[3] = 1;
        g.button_mods[4] = 4;
        g.button_mods[5] = 5;
        g.button_mods[6] = 6;
        g.button_mods[7] = 7;
        g.button_mods[8] = 10;
        g.button_mods[9] = 8;
        g.button_mods[10] = 9;
        g.button_mods[11] = -1;
        g.button_mods[12] = -1;
        g.button_mods[13] = -1;
    }

    if (joystick_type == 3) {
        // ***** Snake (wireless version)
        g.button_mods[0] = 0;
        g.button_mods[1] = 3;
        g.button_mods[2] = 2;
        g.button_mods[3] = 1;
        g.button_mods[4] = 6;
        g.button_mods[5] = 10;
        g.button_mods[6] = 7;
        g.button_mods[7] = 8;
        g.button_mods[8] = 9;
        g.button_mods[9] = 4;
        g.button_mods[10] = 5;
        g.button_mods[11] = -1;
        g.button_mods[12] = -1;
        g.button_mods[13] = -1;
    }

    if (joystick_type == 4) {
        // ***** Sega
        g.button_mods[0] = 2;
        g.button_mods[1] = 0;
        g.button_mods[2] = 3;
        g.button_mods[3] = 1;
        g.button_mods[4] = 9;
        g.button_mods[5] = 8;
        g.button_mods[6] = 4;
        g.button_mods[7] = 5;
        g.button_mods[8] = 7;
        g.button_mods[9] = 10;
        g.button_mods[10] = -1;
        g.button_mods[11] = -1;
        g.button_mods[12] = -1;
        g.button_mods[13] = -1;
    }
}
