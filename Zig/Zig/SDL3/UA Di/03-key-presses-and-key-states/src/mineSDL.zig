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

const colors = [4][3]u8{
    [_]u8{ 0xff, 0x00, 0xff },
    [_]u8{ 0xff, 0x00, 0x00 },
    [_]u8{ 0x00, 0xff, 0x00 },
    [_]u8{ 0x00, 0x00, 0xff },
};

pub fn AppIterate() !void {
    const color: u8 = @as(u8, @intCast(m.postcard_Curr.id));
    _ = c.SDL_SetRenderDrawColor(m.gRenderer, colors[color][0], colors[color][1], colors[color][2], 0xff);
    _ = c.SDL_RenderClear(m.gRenderer);

    m.postcard_Curr.render(0.0, 0.0);

    _ = c.SDL_RenderPresent(m.gRenderer);
}
