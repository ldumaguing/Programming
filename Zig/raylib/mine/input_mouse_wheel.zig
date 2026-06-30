const std = @import("std");
const print = std.debug.print;

const rl = @cImport({
    @cInclude("raylib.h");
});

pub fn main() !void {
    var buffer: [100]u8 = undefined;

    // Initialization
    //--------------------------------------------------------------------------------------
    const screenWidth = 800;
    const screenHeight = 450;

    rl.InitWindow(screenWidth, screenHeight, "raylib-zig [core] example - basic window");
    defer rl.CloseWindow(); // Close window and OpenGL context

    var boxPositionY: f32 = screenHeight / 2 - 40;
    const scrollSpeed: f32 = 4; // Scrolling speed in pixels

    rl.SetTargetFPS(60); // Set our game to run at 60 frames-per-second

    // Main game loop
    while (!rl.WindowShouldClose()) { // Detect window close button or ESC key
        // Update
        //----------------------------------------------------------------------------------
        boxPositionY -= (rl.GetMouseWheelMove() * scrollSpeed);

        // Draw
        //----------------------------------------------------------------------------------
        rl.BeginDrawing();
        defer rl.EndDrawing();

        rl.ClearBackground(rl.WHITE);

        rl.DrawRectangle(screenWidth / 2 - 40, @as(i32, @intFromFloat(boxPositionY)), 80, 80, rl.MAROON);

        rl.DrawText("Use mouse wheel to move the cube up and down!", 10, 10, 20, rl.GRAY);
        const foo = try std.fmt.bufPrint(&buffer, "Box position Y: {d}.", .{boxPositionY});
        foo.ptr[foo.len] = 0;
        rl.DrawText(
            foo.ptr,
            10,
            40,
            20,
            rl.LIGHTGRAY,
        );
    }
}
