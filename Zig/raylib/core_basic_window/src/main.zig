const std = @import("std");
const print = @import("std").debug.print;

const c = @cImport({
    @cInclude("raylib.h");
});

pub fn main() !void {
    const screenWidth: i32 = 800;
    const screenHeight: i32 = 600;

    c.InitWindow(screenWidth, screenHeight, "raylib [core] example - basic window");
    defer c.CloseWindow();

    c.SetTargetFPS(60);

    while (c.WindowShouldClose() == false) {
        c.BeginDrawing();
        c.ClearBackground(c.RAYWHITE);

        c.DrawText("your first window", 190, 200, 20, c.LIGHTGRAY);
        c.EndDrawing();
    }
}
