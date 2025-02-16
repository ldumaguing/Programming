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
    var dst_rect = c.SDL_FRect{ .x = 0.0, .y = 0.0, .w = @floatFromInt(m.texture_width), .h = @floatFromInt(m.texture_height) };
    var viewport: c.SDL_Rect = undefined;

    // Setting a viewport has the effect of limiting the area that rendering
    // can happen, and making coordinate (0, 0) live somewhere else in the
    // window. It does _not_ scale rendering to fit the viewport.

    // as you can see from this, rendering draws over whatever was drawn before it.
    _ = c.SDL_SetRenderDrawColor(renderer, 0, 0, 0, c.SDL_ALPHA_OPAQUE);
    _ = c.SDL_RenderClear(renderer);

    // Draw once with the whole window as the viewport.
    // viewport.x = 0;
    // viewport.y = 0;
    // viewport.w = m.WINDOW_WIDTH / 2;
    // viewport.h = m.WINDOW_HEIGHT / 2;
    _ = c.SDL_SetRenderViewport(renderer, null);
    _ = c.SDL_RenderTexture(renderer, m.texture, null, &dst_rect);

    // top right quarter of the window.
    viewport.x = m.WINDOW_WIDTH / 2;
    viewport.y = m.WINDOW_HEIGHT / 2;
    viewport.w = m.WINDOW_WIDTH / 2;
    viewport.h = m.WINDOW_HEIGHT / 2;
    _ = c.SDL_SetRenderViewport(renderer, &viewport);
    _ = c.SDL_RenderTexture(renderer, m.texture, null, &dst_rect);

    // bottom 20% of the window. Note it clips the width!
    viewport.x = 0;
    viewport.y = m.WINDOW_HEIGHT - (m.WINDOW_HEIGHT / 5);
    viewport.w = m.WINDOW_WIDTH / 5;
    viewport.h = m.WINDOW_HEIGHT / 5;
    _ = c.SDL_SetRenderViewport(renderer, &viewport);
    _ = c.SDL_RenderTexture(renderer, m.texture, null, &dst_rect);

    // what happens if you try to draw above the viewport? It should clip!
    viewport.x = 100;
    viewport.y = 200;
    viewport.w = m.WINDOW_WIDTH;
    viewport.h = m.WINDOW_HEIGHT;
    _ = c.SDL_SetRenderViewport(renderer, &viewport);
    dst_rect.y = -50;
    _ = c.SDL_RenderTexture(renderer, m.texture, null, &dst_rect);

    _ = c.SDL_RenderPresent(renderer);
}
