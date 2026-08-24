const rl = @import("raylib");
const std = @import("std");
const print = std.debug.print;

const sqlite3 = @import("lib/Database.zig");
const cardboard = @import("lib/Cardboard.zig");
const gamemap = @import("lib/GameMap.zig");
const tile = @import("lib/Tile.zig");

pub fn main() anyerror!void {
    const db = sqlite3.Database.init();
    defer db.close();

    var arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    defer arena.deinit();
    const allocator = arena.allocator();

    // var Assets = std.ArrayList(rl.Image).empty;
    // defer Assets.deinit(allocator);

    var Textures = std.ArrayList(rl.Texture).empty;
    defer Textures.deinit(allocator);

    var Tiles = std.ArrayList(tile.Tile).empty;
    defer Tiles.deinit(allocator);

    // ********************************************************************************************
    const screenWidth = 1280;
    const screenHeight = 720;

    rl.setConfigFlags(.{ .window_undecorated = true });
    rl.initWindow(screenWidth, screenHeight, "The Long Road");
    defer rl.closeWindow();

    // ==========================================================
    try db.add_map_tiles(allocator, &Textures, &Tiles);
    print("tile count: {d}\n", .{Tiles.items.len});

    const tileLetters = try db.get_tileLetters(allocator);
    defer allocator.free(tileLetters);

    var gMap = gamemap.GameMap.init(tileLetters);

    for (0..4) |row| {
        for (0..4) |col| {
            print("({d},{d})", .{ col, row });
            print("{d},", .{gMap.GMap[@intCast(col)][@intCast(row)]});
        }
        print("\n", .{});
    }

    print("{d}\n", .{Tiles.items.len});
    for (0..Tiles.items.len) |x| {
        print("{d}:{d}, ", .{ Tiles.items[x].id, Tiles.items[x].rotation });
    }
    print("\n", .{});

    gMap.modify_GMap(&Tiles);

    for (0..4) |row| {
        for (0..4) |col| {
            print("({d},{d})", .{ col, row });
            print("{d},", .{gMap.GMap[@intCast(col)][@intCast(row)]});
        }
        print("\n", .{});
    }
    print("\n", .{});

    db.foo();

    // ==========================================================
    //var mapTile: rl.Texture = undefined;
    //const mapTile1 = Textures.items.ptr[0];
    //const mapTile2 = Textures.items.ptr[1];

    // ==========================================================
    rl.setTargetFPS(12);

    var camera = rl.Camera2D{
        .target = .{ .x = 0, .y = 0 },
        .offset = .{ .x = 0, .y = 0 },
        .zoom = 0.5,
        .rotation = 0,
    };

    while (!rl.windowShouldClose()) {
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

        rl.clearBackground(.blue);

        {
            camera.begin();
            defer camera.end();

            // rl.clearBackground(.white);
            //rl.drawTexture(mapTile1, 0, 0, .white);
            //rl.drawTexture(mapTile2, 1000, 0, .white);

            for (0..4) |row| {
                for (0..4) |col| {
                    if (gMap.GMap[@intCast(col)][@intCast(row)] >= 0) {
                        print("({d},{d})", .{ col, row });
                        print("{d},", .{gMap.GMap[@intCast(col)][@intCast(row)]});

                        //  const tile_num = gMap.GMap[@intCast(col)][@intCast(row)];
                        const tile_num = Tiles.items.ptr[@intCast(gMap.GMap[@intCast(col)][@intCast(row)])].index;
                        print("---{d}", .{Tiles.items.ptr[@intCast(tile_num)].index});
                        const X: f32 = @as(f32, @floatFromInt(col)) * @as(f32, @floatFromInt(db.pixelCount[0]));
                        const Y: f32 = @as(f32, @floatFromInt(row)) * @as(f32, @floatFromInt(db.pixelCount[1]));
                        const rotation: f32 = Tiles.items.ptr[@intCast(gMap.GMap[@intCast(col)][@intCast(row)])].rotation;
                        //print("{d}\n", .{db.pixelCount[0]});
                        print("---> {d}", .{rotation});
                        if (rotation > 0) {
                            const mod_x = X + @as(f32, @floatFromInt(db.pixelCount[0]));
                            const mod_y = Y + @as(f32, @floatFromInt(db.pixelCount[1]));
                            rl.drawTextureEx(Textures.items.ptr[@intCast(tile_num)], .{ .x = mod_x, .y = mod_y }, rotation, 1.0, .white);
                        } else {
                            rl.drawTextureEx(Textures.items.ptr[@intCast(tile_num)], .{ .x = X, .y = 0 }, rotation, 1.0, .white);
                        }
                        // void DrawTextureEx(Texture2D texture, Vector2 position, float rotation, float scale, Color tint);
                    }
                }
                print("\n", .{});
            }
        }
    }
}
