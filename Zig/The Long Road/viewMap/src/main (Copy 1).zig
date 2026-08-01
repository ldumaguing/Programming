const rl = @import("raylib");
const std = @import("std");
const print = std.debug.print;

const sqlite = @import("lib/SQLite.zig");
const c64 = @import("lib/C64.zig");

pub fn main() anyerror!void {
    const sql = sqlite.SQLite.init();
    defer sql.close();

    print("{d}\n", .{sql.currSession});

    const screenWidth = 1227;
    const screenHeight = 690;
    const hex_width = screenWidth / 18;
    const hex_height = screenHeight / 12;
    const halfY: i32 = hex_height / 2;

    print("{d},{d},{d}\n", .{ hex_width, hex_height, halfY });

    rl.initWindow(screenWidth, screenHeight, "raylib-zig [core] example - basic window");
    defer rl.closeWindow(); // Close window and OpenGL context

    rl.setTargetFPS(1); // Set our game to run at 60 frames-per-second

    while (!rl.windowShouldClose()) { // Detect window close button or ESC key
        rl.beginDrawing();
        defer rl.endDrawing();

        rl.clearBackground(c64.colors[7]);

        for (0..19) |x| {
            const fooX: i32 = @intCast(x * hex_width);
            for (0..13) |y| {
                var fooY: i32 = @intCast(y * hex_height);
                if (@mod(x, 2) != 0) fooY -= halfY;
                rl.drawCircle(fooX, fooY, 10, c64.colors[14]);
                if (sql.is_hill(x, y)) {
                    // rl.drawCircle(fooX, fooY, halfY + 5, c64.colors[9]);
                    rl.drawEllipse(fooX, fooY, halfY + 20, halfY + 5, c64.colors[9]);
                }
            }
        }
    }
}
