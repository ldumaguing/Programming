const std = @import("std");
//const gv = @import("GlobalVariables.zig");
const print = @import("std").debug.print;
//const m = @import("main.zig");
//const jstk = @import("joystick.zig");
//const hud_0 = @import("hud_new.zig");

const c = @cImport({
    @cDefine("SDL_DISABLE_OLD_NAMES", {});
    @cInclude("SDL3/SDL.h");
    @cInclude("SDL3/SDL_revision.h");
    @cDefine("SDL_MAIN_HANDLED", {});
    @cInclude("SDL3/SDL_main.h");
    @cInclude("SDL3_image/SDL_image.h");
});

pub fn newGame() void {
    print("New Game\n", .{});
}
