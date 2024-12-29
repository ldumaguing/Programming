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
const trm = @import("terminal.zig");
const trm2 = @import("terminal_2.zig");

pub fn render() void {
    // ********** clear screen
    _ = SDL.SDL_SetRenderDrawColor(gv.renderer, 0xFF, 0x0, 0xFF, 0xFF);
    _ = SDL.SDL_RenderClear(gv.renderer);

    // ********** put map
    var viewport: SDL.SDL_Rect = undefined;
    viewport.x = 0;
    viewport.y = 0;
    viewport.w = @intFromFloat(@as(f64, @floatFromInt(mb.map_image.w)) * mb.scale);
    viewport.h = @intFromFloat(@as(f64, @floatFromInt(mb.map_image.h)) * mb.scale);
    mb.map_image.render(mb.map_image.x, mb.map_image.y, null, &viewport, 0.0, null, SDL.SDL_FLIP_NONE);

    // ********** put units
    for (mb.unit_db.items) |unit| {
        unit.render();
    }

    // ********** put terminal
    if ((mb.modes & (1 << 0)) != 0) {
        trm.doTerminal();
        return;
    }

    // ********** put terminal_2
    if ((mb.modes & (1 << 1)) != 0) {
        trm2.doTerminal();
        return;
    }

    // mb.terminal.render(10, 10, null, null, 0.0, null, SDL.SDL_FLIP_NONE);

    // ********** put arrow
    mb.arrow.render(mb.arrow.x, mb.arrow.y, null, null, 0.0, null, SDL.SDL_FLIP_NONE);

    //const x: i32 = 90;
    //const y: i32 = 66;
    //gv.gTextTexture.render(x, y, null, null, 0.0, null, SDL.SDL_FLIP_NONE);
    //gv.gTextTexture.render(x, y + 16, null, null, 0.0, null, SDL.SDL_FLIP_NONE);
    //gv.gTextTexture.render(x, y + (16 * 25), null, null, 0.0, null, SDL.SDL_FLIP_NONE);
}
