const std = @import("std");
const print = std.debug.print;

const c = @cImport({
    @cInclude("sqlite3.h");
});

const s = @import("stuff.zig");

pub fn tile00(rowNum: i32, colNum: i32, curr_tile: []const u8, sessionID: i32) void {
    // ********** 1: open database
    // [I can't get main's db connection, so I'm connecting the the database again.]
    var db: ?*c.sqlite3 = undefined;
    if (c.sqlite3_open("DB/TLR.db", &db) != c.SQLITE_OK) {
        std.debug.print("Can't open database\n", .{});
        return;
    }
    defer _ = c.sqlite3_close(db);

    // *********************************************
    const ref_A2Z = [_]i32{ 'A', 'Z' };

    if ((ref_A2Z[0] <= curr_tile[0]) and (ref_A2Z[1] >= curr_tile[0])) {
        tile00_rot0(db, rowNum, colNum, curr_tile[0], sessionID);
        return;
    }

    // lower case
    tile00_rot180(rowNum, colNum, curr_tile[0]);
}

// ************************************************************************************************
fn tile00_rot0(db: ?*c.sqlite3, rowNum: i32, colNum: i32, tile_num: i32, sessionID: i32) void {
    print("...rot0{d}..{d}..{d}\n", .{ rowNum, colNum, tile_num });
    const tnum = tile_num - 'A';
    print("....{d}: {s}\n", .{ tnum, s.maps[@intCast(tnum)] });
    print("{d},{d}\n", .{ rowNum, colNum });
    for (0..19) |col| {
        if (@mod(col, 2) != 0) {
            for (1..13) |row| {
                place_tile00_rot0(db, @intCast(row), @intCast(col), s.maps[@intCast(tnum)], sessionID);
            }
        } else {
            for (0..13) |row| {
                place_tile00_rot0(db, @intCast(row), @intCast(col), s.maps[@intCast(tnum)], sessionID);
            }
        }
    }
}

// =======================================================================
fn place_tile00_rot0(db: ?*c.sqlite3, row: i32, col: i32, tname: []const u8, sessionID: i32) void {
    print("{?}: {d},{d}: {s},{d}\n", .{ db, row, col, tname, sessionID });
}

// ***********************************************************************
fn tile00_rot180(rowNum: i32, colNum: i32, tile_num: i32) void {
    const tnum = tile_num - 'a';
    if ((tnum > 25) or (tnum < 0)) return;
    print("------------------{d},{d},{d}\n", .{ rowNum, colNum, tile_num });
}
