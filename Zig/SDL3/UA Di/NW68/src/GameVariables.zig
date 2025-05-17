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
pub var desktop_w: f32 = 0.0;
pub var desktop_h: f32 = 0.0;

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
pub var mapboard_clip_w: i32 = 0;
pub var mapboard_clip_h: i32 = 0;
pub var chits_surface: ?*c.SDL_Surface = undefined;
pub var arrow_surface: ?*c.SDL_Surface = undefined;

// *************** Sheet (is a texture with stuff.)
pub var mapboard_sheet: Sheet = undefined;

// *************** Sprites
pub var aSprite: Sprite = undefined;

// *************** Mapboard info
pub const ZERO_ZERO = [_]i32{ 293, 141 };
pub var Hex_Dim = [_]f64{ 0.0, 0.0 };
pub var Half_Hex_Y: f32 = 0.0;

// *************** Bits
pub const bit_0 = 1 << 0;
pub const bit_1 = 1 << 1;
pub const bit_2 = 1 << 2;
pub const bit_3 = 1 << 3;
pub const bit_4 = 1 << 4;
pub const bit_5 = 1 << 5;
pub const bit_6 = 1 << 6;
pub const bit_7 = 1 << 7;

pub const bit_8 = 1 << 8;
pub const bit_9 = 1 << 9;
pub const bit_10 = 1 << 10;
pub const bit_11 = 1 << 11;
pub const bit_12 = 1 << 12;
pub const bit_13 = 1 << 13;
pub const bit_14 = 1 << 14;
pub const bit_15 = 1 << 15;

pub const bit_16 = 1 << 16;
pub const bit_17 = 1 << 17;
pub const bit_18 = 1 << 18;
pub const bit_19 = 1 << 19;
pub const bit_20 = 1 << 20;
pub const bit_21 = 1 << 21;
pub const bit_22 = 1 << 22;
pub const bit_23 = 1 << 23;
