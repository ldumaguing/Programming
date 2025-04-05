const std = @import("std");
const print = @import("std").debug.print;
const mvzr = @import("mvzr.zig");

const c = @cImport({
    @cDefine("SDL_DISABLE_OLD_NAMES", {});
    @cInclude("SDL3/SDL.h");
    @cInclude("SDL3/SDL_revision.h");
    @cDefine("SDL_MAIN_HANDLED", {});
    @cInclude("SDL3/SDL_main.h");
    @cInclude("SDL3_image/SDL_image.h");
});

pub var window: ?*c.SDL_Window = undefined;
pub var renderer: ?*c.SDL_Renderer = undefined;
pub var display_info: [*c]c.SDL_DisplayMode = undefined;

// *************** Joystick
pub var joystick: ?*c.SDL_Joystick = null;
pub var button_bits: u16 = 0;
pub var button_mods = [_]i32{0} ** 14;
pub var d_pad: u16 = 0;

// ***************
pub var keybrd_bits: u16 = 0;
pub var keybrd_dpad: u16 = 0;

// ***************
pub var all_bits: u16 = 0;
pub var all_dpad: u16 = 0;

// *************** Images
pub var boardgame_surface: ?*c.SDL_Surface = undefined;
pub var chits_surface: ?*c.SDL_Surface = undefined;
// ***
