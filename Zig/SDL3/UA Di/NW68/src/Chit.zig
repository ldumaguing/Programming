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
w_h: i32,
chit_num: i32,
hex_x: i32,
hex_y: i32,

// ****************************************************************************
const Chit = @This();

// ****************************************************************************
pub fn clipTexture4Chit(id: i32, texture: ?*c.SDL_Texture, w_h: i32, chit_num: i32) Chit {
    return .{
        .id = id,
        .texture = @ptrCast(texture),
        .w_h = w_h,
        .chit_num = chit_num,
        .hex_x = 0,
        .hex_y = 0,
    };
}

// **********
pub fn render(self: *Chit, renderer: ?*c.SDL_Renderer) void {
    var src_rect: c.SDL_FRect = undefined;
    var dst_rect: c.SDL_FRect = undefined;

    src_rect.x = 0;
    src_rect.y = @as(f32, @floatFromInt(self.chit_num)) * @as(f32, @floatFromInt(self.w_h));
    src_rect.w = @as(f32, @floatFromInt(self.w_h));
    src_rect.h = @as(f32, @floatFromInt(self.w_h));

    dst_rect.x = 0;
    dst_rect.y = 0;
    dst_rect.w = @as(f32, @floatFromInt(self.w_h));
    dst_rect.h = @as(f32, @floatFromInt(self.w_h));

    _ = c.SDL_RenderTexture(renderer, self.texture, &src_rect, &dst_rect);
}
