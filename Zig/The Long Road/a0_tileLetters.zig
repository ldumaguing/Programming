const std = @import("std");
const print = std.debug.print;

pub fn main() !void {
    const tileLetters = "A,b_c_,D";
    // const tileLetters = "A,b_,C";
    // const tileLetters = ",b_,C";
    // const tileLetters = "b_,C";
    print("{s}\n", .{tileLetters});

    var it_Row = std.mem.splitScalar(u8, tileLetters, '_');
    var locCR: [2]i32 = .{ 0, 0 };
    while (it_Row.next()) |Row| {
        var it_Col = std.mem.splitScalar(u8, Row, ',');
        while (it_Col.next()) |Col| {
            print(" {d},{d}: {s}\n", .{ locCR[0], locCR[1], Col });
            locCR[0] += 1;
        }
        locCR[0] = 0;
        locCR[1] += 1;
    }
}
