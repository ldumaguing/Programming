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
    _ = c.SDL_SetRenderDrawColor(renderer, 0, 0, 0, c.SDL_ALPHA_OPAQUE);
    _ = c.SDL_RenderClear(renderer);

    _ = c.SDL_SetRenderDrawColor(renderer, 255, 255, 255, c.SDL_ALPHA_OPAQUE);
    _ = c.SDL_RenderDebugText(renderer, 272, 100, "Hello world!");
    _ = c.SDL_RenderDebugText(renderer, 224, 150, "This is some debug text.");

    _ = c.SDL_SetRenderDrawColor(renderer, 51, 102, 255, c.SDL_ALPHA_OPAQUE);
    _ = c.SDL_RenderDebugText(renderer, 184, 200, "You can do it in different colors.");

    _ = c.SDL_SetRenderDrawColor(renderer, 255, 255, 255, c.SDL_ALPHA_OPAQUE);
    _ = c.SDL_SetRenderScale(renderer, 4.0, 4.0);
    _ = c.SDL_RenderDebugText(renderer, 14, 65, "It can be scaled.");
    _ = c.SDL_SetRenderScale(renderer, 1.0, 1.0);
    _ = c.SDL_RenderDebugText(renderer, 64, 350, "This only does ASCII chars. So this laughing emoji won't draw: 🤣");

    const ticks: f32 = @as(f32, @floatFromInt(c.SDL_GetTicks())) / 1000.0;
    const charsize: i32 = c.SDL_DEBUG_TEXT_FONT_CHARACTER_SIZE;
    const X: f32 = (@as(f32, @floatFromInt(charsize)) * 46.0) / 2.0;
    _ = c.SDL_RenderDebugTextFormat(renderer, X, 400.0, "(This program has been running for %.0f seconds.)", ticks);

    _ = c.SDL_RenderPresent(renderer);
}
