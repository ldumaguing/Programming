const c = @cImport({
    @cInclude("SDL2/SDL.h");
});
const std = @import("std");

pub fn main() !void {
    if (c.SDL_Init(c.SDL_INIT_VIDEO) != 0) {
        c.SDL_Log("init fail: %s", c.SDL_GetError());
        return error.SDLInitialisationFailure;
    }

    const win = c.SDL_CreateWindow("Foo Window", c.SDL_WINDOWPOS_UNDEFINED, c.SDL_WINDOWPOS_UNDEFINED, 800, 600, c.SDL_WINDOW_RESIZABLE) orelse {
        c.SDL_Log("window fail: %s", c.SDL_GetError());
        return error.SDLInitialisationFailure;
    };

    const renderer = c.SDL_CreateRenderer(win, -1, 0) orelse {
        c.SDL_Log("render fail: %s", c.SDL_GetError());
        return error.SDLInitialisationFailure;
    };
    _ = renderer;
    var running = true;
    while (running) {
        var event: c.SDL_Event = undefined;
        while (c.SDL_PollEvent(&event) != 0) {
            switch (event.type) {
                c.SDL_QUIT => {
                    running = false;
                },
                else => {},
            }
        }
    }
}
