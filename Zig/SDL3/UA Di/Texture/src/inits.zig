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

const m = @import("main.zig");
const texture = @import("texture.zig");
const Sheet = @import("Sheet.zig");
const Tile = @import("Tile.zig");

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
        m.button_mods[0] = 2;
        m.button_mods[1] = 0;
        m.button_mods[2] = 3;
        m.button_mods[3] = 1;
        m.button_mods[4] = 4;
        m.button_mods[5] = 5;
        m.button_mods[6] = 11;
        m.button_mods[7] = 12;
        m.button_mods[8] = 6;
        m.button_mods[9] = 7;
        m.button_mods[10] = 8;
        m.button_mods[11] = 9;
        m.button_mods[12] = 10;
        m.button_mods[13] = -1;
    }

    if (joystick_type == 2) {
        // ***** Logi-X and 8BitDo
        m.button_mods[0] = 0;
        m.button_mods[1] = 3;
        m.button_mods[2] = 2;
        m.button_mods[3] = 1;
        m.button_mods[4] = 4;
        m.button_mods[5] = 5;
        m.button_mods[6] = 6;
        m.button_mods[7] = 7;
        m.button_mods[8] = 10;
        m.button_mods[9] = 8;
        m.button_mods[10] = 9;
        m.button_mods[11] = -1;
        m.button_mods[12] = -1;
        m.button_mods[13] = -1;
    }

    if (joystick_type == 3) {
        // ***** Snake (wireless version)
        m.button_mods[0] = 0;
        m.button_mods[1] = 3;
        m.button_mods[2] = 2;
        m.button_mods[3] = 1;
        m.button_mods[4] = 6;
        m.button_mods[5] = 10;
        m.button_mods[6] = 7;
        m.button_mods[7] = 8;
        m.button_mods[8] = 9;
        m.button_mods[9] = 4;
        m.button_mods[10] = 5;
        m.button_mods[11] = -1;
        m.button_mods[12] = -1;
        m.button_mods[13] = -1;
    }

    if (joystick_type == 4) {
        // ***** Sega
        m.button_mods[0] = 2;
        m.button_mods[1] = 0;
        m.button_mods[2] = 3;
        m.button_mods[3] = 1;
        m.button_mods[4] = 9;
        m.button_mods[5] = 8;
        m.button_mods[6] = 4;
        m.button_mods[7] = 5;
        m.button_mods[8] = 7;
        m.button_mods[9] = 10;
        m.button_mods[10] = -1;
        m.button_mods[11] = -1;
        m.button_mods[12] = -1;
        m.button_mods[13] = -1;
    }
}

pub fn load_images() void {
    m.a_texture = texture.createTextureFromPNG(m.renderer, "img/dots.png");
    m.a_sheet = Sheet.bindTexture2Sheet(0, m.a_texture);

    m.redDot = Tile.bindClippage2Tile(1, m.a_texture, .{ .x = 0.0, .y = 0.0, .h = 100.0, .w = 100.0 });
}
