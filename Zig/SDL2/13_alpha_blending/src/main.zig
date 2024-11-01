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

    pub fn render(self: Texture, x: i32, y: i32, clip: ?*SDL.SDL_Rect, viewport: ?*SDL.SDL_Rect) void {
        // default viewport
        var default_viewport: SDL.SDL_Rect = undefined;
        default_viewport.x = x;
        default_viewport.y = y;
        default_viewport.w = self.w;
        default_viewport.h = self.h;

        if (clip == null) {
            if (viewport != null) {
                default_viewport.w = viewport.?.w;
                default_viewport.h = viewport.?.h;
            }
            _ = SDL.SDL_RenderCopy(GV.renderer, self.t, null, &default_viewport);
            return;
        }

        if (viewport == null) {
            _ = SDL.SDL_RenderCopy(GV.renderer, self.t, clip, &default_viewport);
        } else {
            default_viewport.w = viewport.?.w;
            default_viewport.h = viewport.?.h;
            _ = SDL.SDL_RenderCopy(GV.renderer, self.t, clip, &default_viewport);
        }
    }

    pub fn setColor(self: Texture, r: u8, g: u8, b: u8) void {
        _ = SDL.SDL_SetTextureColorMod(self.t, r, g, b);
    }

    pub fn setBlendMode(self: Texture, blending: SDL.SDL_BlendMode) void {
        _ = SDL.SDL_SetTextureBlendMode(self.t, blending);
    }

    pub fn setAlpha(self: Texture, alpha: u8) void {
        _ = SDL.SDL_SetTextureAlphaMod(self.t, alpha);
    }
};

pub const GV = struct { // Global Variables
    pub const desc = "Global Variables";
    var window: *SDL.SDL_Window = undefined;
    var renderer: *SDL.SDL_Renderer = undefined;
    var gModulatedTexture: Texture = undefined;
    var gBackgroundTexture: Texture = undefined;
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
        "13",
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
    GV.gModulatedTexture = Texture.new("fadeout.png");
    GV.gModulatedTexture.setBlendMode(SDL.SDL_BLENDMODE_BLEND);
    GV.gBackgroundTexture = Texture.new("fadein.png");
    // ********** game loop
    var ev: SDL.SDL_Event = undefined;
    var a: u8 = 0;
    mainLoop: while (true) {
        while (SDL.SDL_PollEvent(&ev) != 0) {
            if (ev.type == SDL.SDL_QUIT)
                break :mainLoop;
            if (ev.type == SDL.SDL_KEYDOWN) {
                switch (ev.key.keysym.sym) {
                    SDL.SDLK_w => {
                        const old = a;
                        a +%= 32;
                        if (old > a) a = 255;
                    },
                    SDL.SDLK_s => {
                        const old = a;
                        a -%= 32;
                        if (a > old) a = 0;
                    },
                    else => {},
                }
            }
        }
        // clear screen
        _ = SDL.SDL_SetRenderDrawColor(GV.renderer, 0xFF, 0x0, 0xFF, 0xFF);
        _ = SDL.SDL_RenderClear(GV.renderer);

        GV.gBackgroundTexture.render(0, 0, null, null);

        GV.gModulatedTexture.setAlpha(a);
        GV.gModulatedTexture.render(10, 10, null, null);

        // *************** present renderer
        SDL.SDL_RenderPresent(GV.renderer);
    }
}

// ***********************************************************************************
fn sdlPanic() noreturn {
    const str = @as(?[*:0]const u8, SDL.SDL_GetError()) orelse "unknown error";
    @panic(std.mem.sliceTo(str, 0));
}
