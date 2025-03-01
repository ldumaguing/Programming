const std = @import("std");
const print = @import("std").debug.print;

const c = @cImport({
    @cDefine("SDL_DISABLE_OLD_NAMES", {});
    @cInclude("SDL3/SDL.h");
    @cInclude("SDL3/SDL_revision.h");
    @cDefine("SDL_MAIN_HANDLED", {});
    @cInclude("SDL3/SDL_main.h");
    @cInclude("SDL3_image/SDL_image.h");
});

const m = @import("main.zig");
const DiTexture = @import("DiTexture.zig");

// ****************************************************************************
id: i32,
sprite_sheet: *DiTexture,
clippage: c.SDL_FRect,

// ****************************************************************************
const DiSprite = @This();

// ****************************************************************************
pub fn new(id: i32, sprite_sheet: *DiTexture, clippage: c.SDL_FRect) DiSprite {
    return .{ .id = id, .sprite_sheet = sprite_sheet, .clippage = clippage };
}

// **********
pub fn render_stretch(self: *DiSprite, x: f32, y: f32, stretch: [2]f32) void {
    // stretch[0] is w; stretch[1] is h
    _ = self.sprite_sheet.render_stretch(x, y, self.clippage, stretch);
}

// **********
pub fn render(self: *DiSprite, x: f32, y: f32) void {
    _ = self.sprite_sheet.render_sprite(x, y, self.clippage);
}
