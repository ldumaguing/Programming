const std = @import("std");
const print = std.debug.print;

const rl = @cImport({
    @cInclude("raylib.h");
});

pub fn main() !void {
    // Initialization
    //--------------------------------------------------------------------------------------
    const screenWidth = 800;
    const screenHeight = 450;

    rl.InitWindow(screenWidth, screenHeight, "raylib-zig [core] example - mouse input");
    defer rl.CloseWindow(); // Close window and OpenGL context

    var ballPosition = rl.Vector2{ .x = -100, .y = -100 };
    var ballColor = rl.DARKBLUE;

    rl.SetTargetFPS(60); // Set our game to run at 60 frames-per-second

    // Main game loop
    while (!rl.WindowShouldClose()) { // Detect window close button or ESC key
        // Update
        //----------------------------------------------------------------------------------
        ballPosition = rl.GetMousePosition();
        ballPosition.x = @as(f32, @floatFromInt(rl.GetMouseX()));
        ballPosition.y = @as(f32, @floatFromInt(rl.GetMouseY()));

        if (rl.IsMouseButtonPressed(rl.MOUSE_LEFT_BUTTON)) {
            ballColor = rl.MAROON;
        } else if (rl.IsMouseButtonPressed(rl.MOUSE_BUTTON_MIDDLE)) {
            ballColor = rl.LIME;
        } else if (rl.IsMouseButtonPressed(rl.MOUSE_RIGHT_BUTTON)) {
            ballColor = rl.DARKBLUE;
        }

        // Draw
        //----------------------------------------------------------------------------------
        rl.BeginDrawing();
        defer rl.EndDrawing();

        rl.ClearBackground(rl.RAYWHITE);

        rl.DrawCircleV(ballPosition, 40, ballColor);

        rl.DrawText("move ball with mouse and click mouse button to change color", 10, 10, 20, rl.DARKGRAY);
        //----------------------------------------------------------------------------------
    }
}
