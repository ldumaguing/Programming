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
const texture = @import("texture.zig");
const Sheet = @import("Sheet.zig");

pub fn load_images() void {
    m.boardgame_texture = texture.createTextureFromJPG(m.renderer, "img/Map.jpg");
    m.boardgame_sheet = Sheet.bindTexture2Sheet(0, m.boardgame_texture);
}
