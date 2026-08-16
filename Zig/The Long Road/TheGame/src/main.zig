const rl = @import("raylib");
const std = @import("std");
const print = std.debug.print;

const sqlite3 = @import("lib/Database.zig");
const tile = @import("lib/Tile.zig");

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
    //var images = std.ArrayList(rl.Image).empty;
    //defer images.deinit(allocator);

    //try db.add_tile(allocator, &images, "TLR/Map A.png");
    //try db.add_tile(allocator, &images, "TLR/Map B.png");

    //var texture1: rl.Texture = undefined;
    //texture1 = try rl.loadTextureFromImage(images.items.ptr[0]);

    // ==========================================================
    var GameMap = std.ArrayList(rl.Image).empty; // an array of tiles(images)
    defer GameMap.deinit(allocator);

    const MapA = tile.Tile.init(allocator, &GameMap, "TLR/Map A.png", 10);
    const MapB = tile.Tile.init(allocator, &GameMap, "TLR/Map B.png", 11);

    var texture1: rl.Texture = undefined;
    texture1 = try rl.loadTextureFromImage(GameMap.items.ptr[MapA.index]);

    // ==========================================================
    var combatants = std.ArrayList(rl.Image).empty;
    defer combatants.deinit(allocator);

    try combatants.append(allocator, try rl.loadImage("TLR/7th-Hamilton-F.png"));
    try combatants.append(allocator, try rl.loadImage("TLR/7th-Hamilton-B.png"));

    var unit: rl.Texture = undefined;
    unit = try rl.loadTextureFromImage(combatants.items.ptr[0]);

    // ==========================================================
    rl.setTargetFPS(12);

    while (!rl.windowShouldClose()) {
        rl.beginDrawing();
        defer rl.endDrawing();

        // rl.clearBackground(.white);
        rl.drawTexture(texture1, 0, 0, .white);
        rl.drawTexture(unit, 50, 50, .white);

        // Control frames speed
        if (rl.isKeyPressed(.right)) {
            texture1 = try rl.loadTextureFromImage(GameMap.items.ptr[MapA.index]);
            unit = try rl.loadTextureFromImage(combatants.items.ptr[0]);
        } else if (rl.isKeyPressed(.left)) {
            texture1 = try rl.loadTextureFromImage(GameMap.items.ptr[MapB.index]);
            unit = try rl.loadTextureFromImage(combatants.items.ptr[1]);
        }

        rl.drawText("Congrats! You created your first window!", 190, 200, 20, .black);
    }
}
