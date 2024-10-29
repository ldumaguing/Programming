const std = @import("std");
const SDL = @cImport({
    @cInclude("SDL2/SDL.h");
    @cInclude("SDL2/SDL_image.h");
});

const GV = @import("main.zig").GV;

const a = 1;
pub const b = 2;
pub const c = 69;

pub fn bar() void {
    std.debug.print("Hello from other.zig\n", .{});
}

pub fn fee() i32 {
    return 70;
}

pub fn fie(x: i32) i32 {
    return x;
}

pub fn fum(x: [*c]const u8) void {
    std.debug.print("Hello from other.zig: {s}\n", .{x});
}

pub fn fum1() void {
    std.debug.print("...{s}\n", .{GV.desc});
}
