const rl = @import("raylib");
const std = @import("std");
const print = std.debug.print;

pub fn main() anyerror!void {
    const screenWidth = 800;
    const screenHeight = 450;

    rl.initWindow(screenWidth, screenHeight, "raylib-zig [core] example - basic window");
    defer rl.closeWindow();

    const vehicle_img = try rl.loadImage("TLR/7th-Trojan-F.png");
    defer rl.unloadImage(vehicle_img);
    const vehicle_txu = try rl.loadTextureFromImage(vehicle_img);
    defer rl.unloadTexture(vehicle_txu);

    const flags0_img = try rl.loadImage("TLR/LAR_flags_0.png");
    defer rl.unloadImage(flags0_img);
    const flags0_txu = try rl.loadTextureFromImage(flags0_img);
    defer rl.unloadTexture(flags0_txu);

    rl.setTargetFPS(60);

    while (!rl.windowShouldClose()) {
        rl.beginDrawing();
        defer rl.endDrawing();

        rl.clearBackground(.brown);

        rl.drawTexture(vehicle_txu, 10, 10, .white);
        rl.drawTexture(flags0_txu, 170, 10, .white);

        rl.drawTextureRec(flags0_txu, .{ .x = 0, .y = 0 * 13, .width = 158, .height = 13 }, .{ .x = 10, .y = 10 }, .white);
        rl.drawTextureRec(flags0_txu, .{ .x = 0, .y = 1 * 13, .width = 158, .height = 13 }, .{ .x = 10, .y = 10 }, .white);
        rl.drawTextureRec(flags0_txu, .{ .x = 0, .y = 2 * 13, .width = 158, .height = 13 }, .{ .x = 10, .y = 10 }, .white);

        rl.drawTextureRec(flags0_txu, .{ .x = 0, .y = 3 * 13, .width = 158, .height = 13 }, .{ .x = 10, .y = 10 }, .white);
        rl.drawTextureRec(flags0_txu, .{ .x = 0, .y = 4 * 13, .width = 158, .height = 13 }, .{ .x = 10, .y = 10 }, .white);
        rl.drawTextureRec(flags0_txu, .{ .x = 0, .y = 5 * 13, .width = 158, .height = 13 }, .{ .x = 10, .y = 10 }, .white);
        rl.drawTextureRec(flags0_txu, .{ .x = 0, .y = 6 * 13, .width = 158, .height = 13 }, .{ .x = 10, .y = 10 }, .white);

        rl.drawText("Congrats! You created your first window!", 190, 200, 20, .light_gray);
    }
}
