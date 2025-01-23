const SDL = @cImport({
    @cInclude("SDL3/SDL.h");
    @cInclude("SDL3/SDL_main.h");
});

var window: ?*SDL.SDL_Window = undefined;
var renderer: ?*SDL.SDL_Renderer = undefined;

// ***********************************************************************************
pub fn main() !void {
    print("yo\n", .{});

    // ********** init SDL
    if (!SDL.SDL_Init(SDL.SDL_INIT_VIDEO))
        sdlPanic();
    SDL.SDL_Quit();

    // ********** create Window & Renderer
    if (!SDL.SDL_CreateWindowAndRenderer("examples/CATEGORY/NAME", 640, 480, 0, &window, &renderer)) {
        SDL.SDL_Log("Couldn't create window/renderer: %s", SDL.SDL_GetError());
        sdlPanic();
    }
}

// ***********************************************************************************
fn sdlPanic() noreturn {
    const str = @as(?[*:0]const u8, SDL.SDL_GetError()) orelse "unknown error";
    @panic(std.mem.sliceTo(str, 0));
}

const std = @import("std");
const print = @import("std").debug.print;
const lib = @import("fish_lib");
