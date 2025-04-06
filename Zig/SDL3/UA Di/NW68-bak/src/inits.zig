const std = @import("std");
const print = @import("std").debug.print;
const mvzr = @import("mvzr.zig");
const g = @import("GameVariables.zig");
// const m = @import("main.zig");
// const texture = @import("texture.zig");
// const Sheet = @import("Sheet.zig");
// const Chit = @import("Chit.zig");

const c = @cImport({
    @cDefine("SDL_DISABLE_OLD_NAMES", {});
    @cInclude("SDL3/SDL.h");
    @cInclude("SDL3/SDL_revision.h");
    @cDefine("SDL_MAIN_HANDLED", {});
    @cInclude("SDL3/SDL_main.h");
    @cInclude("SDL3_image/SDL_image.h");
});

pub fn load_surfaces() void {
    print("yo\n", .{});
    const stream: ?*c.SDL_IOStream = c.SDL_IOFromFile("img/Map.jpg", "r");
    g.mapboard_surface = c.IMG_LoadJPG_IO(stream);
    // g.boardgame_texture = texture.createTextureFromJPG(g.renderer, "img/Map.jpg");
    // g.boardgame_sheet = Sheet.bindTexture2Sheet(0, g.boardgame_texture);

    // g.chit_texture = texture.createTextureFromPNG(g.renderer, "img/red.png");
    // g.chit_1 = Chit.clipTexture4Chit(1, g.chit_texture, 150, 2);
}

pub fn desktop_screen() void {
    g.desktop_dim = @constCast(c.SDL_GetCurrentDisplayMode(1));
    g.window = c.SDL_CreateWindow("Nuklear Winter '68", g.desktop_dim.*.w, g.desktop_dim.*.h, 0);
    // g.window = c.SDL_CreateWindow("Nuklear Winter '68", g.desktop_dim.*.w, g.desktop_dim.*.h, c.SDL_WINDOW_FULLSCREEN);
    g.renderer = c.SDL_CreateRenderer(g.window, null);

    g.window_center_x = @as(f32, @floatFromInt(g.desktop_dim.*.w)) / 2.0;
    g.window_center_y = @as(f32, @floatFromInt(g.desktop_dim.*.h)) / 2.0;
}

// ************************************************************************************************
pub fn define_button_mods(aText: [*c]const u8) !void {
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
    // joystick signal to bit
    // -1: not in use
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
