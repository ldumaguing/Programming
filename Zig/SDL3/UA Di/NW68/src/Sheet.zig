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
sheet: *c.SDL_Texture,
stretch_x: f32,
stretch_y: f32,
scale_x: f32,
scale_y: f32,
loc_x: f32,
loc_y: f32,

// ****************************************************************************
const Sheet = @This();

// ****************************************************************************
pub fn bindTexture2Sheet(id: i32, sheet: ?*c.SDL_Texture) Sheet {
    return .{
        .id = id,
        .sheet = @ptrCast(sheet),
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
    var dst_rect: c.SDL_FRect = undefined;
    if ((self.stretch_x <= 0.0) or (self.stretch_y <= 0.0)) { // if stretch varibles are negative, use scaling.
        dst_rect.h = @as(f32, @floatFromInt(self.sheet.h)) * self.scale_y;
        dst_rect.w = @as(f32, @floatFromInt(self.sheet.w)) * self.scale_x;
    } else {
        dst_rect.h = self.stretch_y;
        dst_rect.w = self.stretch_x;
    }
    dst_rect.x = self.loc_x;
    dst_rect.y = self.loc_y;
    _ = c.SDL_RenderTexture(renderer, self.sheet, null, &dst_rect);
}
