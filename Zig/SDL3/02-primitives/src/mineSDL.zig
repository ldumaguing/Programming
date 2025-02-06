const std = @import("std");
const print = @import("std").debug.print;
const m = @import("main.zig");

const c = @cImport({
    @cDefine("SDL_DISABLE_OLD_NAMES", {});
    @cInclude("SDL3/SDL.h");
    @cInclude("SDL3/SDL_revision.h");
    @cDefine("SDL_MAIN_HANDLED", {});
    @cInclude("SDL3/SDL_main.h");
});

pub fn AppIterate(renderer: *c.SDL_Renderer) !void {
    var rect: c.SDL_FRect = undefined;

    try m.errify(c.SDL_SetRenderDrawColor(renderer, 33, 33, 33, c.SDL_ALPHA_OPAQUE));
    try m.errify(c.SDL_RenderClear(renderer));

    // draw a filled rectangle in the middle of the canvas.
    try m.errify(c.SDL_SetRenderDrawColor(renderer, 0, 0, 255, c.SDL_ALPHA_OPAQUE));
    rect.x = 100;
    rect.y = 100;
    rect.w = 440;
    rect.h = 280;
    try m.errify(c.SDL_RenderFillRect(renderer, &rect));

    // draw some points across the canvas.
    try m.errify(c.SDL_SetRenderDrawColor(renderer, 255, 0, 0, c.SDL_ALPHA_OPAQUE));
    try m.errify(c.SDL_RenderPoints(renderer, &m.points, m.points.len));

    // draw a unfilled rectangle in-set a little bit.
    try m.errify(c.SDL_SetRenderDrawColor(renderer, 0, 255, 0, c.SDL_ALPHA_OPAQUE));
    rect.x += 30;
    rect.y += 30;
    rect.w -= 60;
    rect.h -= 60;
    try m.errify(c.SDL_RenderRect(renderer, &rect));

    // draw two lines in an X across the whole canvas.
    try m.errify(c.SDL_SetRenderDrawColor(renderer, 255, 255, 0, c.SDL_ALPHA_OPAQUE));
    try m.errify(c.SDL_RenderLine(renderer, 0, 0, 640, 480));
    try m.errify(c.SDL_RenderLine(renderer, 0, 480, 640, 0));

    // ***** Present
    try m.errify(c.SDL_RenderPresent(renderer));
}
