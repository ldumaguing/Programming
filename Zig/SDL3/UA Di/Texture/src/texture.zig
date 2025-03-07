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
pub fn render(renderer: ?*c.SDL_Renderer, texture: ?*c.SDL_Texture) void {
    _ = c.SDL_RenderTexture(renderer, texture, null, null);
}

// ****************************************************************************
pub fn createTextureFromPNG(renderer: ?*c.SDL_Renderer, filename: [*c]const u8) ?*c.SDL_Texture {
    const stream: ?*c.SDL_IOStream = c.SDL_IOFromFile(filename, "r");
    const surface: ?*c.SDL_Surface = c.IMG_LoadPNG_IO(stream);
    defer c.SDL_DestroySurface(surface);

    return c.SDL_CreateTextureFromSurface(renderer, surface);
}

// ****************************************************************************
pub fn createTextureFromBMP(renderer: ?*c.SDL_Renderer, filename: [*c]const u8) ?*c.SDL_Texture {
    const stream: ?*c.SDL_IOStream = c.SDL_IOFromFile(filename, "r");
    const surface: ?*c.SDL_Surface = c.IMG_LoadBMP_IO(stream);
    defer c.SDL_DestroySurface(surface);

    return c.SDL_CreateTextureFromSurface(renderer, surface);
}

// ****************************************************************************
pub fn createTextureFromJPG(renderer: ?*c.SDL_Renderer, filename: [*c]const u8) ?*c.SDL_Texture {
    const stream: ?*c.SDL_IOStream = c.SDL_IOFromFile(filename, "r");
    const surface: ?*c.SDL_Surface = c.IMG_LoadJPG_IO(stream);
    defer c.SDL_DestroySurface(surface);

    return c.SDL_CreateTextureFromSurface(renderer, surface);
}

// ****************************************************************************
pub fn createTextureFromGIF(renderer: ?*c.SDL_Renderer, filename: [*c]const u8) ?*c.SDL_Texture {
    const stream: ?*c.SDL_IOStream = c.SDL_IOFromFile(filename, "r");
    const surface: ?*c.SDL_Surface = c.IMG_LoadGIF_IO(stream);
    defer c.SDL_DestroySurface(surface);

    return c.SDL_CreateTextureFromSurface(renderer, surface);
}

// // ****************************************************************************
// id: i32,
// texture: *c.SDL_Texture,
// stretch_x: f32,
// stretch_y: f32,
// scale_x: f32,
// scale_y: f32,
// flip: c.SDL_FlipMode,
// center: c.SDL_FPoint,
// is_default_center: bool,
// angle: f32,
//
// // ****************************************************************************
// const Texture = @This();
//
// // ****************************************************************************
// pub fn new_with_transparency(id: i32, filename: [*c]const u8, r: u8, g: u8, b: u8) Texture {
//     const stream: ?*c.SDL_IOStream = c.SDL_IOFromFile(filename, "r");
//     const surface: ?*c.SDL_Surface = c.IMG_LoadPNG_IO(stream);
//     _ = c.SDL_SetSurfaceColorKey(surface, true, c.SDL_MapSurfaceRGB(surface, r, g, b));
//
//     defer c.SDL_DestroySurface(surface);
//
//     return .{ .id = id, .texture = c.SDL_CreateTextureFromSurface(m.gRenderer, surface) };
// }
//
// // ****************************************************************************
// pub fn new(id: i32, filename: [*c]const u8) Texture {
//     const stream: ?*c.SDL_IOStream = c.SDL_IOFromFile(filename, "r");
//     const surface: ?*c.SDL_Surface = c.IMG_LoadPNG_IO(stream);
//     defer c.SDL_DestroySurface(surface);
//
//     const center: c.SDL_FPoint = .{ .x = 0.0, .y = 0.0 };
//
//     return .{
//         .id = id,
//         .texture = c.SDL_CreateTextureFromSurface(m.gRenderer, surface),
//         .stretch_x = -1.0,
//         .stretch_y = -1.0,
//         .scale_x = 1.0,
//         .scale_y = 1.0,
//         .flip = c.SDL_FLIP_NONE,
//         .center = center,
//         .is_default_center = true,
//         .angle = 0.0,
//     };
// }
//
// // **********
// pub fn render(self: *Texture, x: f32, y: f32) void {
//     var dst_rect: c.SDL_FRect = undefined;
//     if ((self.stretch_x <= 0.0) or (self.stretch_y <= 0.0)) {
//         dst_rect.h = @as(f32, @floatFromInt(self.texture.h)) * self.scale_y;
//         dst_rect.w = @as(f32, @floatFromInt(self.texture.w)) * self.scale_x;
//     } else {
//         dst_rect.h = self.stretch_y;
//         dst_rect.w = self.stretch_x;
//     }
//     dst_rect.x = x;
//     dst_rect.y = y;
//     if (self.is_default_center) {
//         _ = c.SDL_RenderTextureRotated(m.gRenderer, self.texture, null, &dst_rect, self.angle, null, self.flip);
//     } else {
//         _ = c.SDL_RenderTextureRotated(m.gRenderer, self.texture, null, &dst_rect, self.angle, &self.center, self.flip);
//     }
// }
