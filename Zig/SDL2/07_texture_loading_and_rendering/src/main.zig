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

    // ********** set texture filtering to linear.
    const foo = SDL.SDL_SetHint(SDL.SDL_HINT_RENDER_SCALE_QUALITY, "1");
    print("foo: {}\n", .{foo});

    // ********** create Window
    const window = SDL.SDL_CreateWindow(
        "07",
        SDL.SDL_WINDOWPOS_UNDEFINED,
        SDL.SDL_WINDOWPOS_UNDEFINED,
        SCREEN_DIM[0],
        SCREEN_DIM[1],
        SDL.SDL_WINDOW_SHOWN,
    );

    // ********** create renderer
    const gRenderer = SDL.SDL_CreateRenderer(window, -1, SDL.SDL_RENDERER_ACCELERATED);

    // ********** init renderer color
    _ = SDL.SDL_SetRenderDrawColor(gRenderer, 0xFF, 0x00, 0xFF, 0xFF);

    // ********** init PNG loading
    _ = SDL.IMG_Init(SDL.IMG_INIT_PNG);

    // ********** load PNG image & create texture from surface
    const loadedSurface = SDL.IMG_Load("texture.png");
    const gTexture = SDL.SDL_CreateTextureFromSurface(gRenderer, loadedSurface);
    SDL.SDL_FreeSurface(loadedSurface);

    // ********** game loop
    var ev: SDL.SDL_Event = undefined;
    mainLoop: while (true) {
        while (SDL.SDL_PollEvent(&ev) != 0) {
            if (ev.type == SDL.SDL_QUIT)
                break :mainLoop;
        }

        _ = SDL.SDL_RenderClear(gRenderer);
        _ = SDL.SDL_RenderCopy(gRenderer, gTexture, null, null);
        _ = SDL.SDL_RenderPresent(gRenderer);
    }

    SDL.SDL_DestroyWindow(window);
    SDL.SDL_Quit();
}

// ***********************************************************************************
fn sdlPanic() noreturn {
    const str = @as(?[*:0]const u8, SDL.SDL_GetError()) orelse "unknown error";
    @panic(std.mem.sliceTo(str, 0));
}
