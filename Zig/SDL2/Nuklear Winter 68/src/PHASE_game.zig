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

pub fn update() void {
    switch (gv.gcHat) {
        1 => mb.arrow.y -= 1,
        2 => mb.arrow.x += 1,
        4 => mb.arrow.y += 1,
        8 => mb.arrow.x -= 1,
        3 => {
            mb.arrow.y -= 1;
            mb.arrow.x += 1;
        },
        6 => {
            mb.arrow.x += 1;
            mb.arrow.y += 1;
        },
        12 => {
            mb.arrow.x -= 1;
            mb.arrow.y += 1;
        },
        9 => {
            mb.arrow.y -= 1;
            mb.arrow.x -= 1;
        },
        else => {},
    }

    // ***** scaling
    if (inputs.shoulder_r) mb.scale += 0.1;
    if (inputs.shoulder_l) mb.scale -= 0.1;
    if (mb.scale < 0.1) mb.scale = 0.1;

    var scaled_W: i32 = @intFromFloat(@as(f64, @floatFromInt(mb.img.w)) * mb.scale);
    var scaled_H: i32 = @intFromFloat(@as(f64, @floatFromInt(mb.img.h)) * mb.scale);

    if (gv.SCREEN_DIM[0] > scaled_W) {
        mb.scale += 0.1;
        scaled_W = @intFromFloat(@as(f64, @floatFromInt(mb.img.w)) * mb.scale);
        scaled_H = @intFromFloat(@as(f64, @floatFromInt(mb.img.h)) * mb.scale);
    }
    print("{} --- {}\n", .{ gv.SCREEN_DIM[0], scaled_W });

    // ***** arrow
    if (mb.arrow.x < 0) {
        mb.arrow.x = 0;
        mb.img.x += 1;
    }
    if (mb.arrow.y < 0) {
        mb.arrow.y = 0;
        mb.img.y += 1;
    }
    if (mb.arrow.x > gv.SCREEN_DIM[0] - 5) {
        mb.arrow.x = gv.SCREEN_DIM[0] - 5;
        mb.img.x -= 1;
    }
    if (mb.arrow.y > gv.SCREEN_DIM[1] - 5) {
        mb.arrow.y = gv.SCREEN_DIM[1] - 5;
        mb.img.y -= 1;
    }
    if (mb.img.x > 0) mb.img.x = 0;
    if (mb.img.y > 0) mb.img.y = 0;
    const max_w: i32 = gv.SCREEN_DIM[0] - scaled_W;
    const max_h: i32 = gv.SCREEN_DIM[1] - scaled_H;
    if (max_w > mb.img.x) mb.img.x = max_w;
    if (max_h > mb.img.y) mb.img.y = max_h;
}
