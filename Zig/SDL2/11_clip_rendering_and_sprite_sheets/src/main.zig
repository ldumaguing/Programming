const SDL = @cImport({
    @cInclude("SDL2/SDL.h");
    @cInclude("SDL2/SDL_image.h");
});
const std = @import("std");
const print = @import("std").debug.print;

const Texture = struct {
    w: i32,
    h: i32,
    t: *SDL.SDL_Texture,

    pub fn new(pngFile: [*c]const u8) Texture {
        const pngSurface = SDL.IMG_Load(pngFile);
        // *** define a color to be transparent.
        _ = SDL.SDL_SetColorKey(pngSurface, SDL.SDL_TRUE, SDL.SDL_MapRGB(pngSurface.*.format, 0, 0xff, 0xff));
        const t = SDL.SDL_CreateTextureFromSurface(GV.renderer, pngSurface) orelse sdlPanic();
        const w = pngSurface.*.w;
        const h = pngSurface.*.h;
        SDL.SDL_FreeSurface(pngSurface);
        return Texture{
            .w = w,
            .h = h,
            .t = t,
        };
    }

    pub fn render(self: Texture, x: i32, y: i32) void {
        var viewport: SDL.SDL_Rect = undefined;
        viewport.x = x;
        viewport.y = y;
        viewport.w = self.w;
        viewport.h = self.h;
        _ = SDL.SDL_RenderSetViewport(GV.renderer, &viewport);
        _ = SDL.SDL_RenderCopy(GV.renderer, self.t, null, null);
    }

    pub fn render_w_clip(self: Texture, x: i32, y: i32) void {
        var viewport: SDL.SDL_Rect = undefined;
        viewport.x = x;
        viewport.y = y;
        viewport.w = 90;
        viewport.h = 70;
        var vie: SDL.SDL_Rect = undefined;
        vie.x = 0;
        vie.y = 0;
        vie.w = 110;
        vie.h = 110;
        // _ = SDL.SDL_RenderSetViewport(GV.renderer, &viewport);
        _ = SDL.SDL_RenderCopy(GV.renderer, self.t, &vie, &viewport);
    }
};

var gSpriteClip: SDL.SDL_Rect = undefined;

pub const GV = struct { // Global Variables
    pub const desc = "Global Variables";
    var window: *SDL.SDL_Window = undefined;
    var renderer: *SDL.SDL_Renderer = undefined;
    var gFooTexture: Texture = undefined;
    var gBackgroundTexture: Texture = undefined;
    var gSpriteSheetTexture: Texture = undefined;
};

const SCREEN_DIM = [_]i32{ 640, 480 };

// **************************************************************************************
fn init() void {
    // ********** init SDL
    _ = SDL.SDL_Init(SDL.SDL_INIT_VIDEO);

    // ********** set texture filter to linear.
    _ = SDL.SDL_SetHint(SDL.SDL_HINT_RENDER_SCALE_QUALITY, "1");

    // ********** create window
    GV.window = SDL.SDL_CreateWindow(
        "10",
        SDL.SDL_WINDOWPOS_UNDEFINED,
        SDL.SDL_WINDOWPOS_UNDEFINED,
        SCREEN_DIM[0],
        SCREEN_DIM[1],
        SDL.SDL_WINDOW_SHOWN,
    ) orelse sdlPanic();

    // ********** create renderer
    GV.renderer = SDL.SDL_CreateRenderer(GV.window, -1, SDL.SDL_RENDERER_ACCELERATED) orelse sdlPanic();

    // ********** init PNG loading
    _ = SDL.IMG_Init(SDL.IMG_INIT_PNG);
}

// **************************************************************************************
// **************************************************************************************
pub fn main() !void {
    init();

    // ********** load PNGs ang convert to texture
    GV.gFooTexture = Texture.new("foo1.png");
    GV.gBackgroundTexture = Texture.new("background.png");
    GV.gSpriteSheetTexture = Texture.new("dots.png");

    // ********** game loop
    var ev: SDL.SDL_Event = undefined;
    mainLoop: while (true) {
        while (SDL.SDL_PollEvent(&ev) != 0) {
            if (ev.type == SDL.SDL_QUIT)
                break :mainLoop;
        }
        // clear screen
        _ = SDL.SDL_SetRenderDrawColor(GV.renderer, 0xFF, 0x0, 0xFF, 0xFF);
        _ = SDL.SDL_RenderClear(GV.renderer);

        // upload textures to renderer
        //GV.gBackgroundTexture.render(0, 0);
        //GV.gFooTexture.render(240, 190);

        gSpriteClip.x = 0;
        gSpriteClip.y = 0;
        gSpriteClip.w = 10;
        gSpriteClip.h = 10;
        GV.gSpriteSheetTexture.render_w_clip(10, 20);

        // *************** present renderer
        SDL.SDL_RenderPresent(GV.renderer);
    }
}

// ***********************************************************************************
fn sdlPanic() noreturn {
    const str = @as(?[*:0]const u8, SDL.SDL_GetError()) orelse "unknown error";
    @panic(std.mem.sliceTo(str, 0));
}
