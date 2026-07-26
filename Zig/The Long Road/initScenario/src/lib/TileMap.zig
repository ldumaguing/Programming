const std = @import("std");
const print = std.debug.print;

const c = @cImport({
    @cInclude("sqlite3.h");
});

const s = @import("stuff.zig");

pub fn tile00(curr_tile: []const u8, sessionID: i32) void {
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
        tile00_rot0(db, curr_tile[0], sessionID);
        return;
    }

    // lower case
    tile00_rot180(curr_tile[0]);
}

// ************************************************************************************************
fn tile00_rot0(db: ?*c.sqlite3, tile_num: i32, sessionID: i32) void {
    clear_temp_map(db);

    const tnum = tile_num - 'A';
    place_tile00_rot0(db, s.maps[@intCast(tnum)], sessionID);
    //for (0..19) |col| {
    //    if (@mod(col, 2) != 0) {
    //        for (1..13) |row| {
    //            place_tile00_rot0(db, @intCast(row), @intCast(col), s.maps[@intCast(tnum)], sessionID);
    //        }
    //    } else {
    //        for (0..13) |row| {
    //            place_tile00_rot0(db, @intCast(row), @intCast(col), s.maps[@intCast(tnum)], sessionID);
    //        }
    //    }
    //}
}

// =======================================================================
fn place_tile00_rot0(db: ?*c.sqlite3, tname: []const u8, sessionID: i32) void {
    // Prepare statement
    const query =
        \\INSERT INTO gamemaptemp
        \\(sessionID, terrainNum, hex_x, hex_y, terrainName, terrainType, spineLoc)
        \\select ?1, terrainNum, hex_x, hex_y, terrainName, terrainType, spineLoc
        \\from MAP
        \\where filename = ?2
    ;

    var stmt: ?*c.sqlite3_stmt = null;

    if (c.sqlite3_prepare_v2(db, query, -1, &stmt, null) != c.SQLITE_OK) {
        print("Failed to prepare statement(1): {s}\n", .{c.sqlite3_errmsg(db)});
        return;
    }
    defer _ = c.sqlite3_finalize(stmt);

    // Binding
    _ = c.sqlite3_bind_int(stmt, 1, sessionID);
    _ = c.sqlite3_bind_text(stmt, 2, tname.ptr, @intCast(tname.len), c.SQLITE_TRANSIENT);

    // Execute the insertion step
    if (c.sqlite3_step(stmt) != c.SQLITE_DONE) {
        print("Execution failed: {s}\n", .{c.sqlite3_errmsg(db)});
        return;
    }
}

// ***********************************************************************
fn tile00_rot180(tile_num: i32) void {
    const tnum = tile_num - 'a';
    if ((tnum > 25) or (tnum < 0)) return;
    print("------------------{d}\n", .{tile_num});
}

// ************************************************************************************************
fn clear_temp_map(db: ?*c.sqlite3) void {
    print("********************* CLEAR GAME MAP temp\n", .{});
    // Prepare statement
    const query = "DELETE FROM gamemaptemp";

    var stmt: ?*c.sqlite3_stmt = null;

    if (c.sqlite3_prepare_v2(db, query, -1, &stmt, null) != c.SQLITE_OK) {
        print("Failed to prepare statement(1): {s}\n", .{c.sqlite3_errmsg(db)});
        return;
    }
    defer _ = c.sqlite3_finalize(stmt);

    // Execute the insertion step
    if (c.sqlite3_step(stmt) != c.SQLITE_DONE) {
        print("Failed to clear: {s}\n", .{c.sqlite3_errmsg(db)});
        return;
    }
}
