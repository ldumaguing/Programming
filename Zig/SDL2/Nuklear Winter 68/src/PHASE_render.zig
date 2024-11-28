// ***** PHASE_render.zig
const std = @import("std");
const print = @import("std").debug.print;
const SDL = @cImport({
    @cInclude("SDL2/SDL.h");
    @cInclude("SDL2/SDL_image.h");
    @cInclude("SDL2/SDL_ttf.h");
});

const mb = @import("main.zig").MB;
const gv = @import("main.zig").GV;

pub fn render() void {
    // ********** clear screen
    _ = SDL.SDL_SetRenderDrawColor(gv.renderer, 0xFF, 0x0, 0xFF, 0xFF);
    _ = SDL.SDL_RenderClear(gv.renderer);

    var viewport: SDL.SDL_Rect = undefined;
    viewport.x = 0;
    viewport.y = 0;
    viewport.w = @intFromFloat(@as(f64, @floatFromInt(mb.img.w)) * mb.scale);
    viewport.h = @intFromFloat(@as(f64, @floatFromInt(mb.img.h)) * mb.scale);
    mb.img.render(mb.img.x, mb.img.y, null, &viewport, 0.0, null, SDL.SDL_FLIP_NONE);

    var v: SDL.SDL_Rect = undefined;
    v.x = 0;
    v.y = 0;
    v.w = @intFromFloat(@as(f64, @floatFromInt(mb.unit_db.items[0].w)) * mb.scale);
    v.h = @intFromFloat(@as(f64, @floatFromInt(mb.unit_db.items[0].h)) * mb.scale);
    // mb.unit_db.items[0].x = 5020 + mb.img.x;
    // mb.unit_db.items[0].y = 141 + mb.img.y;
    var unit_x: i32 = mb.unit_db.items[0].x;
    var unit_y: i32 = mb.unit_db.items[0].y;
    mb.unit_db.items[0].x = @intFromFloat(@as(f64, @floatFromInt(5021)) * mb.scale);
    mb.unit_db.items[0].x += mb.img.x;
    mb.unit_db.items[0].y = @intFromFloat(@as(f64, @floatFromInt(141)) * mb.scale);
    mb.unit_db.items[0].y += mb.img.y;
    mb.unit_db.items[0].render(unit_x, unit_y, null, &v, 0.0, null, SDL.SDL_FLIP_NONE);

    unit_x = mb.unit_db.items[1].x;
    unit_y = mb.unit_db.items[1].y;
    mb.unit_db.items[1].x = @intFromFloat(@as(f64, @floatFromInt(292)) * mb.scale);
    mb.unit_db.items[1].x += mb.img.x;
    mb.unit_db.items[1].y = @intFromFloat(@as(f64, @floatFromInt(141)) * mb.scale);
    mb.unit_db.items[1].y += mb.img.y;
    mb.unit_db.items[1].render(unit_x, unit_y, null, &v, 0.0, null, SDL.SDL_FLIP_NONE);

    mb.arrow.render(mb.arrow.x, mb.arrow.y, null, null, 0.0, null, SDL.SDL_FLIP_NONE);
}
