const rl = @import("raylib");
const std = @import("std");
const print = std.debug.print;

const sqlite = @import("lib/SQLite.zig");

const c64_colors = [_]rl.Color{
    rl.Color.init(0x00, 0x00, 0x00, 0xff), // Black
    rl.Color.init(0xff, 0xff, 0xff, 0xff), // White
    rl.Color.init(0x68, 0x37, 0x2b, 0xff), // Red
    rl.Color.init(0x70, 0xa4, 0xb2, 0xff), // Cyan
    rl.Color.init(0x6f, 0x3d, 0x86, 0xff), // Purple
    rl.Color.init(0x58, 0x8d, 0x43, 0xff), // Green
    rl.Color.init(0x35, 0x28, 0x79, 0xff), // Blue
    rl.Color.init(0xb8, 0xc7, 0x6f, 0xff), // Yellow
    rl.Color.init(0x6f, 0x4f, 0x25, 0xff), // Orange
    rl.Color.init(0x43, 0x39, 0x00, 0xff), // Brown
    rl.Color.init(0x9a, 0x67, 0x59, 0xff), // Light Red
    rl.Color.init(0x44, 0x44, 0x44, 0xff), // Dark Grey
    rl.Color.init(0x6c, 0x6c, 0x6c, 0xff), // Grey
    rl.Color.init(0x9a, 0xd2, 0x84, 0xff), // Light Green
    rl.Color.init(0x6c, 0x5e, 0xb5, 0xff), // Light Blue
    rl.Color.init(0x95, 0x95, 0x95, 0xff), // Light Grey
};

pub fn main() anyerror!void {
    const sql = sqlite.SQLite.init();
    defer sql.close();

    print("{d}\n", .{sql.currSession});


    // Initialization
    //--------------------------------------------------------------------------------------
    const screenWidth = 800;
    const screenHeight = 450;

    rl.initWindow(screenWidth, screenHeight, "raylib-zig [core] example - basic window");
    defer rl.closeWindow(); // Close window and OpenGL context

    rl.setTargetFPS(1); // Set our game to run at 60 frames-per-second
    //--------------------------------------------------------------------------------------

    // Main game loop
    while (!rl.windowShouldClose()) { // Detect window close button or ESC key
        rl.beginDrawing();
        defer rl.endDrawing();

        // rl.clearBackground(rl.getColor(c64_colors[foo]));
        rl.clearBackground(.white);
        rl.drawCircle(10, 10, 10, c64_colors[0]);
        rl.drawCircle(10, 30, 10, c64_colors[1]);
        rl.drawCircle(10, 50, 10, c64_colors[2]);
        rl.drawCircle(10, 70, 10, c64_colors[3]);
        rl.drawCircle(10, 90, 10, c64_colors[4]);
        rl.drawCircle(10, 110, 10, c64_colors[5]);
        rl.drawCircle(10, 130, 10, c64_colors[6]);
        rl.drawCircle(10, 150, 10, c64_colors[7]);
        rl.drawCircle(10, 170, 10, c64_colors[8]);
        rl.drawCircle(10, 190, 10, c64_colors[9]);
        rl.drawCircle(10, 210, 10, c64_colors[10]);
        rl.drawCircle(10, 230, 10, c64_colors[11]);
        rl.drawCircle(10, 250, 10, c64_colors[12]);
        rl.drawCircle(10, 270, 10, c64_colors[13]);
        rl.drawCircle(10, 290, 10, c64_colors[14]);
        rl.drawCircle(10, 310, 10, c64_colors[15]);

        //----------------------------------------------------------------------------------
    }
}
