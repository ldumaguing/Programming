const std = @import("std");
const print = @import("std").debug.print;
const g = @import("GameVariables.zig");

const c = @cImport({
    @cDefine("SDL_DISABLE_OLD_NAMES", {});
    @cInclude("SDL3/SDL.h");
    @cInclude("SDL3/SDL_revision.h");
    @cDefine("SDL_MAIN_HANDLED", {});
    @cInclude("SDL3/SDL_main.h");
    @cInclude("SDL3_image/SDL_image.h");
});

pub fn drawStuff() void {
    // _ = c.SDL_RenderClear(g.renderer);
    // _ = c.SDL_SetRenderDrawColor(g.renderer, 5, 5, 5, c.SDL_ALPHA_OPAQUE);

    // g.boardgame_sheet.render(g.renderer);
    // g.chit_1.render(g.renderer);

    // _ = c.SDL_RenderLine(g.renderer, 0, 0, g.WINDOW_WIDTH, g.WINDOW_HEIGHT);
    // _ = c.SDL_RenderLine(g.renderer, 0, g.WINDOW_HEIGHT, g.WINDOW_WIDTH, 0);

    // _ = c.SDL_RenderPresent(g.renderer);
}

pub fn updateStuff() void {
    if ((g.all_bits & 32) > 0) {
        g.scale += 1;
        g.all_bits ^= 32;
    }
    if ((g.all_bits & 16) > 0) {
        g.scale -= 1;
        g.all_bits ^= 16;
    }
    // if ((g.all_dpad & 1) > 0) {
    //     g.boardgame_sheet.loc_y += 10;
    // }
    // if ((g.all_dpad & 2) > 0) {
    //     g.boardgame_sheet.loc_x -= 10;
    // }
    // if ((g.all_dpad & 4) > 0) {
    //     g.boardgame_sheet.loc_y -= 10;
    // }
    // if ((g.all_dpad & 8) > 0) {
    //     g.boardgame_sheet.loc_x += 10;
    // }

    if (g.scale >= 0) {
        g.scale_mult = 1.0 + @as(f32, @floatFromInt(g.scale));
    } else {
        g.scale_mult = 1.0 / (1.0 - @as(f32, @floatFromInt(g.scale)));
    }
}
