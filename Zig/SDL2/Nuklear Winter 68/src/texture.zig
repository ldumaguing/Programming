// ***** texture.zig
const SDL = @cImport({
    @cInclude("SDL2/SDL.h");
    @cInclude("SDL2/SDL_image.h");
    @cInclude("SDL2/SDL_ttf.h");
});
const std = @import("std");
const print = @import("std").debug.print;
const GV = @import("main.zig").GV;
const M = @import("main.zig");

pub const Texture = struct {
    w: i32,
    h: i32,
    x: i32,
    y: i32,
    t: *SDL.SDL_Texture,

    pub fn newText(txt: [*c]const u8, textColor: SDL.SDL_Color) Texture {
        const textSurface: *SDL.SDL_Surface = SDL.TTF_RenderText_Solid(GV.gFont, txt, textColor);
        const t = SDL.SDL_CreateTextureFromSurface(GV.renderer, textSurface) orelse M.sdlPanic();
        const w = textSurface.w;
        const h = textSurface.h;
        return Texture{
            .w = w,
            .h = h,
            .t = t,
        };
    }

    pub fn new(pngFile: [*c]const u8) Texture {
        const pngSurface = SDL.IMG_Load(pngFile);
        // *** define a color to be transparent.
        //_ = SDL.SDL_SetColorKey(pngSurface, SDL.SDL_TRUE, SDL.SDL_MapRGB(pngSurface.*.format, 0, 0xff, 0xff));
        const t = SDL.SDL_CreateTextureFromSurface(GV.renderer, pngSurface) orelse M.sdlPanic();
        const w = pngSurface.*.w;
        const h = pngSurface.*.h;
        SDL.SDL_FreeSurface(pngSurface);
        return Texture{
            .w = w,
            .h = h,
            .t = t,
            .x = 0,
            .y = 0,
        };
    }

    pub fn render(self: Texture, x: i32, y: i32, clip: ?*SDL.SDL_Rect, viewport: ?*SDL.SDL_Rect, angle: f64, center: ?*SDL.SDL_Point, flip: SDL.SDL_RendererFlip) void {
        // default viewport
        var default_viewport: SDL.SDL_Rect = undefined;
        default_viewport.x = x;
        default_viewport.y = y;
        default_viewport.w = self.w;
        default_viewport.h = self.h;

        if (clip == null) {
            if (viewport != null) {
                default_viewport.w = viewport.?.w;
                default_viewport.h = viewport.?.h;
            }
            _ = SDL.SDL_RenderCopyEx(GV.renderer, self.t, null, &default_viewport, angle, center, flip);
            return;
        }

        if (viewport == null) {
            _ = SDL.SDL_RenderCopyEx(GV.renderer, self.t, clip, &default_viewport, angle, center, flip);
        } else {
            default_viewport.w = viewport.?.w;
            default_viewport.h = viewport.?.h;
            _ = SDL.SDL_RenderCopyEx(GV.renderer, self.t, clip, &default_viewport, angle, center, flip);
        }
    }

    pub fn setColor(self: Texture, r: u8, g: u8, b: u8) void {
        _ = SDL.SDL_SetTextureColorMod(self.t, r, g, b);
    }

    pub fn setBlendMode(self: Texture, blending: SDL.SDL_BlendMode) void {
        _ = SDL.SDL_SetTextureBlendMode(self.t, blending);
    }

    pub fn setAlpha(self: Texture, alpha: u8) void {
        _ = SDL.SDL_SetTextureAlphaMod(self.t, alpha);
    }
};
