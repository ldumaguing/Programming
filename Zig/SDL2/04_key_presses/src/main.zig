const SDL = @cImport({
    @cInclude("SDL2/SDL.h");
});

const std = @import("std");
const print = @import("std").debug.print;

const KeyPressSurfaces = enum {
    KEY_PRESS_SURFACE_DEFAULT,
    KEY_PRESS_SURFACE_UP,
    KEY_PRESS_SURFACE_DOWN,
    KEY_PRESS_SURFACE_LEFT,
    KEY_PRESS_SURFACE_RIGHT,
    KEY_PRESS_SURFACE_TOTAL,
};
const SCREEN_DIM = [_]i32{ 640, 480 };

var images: [5][*c]SDL.SDL_Surface = undefined;
var gCurrentSurface: [*c]SDL.SDL_Surface = undefined;

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
    const screenSurface = SDL.SDL_GetWindowSurface(window);
    // _ = screenSurface;

    // ********** load images
    images[@intFromEnum(KeyPressSurfaces.KEY_PRESS_SURFACE_DEFAULT)] = SDL.SDL_LoadBMP("press.bmp");
    images[@intFromEnum(KeyPressSurfaces.KEY_PRESS_SURFACE_DEFAULT)] = SDL.SDL_LoadBMP("press.bmp");
    images[@intFromEnum(KeyPressSurfaces.KEY_PRESS_SURFACE_UP)] = SDL.SDL_LoadBMP("up.bmp");
    images[@intFromEnum(KeyPressSurfaces.KEY_PRESS_SURFACE_DOWN)] = SDL.SDL_LoadBMP("down.bmp");
    images[@intFromEnum(KeyPressSurfaces.KEY_PRESS_SURFACE_LEFT)] = SDL.SDL_LoadBMP("left.bmp");
    images[@intFromEnum(KeyPressSurfaces.KEY_PRESS_SURFACE_RIGHT)] = SDL.SDL_LoadBMP("right.bmp");

    // ********** game loop
    var ev: SDL.SDL_Event = undefined;
    gCurrentSurface = images[@intFromEnum(KeyPressSurfaces.KEY_PRESS_SURFACE_DEFAULT)];
    mainLoop: while (true) {
        while (SDL.SDL_PollEvent(&ev) != 0) {
            if (ev.type == SDL.SDL_QUIT)
                break :mainLoop;
            if (ev.type == SDL.SDL_KEYDOWN) {
                switch (ev.key.keysym.sym) {
                    SDL.SDLK_UP => {
                        gCurrentSurface = images[@intFromEnum(KeyPressSurfaces.KEY_PRESS_SURFACE_UP)];
                    },
                    SDL.SDLK_DOWN => {
                        gCurrentSurface = images[@intFromEnum(KeyPressSurfaces.KEY_PRESS_SURFACE_DOWN)];
                    },
                    SDL.SDLK_LEFT => {
                        gCurrentSurface = images[@intFromEnum(KeyPressSurfaces.KEY_PRESS_SURFACE_LEFT)];
                    },
                    SDL.SDLK_RIGHT => {
                        gCurrentSurface = images[@intFromEnum(KeyPressSurfaces.KEY_PRESS_SURFACE_RIGHT)];
                    },
                    else => {
                        gCurrentSurface = images[@intFromEnum(KeyPressSurfaces.KEY_PRESS_SURFACE_DEFAULT)];
                    },
                }
            }
        }
        _ = SDL.SDL_BlitSurface(gCurrentSurface, null, screenSurface, null);
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
