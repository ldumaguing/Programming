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

const Texture = struct {
    img_w: i32,
    img_h: i32,
    img_texture: *SDL.SDL_Texture,
    pub fn loadFromFile(imgFile: []const u8) void {
        print(">>> {s}\n", .{imgFile});
    }
};

// ********** textures
var gFooTexture: Texture = undefined;
var gBackgroundTexture: Texture = undefined;

// **********
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

fn crap(x: []const u8) void {
    print("yo {s}\n", .{x});
}

// **************************************************************************************
// **************************************************************************************
pub fn main() !void {
    gFooTexture.img_w = 30;
    gFooTexture.img_h = 40;
    print("{}, {}\n", .{ gFooTexture.img_h, gFooTexture.img_w });

    crap("Hello World");
}

// ***********************************************************************************
fn sdlPanic() noreturn {
    const str = @as(?[*:0]const u8, SDL.SDL_GetError()) orelse "unknown error";
    @panic(std.mem.sliceTo(str, 0));
}
