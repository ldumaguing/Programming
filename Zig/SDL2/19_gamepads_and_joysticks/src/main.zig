const SDL = @cImport({
    @cInclude("SDL2/SDL.h");
    @cInclude("SDL2/SDL_image.h");
    @cInclude("SDL2/SDL_ttf.h");
});
const std = @import("std");
const print = @import("std").debug.print;

const Texture = struct {
    w: i32,
    h: i32,
    t: *SDL.SDL_Texture,

    pub fn newText(txt: [*c]const u8, textColor: SDL.SDL_Color) Texture {
        const textSurface: *SDL.SDL_Surface = SDL.TTF_RenderText_Solid(GV.gFont, txt, textColor);
        const t = SDL.SDL_CreateTextureFromSurface(GV.renderer, textSurface) orelse sdlPanic();
        const w = textSurface.w;
        const h = textSurface.h;
        return Texture{
            .w = w,
            .h = h,
            .t = t,
        };
    }

    pub fn new(pngFile: [*c]const u8) Texture {
        const pngSurface = SDL.IMG_Load(pngFile);
        // *** define a color to be transparent.
        //_ = SDL.SDL_SetColorKey(pngSurface, SDL.SDL_TRUE, SDL.SDL_MapRGB(pngSurface.*.format, 0, 0xff, 0xff));
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

    pub fn render(self: Texture, x: i32, y: i32, clip: ?*SDL.SDL_Rect, viewport: ?*SDL.SDL_Rect, angle: f64, center: ?*SDL.SDL_Point, flip: SDL.SDL_RendererFlip) void {
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
            _ = SDL.SDL_RenderCopyEx(GV.renderer, self.t, null, &default_viewport, angle, center, flip);
            return;
        }

        if (viewport == null) {
            _ = SDL.SDL_RenderCopyEx(GV.renderer, self.t, clip, &default_viewport, angle, center, flip);
        } else {
            default_viewport.w = viewport.?.w;
            default_viewport.h = viewport.?.h;
            _ = SDL.SDL_RenderCopyEx(GV.renderer, self.t, clip, &default_viewport, angle, center, flip);
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
    // ***
    // var gArrowTexture: Texture = undefined;
    var gTextTexture: Texture = undefined;
    var gFont: *SDL.TTF_Font = undefined;
    var flipType: SDL.SDL_RendererFlip = SDL.SDL_FLIP_NONE;
    var degrees: f64 = 0.0;
    // ***
    var gGameController: *SDL.SDL_Joystick = undefined;
};

const SCREEN_DIM = [_]i32{ 640, 480 };

// **************************************************************************************
fn init() void {
    // ********** init SDL
    _ = SDL.SDL_Init(SDL.SDL_INIT_VIDEO | SDL.SDL_INIT_JOYSTICK);
    _ = SDL.TTF_Init();

    // ********** set texture filter to linear.
    _ = SDL.SDL_SetHint(SDL.SDL_HINT_RENDER_SCALE_QUALITY, "1");

    // ********** create window
    GV.window = SDL.SDL_CreateWindow(
        "17",
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

    // **********
    const NumCount = SDL.SDL_NumJoysticks();
    if (NumCount < 1) {
        print("No joysticks", .{});
        sdlPanic();
    } else {
        GV.gGameController = SDL.SDL_JoystickOpen(0) orelse sdlPanic();
    }
}

// **************************************************************************************
// **************************************************************************************
pub fn main() !void {
    init();

    // ********** load PNGs and convert to texture
    // GV.gArrowTexture = Texture.new("arrow.png");

    // ********** create text
    GV.gFont = SDL.TTF_OpenFont("lazy.ttf", 48) orelse sdlPanic();
    var textColor: SDL.SDL_Color = undefined;
    textColor.r = 0;
    textColor.g = 0;
    textColor.b = 0;
    GV.gTextTexture = Texture.newText("bla bla bla", textColor);

    // ********** game loop
    var ev: SDL.SDL_Event = undefined;
    var counter: u32 = 0;
    mainLoop: while (true) {
        while (SDL.SDL_PollEvent(&ev) != 0) {
            if (ev.type == SDL.SDL_QUIT)
                break :mainLoop;

            switch (ev.key.keysym.sym) {
                SDL.SDLK_a => {
                    GV.degrees -= 1.0;
                    if (GV.degrees < 0.0) {
                        GV.degrees += 360.0;
                    }
                },
                SDL.SDLK_d => {
                    GV.degrees += 1.0;
                    if (GV.degrees >= 360.0) {
                        GV.degrees -= 360.0;
                    }
                },
                SDL.SDLK_q => {
                    GV.flipType = SDL.SDL_FLIP_HORIZONTAL;
                },
                SDL.SDLK_w => {
                    GV.flipType = SDL.SDL_FLIP_NONE;
                },
                SDL.SDLK_e => {
                    GV.flipType = SDL.SDL_FLIP_VERTICAL;
                },
                else => {},
            }

            // ***** Mouse events
            if (ev.type == SDL.SDL_MOUSEMOTION) {
                var mouse_x: i32 = 0;
                var mouse_y: i32 = 0;
                _ = SDL.SDL_GetMouseState(&mouse_x, &mouse_y);
                // print("yo ({},{})\n", .{ mouse_x, mouse_y });
            }
            if (ev.type == SDL.SDL_MOUSEBUTTONDOWN) {
                print("click\n", .{});
                switch (ev.button.button) {
                    SDL.SDL_BUTTON_LEFT => {
                        print("   left\n", .{});
                    },
                    SDL.SDL_BUTTON_X1 => {
                        print("   x1\n", .{});
                    },
                    SDL.SDL_BUTTON_X2 => {
                        print("   x2\n", .{});
                    },
                    SDL.SDL_BUTTON_RIGHT => {
                        print("   right\n", .{});
                    },
                    SDL.SDL_BUTTON_MIDDLE => {
                        print("   middle\n", .{});
                    },
                    else => {},
                }
            }
            if (ev.type == SDL.SDL_MOUSEWHEEL) {
                print("wheel {},{}\n", .{ ev.wheel.x, ev.wheel.y });
            }

            // ********** Joystick
            if (ev.type == SDL.SDL_JOYBUTTONDOWN) {
                print("button down {}, {}\n", .{ ev.type, counter });
                counter += 1;
            }
            if (ev.type == SDL.SDL_JOYAXISMOTION) {
                print("axis motion {}, {}\n", .{ ev.type, counter });
                counter += 1;
            }
            print("............. {}\n", .{ev.type});
            if (ev.type == SDL.SDL_JOYHATMOTION) {
                print("bo\n", .{});
                counter += 1;
            }
        }

        // ********** clear screen
        _ = SDL.SDL_SetRenderDrawColor(GV.renderer, 0xFF, 0x0, 0xFF, 0xFF);
        _ = SDL.SDL_RenderClear(GV.renderer);

        // *************** render phase
        // GV.gArrowTexture.render(100, 100, null, null, GV.degrees, null, GV.flipType);
        GV.gTextTexture.render(100, 100, null, null, GV.degrees, null, GV.flipType);

        // *************** present renderer
        SDL.SDL_RenderPresent(GV.renderer);
    }
}

// ***********************************************************************************
fn sdlPanic() noreturn {
    const str = @as(?[*:0]const u8, SDL.SDL_GetError()) orelse "unknown error";
    @panic(std.mem.sliceTo(str, 0));
}
