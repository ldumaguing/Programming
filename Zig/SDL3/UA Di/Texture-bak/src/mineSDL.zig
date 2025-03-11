const std = @import("std");
const print = @import("std").debug.print;
const m = @import("main.zig");
const texture = @import("texture.zig");

const c = @cImport({
    @cDefine("SDL_DISABLE_OLD_NAMES", {});
    @cInclude("SDL3/SDL.h");
    @cInclude("SDL3/SDL_revision.h");
    @cDefine("SDL_MAIN_HANDLED", {});
    @cInclude("SDL3/SDL_main.h");
    @cInclude("SDL3_image/SDL_image.h");
});

pub fn AppIterate() !void {
    _ = c.SDL_SetRenderDrawColor(m.gRenderer, 0xff, 0xff, 0xff, 0xff);
    _ = c.SDL_RenderClear(m.gRenderer);

    _ = texture.render(m.gRenderer, m.gTexture);

    m.redDot.loc_x = 320.0;
    m.redDot.loc_y = 240.0;
    m.redDot.render(m.gRenderer);
    m.greenDot.render(m.gRenderer);

    m.foo_guy.loc_x = 100.0;
    m.foo_guy.loc_y = 100.0;
    m.foo_guy.flip = c.SDL_FLIP_NONE;
    m.foo_guy.scale_x = 1.0;
    m.foo_guy.angle = 0.0;
    m.foo_guy.render(m.gRenderer);

    m.foo_guy.loc_x = 250.0;
    m.foo_guy.loc_y = 200.0;
    m.foo_guy.flip = c.SDL_FLIP_VERTICAL;
    m.foo_guy.scale_x = 2.0;
    m.foo_guy.angle = 30.0;
    m.foo_guy.animate(m.gRenderer);

    m.gameboard.stretch_x = 100.0;
    m.gameboard.stretch_y = 100.0;
    m.gameboard.loc_y = 240.0;
    m.gameboard.render(m.gRenderer);

    // **********************************************************************************
    _ = c.SDL_RenderPresent(m.gRenderer);
}
