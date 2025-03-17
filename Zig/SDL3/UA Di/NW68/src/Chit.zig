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
hex_x: i32,
hex_y: i32,

// ****************************************************************************
const Chit = @This();

// ****************************************************************************
pub fn bindTexture2Chit(id: i32, texture: ?*c.SDL_Texture) Chit {
    return .{
        .id = id,
        .texture = @ptrCast(texture),
        .hex_x = 0,
        .hex_y = 0,
    };
}

// **********
pub fn render(self: *Chit, renderer: ?*c.SDL_Renderer) void {
    var dst_rect: c.SDL_FRect = undefined;

    // if (m.gScale_prev != m.gScale_mult) {
    //     const orig_len_x: f32 = (m.WINDOW_CENTER_X - m.boardgame_sheet.hex_x) / m.gScale_prev;
    //     const orig_len_y: f32 = (m.WINDOW_CENTER_Y - m.boardgame_sheet.hex_y) / m.gScale_prev;
    //     m.boardgame_sheet.hex_x = m.WINDOW_CENTER_X - (orig_len_x * m.gScale_mult);
    //     m.boardgame_sheet.hex_y = m.WINDOW_CENTER_Y - (orig_len_y * m.gScale_mult);

    //     dst_rect.h = @as(f32, @floatFromInt(self.texture.h)) * m.gScale_mult;
    //     dst_rect.w = @as(f32, @floatFromInt(self.texture.w)) * m.gScale_mult;
    // } else {
    //     dst_rect.h = @as(f32, @floatFromInt(self.texture.h)) * m.gScale_mult;
    //     dst_rect.w = @as(f32, @floatFromInt(self.texture.w)) * m.gScale_mult;
    // }

    // dst_rect.x = self.hex_x;
    // dst_rect.y = self.hex_y;

    dst_rect.x = m.loc0x0[0] + m.boardgame_sheet.loc_x;
    dst_rect.y = m.loc0x0[1] + m.boardgame_sheet.loc_y;
    dst_rect.w = @as(f32, @floatFromInt(self.texture.w));
    dst_rect.h = @as(f32, @floatFromInt(self.texture.h));

    _ = c.SDL_RenderTexture(renderer, self.texture, null, &dst_rect);
}
