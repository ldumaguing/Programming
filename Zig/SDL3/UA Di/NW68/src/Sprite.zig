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
    };
}

// **********
pub fn render(self: *Sprite) void {
    //          // ********************************************************************************************
    //          // ********************************************************************************************
    //          var width: f32 = @as(f32, @floatFromInt(g.desktop_dim.*.w)) / g.scale;
    //          var width_int: i32 = @as(i32, @intFromFloat(width));
    //          var height: f32 = @as(f32, @floatFromInt(g.desktop_dim.*.h)) / g.scale;
    //          var height_int: i32 = @as(i32, @intFromFloat(height));

    //          // ***** too much shrinkage; undo
    //          if ((width_int > self.surface.w) or (height_int > self.surface.h)) {
    //              // if (g.scale_rank < -3) {
    //              g.scale_rank = g.scale_rank_prev;
    //              g.scale = g.scale_prev;

    //              width = @as(f32, @floatFromInt(g.desktop_dim.*.w)) / g.scale;
    //              width_int = @as(i32, @intFromFloat(width));
    //              height = @as(f32, @floatFromInt(g.desktop_dim.*.h)) / g.scale;
    //              height_int = @as(i32, @intFromFloat(height));
    //          }

    // *** create a clippage storage surface
    const clippage_surface: *c.SDL_Surface = c.SDL_CreateSurface(self.size, self.size, c.SDL_PIXELFORMAT_RGBA8888);
    defer c.SDL_DestroySurface(clippage_surface);

    //          // *** scaling
    //          if (g.scale_rank != g.scale_rank_prev) {
    //              const scale_prev_x = g.window_center_x - (g.window_center_x / g.scale_prev);
    //              const scale_prev_y = g.window_center_y - (g.window_center_y / g.scale_prev);
    //              const scale_x = g.window_center_x - (g.window_center_x / g.scale);
    //              const scale_y = g.window_center_y - (g.window_center_y / g.scale);
    //              self.x = self.x - scale_prev_x + scale_x;
    //              self.y = self.y - scale_prev_y + scale_y;
    //          }

    // *** define a clipping square
    var clipping_rect: c.SDL_Rect = undefined;
    clipping_rect.x = 0;
    clipping_rect.y = 0;
    clipping_rect.w = self.size;
    clipping_rect.h = self.size;

    // *** clip a map area and store it in the clippage storage surface
    _ = c.SDL_BlitSurface(g.chits_surface, &clipping_rect, clippage_surface, null);

    // *** convert the surface to a texture
    const clipped_texture = c.SDL_CreateTextureFromSurface(g.renderer, clippage_surface);
    defer c.SDL_DestroyTexture(clipped_texture);

    var dst_rect: c.SDL_FRect = undefined;
    dst_rect.x = 0.0;
    dst_rect.y = 0.0;
    dst_rect.w = 150.0;
    dst_rect.h = 150.0;

    // *** render the whole (null) texture
    _ = c.SDL_RenderTexture(g.renderer, clipped_texture, null, &dst_rect);
}
