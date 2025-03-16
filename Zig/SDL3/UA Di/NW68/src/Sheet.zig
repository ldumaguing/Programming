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
texture: *c.SDL_Texture,
stretch_x: f32,
stretch_y: f32,
scale_x: f32,
scale_y: f32,
loc_x: f32,
loc_y: f32,

// ****************************************************************************
const Sheet = @This();

// ****************************************************************************
pub fn bindTexture2Sheet(id: i32, texture: ?*c.SDL_Texture) Sheet {
    return .{
        .id = id,
        .texture = @ptrCast(texture),
        .stretch_x = -1.0,
        .stretch_y = -1.0,
        .scale_x = 1.0,
        .scale_y = 1.0,
        .loc_x = 0.0,
        .loc_y = 0.0,
    };
}

// **********
pub fn render(self: *Sheet, renderer: ?*c.SDL_Renderer) void {
    var gscale: f32 = 0.0;
    var gscale_prev: f32 = 0.0;

    if (m.gScale >= 0) {
        gscale = 1.0 + @as(f32, @floatFromInt(m.gScale));
        if (m.gScale != m.gScale_prev) {
            print("a", .{});
            if ((m.gScale_prev == -1) and (m.gScale == 0)) {
                print("b", .{});
                gscale_prev = 1.0 / (1.0 - (@as(f32, @floatFromInt(m.gScale_prev)) * 0.25));
            } else {
                print("c", .{});
                if (m.gScale > m.gScale_prev) {
                    print("d", .{});
                    gscale_prev = @as(f32, @floatFromInt(m.gScale));
                } else {
                    print("e", .{});
                    gscale_prev = gscale + 1.0;
                }
            }
            const orig_len_x: f32 = (m.WINDOW_CENTER_X - m.boardgame_sheet.loc_x) / gscale_prev;
            const orig_len_y: f32 = (m.WINDOW_CENTER_Y - m.boardgame_sheet.loc_y) / gscale_prev;
            m.boardgame_sheet.loc_x = m.WINDOW_CENTER_X - (orig_len_x * gscale);
            m.boardgame_sheet.loc_y = m.WINDOW_CENTER_Y - (orig_len_y * gscale);
            print("\n", .{});
        }
    } else {
        gscale = 1.0 / (1.0 - (@as(f32, @floatFromInt(m.gScale)) * 0.25));
        if (m.gScale != m.gScale_prev) {
            print("A", .{});
            gscale_prev = 1.0 / (1.0 - (@as(f32, @floatFromInt(m.gScale_prev)) * 0.25));
            const orig_len_x: f32 = (m.WINDOW_CENTER_X - m.boardgame_sheet.loc_x) / gscale_prev;
            const orig_len_y: f32 = (m.WINDOW_CENTER_Y - m.boardgame_sheet.loc_y) / gscale_prev;
            m.boardgame_sheet.loc_x = m.WINDOW_CENTER_X - (orig_len_x * gscale);
            m.boardgame_sheet.loc_y = m.WINDOW_CENTER_Y - (orig_len_y * gscale);
        }
        print("\n", .{});
    }

    var dst_rect: c.SDL_FRect = undefined;
    if ((self.stretch_x <= 0.0) or (self.stretch_y <= 0.0)) { // if stretch varibles are negative, use scaling.
        dst_rect.h = @as(f32, @floatFromInt(self.texture.h)) * self.scale_y * gscale;
        dst_rect.w = @as(f32, @floatFromInt(self.texture.w)) * self.scale_x * gscale;
    } else {
        dst_rect.h = self.stretch_y;
        dst_rect.w = self.stretch_x;
    }
    dst_rect.x = self.loc_x;
    dst_rect.y = self.loc_y;
    _ = c.SDL_RenderTexture(renderer, self.texture, null, &dst_rect);
}
