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
    tile00_rot180(db, curr_tile[0], sessionID);
}

// ************************************************************************************************
fn tile00_rot0(db: ?*c.sqlite3, tile_num: i32, sessionID: i32) void {
    clear_game(db, sessionID);

    const tnum = tile_num - 'A';
    place_tile00_rot0(db, s.maps[@intCast(tnum)], sessionID);
}

// =======================================================================
fn place_tile00_rot0(db: ?*c.sqlite3, tname: []const u8, sessionID: i32) void {
    // Prepare statement
    const query =
        \\INSERT INTO GameMap
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
fn tile00_rot180(db: ?*c.sqlite3, tile_num: i32, sessionID: i32) void {
    clear_game(db, sessionID);
    const tnum = tile_num - 'a';
    if ((tnum > 25) or (tnum < 0)) return;
    // print("------------------{d}\n", .{tile_num});

    for (0..19) |col| {
        if (@mod(col, 2) != 0) {
            for (1..13) |row| {
                hex_move(db, @intCast(col), @intCast(row), tnum, sessionID);
            }
        } else {
            for (0..13) |row| {
                hex_move(db, @intCast(col), @intCast(row), tnum, sessionID);
            }
        }
    }

    hex_180(db);
}

// =======================================================================
fn hex_180(db: ?*c.sqlite3) void {
    print("{?}\n", .{db});
    // Prepare statement
    const query1 =
        \\SELECT
        \\   rowid, hex_x, hex_y, spineLoc
        \\FROM
        \\   gamemaptemp
        \\WHERE
        \\   spineLoc > 1
    ;

    var stmt: ?*c.sqlite3_stmt = null;

    if (c.sqlite3_prepare_v2(db, query1, -1, &stmt, null) != c.SQLITE_OK) {
        print("Failed to prepare statement(1): {s}\n", .{c.sqlite3_errmsg(db)});
        return;
    }
    defer _ = c.sqlite3_finalize(stmt);

    // ********** 3: loop result
    while (c.sqlite3_step(stmt) == c.SQLITE_ROW) {
        const rowid: i32 = @intCast(c.sqlite3_column_int64(stmt, 0));
        const hex_x: i32 = @intCast(c.sqlite3_column_int64(stmt, 1));
        const hex_y: i32 = @intCast(c.sqlite3_column_int64(stmt, 2));
        const spineLoc: i32 = @intCast(c.sqlite3_column_int64(stmt, 3));

        if (spineLoc == 1) spine_180(db, rowid, hex_x, hex_y + 1, 1);
        if (spineLoc == 2) spine_180(db, rowid, hex_x, hex_y, 16);
        if (spineLoc == 4) spine_180(db, rowid, hex_x, hex_y, 32);
        if (spineLoc == 8) spine_180(db, rowid, hex_x - 2, hex_y, 8);
        if (spineLoc == 16) spine_180(db, rowid, hex_x, hex_y, 2);
        if (spineLoc == 32) spine_180(db, rowid, hex_x, hex_y, 4);
    }
}
// ==============================================
fn spine_180(db: ?*c.sqlite3, rowid: i32, hex_x: i32, hex_y: i32, spineLoc: i32) void {
    print("{d}: {d},{d},{d}\n", .{ rowid, hex_x, hex_y, spineLoc });
    // Prepare statement
    const query1 =
        \\UPDATE gamemaptemp SET
        \\   hex_x =    ?1,
        \\   hex_y =    ?2,
        \\   spineLoc = ?3
        \\WHERE rowid = ?4
    ;

    var stmt: ?*c.sqlite3_stmt = null;

    if (c.sqlite3_prepare_v2(db, query1, -1, &stmt, null) != c.SQLITE_OK) {
        print("Failed to prepare statement(1): {s}\n", .{c.sqlite3_errmsg(db)});
        return;
    }
    defer _ = c.sqlite3_finalize(stmt);

    // Binding
    _ = c.sqlite3_bind_int(stmt, 1, hex_x);
    _ = c.sqlite3_bind_int(stmt, 2, hex_y);
    _ = c.sqlite3_bind_int(stmt, 3, spineLoc);
    _ = c.sqlite3_bind_int(stmt, 4, rowid);

    // Execute the insertion step
    if (c.sqlite3_step(stmt) != c.SQLITE_DONE) {
        print("Execution failed: {s}\n", .{c.sqlite3_errmsg(db)});
        return;
    }
}

// =======================================================================
fn hex_move(db: ?*c.sqlite3, col: i32, row: i32, tnum: i32, sessionID: i32) void {
    const col_r = 18 - col;
    var row_r = 12 - row;
    if (@mod(col_r, 2) != 0) row_r += 1;

    //print("{d},{d}: {d} :{d},{d} -- {s}\n", .{ col_r, row_r, tnum, col, row, s.maps[@intCast(tnum)] });

    // Prepare statement
    const query1 =
        \\INSERT INTO gamemaptemp
        \\(sessionid, terrainNum, hex_x, hex_y, terrainName, terrainType, spineLoc)
        \\SELECT
        \\?1,
        \\terrainNum,
        \\?2,
        \\?3,
        \\terrainName,
        \\terrainType,
        \\spineLoc
        \\FROM MAP WHERE
        \\hex_x = ?4 AND hex_y = ?5
        \\AND
        \\filename = ?6
    ;

    var stmt: ?*c.sqlite3_stmt = null;

    if (c.sqlite3_prepare_v2(db, query1, -1, &stmt, null) != c.SQLITE_OK) {
        print("Failed to prepare statement(1): {s}\n", .{c.sqlite3_errmsg(db)});
        return;
    }
    defer _ = c.sqlite3_finalize(stmt);

    // Binding
    _ = c.sqlite3_bind_int(stmt, 1, sessionID);
    _ = c.sqlite3_bind_int(stmt, 2, col_r);
    _ = c.sqlite3_bind_int(stmt, 3, row_r);
    _ = c.sqlite3_bind_int(stmt, 4, col);
    _ = c.sqlite3_bind_int(stmt, 5, row);
    _ = c.sqlite3_bind_text(stmt, 6, s.maps[@intCast(tnum)].ptr, @intCast(s.maps[@intCast(tnum)].len), c.SQLITE_TRANSIENT);

    // Execute the insertion step
    if (c.sqlite3_step(stmt) != c.SQLITE_DONE) {
        print("Execution failed: {s}\n", .{c.sqlite3_errmsg(db)});
        return;
    }
}

// ************************************************************************************************
fn clear_game(db: ?*c.sqlite3, sessionID: i32) void {
    print("********************* CLEAR GAME MAP\n", .{});
    // Prepare statement
    const query = "DELETE FROM GameMap WHERE sessionID = ?1";

    var stmt: ?*c.sqlite3_stmt = null;

    if (c.sqlite3_prepare_v2(db, query, -1, &stmt, null) != c.SQLITE_OK) {
        print("Failed to prepare statement(1): {s}\n", .{c.sqlite3_errmsg(db)});
        return;
    }
    defer _ = c.sqlite3_finalize(stmt);

    // Binding
    _ = c.sqlite3_bind_int(stmt, 1, sessionID);

    // Execute the insertion step
    if (c.sqlite3_step(stmt) != c.SQLITE_DONE) {
        print("Failed to clear: {s}\n", .{c.sqlite3_errmsg(db)});
        return;
    }

    // **********
    print("********************* CLEAR GAME MAP temp\n", .{});
    // Prepare statement
    const query1 = "DELETE FROM gamemaptemp";

    stmt = null;

    if (c.sqlite3_prepare_v2(db, query1, -1, &stmt, null) != c.SQLITE_OK) {
        print("Failed to prepare statement(1): {s}\n", .{c.sqlite3_errmsg(db)});
        return;
    }

    // Execute the insertion step
    if (c.sqlite3_step(stmt) != c.SQLITE_DONE) {
        print("Failed to clear: {s}\n", .{c.sqlite3_errmsg(db)});
        return;
    }
}
