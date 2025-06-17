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
// *************** Joystick states
pub var button_bits: u16 = 0;
pub var button_bits_old: u16 = 0;
pub var d_pad: u16 = 0;
pub var map_button = [_]i32{0} ** 14;
pub var map_axis = [_]i32{0} ** 6;
pub var axis_vals = [_]i32{0} ** 6;
pub var num_buttons: u32 = 0;

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
        joystick_type = 6;
    }

    regex = mvzr.compile("F710").?;
    if (regex.isMatch(&buffer)) {
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

    regex = mvzr.compile("Xbox One").?;
    if (regex.isMatch(&buffer)) {
        joystick_type = 5;
    }

    print("-----------> {}\n", .{joystick_type});

    // ****************************************************
    // *** joystick signal to bit
    // *** -1: not in use
    if (joystick_type == 1) {
        // ***** RumblePad
        map_button[0] = 1;
        map_button[1] = 3;
        map_button[2] = 0;
        map_button[3] = 2;
        map_button[4] = 4;
        map_button[5] = 5;
        map_button[6] = 8;
        map_button[7] = 9;
        map_button[8] = 10;
        map_button[9] = 11;
        map_button[10] = -1;
        map_button[11] = 6;
        map_button[12] = 7;
        map_button[13] = -1;

        map_axis[0] = -1;
        map_axis[1] = -1;
        map_axis[2] = 0;
        map_axis[3] = 1;
        map_axis[4] = 2;
        map_axis[5] = 3;
    }

    if (joystick_type == 2) {
        // ***** Logi-X
        map_button[0] = 0;
        map_button[1] = 3;
        map_button[2] = 2;
        map_button[3] = 1;
        map_button[4] = 4;
        map_button[5] = 5;
        map_button[6] = 6;
        map_button[7] = 7;
        map_button[8] = 10;
        map_button[9] = 8;
        map_button[10] = 9;
        map_button[11] = -1;
        map_button[12] = -1;
        map_button[13] = -1;
    }

    if (joystick_type == 3) {
        // ***** Snake (wireless version)
        map_button[0] = 0;
        map_button[1] = 3;
        map_button[2] = 2;
        map_button[3] = 1;
        map_button[4] = 6;
        map_button[5] = 10;
        map_button[6] = 7;
        map_button[7] = 8;
        map_button[8] = 9;
        map_button[9] = 4;
        map_button[10] = 5;
        map_button[11] = -1;
        map_button[12] = -1;
        map_button[13] = -1;
    }

    if (joystick_type == 4) {
        // ***** Sega
        map_button[0] = 2;
        map_button[1] = 0;
        map_button[2] = 3;
        map_button[3] = 1;
        map_button[4] = 9;
        map_button[5] = 8;
        map_button[6] = 4;
        map_button[7] = 5;
        map_button[8] = 7;
        map_button[9] = 10;
        map_button[10] = -1;
        map_button[11] = -1;
        map_button[12] = -1;
        map_button[13] = -1;
    }

    if (joystick_type == 5) {
        // ***** Xbox One
        map_button[0] = 0;
        map_button[1] = 3;
        map_button[2] = 2;
        map_button[3] = 1;
        map_button[4] = 4;
        map_button[5] = 5;
        map_button[6] = 6;
        map_button[7] = 7;
        map_button[8] = -1;
        map_button[9] = -1;
        map_button[10] = 10;
        map_button[11] = -1;
        map_button[12] = -1;
        map_button[13] = -1;
    }

    if (joystick_type == 6) {
        // ***** ZeroPlus (Game:Pad 4 S)
        map_button[0] = 1;
        map_button[1] = 3;
        map_button[2] = 0;
        map_button[3] = 2;
        map_button[4] = 4;
        map_button[5] = 5;
        map_button[6] = 8;
        map_button[7] = 9;
        map_button[8] = 10;
        map_button[9] = 11;
        map_button[10] = 12;
        map_button[11] = 6;
        map_button[12] = 7;
        map_button[13] = -1;

        map_axis[0] = 3;
        map_axis[1] = 4;
        map_axis[2] = 0;
        map_axis[3] = 1;
        map_axis[4] = 2;
        map_axis[5] = 5;
    }
}
