const std = @import("std");
const print = @import("std").debug.print;
const sdl = @import("SDLmine.zig");

pub fn main() !void {
    try sdl.AppInit();
}
