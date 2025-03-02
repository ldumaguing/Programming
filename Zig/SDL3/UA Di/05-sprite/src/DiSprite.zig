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
pub fn render_scale_rotate(self: *DiSprite, x: f32, y: f32, opts: [3]f32) void {
    // opts[0] is w; opts[1] is h; opts[2] is degrees
    var dst_rect: c.SDL_FRect = undefined;
    dst_rect.h = self.clippage.h * opts[1];
    dst_rect.w = self.clippage.w * opts[0];
    dst_rect.x = x;
    dst_rect.y = y;
    _ = c.SDL_RenderTextureRotated(m.gRenderer, self.sprite_sheet.texture, &self.clippage, &dst_rect, opts[2], null, 0);
}

// **********
pub fn render_scale(self: *DiSprite, x: f32, y: f32, scale: [2]f32) void {
    // scale[0] is w; scale[1] is h
    var dst_rect: c.SDL_FRect = undefined;
    dst_rect.h = self.clippage.h * scale[1];
    dst_rect.w = self.clippage.w * scale[0];
    dst_rect.x = x;
    dst_rect.y = y;
    _ = c.SDL_RenderTexture(m.gRenderer, self.sprite_sheet.texture, &self.clippage, &dst_rect);
}

// **********
pub fn render_stretch(self: *DiSprite, x: f32, y: f32, stretch: [2]f32) void {
    // stretch[0] is w; stretch[1] is h
    var dst_rect: c.SDL_FRect = undefined;
    dst_rect.h = stretch[1];
    dst_rect.w = stretch[0];
    dst_rect.x = x;
    dst_rect.y = y;
    _ = c.SDL_RenderTexture(m.gRenderer, self.sprite_sheet.texture, &self.clippage, &dst_rect);
}

// **********
pub fn render(self: *DiSprite, x: f32, y: f32) void {
    var dst_rect: c.SDL_FRect = undefined;
    dst_rect.h = self.clippage.h;
    dst_rect.w = self.clippage.w;
    dst_rect.x = x;
    dst_rect.y = y;
    _ = c.SDL_RenderTexture(m.gRenderer, self.sprite_sheet.texture, &self.clippage, &dst_rect);
}
