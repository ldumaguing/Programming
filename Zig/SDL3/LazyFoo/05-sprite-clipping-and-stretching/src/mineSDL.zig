const std = @import("std");
const print = @import("std").debug.print;
const m = @import("main.zig");

const c = @cImport({
    @cDefine("SDL_DISABLE_OLD_NAMES", {});
    @cInclude("SDL3/SDL.h");
    @cInclude("SDL3/SDL_revision.h");
    @cDefine("SDL_MAIN_HANDLED", {});
    @cInclude("SDL3/SDL_main.h");
    @cInclude("SDL3_image/SDL_image.h");
});

pub fn AppIterate() !void {
    _ = c.SDL_SetRenderDrawColor(m.gRenderer, 0xff, 0xff, 0xff, 0xff);
    _ = c.SDL_RenderClear(m.gRenderer);

    const kSpriteSize: f32 = 100.0;
    const spriteClip: c.SDL_FRect = .{ .x = 0.0, .y = 0.0, .h = kSpriteSize, .w = kSpriteSize };
    const spriteStretch: c.SDL_FRect = .{ .x = 200.0, .y = 200.0, .h = kSpriteSize * 2.0, .w = kSpriteSize };
    // const spriteClip: c.SDL_FRect = {0.0, 0.0, kSpriteSize, kSpriteSize};
    // const spriteSize: c.SDL_FRect = {0.0, 0.0, kSpriteSize, kSpriteSize};

    m.gSpriteSheet.renderStretch(&spriteClip, &spriteStretch);
}
