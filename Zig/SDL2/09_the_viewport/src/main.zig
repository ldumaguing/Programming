const SDL = @cImport({
    @cInclude("SDL2/SDL.h");
    @cInclude("SDL2/SDL_image.h");
});
const std = @import("std");
const print = @import("std").debug.print;

const Global_Variables = struct {
    x: f32,
};

fn init(gv: *Global_Variables) void {
    // ********** init SDL
    _ = SDL.SDL_Init(SDL.SDL_INIT_VIDEO);

    print("... {}\n", .{gv.x});
    gv.x = 7.7;
}

pub fn main() !void {
    var gv = Global_Variables{
        .x = 6.6,
    };

    print("{}\n", .{gv.x});
    init(&gv);
    print(">> {}\n", .{gv.x});
}
