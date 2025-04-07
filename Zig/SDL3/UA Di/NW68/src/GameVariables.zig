const std = @import("std");
const print = @import("std").debug.print;
const mvzr = @import("mvzr.zig");
const Sheet = @import("Sheet.zig");
const Sprite = @import("Sprite.zig");

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
pub var desktop_dim: [*c]c.SDL_DisplayMode = undefined;

pub var scale_rank: i32 = 0;
pub var scale_rank_prev: i32 = 0;
pub var scale: f32 = 1.0;
pub var scale_prev: f32 = 1.0;

pub var scroll_spd: i32 = 1;
pub var window_center_x: f32 = 0.0;
pub var window_center_y: f32 = 0.0;

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

// *************** Surface
pub var mapboard_surface: ?*c.SDL_Surface = undefined;
pub var chits_surface: ?*c.SDL_Surface = undefined;

// *************** Sheet (is a texture with stuff.)
pub var mapboard_sheet: Sheet = undefined;

// *************** Sprites
pub var aSprite: Sprite = undefined;

// ***
