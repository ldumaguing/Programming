const SDL = @cImport({
    @cInclude("SDL2/SDL.h");
    @cInclude("SDL2/SDL_image.h");
});

const std = @import("std");
const print = @import("std").debug.print;

const SCREEN_DIM = [_]i32{ 640, 480 };

// ***********************************************************************************
pub fn main() !void {
    // ********** init SDL
    _ = SDL.SDL_Init(SDL.SDL_INIT_VIDEO);

    // ********** create Window
    const window = SDL.SDL_CreateWindow(
        "SDL2 Native Demo",
        SDL.SDL_WINDOWPOS_UNDEFINED,
        SDL.SDL_WINDOWPOS_UNDEFINED,
        SCREEN_DIM[0],
        SCREEN_DIM[1],
        SDL.SDL_WINDOW_SHOWN,
    );

    // ********** init PNG loading
    _ = SDL.IMG_Init(SDL.IMG_INIT_PNG);

    // ********** get Window's surface
    const gScreenSurface = SDL.SDL_GetWindowSurface(window);

    // ********** load PNG image
    const loadedSurface = SDL.IMG_Load("loaded.png");
    const gPNGSurface = SDL.SDL_ConvertSurface(loadedSurface, gScreenSurface.*.format, 0);
    SDL.SDL_FreeSurface(loadedSurface);

    // ********** game loop
    var ev: SDL.SDL_Event = undefined;
    mainLoop: while (true) {
        while (SDL.SDL_PollEvent(&ev) != 0) {
            if (ev.type == SDL.SDL_QUIT)
                break :mainLoop;
        }
        // use the rect as a basis for scaling the image.
        _ = SDL.SDL_BlitScaled(gPNGSurface, null, gScreenSurface, null);
        _ = SDL.SDL_UpdateWindowSurface(window);
    }

    SDL.SDL_DestroyWindow(window);
    SDL.SDL_Quit();
}
