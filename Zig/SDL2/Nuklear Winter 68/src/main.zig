// ***** main.zig
const SDL = @cImport({
    @cInclude("SDL2/SDL.h");
    @cInclude("SDL2/SDL_image.h");
    @cInclude("SDL2/SDL_ttf.h");
});
const std = @import("std");
const print = @import("std").debug.print;
const phPad = @import("PHASE_gamepad.zig");
const phGame = @import("PHASE_game.zig");
const phRender = @import("PHASE_render.zig");
const Texture = @import("texture.zig").Texture;

pub const GV = struct { // Global Variables
    pub const desc = "Global Variables";
    // pub const SCREEN_DIM = [_]i32{ 640, 480 };
    pub const SCREEN_DIM = [_]i32{ 800, 600 };
    // pub const SCREEN_DIM = [_]i32{ 1024, 768 };
    pub var window: *SDL.SDL_Window = undefined;
    pub var renderer: *SDL.SDL_Renderer = undefined;
    // ***
    pub var gTextTexture: Texture = undefined;
    pub var gFont: *SDL.TTF_Font = undefined;
    pub var flipType: SDL.SDL_RendererFlip = SDL.SDL_FLIP_NONE;
    pub var degrees: f64 = 0.0;
    // ***
    pub var gGameController: *SDL.SDL_Joystick = undefined;
    pub var gcButtons: u32 = 0; // 12 bits
    pub var gcAxis_0: i32 = 0; // analog
    pub var gcAxis_1: i32 = 0;
    pub var gcAxis_2: i32 = 0;
    pub var gcAxis_3: i32 = 0;
    pub var gcAxis_4: i32 = 0;
    pub var gcAxis_5: i32 = 0;
    pub var gcHat: u8 = 0; // 4 "bits"
};

pub const MB = struct { // Map board
    pub var img: Texture = undefined;
    pub var arrow: Texture = undefined;
    pub var scale: f32 = 1.0;
};

pub const Inputs = struct {
    pub var shoulder_r: bool = false;
    pub var shoulder_l: bool = false;

    pub fn showStats() void {
        print("{s}\n", .{SDL.SDL_JoystickName(GV.gGameController)});
        print("hat      {}\n", .{GV.gcHat});
        print("axis 0,1 {},{}\n", .{ GV.gcAxis_0, GV.gcAxis_1 });
        print("axis 2,3 {},{}\n", .{ GV.gcAxis_2, GV.gcAxis_3 });
        print("axis 4,5 {},{}\n", .{ GV.gcAxis_4, GV.gcAxis_5 });
        print("{b:0>15}\n", .{GV.gcButtons});
        print("...|...|...|...\n", .{});
        print("\n", .{});
    }
};

// **************************************************************************************
fn init() void {
    // ********** init SDL
    _ = SDL.SDL_Init(SDL.SDL_INIT_VIDEO | SDL.SDL_INIT_JOYSTICK);
    _ = SDL.TTF_Init();

    // ********** set texture filter to linear.
    _ = SDL.SDL_SetHint(SDL.SDL_HINT_RENDER_SCALE_QUALITY, "1");

    // ********** create window
    GV.window = SDL.SDL_CreateWindow(
        "Nuklear Winter '68",
        SDL.SDL_WINDOWPOS_UNDEFINED,
        SDL.SDL_WINDOWPOS_UNDEFINED,
        GV.SCREEN_DIM[0],
        GV.SCREEN_DIM[1],
        SDL.SDL_WINDOW_SHOWN, // | SDL.SDL_WINDOW_FULLSCREEN,
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
    MB.arrow = Texture.new("resource/img/arrow.png");
    MB.img = Texture.new("resource/Vassal/NW68/Map.jpg");

    // ********** create text
    //GV.gFont = SDL.TTF_OpenFont("lazy.ttf", 48) orelse sdlPanic();
    //var textColor: SDL.SDL_Color = undefined;
    //textColor.r = 0;
    //textColor.g = 0;
    //textColor.b = 0;
    //GV.gTextTexture = Texture.newText("bla bla bla", textColor);

    // ********** game loop
    var ev: SDL.SDL_Event = undefined;
    mainLoop: while (true) {
        while (SDL.SDL_PollEvent(&ev) != 0) {
            if (ev.type == SDL.SDL_QUIT)
                break :mainLoop;

            switch (ev.key.keysym.sym) {
                SDL.SDLK_ESCAPE => {
                    break :mainLoop;
                },
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

            // ********** Gamepad
            phPad.query_gamepad(ev);

            // Inputs.showStats();

        }

        phGame.update();
        phRender.render();
        phPad.toggle_buttons();

        // print("scale: {}\n", .{MB.scale});

        // *************** present renderer
        SDL.SDL_RenderPresent(GV.renderer);
        SDL.SDL_Delay(10);
    }
}

// ***********************************************************************************
pub fn sdlPanic() noreturn {
    const str = @as(?[*:0]const u8, SDL.SDL_GetError()) orelse "unknown error";
    @panic(std.mem.sliceTo(str, 0));
}
