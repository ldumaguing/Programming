const rl = @import("raylib");
const std = @import("std");
const print = std.debug.print;

pub fn main() anyerror!void {
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
        .zoom = 1.0,
        .rotation = 0,
    };

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

        // ==============================
        rl.beginDrawing();
        defer rl.endDrawing();

        rl.clearBackground(.black);

        {
            camera.begin();
            defer camera.end();

            rl.drawRectangle(50, 50, 100, 100, .white);

            const screenMousePos = rl.getMousePosition();
            const worldMousePos = rl.getScreenToWorld2D(screenMousePos, camera);

            const aPoint = rl.Vector2{ .x = worldMousePos.x, .y = worldMousePos.y };
            const aRec = rl.Rectangle{ .x = 50.0, .y = 50.0, .width = 100.0, .height = 100.0 };

            if (rl.checkCollisionPointRec(aPoint, aRec)) {
                print("yes\n", .{});
            } else {
                print("no\n", .{});
            }
        }
    }
}
