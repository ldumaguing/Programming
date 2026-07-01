const std = @import("std");
const print = std.debug.print;

const rl = @import("raylib");

const fooEX = @import("fooEX.zig");

pub fn main() anyerror!void {
    const screenWidth = 800;
    const screenHeight = 450;
    var counter: i32 = 0;

    print("----> {d}\n", .{fooEX.add(5, 10)});

    rl.initWindow(screenWidth, screenHeight, "raylib-zig [core] example - basic window");
    defer rl.closeWindow();

    rl.setTargetFPS(60);

    while (!rl.windowShouldClose()) {
        counter += 1;
        if (@mod(counter, 60 * 3) == 0) {
            print("---------\n", .{});
            counter = 0;
        }
        rl.beginDrawing();
        defer rl.endDrawing();

        rl.clearBackground(.white);

        rl.drawText("Congrats! You created your first window!", 190, 200, 20, .light_gray);
    }
}
