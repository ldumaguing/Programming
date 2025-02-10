const std = @import("std");
const print = @import("std").debug.print;
const m = @import("main.zig");

const c = @cImport({
    @cDefine("SDL_DISABLE_OLD_NAMES", {});
    @cInclude("SDL3/SDL.h");
    @cInclude("SDL3/SDL_revision.h");
    @cDefine("SDL_MAIN_HANDLED", {});
    @cInclude("SDL3/SDL_main.h");
});

pub fn AppIterate(renderer: *c.SDL_Renderer) !void {
    var dst_rect: c.SDL_FRect = undefined;
    var now: f32 = @floatFromInt(c.SDL_GetTicks());
    now /= 1000.0;
    const red: f32 = (0.5 + 0.5 * c.SDL_sinf(now));
    const green: f32 = (0.5 + 0.5 * c.SDL_sinf(now + c.SDL_PI_F * 2.0 / 3.0));
    const blue: f32 = (0.5 + 0.5 * c.SDL_sinf(now + c.SDL_PI_F * 4.0 / 3.0));

    // as you can see from this, rendering draws over whatever was drawn before it.
    _ = c.SDL_SetRenderDrawColor(renderer, 0, 0, 0, c.SDL_ALPHA_OPAQUE);
    _ = c.SDL_RenderClear(renderer);

    // as you can see from this, rendering draws over whatever was drawn before it.
    _ = c.SDL_SetRenderDrawColor(renderer, 0, 0, 0, c.SDL_ALPHA_OPAQUE);
    _ = c.SDL_RenderClear(renderer);

    // Just draw the static texture a few times. You can think of it like a
    // stamp, there isn't a limit to the number of times you can draw with it.

    // Color modulation multiplies each pixel's red, green, and blue intensities by the mod values,
    // so multiplying by 1.0f will leave a color intensity alone, 0.0f will shut off that color
    // completely, etc.

    // top left; let's make this one blue!
    dst_rect.x = 0.0;
    dst_rect.y = 0.0;
    dst_rect.w = @floatFromInt(m.texture_width);
    dst_rect.h = @floatFromInt(m.texture_height);
    _ = c.SDL_SetTextureColorModFloat(m.texture, 0.0, 0.0, 1.0);
    _ = c.SDL_RenderTexture(renderer, m.texture, null, &dst_rect);

    // center this one, and have it cycle through red/green/blue modulations.
    dst_rect.x = @floatFromInt(m.WINDOW_WIDTH - m.texture_width);
    dst_rect.x /= 2.0;
    dst_rect.y = @floatFromInt(m.WINDOW_HEIGHT - m.texture_height);
    dst_rect.y /= 2.0;
    dst_rect.w = @floatFromInt(m.texture_width);
    dst_rect.h = @floatFromInt(m.texture_height);
    _ = c.SDL_SetTextureColorModFloat(m.texture, red, green, blue);
    _ = c.SDL_RenderTexture(renderer, m.texture, null, &dst_rect);

    // bottom right; let's make this one red!
    dst_rect.x = @floatFromInt(m.WINDOW_WIDTH - m.texture_width);
    dst_rect.y = @floatFromInt(m.WINDOW_HEIGHT - m.texture_height);
    dst_rect.w = @floatFromInt(m.texture_width);
    dst_rect.h = @floatFromInt(m.texture_height);
    _ = c.SDL_SetTextureColorModFloat(m.texture, 1.0, 0.0, 0.0);
    _ = c.SDL_RenderTexture(renderer, m.texture, null, &dst_rect);

    _ = c.SDL_RenderPresent(renderer);
}
