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
    if (m.gScale >= 0) {
        gscale = 1.0 + @as(f32, @floatFromInt(m.gScale));
    } else {
        gscale = 1.0 / (1.0 - @as(f32, @floatFromInt(m.gScale)));
    }

    // var dst_rect: c.SDL_FRect = undefined;
    // if ((self.stretch_x <= 0.0) or (self.stretch_y <= 0.0)) { // if stretch varibles are negative, use scaling.
    //     dst_rect.h = @as(f32, @floatFromInt(self.texture.h)) * self.scale_y * gscale;
    //     dst_rect.w = @as(f32, @floatFromInt(self.texture.w)) * self.scale_x * gscale;
    // } else {
    //     dst_rect.h = self.stretch_y;
    //     dst_rect.w = self.stretch_x;
    // }
    // dst_rect.x = self.loc_x;
    // dst_rect.y = self.loc_y;
    // _ = c.SDL_RenderTexture(renderer, self.texture, null, &dst_rect);

    var src_rect: c.SDL_FRect = undefined;
    var dst_rect: c.SDL_FRect = undefined;

    src_rect.x = self.loc_x;
    src_rect.y = self.loc_y;
    src_rect.w = m.WINDOW_WIDTH / gscale;
    src_rect.h = m.WINDOW_HEIGHT / gscale;

    print("{}, {}\n", .{ self.loc_x, self.loc_y });
    if (self.loc_x >= 0) {
        dst_rect.x = 0;
        dst_rect.w = m.WINDOW_WIDTH;
    } else {
        dst_rect.x = 0 - self.loc_x;
        dst_rect.w = m.WINDOW_WIDTH + self.loc_x;
    }

    if (self.loc_y >= 0) {
        dst_rect.y = 0;
        dst_rect.h = m.WINDOW_HEIGHT;
    } else {
        dst_rect.y = 0 - self.loc_y;
        dst_rect.h = m.WINDOW_HEIGHT + self.loc_y;
    }

    _ = c.SDL_RenderTexture(renderer, self.texture, &src_rect, &dst_rect);
}
