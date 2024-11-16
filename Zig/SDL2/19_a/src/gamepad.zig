const std = @import("std");
const print = @import("std").debug.print;
const SDL = @cImport({
    @cInclude("SDL2/SDL.h");
    @cInclude("SDL2/SDL_image.h");
    @cInclude("SDL2/SDL_ttf.h");
});

const GV = @import("main.zig").GV;

pub fn query_gamepad(ev: SDL.SDL_Event) void {
    if (ev.type == SDL.SDL_JOYBUTTONDOWN) {
        _ = switch (ev.jbutton.button) {
            0 => GV.gcButtons |= (1 << 0),
            1 => GV.gcButtons |= (1 << 1),
            2 => GV.gcButtons |= (1 << 2),
            3 => GV.gcButtons |= (1 << 3),
            4 => GV.gcButtons |= (1 << 4),
            5 => GV.gcButtons |= (1 << 5),
            6 => GV.gcButtons |= (1 << 6),
            7 => GV.gcButtons |= (1 << 7),
            8 => GV.gcButtons |= (1 << 8),
            9 => GV.gcButtons |= (1 << 9),
            10 => GV.gcButtons |= (1 << 10),
            11 => GV.gcButtons |= (1 << 11),
            else => {},
        };
    }
    if (ev.type == SDL.SDL_JOYBUTTONUP) {
        _ = switch (ev.jbutton.button) {
            0 => GV.gcButtons ^= (1 << 0),
            1 => GV.gcButtons ^= (1 << 1),
            2 => GV.gcButtons ^= (1 << 2),
            3 => GV.gcButtons ^= (1 << 3),
            4 => GV.gcButtons ^= (1 << 4),
            5 => GV.gcButtons ^= (1 << 5),
            6 => GV.gcButtons ^= (1 << 6),
            7 => GV.gcButtons ^= (1 << 7),
            8 => GV.gcButtons ^= (1 << 8),
            9 => GV.gcButtons ^= (1 << 9),
            10 => GV.gcButtons ^= (1 << 10),
            11 => GV.gcButtons ^= (1 << 11),
            else => {},
        };
    }

    if (ev.type == SDL.SDL_JOYAXISMOTION) {
        _ = switch (ev.jaxis.axis) {
            0 => GV.gcAxis_0 = ev.jaxis.value,
            1 => GV.gcAxis_1 = ev.jaxis.value,
            2 => GV.gcAxis_2 = ev.jaxis.value,
            3 => GV.gcAxis_3 = ev.jaxis.value,
            4 => GV.gcAxis_4 = ev.jaxis.value,
            5 => GV.gcAxis_5 = ev.jaxis.value,
            else => {},
        };
    }
    //print("............. {}\n", .{ev.type});
    if (ev.type == SDL.SDL_JOYHATMOTION) {
        // print("bo {}\n", .{ev.jhat.value});
        GV.gcHat = ev.jhat.value;
        //_ = switch (ev.jhat.value) {
        //    1...12 => GV.gcHat = ev.jhat.value,
        //    else => GV.gcHat = 0,
        //};
    }
}
