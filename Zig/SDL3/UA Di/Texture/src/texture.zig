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
