// ***
const SDL = @cImport({
    @cInclude("SDL2/SDL.h");
    @cInclude("SDL2/SDL_image.h");
    @cInclude("SDL2/SDL_ttf.h");
});
const std = @import("std");
const print = @import("std").debug.print;

const mb = @import("main.zig").MB; // map board
const gv = @import("main.zig").GV; // global variable

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
    const max_x: i32 = gv.SCREEN_DIM[0] - mb.img.w;
    const max_y: i32 = gv.SCREEN_DIM[1] - mb.img.h;
    if (max_x > mb.img.x) mb.img.x = max_x;
    if (max_y > mb.img.y) mb.img.y = max_y;
}
