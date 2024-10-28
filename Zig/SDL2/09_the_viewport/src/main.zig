const SDL = @cImport({
    @cInclude("SDL2/SDL.h");
    @cInclude("SDL2/SDL_image.h");
});
const std = @import("std");
const print = @import("std").debug.print;

const Global_Variables = struct {
    window: *SDL.SDL_Window,
    renderer: *SDL.SDL_Renderer,
};

var texture: *SDL.SDL_Texture = undefined;

const SCREEN_DIM = [_]i32{ 640, 480 };

// **************************************************************************************
fn init(gv: *Global_Variables) void {
    // ********** init SDL
    _ = SDL.SDL_Init(SDL.SDL_INIT_VIDEO);

    // ********** set texture filter to linear.
    _ = SDL.SDL_SetHint(SDL.SDL_HINT_RENDER_SCALE_QUALITY, "1");

    // ********** create window
    gv.window = SDL.SDL_CreateWindow(
        "09",
        SDL.SDL_WINDOWPOS_UNDEFINED,
        SDL.SDL_WINDOWPOS_UNDEFINED,
        SCREEN_DIM[0],
        SCREEN_DIM[1],
        SDL.SDL_WINDOW_SHOWN,
    ) orelse sdlPanic();

    // ********** create renderer
    gv.renderer = SDL.SDL_CreateRenderer(gv.window, -1, SDL.SDL_RENDERER_ACCELERATED) orelse sdlPanic();

    // ********** init PNG loading
    _ = SDL.IMG_Init(SDL.IMG_INIT_PNG);
}

// **************************************************************************************
// **************************************************************************************
pub fn main() !void {
    var gv = Global_Variables{
        .window = undefined,
        .renderer = undefined,
    };

    init(&gv);

    // ********** game loop
    var ev: SDL.SDL_Event = undefined;
    mainLoop: while (true) {
        while (SDL.SDL_PollEvent(&ev) != 0) {
            if (ev.type == SDL.SDL_QUIT)
                break :mainLoop;
        }
        // clear screen
        _ = SDL.SDL_SetRenderDrawColor(gv.renderer, 0xFF, 0xFF, 0xFF, 0xFF);
        _ = SDL.SDL_RenderClear(gv.renderer);

        // ********** load PNG image & create texture from surface
        const loadedSurface = SDL.IMG_Load("viewport.png");
        texture = SDL.SDL_CreateTextureFromSurface(gv.renderer, loadedSurface) orelse sdlPanic();
        SDL.SDL_FreeSurface(loadedSurface);

        // top-left corner viewport
        var topLeftViewport: SDL.SDL_Rect = undefined;
        topLeftViewport.x = 0;
        topLeftViewport.y = 0;
        topLeftViewport.w = SCREEN_DIM[0] / 2;
        topLeftViewport.h = SCREEN_DIM[1] / 2;
        _ = SDL.SDL_RenderSetViewport(gv.renderer, &topLeftViewport);

        // render texture to screen
        _ = SDL.SDL_RenderCopy(gv.renderer, texture, null, null);

        // top-right viewport
        var topRightViewport: SDL.SDL_Rect = undefined;
        topRightViewport.x = SCREEN_DIM[0] / 2;
        topRightViewport.y = 0;
        topRightViewport.w = SCREEN_DIM[0] / 2;
        topRightViewport.h = SCREEN_DIM[1] / 2;
        _ = SDL.SDL_RenderSetViewport(gv.renderer, &topRightViewport);

        // render texture to screen
        _ = SDL.SDL_RenderCopy(gv.renderer, texture, null, null);

        // bottom viewport
        var bottomViewport: SDL.SDL_Rect = undefined;
        bottomViewport.x = 0;
        bottomViewport.y = SCREEN_DIM[1] / 2;
        bottomViewport.w = SCREEN_DIM[0];
        bottomViewport.h = SCREEN_DIM[1] / 2;
        _ = SDL.SDL_RenderSetViewport(gv.renderer, &bottomViewport);

        // render texture to screen
        _ = SDL.SDL_RenderCopy(gv.renderer, texture, null, null);

        // *************** present renderer
        SDL.SDL_RenderPresent(gv.renderer);
    }
}

// ***********************************************************************************
fn sdlPanic() noreturn {
    const str = @as(?[*:0]const u8, SDL.SDL_GetError()) orelse "unknown error";
    @panic(std.mem.sliceTo(str, 0));
}
