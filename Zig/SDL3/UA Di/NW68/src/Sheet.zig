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
x_prev: f32,
y_prev: f32,

// ****************************************************************************
const Sheet = @This();

// ****************************************************************************
pub fn bind_Surface_Sheet(id: i32, surface: ?*c.SDL_Surface) Sheet {
    return .{
        .id = id,
        .surface = @ptrCast(surface),
        .x = 0.0,
        .y = 0.0,
        .x_prev = 0.0,
        .y_prev = 0.0,
    };
}

// **********
pub fn render(self: *Sheet) void {
    // var dst_rect: c.SDL_FRect = undefined;

    // if (m.gScale_prev != m.gScale_mult) {
    //     const orig_len_x: f32 = (m.WINDOW_CENTER_X - m.boardgame_sheet.loc_x) / m.gScale_prev;
    //     const orig_len_y: f32 = (m.WINDOW_CENTER_Y - m.boardgame_sheet.loc_y) / m.gScale_prev;
    //     m.boardgame_sheet.loc_x = m.WINDOW_CENTER_X - (orig_len_x * m.gScale_mult);
    //     m.boardgame_sheet.loc_y = m.WINDOW_CENTER_Y - (orig_len_y * m.gScale_mult);

    //     dst_rect.h = @as(f32, @floatFromInt(self.texture.h)) * m.gScale_mult;
    //     dst_rect.w = @as(f32, @floatFromInt(self.texture.w)) * m.gScale_mult;
    // } else {
    //     dst_rect.h = @as(f32, @floatFromInt(self.texture.h)) * m.gScale_mult;
    //     dst_rect.w = @as(f32, @floatFromInt(self.texture.w)) * m.gScale_mult;
    // }

    // dst_rect.x = self.loc_x;
    // dst_rect.y = self.loc_y;

    // ********************************************************************************************
    // ********************************************************************************************
    var width: f32 = @as(f32, @floatFromInt(g.desktop_dim.*.w)) / g.scale;
    var width_int: i32 = @as(i32, @intFromFloat(width));
    var height: f32 = @as(f32, @floatFromInt(g.desktop_dim.*.h)) / g.scale;
    var height_int: i32 = @as(i32, @intFromFloat(height));

    // ***** too much shrinkage; undo
    if ((width_int > self.surface.w) or (height_int > self.surface.h)) {
        g.scale_rank = g.scale_rank_prev;
        g.scale = g.scale_prev;

        width = @as(f32, @floatFromInt(g.desktop_dim.*.w)) / g.scale;
        width_int = @as(i32, @intFromFloat(width));
        height = @as(f32, @floatFromInt(g.desktop_dim.*.h)) / g.scale;
        height_int = @as(i32, @intFromFloat(height));
    }

    // *** create a clippage storage surface
    const clippage_surface: *c.SDL_Surface = c.SDL_CreateSurface(width_int, height_int, c.SDL_PIXELFORMAT_RGBA8888);
    defer c.SDL_DestroySurface(clippage_surface);

    // ============================================================================================
    if (g.scale_rank != g.scale_rank_prev) {
        print("{d} ---> {d}\n", .{ g.scale_rank_prev, g.scale_rank });
        print("{d} ---> {d}\n", .{ g.scale_prev, g.scale });
        print(".{d}, {d}\n", .{ self.x, self.y });
        const orig_len_x: f32 = (g.window_center_x + self.x) * g.scale_prev;
        const orig_len_y: f32 = (g.window_center_y + self.y) * g.scale_prev;
        print("orig_len: {d}, {d}\n", .{ orig_len_x, orig_len_y });
        print("center: {d}, {d}\n", .{g.window_center_x, g.window_center_y});
        // ***     const len_x: f32 = (g.window_center_x - self.x) * g.scale;
        // ***     const len_y: f32 = (g.window_center_y - self.y) * g.scale;
        // ***     print("scale: {d}\n", .{g.scale});

        // ***     print(">{d}, {d}\n", .{ len_x, len_y });

        // ***     //const x_ = g.window_center_x - (orig_len_x * g.scale);
        // ***     //const y_ = g.window_center_y - (orig_len_y * g.scale);
        // ***     //print(":{d}, {d}\n", .{ x_, y_ });

        print("\n", .{});
    }
    // ============================================================================================

    // *** define a clipping rectangle
    var clipping_rect: c.SDL_Rect = undefined;
    clipping_rect.x = @as(i32, @intFromFloat(self.x)) + 0;
    clipping_rect.y = @as(i32, @intFromFloat(self.y)) + 0;
    clipping_rect.w = width_int;
    clipping_rect.h = height_int;

    // *** clip a map area and store it in the clippage storage surface
    _ = c.SDL_BlitSurface(g.mapboard_surface, &clipping_rect, clippage_surface, null);

    // *** convert the surface to a texture
    const clipped_texture = c.SDL_CreateTextureFromSurface(g.renderer, clippage_surface);
    defer c.SDL_DestroyTexture(clipped_texture);

    // *** render the whole (null) texture
    _ = c.SDL_RenderTexture(g.renderer, clipped_texture, null, null);
}
