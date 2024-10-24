const SDL = @cImport({
    @cInclude("SDL2/SDL.h");
});
const std = @import("std");

pub fn main() !void {
    // ********** init SDL
    if (SDL.SDL_Init(SDL.SDL_INIT_VIDEO) < 0)
        sdlPanic();

    // ********** create Window
    const window = SDL.SDL_CreateWindow(
        "SDL2 Native Demo",
        SDL.SDL_WINDOWPOS_UNDEFINED,
        SDL.SDL_WINDOWPOS_UNDEFINED,
        640,
        480,
        SDL.SDL_WINDOW_SHOWN,
    ) orelse sdlPanic();

    // ********** get Window's surface
    const screenSurface = SDL.SDL_GetWindowSurface(window);

    // ********** load image
    const gHelloWorld = SDL.SDL_LoadBMP("hello_world.bmp");

    // ********** The game loop
    mainLoop: while (true) {
        defer _ = SDL.SDL_BlitSurface(gHelloWorld, null, screenSurface, null);
        defer _ = SDL.SDL_UpdateWindowSurface(window);

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
