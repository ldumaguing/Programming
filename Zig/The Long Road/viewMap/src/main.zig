const rl = @import("raylib");
const std = @import("std");
const print = std.debug.print;

const sqlite = @import("lib/SQLite.zig");
const c64 = @import("lib/C64.zig");

pub fn main() anyerror!void {
    const sql = sqlite.SQLite.init();
    defer sql.close();

    const tileCR = sql.get_2int_vals("tileCR");

    const screenWidth = 854;
    const screenHeight = 480;

    const spines = [_]i32{ 1, 2, 4, 8, 16, 32 };

    const pxX = sql.get_float_vals("pxX");
    const pxY = sql.get_float_vals("pxY");
    const hex_width = pxX[0];
    const hex_height = pxY[0];
    const halfY: f32 = hex_height / 2;
    const hexPt_A = sql.get_Point("hexPtA");
    const hexPt_B = sql.get_Point("hexPtB");
    const hexPt_C = sql.get_Point("hexPtC");
    const hexPt_D = sql.get_Point("hexPtD");
    const hexPt_E = sql.get_Point("hexPtE");
    const hexPt_F = sql.get_Point("hexPtF");
    const hexPt_G = sql.get_Point("hexPtG");
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

    rl.setTargetFPS(6); // Set our game to run at 60 frames-per-second

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
                    rl.drawCircle(@intFromFloat(hex_w), @intFromFloat(hex_y), 10, c64.colors[15]);

                    if (sql.is_hill(x, y)) {
                        rl.drawCircle(@intFromFloat(hex_w), @intFromFloat(hex_y), halfY + 5, c64.colors[9]);
                    }

                    var linePts: struct { i32, i32, i32, i32 } = .{ 0, 0, 0, 0 };
                    for (spines) |spine| {
                        if (sql.is_river_spine(x, y, spine)) {
                            print("{d},{d}: {d}\n", .{ x, y, spine });
                            linePts = switch (spine) {
                                //else => get_line_pts(x, y, hex_width, hex_height, hexPt_A[0], hexPt_A[1], hexPt_B[0], hexPt_B[1]),
                                1 => get_line_pts(x, y, hex_width, hex_height, hexPt_A[0], hexPt_A[1], hexPt_B[0], hexPt_B[1]),
                                2 => get_line_pts(x, y, hex_width, hex_height, hexPt_B[0], hexPt_B[1], hexPt_C[0], hexPt_C[1]),
                                4 => get_line_pts(x, y, hex_width, hex_height, hexPt_C[0], hexPt_C[1], hexPt_D[0], hexPt_D[1]),
                                8 => get_line_pts(x, y, hex_width, hex_height, hexPt_C[0], hexPt_C[1], hexPt_E[0], hexPt_E[1]),
                                16 => get_line_pts(x, y, hex_width, hex_height, hexPt_F[0], hexPt_F[1], hexPt_G[0], hexPt_G[1]),
                                else => get_line_pts(x, y, hex_width, hex_height, hexPt_G[0], hexPt_G[1], hexPt_A[0], hexPt_A[1]),
                            };
                            rl.drawLine(linePts[0], linePts[1], linePts[2], linePts[3], c64.colors[0]);
                        }
                    }
                }
            }
        }
        print("\n", .{});
    }
}

// ************************************************************************************************
fn get_line_pts(x: usize, y: usize, hex_w: f32, hex_y: f32, p0x: i32, p0y: i32, p1x: i32, p1y: i32) struct { i32, i32, i32, i32 } {
    //print("{d},{d} - {},{} - {d},{d}...{d},{d}\n", .{ x, y, hex_w, hex_y, p0x, p0y, p1x, p1y });
    const float_x: f32 = @as(f32, (@floatFromInt(x))) * hex_w;
    const float_y: f32 = @as(f32, (@floatFromInt(y))) * hex_y;

    //print("{},{}\n", .{@as(f32, (@floatFromInt(x))), @as(f32, (@floatFromInt(y)))});
    const P0x: i32 = @as(i32, @round(float_x)) + p0x;
    const P0y: i32 = @as(i32, @round(float_y)) + p0y;
    //print("{d},{d}\n", .{P0x, P0y});
    const P1x: i32 = @as(i32, @round(float_x)) + p1x;
    const P1y: i32 = @as(i32, @round(float_y)) + p1y;

    //print("{d},{d} ... {d},{d}\n", .{P0x, P0y, P1x, P1y});
    return .{ P0x, P0y, P1x, P1y };
}
