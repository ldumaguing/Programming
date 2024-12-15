// ***** gamepad.zig
const std = @import("std");
const print = @import("std").debug.print;
const SDL = @cImport({
    @cInclude("SDL2/SDL.h");
    @cInclude("SDL2/SDL_image.h");
    @cInclude("SDL2/SDL_ttf.h");
});

const gv = @import("main.zig").GV;
const inputs = @import("main.zig").Inputs;

pub fn query_gamepad(ev: SDL.SDL_Event) void {
    if (ev.type == SDL.SDL_JOYBUTTONDOWN) {
        // print("......{}\n", .{ev.jbutton.button});
        _ = switch (ev.jbutton.button) {
            0 => gv.gcButtons |= (1 << 0),
            1 => gv.gcButtons |= (1 << 1),
            2 => gv.gcButtons |= (1 << 2),
            3 => gv.gcButtons |= (1 << 3),
            4 => gv.gcButtons |= (1 << 4),
            5 => gv.gcButtons |= (1 << 5),
            6 => gv.gcButtons |= (1 << 6),
            7 => gv.gcButtons |= (1 << 7),
            8 => gv.gcButtons |= (1 << 8),
            9 => gv.gcButtons |= (1 << 9),
            10 => gv.gcButtons |= (1 << 10),
            11 => gv.gcButtons |= (1 << 11),
            12 => gv.gcButtons |= (1 << 12),
            13 => gv.gcButtons |= (1 << 13),
            14 => gv.gcButtons |= (1 << 14),
            else => {},
        };
    }
    if (ev.type == SDL.SDL_JOYBUTTONUP) {
        _ = switch (ev.jbutton.button) {
            0 => gv.gcButtons ^= (1 << 0),
            1 => gv.gcButtons ^= (1 << 1),
            2 => gv.gcButtons ^= (1 << 2),
            3 => gv.gcButtons ^= (1 << 3),
            4 => gv.gcButtons ^= (1 << 4),
            5 => gv.gcButtons ^= (1 << 5),
            6 => gv.gcButtons ^= (1 << 6),
            7 => gv.gcButtons ^= (1 << 7),
            8 => gv.gcButtons ^= (1 << 8),
            9 => gv.gcButtons ^= (1 << 9),
            10 => gv.gcButtons ^= (1 << 10),
            11 => gv.gcButtons ^= (1 << 11),
            12 => gv.gcButtons ^= (1 << 12),
            13 => gv.gcButtons ^= (1 << 13),
            14 => gv.gcButtons ^= (1 << 14),
            else => {},
        };
    }

    if (ev.type == SDL.SDL_JOYAXISMOTION) {
        _ = switch (ev.jaxis.axis) {
            0 => gv.gcAxis_0 = ev.jaxis.value,
            1 => gv.gcAxis_1 = ev.jaxis.value,
            2 => gv.gcAxis_2 = ev.jaxis.value,
            3 => gv.gcAxis_3 = ev.jaxis.value,
            4 => gv.gcAxis_4 = ev.jaxis.value,
            5 => gv.gcAxis_5 = ev.jaxis.value,
            else => {},
        };
    }
    //print("............. {}\n", .{ev.type});
    if (ev.type == SDL.SDL_JOYHATMOTION) {
        // print("bo {}\n", .{ev.jhat.value});
        gv.gcHat = ev.jhat.value;
        //_ = switch (ev.jhat.value) {
        //    1...12 => gv.gcHat = ev.jhat.value,
        //    else => gv.gcHat = 0,
        //};
    }
    reasign_buttons();
}

// **************************************************************************************
fn reasign_buttons() void {
    // print("1 ----{}\n", .{gv.gcAxis_0});
    // print("2 ----{}\n", .{gv.gcAxis_1});
    // print("3 ----{}\n", .{gv.gcAxis_2});
    // print("4 ----{}\n", .{gv.gcAxis_3});
    // print("5 ----{}\n", .{gv.gcAxis_4});
    // print("6 ----{}\n", .{gv.gcAxis_5});

    // ************************************************
    // ***** Logitech Gamepad F310 (X mode)
    // ***** Logitech Gamepad F710 (X mode)
    inputs.shoulder_r = (gv.gcButtons & (1 << 5)) != 0;
    inputs.shoulder_l = (gv.gcButtons & (1 << 4)) != 0;
    inputs.Axis_Lx = gv.gcAxis_0;
    inputs.Axis_Ly = gv.gcAxis_1;
    inputs.Axis_Rx = gv.gcAxis_2;
    inputs.Axis_Ry = gv.gcAxis_3;
    // ***
    inputs.btn_A = (gv.gcButtons & (1 << 0)) != 0;
    inputs.btn_B = (gv.gcButtons & (1 << 1)) != 0;
    inputs.btn_Y = (gv.gcButtons & (1 << 3)) != 0;
    inputs.reset_zoom = (gv.gcButtons & (1 << 6)) != 0;

    // ************************************************
    // ***** ZEROPLUS GAMEPAD4-WIRED
    // ***** Logitech RumblePad 2 USB
    // inputs.btn_A = (gv.gcButtons & (1 << 1)) != 0;
    // inputs.btn_B = (gv.gcButtons & (1 << 2)) != 0;
    // inputs.btn_Y = (gv.gcButtons & (1 << 3)) != 0;
    // inputs.reset_zoom = (gv.gcButtons & (1 << 8)) != 0;
}

pub fn toggle_buttons() void {
    // print("{},{}\n", .{ inputs.shoulder_r, inputs.shoulder_l });
    inputs.reset_zoom = false;
    inputs.shoulder_r = false;
    inputs.shoulder_l = false;
    // inputs.btn_A = false;
}
