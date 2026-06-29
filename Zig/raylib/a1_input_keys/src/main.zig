// raylib-zig (c) Nikolas Wipper 2023
const std = @import("std");
const print = std.debug.print;

const rl = @cImport({
    @cInclude("raylib.h");
});

pub fn main() anyerror!void {
    const screenWidth = 800;
    const screenHeight = 450;

    rl.InitWindow(screenWidth, screenHeight, "raylib-zig [core] example - keyboard input");
    defer rl.CloseWindow(); // Close window and OpenGL context

    var ballPosition = rl.Vector2{ .x = screenWidth / 2, .y = screenHeight / 2 };

    rl.SetTargetFPS(60); // Set our game to run at 60 frames-per-second

    // Main game loop
    while (!rl.WindowShouldClose()) { // Detect window close button or ESC key
        if (rl.IsKeyDown(rl.KEY_RIGHT)) {
            ballPosition.x += 2.0;
        }
        if (rl.IsKeyDown(rl.KEY_LEFT)) {
            ballPosition.x -= 2.0;
        }
        if (rl.IsKeyDown(rl.KEY_UP)) {
            ballPosition.y -= 2.0;
        }
        if (rl.IsKeyDown(rl.KEY_DOWN)) {
            ballPosition.y += 2.0;
        }

        rl.BeginDrawing();
        defer rl.EndDrawing();

        rl.ClearBackground(rl.RAYWHITE);
        rl.DrawText("move the ball with arrow keys", 10, 10, 20, rl.DARKGRAY);

        rl.DrawCircleV(ballPosition, 50, rl.MAROON);
    }
}
