// ***** PHASE_game.zig
const SDL = @cImport({
    @cInclude("SDL2/SDL.h");
    @cInclude("SDL2/SDL_image.h");
    @cInclude("SDL2/SDL_ttf.h");
});
const std = @import("std");
const print = @import("std").debug.print;

const mb = @import("main.zig").MB; // map board
const gv = @import("main.zig").GV; // global variable
const inputs = @import("main.zig").Inputs;

var cursorSpeed: i32 = 0;

pub fn update() void {
    if (inputs.btn_B) {
        cursorSpeed = 1;
    } else {
        cursorSpeed = 10;
    }
    switch (gv.gcHat) {
        1 => mb.arrow.y -= cursorSpeed,
        2 => mb.arrow.x += cursorSpeed,
        4 => mb.arrow.y += cursorSpeed,
        8 => mb.arrow.x -= cursorSpeed,
        3 => {
            mb.arrow.y -= cursorSpeed;
            mb.arrow.x += cursorSpeed;
        },
        6 => {
            mb.arrow.x += cursorSpeed;
            mb.arrow.y += cursorSpeed;
        },
        12 => {
            mb.arrow.x -= cursorSpeed;
            mb.arrow.y += cursorSpeed;
        },
        9 => {
            mb.arrow.y -= cursorSpeed;
            mb.arrow.x -= cursorSpeed;
        },
        else => {},
    }

    // ***** scaling
    if (inputs.shoulder_r) mb.scale += 0.05;
    if (inputs.shoulder_l) mb.scale -= 0.05;
    if (mb.scale < 0.05) mb.scale = 0.05; // limiting zoom out
    if (inputs.reset_zoom) mb.scale = 1.0;

    var scaled_W: i32 = @intFromFloat(@as(f64, @floatFromInt(mb.map_image.w)) * mb.scale);
    var scaled_H: i32 = @intFromFloat(@as(f64, @floatFromInt(mb.map_image.h)) * mb.scale);

    if (gv.SCREEN_DIM[0] > scaled_W) { // prevent shrinking map too much
        mb.scale += 0.05;
        scaled_W = @intFromFloat(@as(f64, @floatFromInt(mb.map_image.w)) * mb.scale);
        scaled_H = @intFromFloat(@as(f64, @floatFromInt(mb.map_image.h)) * mb.scale);
    }
    // print("{} --- {}\n", .{ gv.SCREEN_DIM[0], scaled_W });

    // ***** arrow
    if (mb.arrow.x < 0) {
        mb.arrow.x = 0;
        mb.map_image.x += cursorSpeed;
    }
    if (mb.arrow.y < 0) {
        mb.arrow.y = 0;
        mb.map_image.y += cursorSpeed;
    }
    if (mb.arrow.x > gv.SCREEN_DIM[0] - 5) {
        mb.arrow.x = gv.SCREEN_DIM[0] - 5;
        mb.map_image.x -= cursorSpeed;
    }
    if (mb.arrow.y > gv.SCREEN_DIM[1] - 5) {
        mb.arrow.y = gv.SCREEN_DIM[1] - 5;
        mb.map_image.y -= cursorSpeed;
    }

    // ***** Axis
    if (inputs.Axis_Lx < -15000) mb.map_image.x += cursorSpeed;
    if (inputs.Axis_Lx > 15000) mb.map_image.x -= cursorSpeed;
    if (inputs.Axis_Ly < -15000) mb.map_image.y += cursorSpeed;
    if (inputs.Axis_Ly > 15000) mb.map_image.y -= cursorSpeed;

    // ***** corrections
    if (mb.map_image.x > 0) mb.map_image.x = 0;
    if (mb.map_image.y > 0) mb.map_image.y = 0;
    const max_w: i32 = gv.SCREEN_DIM[0] - scaled_W;
    const max_h: i32 = gv.SCREEN_DIM[1] - scaled_H;
    if (max_w > mb.map_image.x) mb.map_image.x = max_w;
    if (max_h > mb.map_image.y) mb.map_image.y = max_h;
}
