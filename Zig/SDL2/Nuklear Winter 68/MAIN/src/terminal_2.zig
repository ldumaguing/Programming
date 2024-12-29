// ***** terminal.zig
const std = @import("std");
const print = @import("std").debug.print;
const SDL = @cImport({
    @cInclude("SDL2/SDL.h");
    @cInclude("SDL2/SDL_image.h");
    @cInclude("SDL2/SDL_ttf.h");
});

const mb = @import("main.zig").MB;
const gv = @import("main.zig").GV;
const Texture = @import("Texture.zig").Texture;
const inputs = @import("main.zig").Inputs;

const terminal_dim = [_]i32{ 719, 600 };
const terminal_center = [_]i32{ (gv.SCREEN_DIM[0] - terminal_dim[0]) / 2, (gv.SCREEN_DIM[1] - terminal_dim[1]) / 2 };

pub fn doTerminal() void {
    if (inputs.btn_B) {
        mb.modes &= ~@as(u32, (1 << 1));
    }

    const corner_0 = [_]f64{ @as(f64, @floatFromInt(mb.CORNER_0[0])) * @as(f64, mb.scale), @as(f64, @floatFromInt(mb.CORNER_0[1])) * @as(f64, mb.scale) };
    const hexagon_dim = [_]f64{ (mb.HEXAGON_DIM[0] * mb.scale), (mb.HEXAGON_DIM[1] * mb.scale) };
    // print("hexagon_dim: ({d:.6},{d:.6})\n", .{ hexagon_dim[0], hexagon_dim[1] });

    const arrow_loc = [_]i32{ (mb.arrow.x - @as(i32, @intFromFloat(corner_0[0])) - mb.map_image.x), (mb.arrow.y - @as(i32, @intFromFloat(corner_0[1])) - mb.map_image.y) };
    // print("arrow loc: ({},{})\n", .{ arrow_loc[0], arrow_loc[1] });

    const hex_id_x: i32 = @intFromFloat(@as(f64, @floatFromInt(arrow_loc[0])) / hexagon_dim[0]);
    var hex_id_y: i32 = 0;
    if (@mod(hex_id_x, 2) == 0) {
        hex_id_y = @intFromFloat(@as(f64, @floatFromInt(arrow_loc[1])) / hexagon_dim[1]);
    } else {
        const corner_y: i32 = @intFromFloat(corner_0[1]);
        hex_id_y = @intFromFloat(@as(f64, @floatFromInt(arrow_loc[1] + corner_y)) / hexagon_dim[1]);
        hex_id_y -= 1;
    }
    const hex_id = [_]i32{ hex_id_x, hex_id_y };
    print("hex id: ({},{})\n", .{ hex_id[0], hex_id[1] });
    // print("\n", .{});
    mb.terminal_2.render(terminal_center[0], terminal_center[1], null, null, 0.0, null, SDL.SDL_FLIP_NONE);

    var textColor: SDL.SDL_Color = undefined;
    textColor.r = 255;
    textColor.g = 180;
    textColor.b = 0;
    var gTextTexture: Texture = Texture.newText("1234567890123456789012345678901234567890123456789012345678901234567890", textColor, gv.gFont);

    const x: i32 = 80 + terminal_center[0];
    const y: i32 = 63 + terminal_center[1];
    gTextTexture.render(x, y, null, null, 0.0, null, SDL.SDL_FLIP_NONE);

    gTextTexture = Texture.newText("1234567890123456789012345678901234567890123456789012345678901234567890", textColor, gv.gFont2);
    gTextTexture.render(x, y + (16 * 12), null, null, 0.0, null, SDL.SDL_FLIP_NONE);

    gTextTexture = Texture.newText("123456789.123456789.123456789.123456789.123456789.123456789.1234567890", textColor, gv.gFont);
    gTextTexture.render(x, y + (16 * 1), null, null, 0.0, null, SDL.SDL_FLIP_NONE);
    gTextTexture = Texture.newText("123456789.123456789.123456789.123456789.123456789.123456789.1234567890", textColor, gv.gFont);
    gTextTexture.render(x + 1, y + (16 * 1), null, null, 0.0, null, SDL.SDL_FLIP_NONE);
}
