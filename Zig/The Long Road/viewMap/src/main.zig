const rl = @import("raylib");
const std = @import("std");
const print = std.debug.print;

const sqlite3 = @import("lib/Database.zig");
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

    var Lakes = std.ArrayList(terrain.Lake).empty;
    defer Lakes.deinit(allocator);

    var Rivers = std.ArrayList(terrain.River).empty;
    defer Rivers.deinit(allocator);

    var Roads = std.ArrayList(terrain.Road).empty;
    defer Roads.deinit(allocator);

    var WholeHex = std.ArrayList(terrain.WholeHex).empty;
    defer WholeHex.deinit(allocator);

    // ********************************************************************************************
    const pxX = db.get_float_vals("pxX");
    const pxY = db.get_float_vals("pxY");
    const hex_width = pxX[0];
    const hex_height = pxY[0];
    const halfY: f32 = hex_height / 2.0;

    // ********************************************************************************************
    const spines = [_]i32{ 1, 2, 4, 8, 16, 32 };

    const hexPt_A = db.get_Point("hexPtA");
    const hexPt_B = db.get_Point("hexPtB");
    const hexPt_C = db.get_Point("hexPtC");
    const hexPt_D = db.get_Point("hexPtD");
    const hexPt_E = db.get_Point("hexPtE");
    const hexPt_F = db.get_Point("hexPtF");
    const hexPt_G = db.get_Point("hexPtG");

    const spinePt_A = db.get_Point("spinePtA");
    const spinePt_B = db.get_Point("spinePtB");
    const spinePt_C = db.get_Point("spinePtC");
    const spinePt_D = db.get_Point("spinePtD");
    const spinePt_E = db.get_Point("spinePtE");
    const spinePt_F = db.get_Point("spinePtF");

    // ********************************************************************************************
    const screenWidth = 1280;
    const screenHeight = 720;

    rl.setConfigFlags(.{ .window_undecorated = true });
    rl.initWindow(screenWidth, screenHeight, "The Long Road");
    defer rl.closeWindow();

    // ********************************************************************************************
    const png_rolling = try rl.loadTexture("TLR/LAR_rolling.png");
    const png_cultivated = try rl.loadTexture("TLR/LAR_cultivated.png");
    const png_forest = try rl.loadTexture("TLR/LAR_forest.png");
    const png_city = try rl.loadTexture("TLR/LAR_city.png");
    const png_town = try rl.loadTexture("TLR/LAR_town.png");

    // ==========================================================
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

    try db.add_map_rollings(allocator, &WholeHex);
    try db.add_map_cultivated(allocator, &WholeHex);
    try db.add_map_forest(allocator, &WholeHex);
    try db.add_map_city(allocator, &WholeHex);
    try db.add_map_town(allocator, &WholeHex);
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

            for (0..Hills.items.len) |i| {
                var X: f32 = @floatFromInt(Hills.items.ptr[i].x);
                var Y: f32 = @floatFromInt(Hills.items.ptr[i].y);
                X = X * hex_width;
                Y = Y * hex_height;
                if (@mod(Hills.items.ptr[i].x, 2) != 0) Y -= halfY;
                rl.drawPoly(rl.Vector2.init(X, Y), 6, 135.0, 0.0, .brown);
            }

            for (0..Lakes.items.len) |i| {
                var X: f32 = @floatFromInt(Lakes.items.ptr[i].x);
                var Y: f32 = @floatFromInt(Lakes.items.ptr[i].y);
                X = X * hex_width;
                Y = Y * hex_height;
                if (@mod(Lakes.items.ptr[i].x, 2) != 0) Y -= halfY;
                rl.drawPoly(rl.Vector2.init(X, Y), 6, 135.0, 0.0, .blue);
            }

            for (0..WholeHex.items.len) |i| {
                var X: f32 = @floatFromInt(WholeHex.items.ptr[i].x);
                var Y: f32 = @floatFromInt(WholeHex.items.ptr[i].y);
                if (WholeHex.items.ptr[i].id == 10) {
                    X = (X * hex_width) - 130.0;
                    Y = (Y * hex_height) - 113.0;
                    if (@mod(WholeHex.items.ptr[i].x, 2) != 0) Y -= halfY;
                    rl.drawTexture(png_rolling, @intFromFloat(X), @intFromFloat(Y), .white);
                }
                if (WholeHex.items.ptr[i].id == 3) {
                    X = (X * hex_width) - 130.0;
                    Y = (Y * hex_height) - 113.0;
                    if (@mod(WholeHex.items.ptr[i].x, 2) != 0) Y -= halfY;
                    rl.drawTexture(png_cultivated, @intFromFloat(X), @intFromFloat(Y), .white);
                }
                if (WholeHex.items.ptr[i].id == 2) {
                    X = (X * hex_width) - 130.0;
                    Y = (Y * hex_height) - 113.0;
                    if (@mod(WholeHex.items.ptr[i].x, 2) != 0) Y -= halfY;
                    rl.drawTexture(png_city, @intFromFloat(X), @intFromFloat(Y), .white);
                }
                if (WholeHex.items.ptr[i].id == 11) {
                    X = (X * hex_width) - 130.0;
                    Y = (Y * hex_height) - 113.0;
                    if (@mod(WholeHex.items.ptr[i].x, 2) != 0) Y -= halfY;
                    rl.drawTexture(png_town, @intFromFloat(X), @intFromFloat(Y), .white);
                }
            }

            for (0..Rivers.items.len) |i| {
                const X: f32 = @floatFromInt(Rivers.items.ptr[i].x);
                const Y: f32 = @floatFromInt(Rivers.items.ptr[i].y);

                var linePts: struct { i32, i32, i32, i32 } = .{ 0, 0, 0, 0 };
                for (spines) |spine| {
                    const x: i32 = @intFromFloat(X);
                    const y: i32 = @intFromFloat(Y);
                    linePts = switch (spine) {
                        1 => get_line_pts(x, y, hex_width, hex_height, hexPt_A[0], hexPt_A[1], hexPt_B[0], hexPt_B[1]),
                        2 => get_line_pts(x, y, hex_width, hex_height, hexPt_B[0], hexPt_B[1], hexPt_C[0], hexPt_C[1]),
                        4 => get_line_pts(x, y, hex_width, hex_height, hexPt_C[0], hexPt_C[1], hexPt_D[0], hexPt_D[1]),
                        8 => get_line_pts(x, y, hex_width, hex_height, hexPt_C[0], hexPt_C[1], hexPt_E[0], hexPt_E[1]),
                        16 => get_line_pts(x, y, hex_width, hex_height, hexPt_F[0], hexPt_F[1], hexPt_G[0], hexPt_G[1]),
                        else => get_line_pts(x, y, hex_width, hex_height, hexPt_G[0], hexPt_G[1], hexPt_A[0], hexPt_A[1]),
                    };
                    if (spine != Rivers.items.ptr[i].s) continue;
                    rl.drawLineEx(rl.Vector2.init(@floatFromInt(linePts[0]), @floatFromInt(linePts[1])), rl.Vector2.init(@floatFromInt(linePts[2]), @floatFromInt(linePts[3])), 30.0, .blue);
                }
            }

            for (0..Roads.items.len) |i| {
                var X: f32 = @floatFromInt(Roads.items.ptr[i].x);
                var Y: f32 = @floatFromInt(Roads.items.ptr[i].y);
                X = (X * hex_width);
                Y = (Y * hex_height);
                var roadPts: struct { f32, f32, f32, f32 } = .{ 0.0, 0.0, 0.0, 0.0 };
                for (spines) |spine| {
                    //print("{}\n", .{spine});
                    roadPts = switch (spine) {
                        1 => get_road_pts(X, Y, spinePt_A),
                        2 => get_road_pts(X, Y, spinePt_B),
                        4 => get_road_pts(X, Y, spinePt_C),
                        8 => get_road_pts(X, Y, spinePt_D),
                        16 => get_road_pts(X, Y, spinePt_E),
                        else => get_road_pts(X, Y, spinePt_F),
                    };
                    if (spine != Roads.items.ptr[i].s) continue;
                    if (spine == 1) {
                        rl.drawLineEx(rl.Vector2.init(roadPts[0], roadPts[1]), rl.Vector2.init(roadPts[2], roadPts[3]), 30.0, .black);
                        const pt3 = terrain.get_3rd_pt(.{ @intFromFloat(roadPts[2]), @intFromFloat(roadPts[3]) }, spinePt_A);
                        rl.drawLineEx(rl.Vector2.init(roadPts[2], roadPts[3]), rl.Vector2.init(@floatFromInt(pt3[0]), @floatFromInt(pt3[1])), 30.0, .black);
                    }
                    if (spine == 2) {
                        rl.drawLineEx(rl.Vector2.init(roadPts[0], roadPts[1]), rl.Vector2.init(roadPts[2], roadPts[3]), 30.0, .black);
                        const pt3 = terrain.get_3rd_pt(.{ @intFromFloat(roadPts[2]), @intFromFloat(roadPts[3]) }, spinePt_B);
                        rl.drawLineEx(rl.Vector2.init(roadPts[2], roadPts[3]), rl.Vector2.init(@floatFromInt(pt3[0]), @floatFromInt(pt3[1])), 30.0, .black);
                    }
                    if (spine == 4) {
                        rl.drawLineEx(rl.Vector2.init(roadPts[0], roadPts[1]), rl.Vector2.init(roadPts[2], roadPts[3]), 30.0, .black);
                        const pt3 = terrain.get_3rd_pt(.{ @intFromFloat(roadPts[2]), @intFromFloat(roadPts[3]) }, spinePt_C);
                        rl.drawLineEx(rl.Vector2.init(roadPts[2], roadPts[3]), rl.Vector2.init(@floatFromInt(pt3[0]), @floatFromInt(pt3[1])), 30.0, .black);
                    }
                    if (spine == 8) {
                        var p: i32 = @as(i32, @intFromFloat(roadPts[3])) - spinePt_A[1];
                        rl.drawLineEx(rl.Vector2.init(roadPts[2], roadPts[3]), rl.Vector2.init(roadPts[2], @floatFromInt(p)), 30.0, .black);
                        p = @as(i32, @intFromFloat(roadPts[3])) + spinePt_A[1];
                        rl.drawLineEx(rl.Vector2.init(roadPts[2], roadPts[3]), rl.Vector2.init(roadPts[2], @floatFromInt(p)), 30.0, .black);
                    }
                    if (spine == 16) {
                        rl.drawLineEx(rl.Vector2.init(roadPts[0], roadPts[1]), rl.Vector2.init(roadPts[2], roadPts[3]), 30.0, .black);
                        const pt3 = terrain.get_3rd_pt(.{ @intFromFloat(roadPts[2]), @intFromFloat(roadPts[3]) }, spinePt_E);
                        rl.drawLineEx(rl.Vector2.init(roadPts[2], roadPts[3]), rl.Vector2.init(@floatFromInt(pt3[0]), @floatFromInt(pt3[1])), 30.0, .black);
                    }
                    if (spine == 32) {
                        rl.drawLineEx(rl.Vector2.init(roadPts[0], roadPts[1]), rl.Vector2.init(roadPts[2], roadPts[3]), 30.0, .black);
                        const pt3 = terrain.get_3rd_pt(.{ @intFromFloat(roadPts[2]), @intFromFloat(roadPts[3]) }, spinePt_F);
                        rl.drawLineEx(rl.Vector2.init(roadPts[2], roadPts[3]), rl.Vector2.init(@floatFromInt(pt3[0]), @floatFromInt(pt3[1])), 30.0, .black);
                    }
                }
            }

            for (0..WholeHex.items.len) |i| {
                var X: f32 = @floatFromInt(WholeHex.items.ptr[i].x);
                var Y: f32 = @floatFromInt(WholeHex.items.ptr[i].y);
                if (WholeHex.items.ptr[i].id == 4) {
                    X = (X * hex_width) - 130.0;
                    Y = (Y * hex_height) - 113.0;
                    if (@mod(WholeHex.items.ptr[i].x, 2) != 0) Y -= halfY;
                    rl.drawTexture(png_forest, @intFromFloat(X), @intFromFloat(Y), .white);
                }
            }

            // ***** map tiles
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

// ************************************************************************************************
fn get_line_pts(x: i32, y: i32, hex_w: f32, hex_y: f32, p0x: i32, p0y: i32, p1x: i32, p1y: i32) struct { i32, i32, i32, i32 } {
    const float_x: f32 = @as(f32, (@floatFromInt(x))) * hex_w;
    const float_y: f32 = @as(f32, (@floatFromInt(y))) * hex_y;

    const P0x: i32 = @as(i32, @round(float_x)) + p0x;
    const P0y: i32 = @as(i32, @round(float_y)) + p0y;
    const P1x: i32 = @as(i32, @round(float_x)) + p1x;
    const P1y: i32 = @as(i32, @round(float_y)) + p1y;

    return .{ P0x, P0y, P1x, P1y };
}

// ************************************************************************************************
fn get_road_pts(hex_w: f32, hex_y: f32, spine: struct { i32, i32 }) struct { f32, f32, f32, f32 } {
    //print("{d},{d}\n", .{ spine[0], spine[1] });
    const p0x: f32 = hex_w;
    const p0y: f32 = hex_y;
    const p1x: f32 = hex_w + @as(f32, @floatFromInt(spine[0]));
    const p1y: f32 = hex_y + @as(f32, @floatFromInt(spine[1]));

    return .{ p0x, p0y, p1x, p1y };
}
