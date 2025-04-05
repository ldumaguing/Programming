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

const CLIPRECT_SIZE = 250;
const CLIPRECT_SPEED = 200;

pub fn AppIterate(renderer: *c.SDL_Renderer) !void {
    const now: f32 = @floatFromInt(c.SDL_GetTicks());
    const elapsed: f32 = (now - m.last_time) / 1000.0;
    const distance: f32 = elapsed * CLIPRECT_SPEED;

    if (m.cliprect_position.x < 0.0) {
        m.cliprect_position.x = 0.0;
        m.cliprect_direction.x = 1.0;
    } else if (m.cliprect_position.x >= (m.WINDOW_WIDTH - CLIPRECT_SIZE)) {
        m.cliprect_position.x = (m.WINDOW_WIDTH - CLIPRECT_SIZE) - 1;
        m.cliprect_direction.x = -1.0;
    }

    if (m.cliprect_position.y < 0.0) {
        m.cliprect_position.y = 0.0;
        m.cliprect_direction.y = 1.0;
    } else if (m.cliprect_position.y >= (m.WINDOW_HEIGHT - CLIPRECT_SIZE)) {
        m.cliprect_position.y = (m.WINDOW_HEIGHT - CLIPRECT_SIZE) - 1;
        m.cliprect_direction.y = -1.0;
    }

    m.cliprect_position.x += distance * m.cliprect_direction.x;
    m.cliprect_position.y += distance * m.cliprect_direction.y;
    const cliprect = c.SDL_Rect{ .x = @intFromFloat(m.cliprect_position.x), .y = @intFromFloat(m.cliprect_position.y), .w = CLIPRECT_SIZE, .h = CLIPRECT_SIZE };

    _ = c.SDL_SetRenderClipRect(renderer, &cliprect);

    m.last_time = now;

    // okay, now draw!

    // Note that SDL_RenderClear is _not_ affected by the clipping rectangle!
    _ = c.SDL_SetRenderDrawColor(renderer, 33, 33, 33, c.SDL_ALPHA_OPAQUE);
    _ = c.SDL_RenderClear(renderer);

    // stretch the texture across the entire window. Only the piece in the
    // clipping rectangle will actually render, though!
    _ = c.SDL_RenderTexture(renderer, m.texture, null, null);

    _ = c.SDL_RenderPresent(renderer);
}
