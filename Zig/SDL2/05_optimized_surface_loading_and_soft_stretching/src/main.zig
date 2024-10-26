const SDL = @cImport({
    @cInclude("SDL2/SDL.h");
});

const std = @import("std");
const print = @import("std").debug.print;

const SCREEN_DIM = [_]i32{ 640, 480 };

// ***********************************************************************************
pub fn main() !void {
    // ********** init SDL
    if (SDL.SDL_Init(SDL.SDL_INIT_VIDEO) < 0)
        sdlPanic();

    // ********** create Window
    const window = SDL.SDL_CreateWindow(
        "SDL2 Native Demo",
        SDL.SDL_WINDOWPOS_UNDEFINED,
        SDL.SDL_WINDOWPOS_UNDEFINED,
        SCREEN_DIM[0],
        SCREEN_DIM[1],
        SDL.SDL_WINDOW_SHOWN,
    ) orelse sdlPanic();

    // ********** get Window's surface
    const gScreenSurface = SDL.SDL_GetWindowSurface(window);
    // _ = screenSurface;`i`

    // ********** load image and apply stretching
    const loadedSurface = SDL.SDL_LoadBMP("stretch.bmp");
    const gStretchedSurface = SDL.SDL_ConvertSurface(loadedSurface, gScreenSurface.*.format, 0);
    SDL.SDL_FreeSurface(loadedSurface);

    // ********** game loop
    var stretchRect: SDL.SDL_Rect = undefined;
    stretchRect.x = 0;
    stretchRect.y = 0;
    stretchRect.w = SCREEN_DIM[0];
    stretchRect.h = SCREEN_DIM[1];

    var ev: SDL.SDL_Event = undefined;
    mainLoop: while (true) {
        while (SDL.SDL_PollEvent(&ev) != 0) {
            if (ev.type == SDL.SDL_QUIT)
                break :mainLoop;
        }
        _ = SDL.SDL_BlitScaled(gStretchedSurface, null, gScreenSurface, &stretchRect);
        _ = SDL.SDL_UpdateWindowSurface(window);
    }

    SDL.SDL_DestroyWindow(window);
    SDL.SDL_Quit();
}

// ***********************************************************************************
fn sdlPanic() noreturn {
    const str = @as(?[*:0]const u8, SDL.SDL_GetError()) orelse "unknown error";
    @panic(std.mem.sliceTo(str, 0));
}
