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

    regex = mvzr.compile("F310").?;
    if (regex.isMatch(&buffer)) {
        joystick_type = 7;
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
        // ***** RumblePad 2 USB
        map_button[0] = 2; // left
        map_button[1] = 0; // down
        map_button[2] = 3; // right
        map_button[3] = 1; // up
        map_button[4] = 4; // left sholder
        map_button[5] = 5; // right sholder
        map_button[6] = 11; // left trigger
        map_button[7] = 12; // right trigger
        map_button[8] = 6; // left center
        map_button[9] = 7; // right center
        map_button[10] = 8; // left axis
        map_button[11] = 9; // right axis
        map_button[12] = -1;
        map_button[13] = -1;

        map_axis[0] = 2; // left X
        map_axis[1] = 3; // left Y
        map_axis[2] = 4; // right X
        map_axis[3] = 5; // right Y
        map_axis[4] = -1;
        map_axis[5] = -1;
    }

    if (joystick_type == 2) {
        // ***** F710
        map_button[0] = 0; // down
        map_button[1] = 3; // right
        map_button[2] = 2; // left
        map_button[3] = 1; // up
        map_button[4] = 4; // left sholder
        map_button[5] = 5; // right sholder
        map_button[6] = 6; // center left
        map_button[7] = 7; // center right
        map_button[8] = 10; // center
        map_button[9] = 8; // left axis
        map_button[10] = 9; // right axis
        map_button[11] = -1;
        map_button[12] = -1;
        map_button[13] = -1;

        map_axis[0] = 2; // left X
        map_axis[1] = 3; // left Y
        map_axis[2] = 0; // left trigger
        map_axis[3] = 4; // right X
        map_axis[4] = 5; // right Y
        map_axis[5] = 1; // right trigger
    }

    if (joystick_type == 3) {
        // ***** PS4
        map_button[0] = 0; // down
        map_button[1] = 3; // right
        map_button[2] = 2; // left
        map_button[3] = 1; // up
        map_button[4] = 6; // center left
        map_button[5] = 10; // center
        map_button[6] = 7; // center right
        map_button[7] = 8; // axis left
        map_button[8] = 9; // axis right
        map_button[9] = 4; // left sholder
        map_button[10] = 5; // right sholder
        map_button[11] = 13; // touch pad
        map_button[12] = -1;
        map_button[13] = -1;

        map_axis[0] = 2; // left x
        map_axis[1] = 3; // left y
        map_axis[2] = 4; // right x
        map_axis[3] = 5; // right y
        map_axis[4] = 0; // left trigger
        map_axis[5] = 1; // right trigger
    }

    if (joystick_type == 4) {
        // ***** Sega
        map_button[0] = 2; // left - x
        map_button[1] = 0; // down - A
        map_button[2] = 3; // right - B
        map_button[3] = 1; // up - y
        map_button[4] = 9; // axis R - C
        map_button[5] = 8; // axis L - z
        map_button[6] = 4; // left sholder
        map_button[7] = 5; // right sholder
        map_button[8] = 7; // center right
        map_button[9] = 10; // center
        map_button[10] = -1;
        map_button[11] = -1;
        map_button[12] = -1;
        map_button[13] = -1;
        
        
        map_axis[0] = 2; // left x
        map_axis[1] = 3; // left y
        map_axis[2] = -1; // 
        map_axis[3] = -1; // 
        map_axis[4] = -1; // 
        map_axis[5] = -1; // 
        
        
    }

    if (joystick_type == 5) {
        // ***** Xbox One
        map_button[0] = 0; // down
        map_button[1] = 3; // right
        map_button[2] = 2; // left
        map_button[3] = 1; // up
        map_button[4] = 4; // sholder L
        map_button[5] = 5; // sholder R
        map_button[6] = 6; // center left
        map_button[7] = 7; // center right
        map_button[8] = 9; // left axis
        map_button[9] = 4; // right axis
        map_button[10] = 10; // heart (center)
        map_button[11] = -1; //
        map_button[12] = -1;
        map_button[13] = -1;

        map_axis[0] = 2; // left X
        map_axis[1] = 3; // left Y
        map_axis[2] = 0; // left trigger
        map_axis[3] = 4; // right X
        map_axis[4] = 5; // right Y
        map_axis[5] = 1; // right trigger
    }

    if (joystick_type == 6) {
        // ***** ZeroPlus (Game:Pad 4 S)
        map_button[0] = 2; // left
        map_button[1] = 0; // down
        map_button[2] = 3; // right
        map_button[3] = 1; // up
        map_button[4] = 4; // left sholder
        map_button[5] = 5; // right sholder
        map_button[6] = 11; // left trigger
        map_button[7] = 12; // right trigger
        map_button[8] = 6; // center left
        map_button[9] = 7; // center right
        map_button[10] = 8; // left axis
        map_button[11] = 9; // right axis
        map_button[12] = 10; // center
        map_button[13] = -1; //

        map_axis[0] = 2; // left x
        map_axis[1] = 3; // left y
        map_axis[2] = 4; // right x
        map_axis[3] = 0; // left trigger
        map_axis[4] = 1; // right trigger
        map_axis[5] = 5; // right Y
    }

    if (joystick_type == 7) {
        // ***** F310
        map_button[0] = 0;
        map_button[1] = 3;
        map_button[2] = 2;
        map_button[3] = 1;
        map_button[4] = 4;
        map_button[5] = 5;
        map_button[6] = 6;
        map_button[7] = 7;
        map_button[8] = 9;
        map_button[9] = 10;
        map_button[10] = 8;
        map_button[11] = -1;
        map_button[12] = -1;
        map_button[13] = -1;

        map_axis[0] = 2;
        map_axis[1] = 5;
        map_axis[2] = 0;
        map_axis[3] = 1;
        map_axis[4] = 3;
        map_axis[5] = 4;
    }
}
