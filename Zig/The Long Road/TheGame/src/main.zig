const rl = @import("raylib");
const std = @import("std");
const print = std.debug.print;

const sqlite3 = @import("lib/Database.zig");

pub fn main() anyerror!void {
    const db = sqlite3.Database.init();
    defer db.close();
    db.foo();

    // ********************************************************************************************
    const screenWidth = 1024;
    const screenHeight = 720;

    rl.initWindow(screenWidth, screenHeight, "raylib-zig [core] example - basic window");
    defer rl.closeWindow();

    // ==========================================================
    var images: [2]rl.Image = undefined;
    images[0] = try rl.loadImage("TLR/Map A.png");
    defer rl.unloadImage(images[0]);
    images[1] = try rl.loadImage("TLR/Map B.png");
    defer rl.unloadImage(images[1]);

    var texture1: rl.Texture = try rl.loadTextureFromImage(images[1]);

    // ==========================================================
    rl.setTargetFPS(12);

    while (!rl.windowShouldClose()) {
        rl.beginDrawing();
        defer rl.endDrawing();

        // rl.clearBackground(.white);
        rl.drawTexture(texture1, 0, 0, .white);

        // Control frames speed
        if (rl.isKeyPressed(.right)) {
            texture1 = try rl.loadTextureFromImage(images[0]);
        } else if (rl.isKeyPressed(.left)) {
            texture1 = try rl.loadTextureFromImage(images[1]);
        }

        rl.drawText("Congrats! You created your first window!", 190, 200, 20, .light_gray);
    }
}
