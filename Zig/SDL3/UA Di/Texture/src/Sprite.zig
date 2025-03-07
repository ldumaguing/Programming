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

// ****************************************************************************
id: i32,
sprite_sheet: *c.SDL_Texture,
sprite0: c.SDL_FRect, // first chippage for the sprite
stretch_x: f32,
stretch_y: f32,
scale_x: f32,
scale_y: f32,
flip: c.SDL_FlipMode,
center: c.SDL_FPoint,
is_default_center: bool,
angle: f32,
frame_count: i32,
frame_current: i32,
loc_x: f32,
loc_y: f32,

// ****************************************************************************
const Sprite = @This();

// ****************************************************************************
pub fn new(id: i32, sprite_sheet: ?*c.SDL_Texture, sprite0: c.SDL_FRect, frame_count: i32) Sprite {
    const center: c.SDL_FPoint = .{ .x = 0.0, .y = 0.0 };
    return .{
        .id = id,
        .sprite_sheet = @ptrCast(sprite_sheet),
        .sprite0 = sprite0,
        .stretch_x = -1.0,
        .stretch_y = -1.0,
        .scale_x = 1.0,
        .scale_y = 1.0,
        .flip = c.SDL_FLIP_NONE,
        .center = center,
        .is_default_center = true,
        .angle = 0.0,
        .frame_count = frame_count,
        .frame_current = 0,
        .loc_x = 0.0,
        .loc_y = 0.0,
    };
}

// **********
pub fn animate(self: *Sprite, renderer: ?*c.SDL_Renderer) void {
    var tick: i32 = @as(i32, @intCast(c.SDL_GetTicks() / 125));
    tick = @mod(tick, self.frame_count);
    self.frame_current = tick;
    // self.render(renderer, 0.0, 0.0);
    const w = self.sprite0.w * @as(f32, @floatFromInt(tick));

    var dst_rect: c.SDL_FRect = undefined;
    if ((self.stretch_x <= 0.0) or (self.stretch_y <= 0.0)) { // if stretch varibles are negative, use scaling.
        dst_rect.h = self.sprite0.h * self.scale_y;
        dst_rect.w = self.sprite0.w * self.scale_x;
    } else {
        dst_rect.h = self.stretch_y;
        dst_rect.w = self.stretch_x;
    }
    dst_rect.x = self.loc_x;
    dst_rect.y = self.loc_y;

    var src_rect: c.SDL_FRect = undefined;
    src_rect.h = self.sprite0.h;
    src_rect.w = self.sprite0.w;
    src_rect.x = self.sprite0.x + w;
    src_rect.y = 0.0;
    if (self.is_default_center) {
        _ = c.SDL_RenderTextureRotated(renderer, self.sprite_sheet, &src_rect, &dst_rect, self.angle, null, self.flip);
    } else {
        _ = c.SDL_RenderTextureRotated(renderer, self.sprite_sheet, &src_rect, &dst_rect, self.angle, &self.center, self.flip);
    }
}

// **********
pub fn render(self: *Sprite, renderer: ?*c.SDL_Renderer) void {
    var dst_rect: c.SDL_FRect = undefined;
    if ((self.stretch_x <= 0.0) or (self.stretch_y <= 0.0)) { // if stretch varibles are negative, use scaling.
        dst_rect.h = self.sprite0.h * self.scale_y;
        dst_rect.w = self.sprite0.w * self.scale_x;
    } else {
        dst_rect.h = self.stretch_y;
        dst_rect.w = self.stretch_x;
    }
    dst_rect.x = self.loc_x;
    dst_rect.y = self.loc_y;
    if (self.is_default_center) {
        _ = c.SDL_RenderTextureRotated(renderer, self.sprite_sheet, &self.sprite0, &dst_rect, self.angle, null, self.flip);
    } else {
        _ = c.SDL_RenderTextureRotated(renderer, self.sprite_sheet, &self.sprite0, &dst_rect, self.angle, &self.center, self.flip);
    }
}
