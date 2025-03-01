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

// ****************************************************************************
const DiTexture = @This();

// ****************************************************************************
pub fn new_with_transparency(id: i32, filename: [*c]const u8, r: u8, g: u8, b: u8) DiTexture {
    const stream: ?*c.SDL_IOStream = c.SDL_IOFromFile(filename, "r");
    const surface: ?*c.SDL_Surface = c.IMG_LoadPNG_IO(stream);
    _ = c.SDL_SetSurfaceColorKey(surface, true, c.SDL_MapSurfaceRGB(surface, r, g, b));

    defer c.SDL_DestroySurface(surface);

    return .{ .id = id, .texture = c.SDL_CreateTextureFromSurface(m.gRenderer, surface) };
}

// ****************************************************************************
pub fn new(id: i32, filename: [*c]const u8) DiTexture {
    const stream: ?*c.SDL_IOStream = c.SDL_IOFromFile(filename, "r");
    const surface: ?*c.SDL_Surface = c.IMG_LoadPNG_IO(stream);
    defer c.SDL_DestroySurface(surface);

    return .{ .id = id, .texture = c.SDL_CreateTextureFromSurface(m.gRenderer, surface) };
}

// **********
pub fn render_sprite(self: *DiTexture, x: f32, y: f32, clippage: c.SDL_FRect) void {
    var dst_rect: c.SDL_FRect = undefined;
    dst_rect.h = clippage.h;
    dst_rect.w = clippage.w;
    dst_rect.x = x;
    dst_rect.y = y;
    _ = c.SDL_RenderTexture(m.gRenderer, self.texture, &clippage, &dst_rect);
}

// **********
pub fn render(self: *DiTexture, x: f32, y: f32) void {
    var dst_rect: c.SDL_FRect = undefined;
    dst_rect.h = @floatFromInt(self.texture.h);
    dst_rect.w = @floatFromInt(self.texture.w);
    dst_rect.x = x;
    dst_rect.y = y;
    _ = c.SDL_RenderTexture(m.gRenderer, self.texture, null, &dst_rect);
}

// **********
pub fn destroy(self: *DiTexture) void {
    c.SDL_DestroyTexture(self.texture);
}
