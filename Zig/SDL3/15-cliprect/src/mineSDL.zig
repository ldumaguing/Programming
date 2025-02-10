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
var last_time: f32 = 0.0;

pub fn AppIterate(renderer: *c.SDL_Renderer) !void {
    const cliprect_position = c.SDL_FPoint{ .x = 0.0, .y = 0.0 };
    const cliprect_direction = c.SDL_FPoint{ .x = 0.0, .y = 0.0 };
    const cliprect = c.SDL_Rect{ .x = @intFromFloat(cliprect_position.x), .y = @intFromFloat(cliprect_position.y), .w = CLIPRECT_SIZE, .h = CLIPRECT_SIZE };
    const now: f32 = @floatFromInt(c.SDL_GetTicks());
    const elapsed: f32 = (now - last_time) / 1000.0;
    const distance: f32 = elapsed * CLIPRECT_SPEED;

    // Set a new clipping rectangle position
    cliprect_position.x += distance * cliprect_direction.x;
    if (cliprect_position.x < 0.0) {
        cliprect_position.x = 0.0;
        cliprect_direction.x = 1.0;
    } else if (cliprect_position.x >= (m.WINDOW_WIDTH - CLIPRECT_SIZE)) {
        cliprect_position.x = (m.WINDOW_WIDTH - CLIPRECT_SIZE) - 1;
        cliprect_direction.x = -1.0;
    }

    cliprect_position.y += distance * cliprect_direction.y;
    if (cliprect_position.y < 0.0) {
        cliprect_position.y = 0.0;
        cliprect_direction.y = 1.0;
    } else if (cliprect_position.y >= (m.WINDOW_HEIGHT - CLIPRECT_SIZE)) {
        cliprect_position.y = (m.WINDOW_HEIGHT - CLIPRECT_SIZE) - 1;
        cliprect_direction.y = -1.0;
    }
    _ = c.SDL_SetRenderClipRect(renderer, &cliprect);

    _ = c.SDL_RenderPresent(renderer);
}
