const std = @import("std");
const gv = @import("GlobalVariables.zig");
const print = @import("std").debug.print;
const m = @import("main.zig");

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
img_index: i32,
hex_ID: [2]i32,

// ****************************************************************************
pub const Chit = @This();

// ****************************************************************************
pub fn new(id: i32, img_index: i32, hex_ID: [2]i32) Chit {
    return .{
        .id = id,
        .img_index = img_index,
        .hex_ID = hex_ID,
    };
}

pub fn render(self: *Chit) void {
    // ***** create a surface
    const a_surf: *c.SDL_Surface = c.SDL_CreateSurface(gv.chit_square_dim, gv.chit_square_dim, c.SDL_PIXELFORMAT_RGBA8888);
    defer c.SDL_DestroySurface(a_surf);

    // ***** clip one chit and put it on the surface
    var a_rect: c.SDL_Rect = undefined;
    a_rect.x = 0;
    a_rect.y = self.index * gv.chit_square_dim;
    a_rect.w = gv.chit_square_dim;
    a_rect.h = gv.chit_square_dim;
    _ = c.SDL_BlitSurface(@ptrCast(m.chits_surface), &a_rect, a_surf, null); // no scaling. the target surface truncates.

    // convert the surface to a texture
    const a_texture = c.SDL_CreateTextureFromSurface(@ptrCast(m.renderer), a_surf);
    defer c.SDL_DestroyTexture(a_texture);

    // define a silly puddy rectangle and render it
    var a_rectness: c.SDL_FRect = undefined;
    const hex_ID_x: i32 = @intFromFloat(@as(f64, @floatFromInt(self.hex_ID[0])) * gv.Hex_Dim_ness[0]);
    const hex_ID_y: i32 = @intFromFloat(@as(f64, @floatFromInt(self.hex_ID[1])) * gv.Hex_Dim_ness[1]);
    const x: f32 = @as(f32, @floatFromInt(gv.Zero_Zero[0] - gv.map_loc[0] + hex_ID_x)) / gv.scaleness;
    var y: f32 = 0.0;
    if (@mod(self.hex_ID[0], 2) == 0) {
        y = @as(f32, @floatFromInt(gv.Zero_Zero[1] - gv.map_loc[1] + hex_ID_y)) / gv.scaleness;
    } else {
        y = @as(f32, @floatFromInt(gv.Zero_Zero[1] - gv.map_loc[1] + hex_ID_y + @as(i32, @intFromFloat(gv.Half_Hex_Y_ness)))) / gv.scaleness;
    }

    const w_h_ness: f32 = @as(f32, @floatFromInt(gv.chit_square_dim)) / gv.scaleness;
    a_rectness.x = x;
    a_rectness.y = y;
    a_rectness.w = w_h_ness;
    a_rectness.h = w_h_ness;
    if ((x + w_h_ness) < 0) return;
    if (x > gv.window_w) return;
    if ((y + w_h_ness) < 0) return;
    if (y > gv.window_h) return;
    _ = c.SDL_RenderTexture(@ptrCast(m.renderer), a_texture, null, &a_rectness);
}
