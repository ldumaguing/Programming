const std = @import("std");
const print = @import("std").debug.print;
const SDL = @cImport({
    @cInclude("SDL2/SDL.h");
    @cInclude("SDL2/SDL_image.h");
    @cInclude("SDL2/SDL_ttf.h");
});

const mb = @import("main.zig").MB;
const gv = @import("main.zig").GV;

pub fn doTerminal() void {
    print("blaa\n", .{});
    mb.terminal.render(10, 10, null, null, 0.0, null, SDL.SDL_FLIP_NONE);
    
     const x: i32 = 90;
    const y: i32 = 66;
    gv.gTextTexture.render(x, y, null, null, 0.0, null, SDL.SDL_FLIP_NONE);
    gv.gTextTexture.render(x, y + 16, null, null, 0.0, null, SDL.SDL_FLIP_NONE);
    gv.gTextTexture.render(x, y + (16 * 25), null, null, 0.0, null, SDL.SDL_FLIP_NONE);
    
    
}
