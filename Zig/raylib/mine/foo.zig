const rl = @cImport({
    @cInclude("raylib.h");
    @cInclude("rlgl.h");
    @cInclude("raymath.h");
});

const std = @import("std");
const print = std.debug.print;

pub fn main() !void {
    // Initialization
    //--------------------------------------------------------------------------------------
    const screenWidth = 800;
    const screenHeight = 450;

    rl.InitWindow(screenWidth, screenHeight, "raylib-zig [core] example - 2d camera mouse zoom");
    defer rl.CloseWindow(); // Close window and OpenGL context

    var camera = rl.Camera2D{
        .target = .{ .x = 0, .y = 0 },
        .offset = .{ .x = 0, .y = 0 },
        .zoom = 1.0,
        .rotation = 0,
    };

    var zoomMode: i32 = 0; // 0-Mouse Wheel, 1-Mouse Move

    rl.SetTargetFPS(60); // Set our game to run at 60 frames-per-second
    //--------------------------------------------------------------------------------------

    // Main game loop
    while (!rl.WindowShouldClose()) { // Detect window close button or ESC key
        // Update
        //----------------------------------------------------------------------------------
        if (rl.IsKeyPressed(rl.KEY_KP_1)) {
            zoomMode = 0;
        } else if (rl.IsKeyPressed(rl.KEY_KP_2)) {
            zoomMode = 1;
        }

        // Translate based on mouse right click
        if (rl.IsMouseButtonDown(rl.MOUSE_BUTTON_RIGHT)) {
            var delta = rl.GetMouseDelta();
            delta = rl.Vector2Scale(delta, -1.0 / camera.zoom);

            camera.target = rl.Vector2Add(camera.target, delta);
        }

        if (zoomMode == 0) {
            // Zoom based on mouse wheel
            const wheel = rl.GetMouseWheelMove();
            if (wheel != 0) {
                // Get the world point that is under the mouse
                const mouseWorldPos = rl.GetScreenToWorld2D(rl.GetMousePosition(), camera);

                // Set the offset to where the mouse is
                camera.offset = rl.GetMousePosition();

                // Set the target to match, so that the camera maps the world space point
                // under the cursor to the screen space point under the cursor at any zoom
                camera.target = mouseWorldPos;

                // Zoom increment
                var scaleFactor = 1.0 + (0.25 * @abs(wheel));
                if (wheel < 0) {
                    scaleFactor = 1.0 / scaleFactor;
                }
                camera.zoom = rl.Clamp(camera.zoom * scaleFactor, 0.125, 64.0);
            }
        } else {
            // Zoom based on left click
            if (rl.IsMouseButtonPressed(rl.MOUSE_BUTTON_LEFT)) {
                // Get the world point that is under the mouse
                const mouseWorldPos = rl.GetScreenToWorld2D(rl.GetMousePosition(), camera);

                // Set the offset to where the mouse is
                camera.offset = rl.GetMousePosition();

                // Set the target to match, so that the camera maps the world space point
                // under the cursor to the screen space point under the cursor at any zoom
                camera.target = mouseWorldPos;
            }
            if (rl.IsMouseButtonDown(rl.MOUSE_BUTTON_LEFT)) {
                // Zoom increment
                const deltaX = rl.GetMouseDelta().x;
                var scaleFactor = 1.0 + (0.01 * @abs(deltaX));
                if (deltaX < 0) {
                    scaleFactor = 1.0 / scaleFactor;
                }
                camera.zoom = rl.Clamp(camera.zoom * scaleFactor, 0.125, 64.0);
            }
        }
        //----------------------------------------------------------------------------------

        // Draw
        //----------------------------------------------------------------------------------
        rl.BeginDrawing();
        defer rl.EndDrawing();

        rl.ClearBackground(rl.RAYWHITE);

        {
            rl.BeginMode2D(camera);
            defer rl.EndMode2D();

            rl.rlPushMatrix();
            rl.rlTranslatef(0, 25 * 50, 0);
            rl.rlRotatef(90, 1, 0, 0);
            rl.DrawGrid(100, 50);
            rl.rlPopMatrix();

            rl.DrawCircle(screenWidth / 2, screenHeight / 2, 50, rl.MAROON);
        }

        rl.DrawText("[1][2] Select mouse zoom mode (Wheel or Move)", 20, 20, 20, rl.DARKGRAY);
        if (zoomMode == 0) {
            rl.DrawText("Mouse right button drag to move, mouse wheel to zoom", 20, 50, 20, rl.DARKGRAY);
        } else {
            rl.DrawText("Mouse right button drag to move, mouse press and move to zoom", 20, 50, 20, rl.DARKGRAY);
        }

        //----------------------------------------------------------------------------------
    }
}
