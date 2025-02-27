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
mTexture: *c.SDL_Texture,

// ****************************************************************************
const LTexture = @This();

// ****************************************************************************
pub fn new(id: i32, filename: [*c]const u8) LTexture {
    const stream: ?*c.SDL_IOStream = c.SDL_IOFromFile(filename, "r");
    const surface: ?*c.SDL_Surface = c.IMG_LoadPNG_IO(stream);
    // define a transparent color
    _ = c.SDL_SetSurfaceColorKey(surface, true, c.SDL_MapSurfaceRGB(surface, 0x00, 0xff, 0xff));

    defer c.SDL_DestroySurface(surface);

    return .{ .id = id, .mTexture = c.SDL_CreateTextureFromSurface(m.gRenderer, surface) };
}

// **********
pub fn render(self: *LTexture, x: f32, y: f32) void {
    var dst_rect: c.SDL_FRect = undefined;
    dst_rect.h = @as(f32, @floatFromInt(self.mTexture.h));
    // dst_rect.h = m.WINDOW_HEIGHT;
    dst_rect.w = @as(f32, @floatFromInt(self.mTexture.w));
    // dst_rect.w = m.WINDOW_WIDTH;
    dst_rect.x = x;
    dst_rect.y = y;
    _ = c.SDL_RenderTexture(m.gRenderer, self.mTexture, null, &dst_rect);
}

// **********
pub fn renderStretch(self: *LTexture, srcrect: [*c]const c.SDL_FRect, dstrect: [*c]const c.SDL_FRect) void {
    _ = c.SDL_RenderTexture(m.gRenderer, self.mTexture, srcrect, dstrect);

    // c.SDL_RenderTexture(
    // renderer: ?*SDL_Renderer,
    // texture: [*c]SDL_Texture,
    // srcrect: [*c]const SDL_FRect,
    // dstrect: [*c]const SDL_FRect);

}

// **********
pub fn destroy(self: *LTexture) void {
    c.SDL_DestroyTexture(self.mTexture);
}
