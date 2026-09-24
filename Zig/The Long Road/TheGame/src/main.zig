const rl = @import("raylib");
const std = @import("std");
const print = std.debug.print;

const sqlite3 = @import("lib/Database.zig");
const gamemap = @import("lib/GameMap.zig");
const tile = @import("lib/Tile.zig");
const terrain = @import("lib/Terrain.zig");
const hexagon = @import("lib/Hexagon.zig");
const asset = @import("lib/Asset.zig");
const card = @import("lib/Card.zig");
const ui = @import("lib/UI.zig");

var GameFlags: u64 = 0;
//var GameFlags_prev: u64 = 0;
var hexLoc = [3]i32{ 0, 0, 0 };
var mousePos: rl.Vector2 = undefined;

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

    // ***** Path
    var Paths = std.ArrayList(terrain.Path).empty;
    defer Paths.deinit(allocator);

    const A = hexagon.Hexagon.init(0, 0);
    const B = hexagon.Hexagon.init(5, 8);
    try A.get_path(allocator, B, &Paths);

    // ***** Asset
    var Imgs = std.ArrayList(rl.Texture).empty;
    defer Imgs.deinit(allocator);

    var ImgIDs = std.ArrayList(asset.ImgID2index).empty;
    defer ImgIDs.deinit(allocator);

    var Combatants = std.ArrayList(asset.Combatant).empty;
    defer Combatants.deinit(allocator);

    var Chosen_Units_in_Hex = std.ArrayList(asset.Combatant).empty;
    defer Chosen_Units_in_Hex.deinit(allocator);

    // ********************************************************************************************
    const pxX = db.get_float_vals("pxX");
    const pxY = db.get_float_vals("pxY");
    const hex_width = pxX[0];
    const hex_height = pxY[0];

    // ********************************************************************************************
    const windowWidth = 1280;
    const windowHeight = 720;

    rl.setConfigFlags(.{ .window_undecorated = true });
    rl.initWindow(windowWidth, windowHeight, "The Long Road");
    defer rl.closeWindow();

    //rl.toggleFullscreen();

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

    try db.add_map_combatants(allocator, &Imgs, &ImgIDs, &Combatants);

    // ==========================================================
    //const card_pac = try card.PlayerAid.init(-1509, 0, "TLR/Player Aid Card.png", "TLR/Last Turn.png", db);
    //const card_pdw = try card.Card.init(0, -1417, "TLR/TLR_Para_Deck_Window.png");
    //const card_compass = try card.Card.init(-163, -163, "TLR/LAR_Compass.png");

    // ********************************************************************************************
    if (terrain.is_hill_blocks_LOS(&Hills, &Paths)) {
        print("*********** block *************\n", .{});
    }

    // ********************************************************************************************
    // ********************************************************************************************
    // ********************************************************************************************
    rl.setTargetFPS(12);

    var camera = rl.Camera2D{
        .target = .{ .x = 0, .y = 0 },
        .offset = .{ .x = 0, .y = 0 },
        .zoom = 1.0,
        .rotation = 0,
    };

    var toggle: i32 = 1;
    while (!rl.windowShouldClose()) {
        if (rl.isKeyPressed(.space)) {
            if (toggle == 0) {
                for (0..Combatants.items.len) |i| {
                    if (Combatants.items.ptr[i].instanceID == 1001) {
                        Combatants.items.ptr[i].is_visible = true;
                    }
                }
                toggle = 1;
            } else {
                for (0..Combatants.items.len) |i| {
                    if (Combatants.items.ptr[i].instanceID == 1001) {
                        Combatants.items.ptr[i].is_visible = false;
                    }
                }
                toggle = 0;
            }
        }

        // Translate based on mouse right click
        if (rl.isMouseButtonDown(.right)) {
            var delta = rl.getMouseDelta();
            delta = rl.math.vector2Scale(delta, -1.0 / camera.zoom);
            camera.target = rl.math.vector2Add(camera.target, delta);
            //if (GameFlags != GameFlags_prev) {
            print("reset\n", .{});
            GameFlags = 0;
            Chosen_Units_in_Hex.clearAndFree(allocator);
            //    GameFlags_prev = 0;
            //}
        }

        if (rl.isMouseButtonDown(.left)) {
            if ((GameFlags & (1 << 0)) == 0) { // set selected mode
                print("set selected mode\n", .{});
                //GameFlags_prev = GameFlags;
                GameFlags |= (1 << 0);
            }
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

            // units
            for (0..Combatants.items.len) |i| {
                Combatants.items.ptr[i].drawMe(hex_width, hex_height, &Imgs);
            }

            if ((GameFlags & (1 << 0)) == 1) try ui.mode_1(&GameFlags, camera, hex_width, hex_height, &Combatants, &Chosen_Units_in_Hex, allocator);
        } // camera block
        print(">>>>>>>>>>>>>>>>> {d}\n", .{Chosen_Units_in_Hex.items.len});
        if (Chosen_Units_in_Hex.items.len > 0) {
            print(">>> {d}\n", .{Chosen_Units_in_Hex.items.ptr[0].imgIndex});
            rl.drawTexture(Imgs.items.ptr[@intCast(Chosen_Units_in_Hex.items.ptr[0].imgIndex)], 0, 0, .white);
        }
    } // Game loop
}
