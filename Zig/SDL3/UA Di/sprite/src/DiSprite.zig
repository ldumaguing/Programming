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
stretch_x: f32,
stretch_y: f32,
scale_x: f32,
scale_y: f32,
flip: c.SDL_FlipMode,
center: c.SDL_FPoint,
angle: f32,

// ****************************************************************************
const DiSprite = @This();

// ****************************************************************************
pub fn new(id: i32, sprite_sheet: *DiTexture, clippage: c.SDL_FRect) DiSprite {
    return .{
        .id = id,
        .sprite_sheet = sprite_sheet,
        .clippage = clippage,
        .stretch_x = -1.0,
        .stretch_y = -1.0,
        .scale_x = 1.0,
        .scale_y = 1.0,
        .flip = c.SDL_FLIP_NONE,
        .center = null,
        .angle = 0.0,
    };
}

// **********
pub fn render2(self: *DiSprite, x: f32, y: f32) void {
    var dst_rect: c.SDL_FRect = undefined;
    if ((self.stretch_x <= 0.0) or (self.stretch_y <= 0.0)) {
        dst_rect.h = self.clippage.h * self.scale_y;
        dst_rect.w = self.clippage.w * self.scale_x;
    } else {
        dst_rect.h = self.stretch_y;
        dst_rect.w = self.stretch_x;
    }
    dst_rect.x = x;
    dst_rect.y = y;
    _ = c.SDL_RenderTextureRotated(m.gRenderer, self.sprite_sheet.texture, &self.clippage, &dst_rect, self.angle, &self.center, self.flip);
}

// **********
pub fn render_scale_rotate_center_flip(self: *DiSprite, x: f32, y: f32, opts: [3]f32, center: c.SDL_FPoint, flip: c.SDL_FlipMode) void {
    // opts[0] is w; opts[1] is h; opts[2] is degrees
    var dst_rect: c.SDL_FRect = undefined;
    dst_rect.h = self.clippage.h * opts[1];
    dst_rect.w = self.clippage.w * opts[0];
    dst_rect.x = x;
    dst_rect.y = y;
    _ = c.SDL_RenderTextureRotated(m.gRenderer, self.sprite_sheet.texture, &self.clippage, &dst_rect, opts[2], &center, flip);
}

// **********
pub fn render_scale_rotate_center(self: *DiSprite, x: f32, y: f32, opts: [3]f32, center: c.SDL_FPoint) void {
    // opts[0] is w; opts[1] is h; opts[2] is degrees
    var dst_rect: c.SDL_FRect = undefined;
    dst_rect.h = self.clippage.h * opts[1];
    dst_rect.w = self.clippage.w * opts[0];
    dst_rect.x = x;
    dst_rect.y = y;
    _ = c.SDL_RenderTextureRotated(m.gRenderer, self.sprite_sheet.texture, &self.clippage, &dst_rect, opts[2], &center, 0);
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
