const std = @import("std");
const print = std.debug.print;

pub fn main() !void {
    // const tileLetters = "A,b_c_,D";
    // const tileLetters = "A,b_,C";
    // const tileLetters = ",b_,C";
    const tileLetters = "b_,C";
    print("{s}\n", .{tileLetters});

    var it_row = std.mem.splitScalar(u8, tileLetters, '_');
    var locs: [2]i32 = .{ 0, 0 };
    while (it_row.next()) |row| {
        var it_col = std.mem.splitScalar(u8, row, ',');
        while (it_col.next()) |col| {
            print(" {d},{d}: {s}\n", .{ locs[0], locs[1], col });
            locs[0] += 1;
        }
        locs[0] = 0;
        locs[1] += 1;
    }
}
