const std = @import("std");
const print = @import("std").debug.print;
const m = @import("main.zig");
const g = @import("GameVariables.zig");

const c = @cImport({
    @cDefine("SDL_DISABLE_OLD_NAMES", {});
    @cInclude("SDL3/SDL.h");
    @cInclude("SDL3/SDL_revision.h");
    @cDefine("SDL_MAIN_HANDLED", {});
    @cInclude("SDL3/SDL_main.h");
    @cInclude("SDL3_image/SDL_image.h");
});

pub fn draw_Screen() void {
    // _ = c.SDL_RenderTexture(g.renderer, g.mapboard_texture, null, null);
    g.mapboard_sheet.render();
    _ = c.SDL_RenderPresent(g.renderer);
}

pub fn AppUpdate() void {
    // if ((m.all_bits & 32) > 0) {
    //     m.gScale += 1;
    //     m.all_bits ^= 32;
    // }
    // if ((m.all_bits & 16) > 0) {
    //     m.gScale -= 1;
    //     m.all_bits ^= 16;
    // }
    // if ((m.all_dpad & 1) > 0) {
    //     m.boardgame_sheet.loc_y += 10;
    // }
    // if ((m.all_dpad & 2) > 0) {
    //     m.boardgame_sheet.loc_x -= 10;
    // }
    // if ((m.all_dpad & 4) > 0) {
    //     m.boardgame_sheet.loc_y -= 10;
    // }
    // if ((m.all_dpad & 8) > 0) {
    //     m.boardgame_sheet.loc_x += 10;
    // }

    // if (m.gScale >= 0) {
    //     m.gScale_mult = 1.0 + @as(f32, @floatFromInt(m.gScale));
    // } else {
    //     m.gScale_mult = 1.0 / (1.0 - @as(f32, @floatFromInt(m.gScale)));
    // }
}
