const std = @import("std");
const print = std.debug.print;

const tile = @import("Tile.zig");

pub const GameMap = struct {
    GMap: [4][4]i32,

    pub fn init(tileLetters: []const u8) GameMap {
        print("{s}\n", .{tileLetters});

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
        print("modifying....................\n", .{});

        //self.GMap[0][0] = get_tile_id(tiles);

        //print("{d}\n", .{tiles.items.len});
        //for (0..tiles.items.len) |x| {
        //    print("{d}:{d}, ", .{ tiles.items[x].id, tiles.items[x].rotation });
        //}
        //print("\n", .{});

        for (0..4) |row| {
            for (0..4) |col| {
                //        print("({d},{d})", .{ col, row });
                //        print("{d},", .{self.GMap[@intCast(col)][@intCast(row)]});
                const X = get_tile_id(tiles, self.GMap[@intCast(col)][@intCast(row)]);
                //print("> {d}\n", .{X});
                self.GMap[@intCast(col)][@intCast(row)] = X;
            }
            //    print("\n", .{});
        }
    }

    // ==========================================
    fn get_tile_id(tiles: *std.ArrayList(tile.Tile), letter: i32) i32 {
        const ref_A: i32 = 'A';
        const ref_a: i32 = 'a';
        //print("{d}:{d}\n", .{ ref_A, ref_a });

        var rotation: f32 = 0.0;
        var ref = letter - ref_A;
        if (ref > 26) {
            ref = letter - ref_a;
            rotation = 180;
        }

        var tile_id: i32 = -1;
        for (0..tiles.items.len) |x| {
            // print("{d}:{d}, ", .{ tiles.items[x].id, tiles.items[x].rotation });
            if (ref >= 0) {
                //print("{d}...{d}:{d} --- {d}:{d}\n", .{ x, ref, rotation, tiles.items[x].id, tiles.items[x].rotation });
                if ((ref == tiles.items[x].id) and (rotation == tiles.items[x].rotation))
                    tile_id = @intCast(x);
            }
        }
        //print("{d}\n", .{letter});
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
