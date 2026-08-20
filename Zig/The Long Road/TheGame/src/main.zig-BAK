const rl = @import("raylib");
const std = @import("std");
const print = std.debug.print;

const sqlite3 = @import("lib/Database.zig");
const cardboard = @import("lib/Cardboard.zig");
//const gamemap = @import("lib/GameMap.zig");
const tile = @import("lib/Tile.zig");

pub fn main() anyerror!void {
    const db = sqlite3.Database.init();
    defer db.close();
    db.foo();

    var arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    defer arena.deinit();
    const allocator = arena.allocator();

    var Assets = std.ArrayList(rl.Image).empty;
    defer Assets.deinit(allocator);

    var Tiles = std.ArrayList(tile.Tile).empty;
    defer Tiles.deinit(allocator);

    // ********************************************************************************************
    const screenWidth = 1280;
    const screenHeight = 720;

    rl.setConfigFlags(.{ .window_undecorated = true });
    rl.initWindow(screenWidth, screenHeight, "The Long Road");
    defer rl.closeWindow();

    // ==========================================================
    try db.add_map_tiles(allocator, &Assets, &Tiles);
    print("tile count: {d}\n", .{Tiles.items.len});

    const message = try db.get_tileLetters(allocator);
    defer allocator.free(message);
    print("{s}\n", .{message});

    // ==========================================================
    const Unit_1f = cardboard.Cardboard.init(allocator, &Assets, "TLR/7th-Hamilton-F.png", 12);
    const Unit_1b = cardboard.Cardboard.init(allocator, &Assets, "TLR/7th-Hamilton-B.png", 13);

    var mapTile: rl.Texture = undefined;
    mapTile = try rl.loadTextureFromImage(Assets.items.ptr[Tiles.items.ptr[0].index]);
    var unit_1: rl.Texture = undefined;
    unit_1 = try rl.loadTextureFromImage(Assets.items.ptr[Unit_1f.index]);

    // ==========================================================
    rl.setTargetFPS(12);

    while (!rl.windowShouldClose()) {
        rl.beginDrawing();
        defer rl.endDrawing();

        // rl.clearBackground(.white);
        rl.drawTexture(mapTile, 0, 0, .white);
        rl.drawTexture(unit_1, 50, 50, .white);

        // Control frames speed
        if (rl.isKeyPressed(.right)) {
            mapTile = try rl.loadTextureFromImage(Assets.items.ptr[Tiles.items.ptr[0].index]);
            unit_1 = try rl.loadTextureFromImage(Assets.items.ptr[Unit_1f.index]);
        } else if (rl.isKeyPressed(.left)) {
            mapTile = try rl.loadTextureFromImage(Assets.items.ptr[Tiles.items.ptr[1].index]);
            unit_1 = try rl.loadTextureFromImage(Assets.items.ptr[Unit_1b.index]);
        }

        rl.drawText("Congrats! You created your first window!", 190, 200, 20, .black);
    }
}
