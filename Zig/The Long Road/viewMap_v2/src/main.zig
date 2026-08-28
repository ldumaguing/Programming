const rl = @import("raylib");
const std = @import("std");
const print = std.debug.print;

const sqlite3 = @import("lib/Database.zig");
const cardboard = @import("lib/Cardboard.zig");
const gamemap = @import("lib/GameMap.zig");
const tile = @import("lib/Tile.zig");
const terrain = @import("lib/Terrain.zig");

pub fn main() !void {
    const db = sqlite3.Database.init();
    defer db.close();

    var arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    defer arena.deinit();
    const allocator = arena.allocator();

    var Textures = std.ArrayList(rl.Texture).empty;
    defer Textures.deinit(allocator);

    var Tiles = std.ArrayList(tile.Tile).empty;
    defer Tiles.deinit(allocator);

    // ***** Terrains
    var Hills = std.ArrayList(terrain.Hill).empty;
    defer Hills.deinit(allocator);

    var WholeHex = std.ArrayList(terrain.WholeHex).empty;
    defer WholeHex.deinit(allocator);

    // ********************************************************************************************
    const pxX = db.get_float_vals("pxX");
    const pxY = db.get_float_vals("pxY");
    const hex_width = pxX[0];
    const hex_height = pxY[0];
    const halfY: f32 = hex_height / 2.0;

    // ********************************************************************************************
    const screenWidth = 1280;
    const screenHeight = 720;

    rl.setConfigFlags(.{ .window_undecorated = true });
    rl.initWindow(screenWidth, screenHeight, "The Long Road");
    defer rl.closeWindow();

    // ********************************************************************************************
    const png_rolling = try rl.loadTexture("TLR/LAR_rolling.png");
    defer rl.unloadTexture(png_rolling);
    const png_cultivated = try rl.loadTexture("TLR/LAR_cultivated.png");
    defer rl.unloadTexture(png_cultivated);
    const png_forest = try rl.loadTexture("TLR/LAR_forest.png");
    defer rl.unloadTexture(png_forest);
    const png_city = try rl.loadTexture("TLR/LAR_city.png");
    defer rl.unloadTexture(png_city);

    // ==========================================================
    try db.add_map_tiles(allocator, &Textures, &Tiles);

    const tileLetters = try db.get_tileLetters(allocator);
    defer allocator.free(tileLetters);

    var gMap = gamemap.GameMap.init(tileLetters, &Tiles);
    gMap.status(&Tiles);

    // ==========================================================
    try db.add_map_hills(allocator, &Hills);
    try db.add_map_rollings(allocator, &WholeHex);
    try db.add_map_cultivated(allocator, &WholeHex);
    try db.add_map_forest(allocator, &WholeHex);
    try db.add_map_city(allocator, &WholeHex);
    print("count: {d}\n", .{WholeHex.items.len});

    // ********************************************************************************************
    rl.setTargetFPS(12);

    var camera = rl.Camera2D{
        .target = .{ .x = 0, .y = 0 },
        .offset = .{ .x = 0, .y = 0 },
        .zoom = 0.5,
        .rotation = 0,
    };

    var toggle: i32 = 0;
    while (!rl.windowShouldClose()) {
        if (rl.isKeyPressed(.space)) {
            if (toggle == 0)
                toggle = 1
            else
                toggle = 0;
        }
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

        rl.clearBackground(rl.Color.init(0xCE, 0xCC, 0xBF, 0xFF));

        {
            camera.begin();
            defer camera.end();

            for (0..Hills.items.len) |x| {
                var X: f32 = @floatFromInt(Hills.items.ptr[x].x);
                var Y: f32 = @floatFromInt(Hills.items.ptr[x].y);
                X = X * hex_width;
                Y = Y * hex_height;
                if (@mod(Hills.items.ptr[x].x, 2) != 0) Y -= halfY;
                rl.drawPoly(rl.Vector2.init(X, Y), 6, 135.0, 0.0, .brown);
            }

            for (0..WholeHex.items.len) |x| {
                var X: f32 = @floatFromInt(WholeHex.items.ptr[x].x);
                var Y: f32 = @floatFromInt(WholeHex.items.ptr[x].y);
                if (WholeHex.items.ptr[x].id == 10) {
                    X = (X * hex_width) - 130.0;
                    Y = (Y * hex_height) - 113.0;
                    if (@mod(WholeHex.items.ptr[x].x, 2) != 0) Y -= halfY;
                    rl.drawTexture(png_rolling, @intFromFloat(X), @intFromFloat(Y), .white);
                }
                if (WholeHex.items.ptr[x].id == 3) {
                    X = (X * hex_width) - 130.0;
                    Y = (Y * hex_height) - 113.0;
                    if (@mod(WholeHex.items.ptr[x].x, 2) != 0) Y -= halfY;
                    rl.drawTexture(png_cultivated, @intFromFloat(X), @intFromFloat(Y), .white);
                }
                if (WholeHex.items.ptr[x].id == 4) {
                    X = (X * hex_width) - 130.0;
                    Y = (Y * hex_height) - 113.0;
                    if (@mod(WholeHex.items.ptr[x].x, 2) != 0) Y -= halfY;
                    rl.drawTexture(png_forest, @intFromFloat(X), @intFromFloat(Y), .white);
                }
                if (WholeHex.items.ptr[x].id == 2) {
                    X = (X * hex_width) - 130.0;
                    Y = (Y * hex_height) - 113.0;
                    if (@mod(WholeHex.items.ptr[x].x, 2) != 0) Y -= halfY;
                    rl.drawTexture(png_city, @intFromFloat(X), @intFromFloat(Y), .white);
                }
            }

            if (toggle == 0) {
                for (0..4) |row| {
                    for (0..4) |col| {
                        if (gMap.GMap[@intCast(col)][@intCast(row)] >= 0) {
                            const tile_num = Tiles.items.ptr[@intCast(gMap.GMap[@intCast(col)][@intCast(row)])].index;
                            const rotation = Tiles.items.ptr[@intCast(gMap.GMap[@intCast(col)][@intCast(row)])].rotation;

                            const X = @as(f32, @floatFromInt(col)) * @as(f32, @floatFromInt(db.pixelCount[0]));
                            const Y = @as(f32, @floatFromInt(row)) * @as(f32, @floatFromInt(db.pixelCount[1]));

                            if (rotation > 0) {
                                const mod_x = X + @as(f32, @floatFromInt(db.pixelCount[0]));
                                const mod_y = Y + @as(f32, @floatFromInt(db.pixelCount[1]));
                                rl.drawTextureEx(Textures.items.ptr[@intCast(tile_num)], .{ .x = mod_x, .y = mod_y }, rotation, 1.0, .white);
                            } else {
                                rl.drawTextureEx(Textures.items.ptr[@intCast(tile_num)], .{ .x = X, .y = Y }, rotation, 1.0, .white);
                            }
                        }
                    }
                }
            }
        }
    }
}
