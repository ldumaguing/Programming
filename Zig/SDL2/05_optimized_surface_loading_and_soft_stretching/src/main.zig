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

    // ********** load image and apply stretching
    const loadedSurface = SDL.SDL_LoadBMP("stretch.bmp");
    const gStretchedSurface = SDL.SDL_ConvertSurface(loadedSurface, gScreenSurface.*.format, 0);
    SDL.SDL_FreeSurface(loadedSurface);

    // ********** game loop
    // defining a rect
    var myRect: SDL.SDL_Rect = undefined;
    myRect.x = 50; // anchoring to window's X coordinate
    myRect.y = 50; // anchoring to window's Y coordinate
    myRect.w = SCREEN_DIM[0] / 3;
    myRect.h = SCREEN_DIM[1] / 3;

    var ev: SDL.SDL_Event = undefined;
    mainLoop: while (true) {
        while (SDL.SDL_PollEvent(&ev) != 0) {
            if (ev.type == SDL.SDL_QUIT)
                break :mainLoop;
        }
        // use the rect as a basis for scaling the image.
        _ = SDL.SDL_BlitScaled(gStretchedSurface, null, gScreenSurface, &myRect);
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
