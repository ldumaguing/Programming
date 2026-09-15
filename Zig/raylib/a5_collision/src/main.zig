const std = @import("std");
const print = std.debug.print;

// build with `zig build-exe test0.zig -lc -lraylib`
const rl = @cImport({
    @cInclude("raylib.h");
});

pub fn main() void {
    const screenWidth = 640;
    const screenHeight = 400;

    rl.InitWindow(screenWidth, screenHeight, "raylib [core] example - basic window");
    defer rl.CloseWindow();

    rl.SetTargetFPS(60);

    while (!rl.WindowShouldClose()) {
        rl.BeginDrawing();
        defer rl.EndDrawing();

        rl.ClearBackground(rl.RAYWHITE);
        rl.DrawText("Hello, World!", 190, 200, 20, rl.LIGHTGRAY);

        // ********************************************************************************
        const aPoint = rl.Vector2{ .x = @floatFromInt(rl.GetMouseX()), .y = @floatFromInt(rl.GetMouseY()) };
        const aRec = rl.Rectangle{ .x = 15.0, .y = 15.0, .width = 25.0, .height = 25.0 };

        if (rl.CheckCollisionPointRec(aPoint, aRec)) {
            print("yes\n", .{});
        } else {
            print("no\n", .{});
        }
    }
}
