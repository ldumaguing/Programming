const std = @import("std");
const print = @import("std").debug.print;
const g = @import("GameVariables.zig");

const c = @cImport({
    @cDefine("SDL_DISABLE_OLD_NAMES", {});
    @cInclude("SDL3/SDL.h");
    @cInclude("SDL3/SDL_revision.h");
    @cDefine("SDL_MAIN_HANDLED", {});
    @cInclude("SDL3/SDL_main.h");
    @cInclude("SDL3_image/SDL_image.h");
});

// ****************************************************************************
id: i32,
surface: *c.SDL_Surface,
x: f32,
y: f32,
index: i32,
size: i32,
hex_loc: [2]i32,

// ****************************************************************************
const Sprite = @This();

// ****************************************************************************
pub fn bind_Surface_Sprite(id: i32, surface: ?*c.SDL_Surface, index: i32, size: i32) Sprite {
    return .{
        .id = id,
        .surface = @ptrCast(surface),
        .x = 0.0,
        .y = 0.0,
        .index = index,
        .size = size,
        .hex_loc = .{ 0, 0 },
    };
}

// **********
pub fn set_HexID(self: *Sprite, x: i32, y: i32) void {
    self.hex_loc[0] = x;
    self.hex_loc[1] = y;

    self.x = @floatCast(@as(f64, @floatFromInt(g.ZERO_ZERO[0])) + (@as(f64, @floatFromInt(x)) * g.Hex_Dim[0]));
    self.y = @floatCast(@as(f64, @floatFromInt(g.ZERO_ZERO[1])) + (@as(f64, @floatFromInt(y)) * g.Hex_Dim[1]));
    if (@mod(x, 2) != 0) {
        self.y += g.Half_Hex_Y;
    }
    //print(">>>>>{d},{d}\n", .{ self.x, self.y });
    //self.y = g.ZERO_ZERO[1] + (y * g.Hex_Dim[1]);
}

// **********
pub fn render(self: *Sprite) void {
    // *** create a clippage storage surface
    const clippage_surface: *c.SDL_Surface = c.SDL_CreateSurface(self.size, self.size, c.SDL_PIXELFORMAT_RGBA8888);
    defer c.SDL_DestroySurface(clippage_surface);

    // *** define a clipping square
    var clipping_rect: c.SDL_Rect = undefined;
    clipping_rect.x = 0;
    clipping_rect.y = self.index * self.size;
    clipping_rect.w = self.size;
    clipping_rect.h = self.size;

    // *** clip a map area and store it in the clippage storage surface
    _ = c.SDL_BlitSurface(g.chits_surface, &clipping_rect, clippage_surface, null);

    // *** convert the surface to a texture
    const clipped_texture = c.SDL_CreateTextureFromSurface(g.renderer, clippage_surface);
    defer c.SDL_DestroyTexture(clipped_texture);

    // *** create silly putty rect
    var dst_rect: c.SDL_FRect = undefined;
    dst_rect.x = (self.x * g.scale) - (g.mapboard_sheet.x * g.scale);
    dst_rect.y = (self.y * g.scale) - (g.mapboard_sheet.y * g.scale);
    dst_rect.w = @as(f32, @floatFromInt(self.size)) * g.scale;
    dst_rect.h = @as(f32, @floatFromInt(self.size)) * g.scale;

    // *** don't render if out of screen
    if (self.x < g.mapboard_sheet.x) {
        const right_most = self.x + @as(f32, @floatFromInt(self.size));
        if (right_most < g.mapboard_sheet.x) {
            return;
        }
    }
    if (self.y < g.mapboard_sheet.y) {
        const bottom_most = self.y + @as(f32, @floatFromInt(self.size));
        if (bottom_most < g.mapboard_sheet.y) {
            return;
        }
    }
    if (@as(f32, @floatFromInt(g.mapboard_clip_w)) + g.mapboard_sheet.x < self.x) {
        return;
    }
    if (@as(f32, @floatFromInt(g.mapboard_clip_h)) + g.mapboard_sheet.y < self.y) {
        return;
    }

    // *** render the whole (null) texture with silly putty
    _ = c.SDL_RenderTexture(g.renderer, clipped_texture, null, &dst_rect);
}
