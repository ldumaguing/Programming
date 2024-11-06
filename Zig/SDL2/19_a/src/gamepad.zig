const std = @import("std");
const print = @import("std").debug.print;
const SDL = @cImport({
    @cInclude("SDL2/SDL.h");
    @cInclude("SDL2/SDL_image.h");
    @cInclude("SDL2/SDL_ttf.h");
});

pub fn query_gamepad(ev: SDL.SDL_Event) void {
    //if (ev.type == SDL.SDL_JOYBUTTONDOWN) {
    //    print("button down 1-12 {}, {}\n", .{ ev.type, ev.jbutton.button });
    //}
    //if (ev.type == SDL.SDL_JOYAXISMOTION) {
    //    print("axis motion {}\n", .{ev.type});
    //    print("     {}, {}\n", .{ ev.jaxis.value, ev.jaxis.axis });
    //}
    //print("............. {}\n", .{ev.type});
    if (ev.type == SDL.SDL_JOYHATMOTION) {
        print("bo\n", .{});
    }
}
