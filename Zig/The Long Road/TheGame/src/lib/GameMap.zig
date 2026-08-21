const std = @import("std");
const print = std.debug.print;

const tile = @import("Tile.zig");

pub const GameMap = struct {
    GMap: [4][4]i32,

    pub fn init(tileLetters: []const u8) GameMap {
        var GMap: [4][4]i32 = [4][4]i32{
            [4]i32{ -1, -1, -1, -1 },
            [4]i32{ -1, -1, -1, -1 },
            [4]i32{ -1, -1, -1, -1 },
            [4]i32{ -1, -1, -1, -1 },
        };

        var it_Row = std.mem.splitScalar(u8, tileLetters, '_');
        var locCR: [2]i32 = .{ 0, 0 };
        while (it_Row.next()) |Row| {
            var it_Col = std.mem.splitScalar(u8, Row, ',');
            while (it_Col.next()) |Col| {
                if (Col.len < 1) {
                    locCR[0] += 1;
                    continue;
                }
                GMap[@intCast(locCR[0])][@intCast(locCR[1])] = @intCast(Col[0]);
                locCR[0] += 1;
            }
            locCR[0] = 0;
            locCR[1] += 1;
        }

        return GameMap{
            .GMap = GMap,
        };
    }

    // ********************************************************************************************
    pub fn modify_GMap(self: *GameMap, tiles: *std.ArrayList(tile.Tile)) void {
        for (0..4) |row| {
            for (0..4) |col| {
                const X = get_tile_id(tiles, self.GMap[@intCast(col)][@intCast(row)]);
                self.GMap[@intCast(col)][@intCast(row)] = X;
            }
        }
    }

    // ==========================================
    fn get_tile_id(tiles: *std.ArrayList(tile.Tile), letter: i32) i32 {
        const ref_A: i32 = 'A';
        const ref_a: i32 = 'a';

        var rotation: f32 = 0.0;
        var ref = letter - ref_A;
        if (ref > 26) {
            ref = letter - ref_a;
            rotation = 180;
        }

        var tile_id: i32 = -1;
        for (0..tiles.items.len) |x| {
            if (ref >= 0) {
                if ((ref == tiles.items[x].id) and (rotation == tiles.items[x].rotation))
                    tile_id = @intCast(x);
            }
        }

        return tile_id;
    }

    // ********************************************************************************************
    pub fn foo(self: GameMap) void {
        _ = self;
        print("************** yo ************\n", .{});
    }

    pub fn bar(self: GameMap) void {
        _ = self;
        print("************** yeah ************\n", .{});
    }
};
