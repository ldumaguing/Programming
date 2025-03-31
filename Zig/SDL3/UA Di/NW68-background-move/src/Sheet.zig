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

// ****************************************************************************
const Sheet = @This();

// ****************************************************************************
pub fn bind_Surface_Sheet(id: i32, surface: ?*c.SDL_Surface) Sheet {
    return .{
        .id = id,
        .surface = @ptrCast(surface),
        .x = 0.0,
        .y = 0.0,
    };
}

// **********
pub fn render(self: *Sheet) void {
    print("yo: {d}, {d}\n", .{ self.x, self.y });
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

    const store_clippage_surface: *c.SDL_Surface = c.SDL_CreateSurface(g.desktop_dim.*.w, g.desktop_dim.*.h, c.SDL_PIXELFORMAT_RGBA8888);
    defer c.SDL_DestroySurface(store_clippage_surface);

    var src_rect: c.SDL_Rect = undefined;
    src_rect.x = @intFromFloat(self.x);
    src_rect.y = @intFromFloat(self.y);
    src_rect.w = g.desktop_dim.*.w;
    src_rect.h = g.desktop_dim.*.h;

    _ = c.SDL_BlitSurface(g.mapboard_surface, &src_rect, store_clippage_surface, null);
    const clipped_texture = c.SDL_CreateTextureFromSurface(g.renderer, store_clippage_surface);
    defer c.SDL_DestroyTexture(clipped_texture);

    _ = c.SDL_RenderTexture(g.renderer, clipped_texture, null, null);

    // const texture = c.SDL_CreateTextureFromSurface(g.renderer, self.surface);
    //defer c.SDL_DestroyTexture(texture);
    //_ = c.SDL_RenderTexture(g.renderer, texture, null, null);
}
