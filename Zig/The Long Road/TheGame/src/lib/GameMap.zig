const std = @import("std");
const print = std.debug.print;

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
    pub fn foo(self: GameMap) void {
        _ = self;
        print("************** yo ************\n", .{});
    }

    pub fn bar(self: GameMap) void {
        _ = self;
        print("************** yeah ************\n", .{});
    }
};
