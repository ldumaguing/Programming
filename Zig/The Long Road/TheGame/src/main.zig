const rl = @import("raylib");
const std = @import("std");
const print = std.debug.print;

const sqlite3 = @import("lib/Database.zig");
const asset = @import("lib/Asset.zig");

pub fn main() anyerror!void {
    const db = sqlite3.Database.init();
    defer db.close();
    db.foo();

    var arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    defer arena.deinit();
    const allocator = arena.allocator();

    // ********************************************************************************************
    const screenWidth = 1024;
    const screenHeight = 720;

    rl.initWindow(screenWidth, screenHeight, "raylib-zig [core] example - basic window");
    defer rl.closeWindow();

    // ==========================================================
    var images = std.ArrayList(rl.Image).empty;
    defer images.deinit(allocator);

    try images.append(allocator, try rl.loadImage("TLR/Map A.png"));
    try images.append(allocator, try rl.loadImage("TLR/Map B.png"));
    var texture1: rl.Texture = undefined;

    texture1 = try rl.loadTextureFromImage(images.items.ptr[0]);

    // ==========================================================
    asset.foo(db);

    // ==========================================================
    rl.setTargetFPS(12);

    while (!rl.windowShouldClose()) {
        rl.beginDrawing();
        defer rl.endDrawing();

        // rl.clearBackground(.white);
        rl.drawTexture(texture1, 0, 0, .white);

        // Control frames speed
        if (rl.isKeyPressed(.right)) {
            texture1 = try rl.loadTextureFromImage(images.items.ptr[0]);
        } else if (rl.isKeyPressed(.left)) {
            texture1 = try rl.loadTextureFromImage(images.items.ptr[1]);
        }

        rl.drawText("Congrats! You created your first window!", 190, 200, 20, .light_gray);
    }
}
