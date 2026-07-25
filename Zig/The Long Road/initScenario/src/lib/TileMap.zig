const std = @import("std");
const print = std.debug.print;

const s = @import("stuff.zig");

pub fn tile00(rowNum: i32, colNum: i32, curr_tile: []const u8) void {
    const ref_A2Z = [_]i32{ 'A', 'Z' };
    const tile_num = std.fmt.parseInt(i32, curr_tile, 10) catch 0;
    if ((ref_A2Z[0] >= tile_num) or (ref_A2Z[1] <= tile_num)) {
        tile00_rot0();
        return;
    }

    print("{d}, {d}\n", .{ ref_A2Z[0], ref_A2Z[1] });
    print("{d},{d}: {s}\n", .{ rowNum, colNum, curr_tile });
}

// ************************************************************************************************
fn tile00_rot0() void {
    print("yo\n", .{});
}
