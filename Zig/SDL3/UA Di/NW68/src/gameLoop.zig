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
    _ = c.SDL_SetRenderDrawColor(g.renderer, 5, 5, 5, c.SDL_ALPHA_OPAQUE);
    _ = c.SDL_RenderClear(g.renderer);

    g.mapboard_sheet.render(); // the map is a good reference.

    g.aSprite.render();

    const W: f32 = g.desktop_w;
    const H: f32 = g.desktop_h;
    _ = c.SDL_RenderLine(g.renderer, 0, 0, W, H);
    _ = c.SDL_RenderLine(g.renderer, 0, H, W, 0);

    _ = c.SDL_RenderPresent(g.renderer);
}

pub fn update_world() void {
    // ****************************** Global scale
    // *** update rank
    if ((g.all_bits & 32) > 0) {
        g.scale_rank += 1;
        g.all_bits ^= 32;
    }
    if ((g.all_bits & 16) > 0) {
        g.scale_rank -= 1;
        g.all_bits ^= 16;
    }
    // *** define scale rank
    if (g.scale_rank != g.scale_rank_prev) {}
    if (g.scale_rank >= 0) {
        g.scale = 1.0 + @as(f32, @floatFromInt(g.scale_rank));
    } else {
        g.scale = 1.0 / (1.0 - @as(f32, @floatFromInt(g.scale_rank)));
    }

    // *** update scroll speed
    g.scroll_spd = 10;
    if (g.scale_rank == -1) {
        g.scroll_spd = 50;
    }
    if (g.scale_rank == -2) {
        g.scroll_spd = 110;
    }
    if (g.scale_rank == -3) {
        g.scroll_spd = 200;
    }
    if (g.scale_rank >= 3) {
        g.scroll_spd = 5;
    }

    // ****************************** move mapboard
    if ((g.all_dpad & 1) > 0) {
        g.mapboard_sheet.y += @as(f32, @floatFromInt(g.scroll_spd));
    }
    if ((g.all_dpad & 2) > 0) {
        g.mapboard_sheet.x -= @as(f32, @floatFromInt(g.scroll_spd));
    }
    if ((g.all_dpad & 4) > 0) {
        g.mapboard_sheet.y -= @as(f32, @floatFromInt(g.scroll_spd));
    }
    if ((g.all_dpad & 8) > 0) {
        g.mapboard_sheet.x += @as(f32, @floatFromInt(g.scroll_spd));
    }
}
