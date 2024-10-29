const SDL = @cImport({
    @cInclude("SDL2/SDL.h");
    @cInclude("SDL2/SDL_image.h");
});
const std = @import("std");
const print = @import("std").debug.print;

pub const GV = struct { // Global Variables
    pub const desc = "Global Variables";
    var window: *SDL.SDL_Window = undefined;
    var renderer: *SDL.SDL_Renderer = undefined;
};

const SCREEN_DIM = [_]i32{ 640, 480 };

const Texture = struct {
    img_w: i32,
    img_h: i32,
    img_texture: *SDL.SDL_Texture,

    fn new() Texture {
        const loadedSurface = SDL.IMG_Load("foo.png");
        const w = loadedSurface.*.w;
        const h = loadedSurface.*.h;
        const t = SDL.SDL_CreateTextureFromSurface(GV.renderer, loadedSurface) orelse sdlPanic();
        return Texture{
            .img_w = w,
            .img_h = h,
            .img_texture = t,
        };
    }
    //pub fn loadFromFile(self: Texture, imgFile: [*c]const u8) void {
    //    print(">>> {s}\n", .{imgFile});
    //    const loadedSurface = SDL.IMG_Load(imgFile);
    //    self.img_w = loadedSurface.*.w;
    //    self.img_h = loadedSurface.*.h;
    //    self.img_texture = SDL.SDL_CreateTextureFromSurface(GV.renderer, loadedSurface) orelse sdlPanic();
    //    SDL.SDL_FreeSurface(loadedSurface);
    // }

    pub fn render(self: Texture, x: i32, y: i32) void {
        var aRect: SDL.SDL_Rect = undefined;
        aRect.x = x;
        aRect.y = y;
        aRect.w = self.img_w;
        aRect.h = self.img_h;
        _ = SDL.SDL_RenderSetViewport(GV.renderer, &aRect);
        _ = SDL.SDL_RenderCopy(GV.renderer, self.img_texture, null, null);
    }
};

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
pub fn main() !void {
    var gFooTexture = Texture.new();
    //gFooTexture.loadFromFile("foo.png");
    gFooTexture.render(10, 10);

    // ********** game loop
    var ev: SDL.SDL_Event = undefined;
    mainLoop: while (true) {
        while (SDL.SDL_PollEvent(&ev) != 0) {
            if (ev.type == SDL.SDL_QUIT)
                break :mainLoop;
        }
        SDL.SDL_RenderPresent(GV.renderer);
    }
}

// ***********************************************************************************
fn sdlPanic() noreturn {
    const str = @as(?[*:0]const u8, SDL.SDL_GetError()) orelse "unknown error";
    @panic(std.mem.sliceTo(str, 0));
}
