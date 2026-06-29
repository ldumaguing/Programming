const std = @import("std");
const print = std.debug.print;

const rl = @cImport({
    @cInclude("raylib.h");
});

pub fn main() anyerror!void {
    const screenWidth = 800;
    const screenHeight = 450;

    rl.InitWindow(screenWidth, screenHeight, "raylib [textures] example - logo raylib");
    defer rl.CloseWindow(); // Close window and OpenGL context

    // const texture: rl.Texture2D = rl.LoadTexture("raylib_logo.png");
    const texture = rl.LoadTexture("raylib_logo.png");

    rl.SetTargetFPS(60); // Set our game to run at 60 frames-per-second

    const W = (screenWidth / 2) - @divTrunc(texture.width, 2);
    const H = (screenHeight / 2) - @divTrunc(texture.height, 2);
    print("--------------------> {d}\n", .{W});
    // Main game loop
    while (!rl.WindowShouldClose()) { // Detect window close button or ESC key
        rl.BeginDrawing();
        defer rl.EndDrawing();

        rl.ClearBackground(rl.RAYWHITE);
        rl.DrawTexture(texture, W, H, rl.WHITE);
    }
}
