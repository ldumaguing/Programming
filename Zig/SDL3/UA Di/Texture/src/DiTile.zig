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
tile_sheet: *DiTexture,
clippage: c.SDL_FRect, // defines a Tile
stretch_x: f32,
stretch_y: f32,
scale_x: f32,
scale_y: f32,
flip: c.SDL_FlipMode,
center: c.SDL_FPoint,
is_default_center: bool,
angle: f32,

// ****************************************************************************
const DiTile = @This();

// ****************************************************************************
pub fn new(id: i32, tile_sheet: *DiTexture, clippage: c.SDL_FRect) DiTile {
    const center: c.SDL_FPoint = .{ .x = 0.0, .y = 0.0 };
    return .{
        .id = id,
        .tile_sheet = tile_sheet,
        .clippage = clippage,
        .stretch_x = -1.0,
        .stretch_y = -1.0,
        .scale_x = 1.0,
        .scale_y = 1.0,
        .flip = c.SDL_FLIP_NONE,
        .center = center,
        .is_default_center = true,
        .angle = 0.0,
    };
}

// **********
pub fn render(self: *DiTile, x: f32, y: f32) void {
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
    if (self.is_default_center) {
        _ = c.SDL_RenderTextureRotated(m.gRenderer, self.tile_sheet.texture, &self.clippage, &dst_rect, self.angle, null, self.flip);
    } else {
        _ = c.SDL_RenderTextureRotated(m.gRenderer, self.tile_sheet.texture, &self.clippage, &dst_rect, self.angle, &self.center, self.flip);
    }
}
