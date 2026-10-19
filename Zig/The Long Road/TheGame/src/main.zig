const rl = @import("raylib");
const std = @import("std");
const print = std.debug.print;

const sqlite3 = @import("lib/Database.zig");
const gamemap = @import("lib/GameMap.zig");
const tile = @import("lib/Tile.zig");
const terrain = @import("lib/Terrain.zig");
const hexagon = @import("lib/Hexagon.zig");
const asset = @import("lib/Asset.zig");

pub fn main() !void {
    const db = sqlite3.Database.init();
    defer db.close();

    var arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    defer arena.deinit();
    const allocator = arena.allocator();

    // ********************************************************************************************
    var Textures = std.ArrayList(rl.Texture).empty;
    defer Textures.deinit(allocator);

    var Tiles = std.ArrayList(tile.Tile).empty;
    defer Tiles.deinit(allocator);

    // ***** Terrains
    var Hills = std.ArrayList(terrain.Hill).empty;
    defer Hills.deinit(allocator);

    var Lakes = std.ArrayList(terrain.Lake).empty;
    defer Lakes.deinit(allocator);

    var Rivers = std.ArrayList(terrain.River).empty;
    defer Rivers.deinit(allocator);

    var Roads = std.ArrayList(terrain.Road).empty;
    defer Roads.deinit(allocator);

    var WholeHex = std.ArrayList(terrain.WholeHex).empty;
    defer WholeHex.deinit(allocator);

    var Bridges = std.ArrayList(terrain.Bridge).empty;
    defer Bridges.deinit(allocator);

    var Tunnel_Entrances = std.ArrayList(terrain.Tunnel_Entrance).empty;
    defer Tunnel_Entrances.deinit(allocator);

    // ***** Asset
    var Imgs = std.ArrayList(rl.Texture).empty;
    defer Imgs.deinit(allocator);

    var ImgIDs = std.ArrayList(asset.ImgID2index).empty;
    defer ImgIDs.deinit(allocator);

    var Combatants = std.ArrayList(asset.Combatant).empty;
    defer Combatants.deinit(allocator);

    // ********************************************************************************************
    const pxX = db.get_float_vals("pxX");
    const pxY = db.get_float_vals("pxY");
    const hex_width = pxX[0];
    const hex_height = pxY[0];

    // ********************************************************************************************
    const screenWidth = 1280;
    const screenHeight = 720;

    rl.setConfigFlags(.{ .window_undecorated = true });
    rl.initWindow(screenWidth, screenHeight, "The Long Road");
    defer rl.closeWindow();

    // ********************************************************************************************
    try db.add_map_tiles(allocator, &Textures, &Tiles);

    const tileLetters = try db.get_tileLetters(allocator);
    defer allocator.free(tileLetters);

    var gMap = gamemap.GameMap.init(tileLetters, &Tiles);
    gMap.status(&Tiles);

    // ==========================================================
    try db.add_map_hills(allocator, &Hills);
    try db.add_map_lakes(allocator, &Lakes);
    try db.add_map_rivers(allocator, &Rivers);
    try db.add_map_roads(allocator, &Roads);
    try db.add_map_bridges(allocator, &Bridges);
    try db.add_map_tunnel_entrances(allocator, &Tunnel_Entrances);

    try db.add_map_rollings(allocator, &WholeHex);
    try db.add_map_cultivated(allocator, &WholeHex);
    try db.add_map_forests(allocator, &WholeHex);
    try db.add_map_cities(allocator, &WholeHex);
    try db.add_map_towns(allocator, &WholeHex);

    // ***** asset
    db.add_Img(); // This must be first because Asset uses a VIEW
    db.add_Asset(); // meta data for the image
    try db.add_map_combatants(allocator, &Imgs, &ImgIDs, &Combatants); // units encapsulating Img & Asset

    // ********************************************************************************************
    rl.setTargetFPS(12);

    var camera = rl.Camera2D{
        .target = .{ .x = 0, .y = 0 },
        .offset = .{ .x = 0, .y = 0 },
        .zoom = 0.5,
        .rotation = 0,
    };

    while (!rl.windowShouldClose()) {
        //if (rl.isKeyPressed(.space)) {
        //}

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

        rl.clearBackground(terrain.pale_yellow);

        {
            camera.begin();
            defer camera.end();

            // ***** map tiles
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

            // ***** units
            const adjX: f32 = 79.0;
            const adjY: f32 = hex_height * 0.84;
            const adjYa: f32 = hex_height * 0.35;
            for (0..Combatants.items.len) |i| {
                var X: f32 = @floatFromInt(Combatants.items.ptr[i].hex_x);
                X = (X * hex_width) - adjX;
                var Y: f32 = @floatFromInt(Combatants.items.ptr[i].hex_y);
                if (@mod(Combatants.items.ptr[i].hex_x, 2) == 0) {
                    Y = (Y * hex_height) - adjYa;
                } else {
                    Y = (Y * hex_height) - adjY;
                }
                const aF32: f32 = @floatFromInt(Combatants.items.ptr[i].stack_lvl);
                X += (aF32 * 8.0);
                Y -= (aF32 * 8.0);

                rl.drawTextureEx(Imgs.items.ptr[@intCast(Combatants.items.ptr[i].imgIndex)], rl.Vector2.init(X, Y), 0.0, 1.0, .white);
            }
        }
    }
}
