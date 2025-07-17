const std = @import("std");
const print = @import("std").debug.print;
const mvzr = @import("mvzr.zig");
const m = @import("main.zig");
const gv = @import("GlobalVariables.zig");

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
pub fn record_events() void {
    if (gv.joystick_type == 0) return;

    // ********** clear bits & d_pad info
    button_bits_old = button_bits;
    button_bits = 0;
    d_pad = 0;

    // ********** set info bits
    for (0..num_buttons) |i| {
        if (c.SDL_GetJoystickButton(@ptrCast(m.joystick), @intCast(i))) { // if buttons are pressed
            //print("button {d}", .{i});
            const val = map_button[i];
            //print(": {d}\n", .{val});
            if (val < 0) continue;
            const bits: u16 = std.math.pow(u16, 2, @as(u16, @intCast(val)));
            button_bits |= bits;
        }
    }

    // ********** set d_pad info
    const hat = c.SDL_GetJoystickHat(@ptrCast(m.joystick), 0);
    if (hat != 0) {
        d_pad = hat;
    }

    // ********** set axis info
    for (0..6) |i| {
        if (map_axis[i] >= 0) {
            const val = c.SDL_GetJoystickAxis(@ptrCast(m.joystick), @intCast(i));
            axis_vals[@abs(map_axis[i])] = val;
        }
    }
}

// ************************************************************************************************
pub fn bind_buttons(aText: [*c]const u8) !void {
    var buffer = [_]u8{0} ** 100;
    _ = try std.fmt.bufPrintZ(&buffer, "{s}\n", .{aText});

    var regex: mvzr.Regex = mvzr.compile("RumblePad").?;
    if (regex.isMatch(&buffer)) {
        gv.joystick_type = 1;
    }

    regex = mvzr.compile("ZEROPLUS").?;
    if (regex.isMatch(&buffer)) {
        gv.joystick_type = 6;
    }

    regex = mvzr.compile("F310").?;
    if (regex.isMatch(&buffer)) {
        gv.joystick_type = 7;
    }

    regex = mvzr.compile("F710").?;
    if (regex.isMatch(&buffer)) {
        gv.joystick_type = 2;
    }

    regex = mvzr.compile("PS4").?;
    if (regex.isMatch(&buffer)) {
        gv.joystick_type = 3;
    }

    regex = mvzr.compile("SWITCH CO").?; // Sega
    if (regex.isMatch(&buffer)) {
        gv.joystick_type = 4;
    }

    regex = mvzr.compile("Xbox One").?;
    if (regex.isMatch(&buffer)) {
        gv.joystick_type = 5;
    }

    _ = try std.fmt.bufPrintZ(&buffer, "{s}\n", .{c.SDL_GetPlatform()});
    regex = mvzr.compile("FreeBSD").?;
    if (regex.isMatch(&buffer)) {
        gv.OS_platform = 1;
    }

    print("-----------> {} -- {}\n", .{ gv.joystick_type, gv.OS_platform });

    // ****************************************************
    // *** joystick signal to bit
    // *** -1: not in use
    if (gv.joystick_type == 1) {
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

    if (gv.joystick_type == 2) {
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

    if (gv.joystick_type == 3) {
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

    if (gv.joystick_type == 4) {
        // ***** Sega
        map_button[0] = 1; // y (up)
        map_button[1] = 3; // B (right)
        map_button[2] = 0; // A (down)
        map_button[3] = 2; // x (left)
        map_button[4] = 4; // sholder left
        map_button[5] = 5; // sholder right
        map_button[6] = 8; // z (left axis)
        map_button[7] = 9; // C (right axis)
        map_button[8] = 7; // center right
        map_button[9] = 10; // center
        map_button[10] = -1;
        map_button[11] = -1;
        map_button[12] = 6; // center left
        map_button[13] = -1;

        map_axis[0] = 0; // d - left & right
        map_axis[1] = 1; // d - up & down
        map_axis[2] = -1; //
        map_axis[3] = -1; //
        map_axis[4] = -1; //
        map_axis[5] = -1; //

    }

    if (gv.joystick_type == 5) {
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

    if (gv.joystick_type == 6) {
        // ***** ZeroPlus (Game:Pad 4 S)
        map_button[0] = 2; // left
        map_button[1] = 0; // down
        map_button[2] = 3; // right
        map_button[3] = 1; // up
        map_button[4] = 4; // left sholder
        map_button[5] = 5; // right sholder
        map_button[6] = -1;
        map_button[7] = -1;
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

    if (gv.joystick_type == 7) {
        // ***** F310
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

        map_axis[0] = 2; // left x
        map_axis[1] = 3; // left y
        map_axis[2] = 0; // left trigger
        map_axis[3] = 4; // right x
        map_axis[4] = 5; // right y
        map_axis[5] = 1; // right trigger
    }
}
