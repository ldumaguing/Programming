const rl = @import("raylib");
const std = @import("std");
const print = std.debug.print;

const sqlite3 = @import("lib/Database.zig");
const gamemap = @import("lib/GameMap.zig");
const tile = @import("lib/Tile.zig");
const terrain = @import("lib/Terrain.zig");
const hexagon = @import("lib/Hexagon.zig");
const combatant = @import("lib/Combatant.zig");

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

    var Bridges = std.ArrayList(terrain.Bridge).empty;
    defer Bridges.deinit(allocator);

    var Paths = std.ArrayList(terrain.Path).empty;
    defer Paths.deinit(allocator);

    // ***** Combatant
    var Combatants = std.ArrayList(combatant.Combatant).empty;
    defer Combatants.deinit(allocator);

    try db.add_combatants(allocator, &Combatants);
    print("combatant count: {d}\n", .{Combatants.items.len});
    for (0..Combatants.items.len) |i| {
        print("...{d}: {s}\n", .{ Combatants.items.ptr[i].instanceID, Combatants.items.ptr[i].imagefile[0..@intCast(Combatants.items.ptr[i].imagefile_len)] });
    }

    // ********************************************************************************************
    const screenWidth = 320;
    const screenHeight = 240;

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

    try db.add_map_rollings(allocator, &WholeHex);
    try db.add_map_cultivated(allocator, &WholeHex);
    try db.add_map_forest(allocator, &WholeHex);
    try db.add_map_city(allocator, &WholeHex);
    try db.add_map_town(allocator, &WholeHex);
    print("count: {d}\n", .{WholeHex.items.len});

    // ********************************************************************************************
    if (terrain.is_hill_blocks_LOS(&Hills, &Paths)) {
        print("*********** block *************\n", .{});
    }
}
