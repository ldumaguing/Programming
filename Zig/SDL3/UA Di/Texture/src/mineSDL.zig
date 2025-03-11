const std = @import("std");
const print = @import("std").debug.print;
const m = @import("main.zig");

const c = @cImport({
    @cDefine("SDL_DISABLE_OLD_NAMES", {});
    @cInclude("SDL3/SDL.h");
    @cInclude("SDL3/SDL_revision.h");
    @cDefine("SDL_MAIN_HANDLED", {});
    @cInclude("SDL3/SDL_main.h");
    @cInclude("SDL3_image/SDL_image.h");
});

pub fn AppIterate() void {
    _ = c.SDL_RenderClear(m.renderer);

    m.a_sheet.render(m.renderer);

    m.redDot.render(m.renderer);

    _ = c.SDL_RenderPresent(m.renderer);
}

pub fn AppUpdate() void {
    if ((m.all_bits & 32) > 0) {
        m.gScale += 1;
        m.all_bits ^= 32;
    }
    if ((m.all_bits & 16) > 0) {
        m.gScale -= 1;
        m.all_bits ^= 16;
    }
    if ((m.all_dpad & 1) > 0) {
        m.a_sheet.loc_y += 10;
    }
    if ((m.all_dpad & 2) > 0) {
        m.a_sheet.loc_x -= 10;
    }
    if ((m.all_dpad & 4) > 0) {
        m.a_sheet.loc_y -= 10;
    }
    if ((m.all_dpad & 8) > 0) {
        m.a_sheet.loc_x += 10;
    }
}
