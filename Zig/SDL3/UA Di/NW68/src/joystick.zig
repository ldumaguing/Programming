const std = @import("std");
const print = @import("std").debug.print;
const mvzr = @import("mvzr.zig");
const m = @import("main.zig");

const c = @cImport({
    @cDefine("SDL_DISABLE_OLD_NAMES", {});
    @cInclude("SDL3/SDL.h");
    @cInclude("SDL3/SDL_revision.h");
    @cDefine("SDL_MAIN_HANDLED", {});
    @cInclude("SDL3/SDL_main.h");
    @cInclude("SDL3_image/SDL_image.h");
});

// ************************************************************************************************
pub fn bind_buttons(aText: [*c]const u8) !void {
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

    print("-----------> {}", .{joystick_type});

    // ****************************************************
    // *** joystick signal to bit
    // *** -1: not in use
    if (joystick_type == 1) {
        // ***** Logi-D and Snake W
        m.map_button[0] = 2;
        m.map_button[1] = 0;
        m.map_button[2] = 3;
        m.map_button[3] = 1;
        m.map_button[4] = 4;
        m.map_button[5] = 5;
        m.map_button[6] = 11;
        m.map_button[7] = 12;
        m.map_button[8] = 6;
        m.map_button[9] = 7;
        m.map_button[10] = 8;
        m.map_button[11] = 9;
        m.map_button[12] = 10;
        m.map_button[13] = -1;
    }

    if (joystick_type == 2) {
        // ***** Logi-X and 8BitDo
        m.map_button[0] = 0;
        m.map_button[1] = 3;
        m.map_button[2] = 2;
        m.map_button[3] = 1;
        m.map_button[4] = 4;
        m.map_button[5] = 5;
        m.map_button[6] = 6;
        m.map_button[7] = 7;
        m.map_button[8] = 10;
        m.map_button[9] = 8;
        m.map_button[10] = 9;
        m.map_button[11] = -1;
        m.map_button[12] = -1;
        m.map_button[13] = -1;
    }

    if (joystick_type == 3) {
        // ***** Snake (wireless version)
        m.map_button[0] = 0;
        m.map_button[1] = 3;
        m.map_button[2] = 2;
        m.map_button[3] = 1;
        m.map_button[4] = 6;
        m.map_button[5] = 10;
        m.map_button[6] = 7;
        m.map_button[7] = 8;
        m.map_button[8] = 9;
        m.map_button[9] = 4;
        m.map_button[10] = 5;
        m.map_button[11] = -1;
        m.map_button[12] = -1;
        m.map_button[13] = -1;
    }

    if (joystick_type == 4) {
        // ***** Sega
        m.map_button[0] = 2;
        m.map_button[1] = 0;
        m.map_button[2] = 3;
        m.map_button[3] = 1;
        m.map_button[4] = 9;
        m.map_button[5] = 8;
        m.map_button[6] = 4;
        m.map_button[7] = 5;
        m.map_button[8] = 7;
        m.map_button[9] = 10;
        m.map_button[10] = -1;
        m.map_button[11] = -1;
        m.map_button[12] = -1;
        m.map_button[13] = -1;
    }
}
