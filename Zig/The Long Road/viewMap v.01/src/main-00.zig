const rl = @import("raylib");
const sqlite3 = @import("lib/Database.zig");

const std = @import("std");
const print = std.debug.print;

pub fn main() !void {
    // ********************************************************************************************
    const screenWidth = 1280;
    const screenHeight = 720;

    rl.setConfigFlags(.{ .window_undecorated = true });
    rl.initWindow(screenWidth, screenHeight, "The Long Road");
    defer rl.closeWindow();

    // ==========================================================
    rl.setTargetFPS(12);

    var camera = rl.Camera2D{
        .target = .{ .x = 0, .y = 0 },
        .offset = .{ .x = 0, .y = 0 },
        .zoom = 0.5,
        .rotation = 0,
    };

    const image_1 = rl.genImageColor(32, 32, .white);
    const texture_1 = try rl.loadTextureFromImage(image_1);

    var tag_A: i32 = 1;
    var tag_B: i32 = 0;
    while (!rl.windowShouldClose()) {

        // Translate based on mouse right click
        if (rl.isMouseButtonDown(.right)) {
            var delta = rl.getMouseDelta();
            delta = rl.math.vector2Scale(delta, -1.0 / camera.zoom);
            camera.target = rl.math.vector2Add(camera.target, delta);
        }

        // Zoom based on mouse wheel
        const wheel = rl.getMouseWheelMove();
        if (wheel != 0) {
            const mouseWorldPos = rl.getScreenToWorld2D(rl.getMousePosition(), camera);
            camera.offset = rl.getMousePosition();
            camera.target = mouseWorldPos;

            // Zoom increment
            var scaleFactor = 1.0 + (0.25 * @abs(wheel));
            if (wheel < 0) {
                scaleFactor = 1.0 / scaleFactor;
            }
            camera.zoom = rl.math.clamp(camera.zoom * scaleFactor, 0.125, 64.0);
        }

        if (rl.isKeyPressed(.space)) {
            const tog = tag_A;
            tag_A = tag_B;
            tag_B = tog;
        }
        print("{d}:{d}\n", .{ tag_B, tag_A });

        // ==============================
        rl.beginDrawing();
        defer rl.endDrawing();

        rl.clearBackground(.blue);

        if (tag_B < tag_A) {
            camera.begin();
            defer camera.end();

            rl.drawTexture(texture_1, 100, 100, .white);
        }
    }
}
