const rl = @import("raylib");
const std = @import("std");
const print = std.debug.print;

const sqlite = @import("lib/SQLite.zig");
const c64 = @import("lib/C64.zig");

pub fn main() anyerror!void {
    const sql = sqlite.SQLite.init();
    defer sql.close();

    const tileCR = sql.get_2int_vals("tileCR");

    const screenWidth = 1227;
    const screenHeight = 690;

    // const hex_width = screenWidth / 18;
    const pxX = sql.get_float_vals("pxX");
    const pxY = sql.get_float_vals("pxY");
    const hex_width = pxX[0];
    const hex_height = pxY[0];
    const halfY: f32 = hex_height / 2;
    const hexPt_A = sql.get_2int_vals("hexPtA");
    const hexPt_B = sql.get_2int_vals("hexPtB");
    const hexPt_C = sql.get_2int_vals("hexPtC");
    const hexPt_D = sql.get_2int_vals("hexPtD");
    const hexPt_E = sql.get_2int_vals("hexPtE");
    const hexPt_F = sql.get_2int_vals("hexPtF");
    const hexPt_G = sql.get_2int_vals("hexPtG");
    print("A({d},{d})\n", .{ hexPt_A[0], hexPt_A[1] });
    print("B({d},{d})\n", .{ hexPt_B[0], hexPt_B[1] });
    print("C({d},{d})\n", .{ hexPt_C[0], hexPt_C[1] });
    print("D({d},{d})\n", .{ hexPt_D[0], hexPt_D[1] });
    print("E({d},{d})\n", .{ hexPt_E[0], hexPt_E[1] });
    print("F({d},{d})\n", .{ hexPt_F[0], hexPt_F[1] });
    print("G({d},{d})\n", .{ hexPt_G[0], hexPt_G[1] });
    rl.initWindow(screenWidth, screenHeight, "View Map");
    defer rl.closeWindow(); // Close window and OpenGL context

    rl.setTargetFPS(1); // Set our game to run at 60 frames-per-second

    var camera = rl.Camera2D{
        .target = .{ .x = 0, .y = 0 },
        .offset = .{ .x = 0, .y = 0 },
        .zoom = 1.0,
        .rotation = 0,
    };

    rl.setTargetFPS(12); // Set our game to run at 60 frames-per-second

    // Main game loop
    while (!rl.windowShouldClose()) { // Detect window close button or ESC key
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

        // Draw
        //----------------------------------------------------------------------------------
        rl.beginDrawing();
        defer rl.endDrawing();

        rl.clearBackground(c64.colors[7]);

        {
            camera.begin();
            defer camera.end();

            const count_col: usize = @intCast((18 * tileCR[0]) + 1);
            for (0..count_col) |x| {
                const hex_w: f32 = @round(@as(f32, @floatFromInt(x)) * hex_width);
                const count_row: usize = @intCast((13 * tileCR[0]) + 1);
                for (0..count_row) |y| {
                    var hex_y: f32 = @round(@as(f32, @floatFromInt(y)) * hex_height);
                    if (@mod(x, 2) != 0) hex_y -= halfY;
                    rl.drawCircle(@intFromFloat(hex_w), @intFromFloat(hex_y), 10, c64.colors[14]);
                    if (sql.is_hill(x, y)) {
                        rl.drawCircle(@intFromFloat(hex_w), @intFromFloat(hex_y), halfY + 5, c64.colors[9]);
                    }
                }
            }
        }
    }
}
