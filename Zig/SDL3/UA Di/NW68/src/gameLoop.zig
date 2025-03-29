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

pub fn draw_world() void {
    // _ = c.SDL_RenderTexture(g.renderer, g.mapboard_texture, null, null);
    g.mapboard_sheet.render();
    _ = c.SDL_RenderPresent(g.renderer);
}

pub fn update_world() void {
     if ((g.all_bits & 32) > 0) {
         g.scale_rank += 1;
         g.all_bits ^= 32;
     }
     if ((g.all_bits & 16) > 0) {
         g.scale_rank -= 1;
         g.all_bits ^= 16;
     }
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

     if (g.scale_rank >= 0) {
         g.scale = 1.0 + @as(f32, @floatFromInt(g.scale_rank));
     } else {
         g.scale = 1.0 / (1.0 - @as(f32, @floatFromInt(g.scale_rank)));
     }
}
