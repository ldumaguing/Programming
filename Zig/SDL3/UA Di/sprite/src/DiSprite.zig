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
stretch_x: f32,
stretch_y: f32,
scale_x: f32,
scale_y: f32,
flip: c.SDL_FlipMode,
center: c.SDL_FPoint,
is_default_center: bool,
angle: f32,
frames: i32, // defines a number of frames a sprite have in a row
frame_dim: c.SDL_FPoint, // defines the frame's dimentions (w, h)
frame_curr: i32,
tock: u64,

// ****************************************************************************
const DiSprite = @This();

// ****************************************************************************
pub fn new(id: i32, sprite_sheet: *DiTexture, frame_dim: c.SDL_FPoint) DiSprite {
    const center: c.SDL_FPoint = .{ .x = 0.0, .y = 0.0 };
    return .{
        .id = id,
        .sprite_sheet = sprite_sheet,
        .stretch_x = -1.0,
        .stretch_y = -1.0,
        .scale_x = 1.0,
        .scale_y = 1.0,
        .flip = c.SDL_FLIP_NONE,
        .center = center,
        .is_default_center = true,
        .angle = 0.0,
        .frames = 1,
        .frame_dim = frame_dim,
        .frame_curr = 0,
        .tock = 0,
    };
}

// **********
pub fn render(self: *DiSprite, x: f32, y: f32) void {
    if ((m.tick - self.tock) >= 100) {
        self.frame_curr += 1;
        self.frame_curr = @mod(self.frame_curr, 4);
        self.tock = m.tick;
    }

    var dst_rect: c.SDL_FRect = undefined;
    dst_rect.h = self.frame_dim.y;
    dst_rect.w = self.frame_dim.x;
    dst_rect.x = x;
    dst_rect.y = y;

    var clippage: c.SDL_FRect = undefined;
    clippage.h = self.frame_dim.y;
    clippage.w = self.frame_dim.x;
    clippage.x = self.frame_dim.x * @as(f32, @floatFromInt(self.frame_curr));
    clippage.y = 0.0;

    if (self.is_default_center) {
        _ = c.SDL_RenderTextureRotated(m.gRenderer, self.sprite_sheet.texture, &clippage, &dst_rect, self.angle, null, self.flip);
    } else {
        _ = c.SDL_RenderTextureRotated(m.gRenderer, self.sprite_sheet.texture, &clippage, &dst_rect, self.angle, &self.center, self.flip);
    }
}
