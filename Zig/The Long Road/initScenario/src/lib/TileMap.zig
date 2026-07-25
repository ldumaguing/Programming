const std = @import("std");
const print = std.debug.print;

const s = @import("stuff.zig");

pub fn tile00(rowNum: i32, colNum: i32, curr_tile: []const u8) void {
    const ref_A2Z = [_]i32{ 'A', 'Z' };

    if ((ref_A2Z[0] <= curr_tile[0]) and (ref_A2Z[1] >= curr_tile[0])) {
        tile00_rot0(rowNum, colNum, curr_tile[0]);
        return;
    }

    tile00_rot180(rowNum, colNum, curr_tile[0]);
}

// ************************************************************************************************
fn tile00_rot0(rowNum: i32, colNum: i32, tile_num: i32) void {
    print("...rot0{d}..{d}..{d}\n", .{ rowNum, colNum, tile_num });
    const tnum = tile_num - 'A';
    print("...{d}: {s}\n", .{ tnum, s.maps[@intCast(tnum)] });
    print("{d},{d}\n", .{ rowNum, colNum });
    for (0..19) |col| {
        if (@mod(col, 2) != 0) {
            for (1..13) |row| {
                print("..{d},{d}\n", .{row, col});
            }
        } else {
            for (0..13) |row| {
                print("..{d},{d}\n", .{row, col});
            }
        }
    }
}

// ***********************************************************************
fn tile00_rot180(rowNum: i32, colNum: i32, tile_num: i32) void {
    const tnum = tile_num - 'a';
    if ((tnum > 25) or (tnum < 0)) return;
    print("------------------{d},{d},{d}\n", .{ rowNum, colNum, tile_num });
}
