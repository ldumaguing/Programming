const std = @import("std");
const print = std.debug.print;

const rl = @cImport({
    @cInclude("raylib.h");
});

//------------------------------------------------------------------------------------
// Program main entry point
//------------------------------------------------------------------------------------
pub fn main() !void {
    // Initialization
    //--------------------------------------------------------------------------------------
    const screen_width = 800;
    const screen_height = 450;

    rl.InitWindow(screen_width, screen_height, "raylib [textures] example - texture loading and drawing");
    defer rl.CloseWindow();

    // NOTE: Textures MUST be loaded after Window initialization (OpenGL context is required)
    const texture = rl.LoadTexture("resources/raylib_logo.png");
    defer rl.UnloadTexture(texture);

    rl.SetTargetFPS(60); // Set our game to run at 60 frames-per-second
    //---------------------------------------------------------------------------------------

    // Main game loop
    while (!rl.WindowShouldClose()) // Detect window close button or ESC key
    {
        // Draw
        //----------------------------------------------------------------------------------
        rl.BeginDrawing();
        defer rl.EndDrawing();

        rl.ClearBackground(rl.RAYWHITE);
        const W = (screen_width / 2) - @divTrunc(texture.width, 2);
        const H = (screen_height / 2) - @divTrunc(texture.height, 2);
        rl.DrawTexture(texture, W, H, rl.WHITE);

        rl.DrawText("this IS a texture!", 360, 370, 10, rl.GRAY);

        //----------------------------------------------------------------------------------
    }
}
