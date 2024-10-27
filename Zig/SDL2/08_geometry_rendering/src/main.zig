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
        "08",
        SDL.SDL_WINDOWPOS_UNDEFINED,
        SDL.SDL_WINDOWPOS_UNDEFINED,
        SCREEN_DIM[0],
        SCREEN_DIM[1],
        SDL.SDL_WINDOW_SHOWN,
    );

    // ********** create renderer
    const gRenderer = SDL.SDL_CreateRenderer(window, -1, SDL.SDL_RENDERER_ACCELERATED);

    // ********** init PNG loading
    _ = SDL.IMG_Init(SDL.IMG_INIT_PNG);

    // ********** game loop
    var ev: SDL.SDL_Event = undefined;
    mainLoop: while (true) {
        while (SDL.SDL_PollEvent(&ev) != 0) {
            if (ev.type == SDL.SDL_QUIT)
                break :mainLoop;
        }

        // ********** Clear screen
        _ = SDL.SDL_SetRenderDrawColor(gRenderer, 0xF0, 0x00, 0xF0, 0xFF);
        _ = SDL.SDL_RenderClear(gRenderer);

        // ********** Render red filled quad
        const fillRect = SDL.SDL_Rect{ .x = SCREEN_DIM[0] / 4, .y = SCREEN_DIM[1] / 4, .w = SCREEN_DIM[0] / 2, .h = SCREEN_DIM[1] / 2 };
        _ = SDL.SDL_SetRenderDrawColor(gRenderer, 0xFF, 0x00, 0x00, 0xFF);
        _ = SDL.SDL_RenderFillRect(gRenderer, &fillRect);

        // ********** Render green outlined quad
        const outlineRect = SDL.SDL_Rect{ .x = SCREEN_DIM[0] / 6, .y = SCREEN_DIM[1] / 6, .w = SCREEN_DIM[0] * 2 / 3, .h = SCREEN_DIM[1] * 2 / 3 };
        _ = SDL.SDL_SetRenderDrawColor(gRenderer, 0x00, 0xFF, 0x00, 0xFF);
        _ = SDL.SDL_RenderDrawRect(gRenderer, &outlineRect);

        // ********** Draw blue horizontal line
        _ = SDL.SDL_SetRenderDrawColor(gRenderer, 0x00, 0x00, 0xFF, 0xFF);
        _ = SDL.SDL_RenderDrawLine(gRenderer, 0, SCREEN_DIM[1] / 2, SCREEN_DIM[0], SCREEN_DIM[1] / 2);

        //Draw vertical line of yellow dots
        _ = SDL.SDL_SetRenderDrawColor(gRenderer, 0xFF, 0xFF, 0x00, 0xFF);
        for (0..SCREEN_DIM[1]) |i| {
            if ((i % 4) == 0) {
                _ = SDL.SDL_RenderDrawPoint(gRenderer, SCREEN_DIM[0] / 2, @intCast(i));
            }
        }

        SDL.SDL_RenderPresent(gRenderer);
    }

    SDL.SDL_DestroyWindow(window);
    SDL.SDL_Quit();
}

// ***********************************************************************************
fn sdlPanic() noreturn {
    const str = @as(?[*:0]const u8, SDL.SDL_GetError()) orelse "unknown error";
    @panic(std.mem.sliceTo(str, 0));
}
