const SDL = @cImport({
    @cInclude("SDL2/SDL.h");
});
const std = @import("std");

const WINDOW_DIM = [_]i32{ 800, 600 };

pub fn main() !void {
    // ********** init SDL
    if (SDL.SDL_Init(SDL.SDL_INIT_VIDEO) < 0)
        sdlPanic();
    SDL.SDL_Quit();

    // ********** create Window
    const window = SDL.SDL_CreateWindow(
        "SDL2 Native Demo",
        SDL.SDL_WINDOWPOS_UNDEFINED,
        SDL.SDL_WINDOWPOS_UNDEFINED,
        WINDOW_DIM[0],
        WINDOW_DIM[1],
        SDL.SDL_WINDOW_SHOWN,
    ) orelse sdlPanic();

    // ********** The game loop
    mainLoop: while (true) {
        const screenSurface = SDL.SDL_GetWindowSurface(window);
        _ = SDL.SDL_FillRect(screenSurface, null, SDL.SDL_MapRGB(screenSurface.*.format, 255, 0, 255));
        _ = SDL.SDL_UpdateWindowSurface(window);

        var ev: SDL.SDL_Event = undefined;
        while (SDL.SDL_PollEvent(&ev) != 0) {
            if (ev.type == SDL.SDL_QUIT)
                break :mainLoop;
        }
    }

    SDL.SDL_DestroyWindow(window);
    SDL.SDL_Quit();
}

// ***********************************************************************************
fn sdlPanic() noreturn {
    const str = @as(?[*:0]const u8, SDL.SDL_GetError()) orelse "unknown error";
    @panic(std.mem.sliceTo(str, 0));
}
