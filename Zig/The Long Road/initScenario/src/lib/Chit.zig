const std = @import("std");
const print = std.debug.print;

const c = @cImport({
    @cInclude("sqlite3.h");
});

pub fn place(unitID: []const u8, location: []const u8, sessionID: i32) void {
    const instanceID = std.fmt.parseInt(i32, unitID[0..4], 10) catch 0;

    const trimmed = std.mem.trim(u8, location, " ");
    var xy = std.mem.splitAny(u8, trimmed, ",");
    var hex_X: i32 = 0;
    var hex_Y: i32 = 0;
    if (xy.next()) |x| hex_X = std.fmt.parseInt(i32, x, 10) catch 0;
    if (xy.next()) |x| hex_Y = std.fmt.parseInt(i32, x, 10) catch 0;

    // ********** 1: open database
    var db: ?*c.sqlite3 = undefined;
    if (c.sqlite3_open("DB/TLR.db", &db) != c.SQLITE_OK) {
        std.debug.print("Can't open database\n", .{});
        return;
    }
    defer _ = c.sqlite3_close(db);

    set_location(db, hex_X, hex_Y, instanceID, sessionID);
}

// ************************************************************************************************
pub fn adjust_stack(sessionID: i32) void {
    print("yo{d}\n", .{sessionID});
    // ********** 1: open database
    var db: ?*c.sqlite3 = undefined;
    if (c.sqlite3_open("DB/TLR.db", &db) != c.SQLITE_OK) {
        std.debug.print("Can't open database\n", .{});
        return;
    }
    defer _ = c.sqlite3_close(db);

    // ********** statement
    // const query = "select rowid, * from GameCombatant order by hex_x, hex_y, rowid desc";
    const query =
        \\SELECT rowid, hex_x, hex_y, stack
        \\FROM GameCombatant
        \\WHERE sessionID = ?1
        \\ORDER BY hex_x, hex_y, rowid DESC
    ;
    var stmt: ?*c.sqlite3_stmt = null;

    if (c.sqlite3_prepare_v2(db, query, -1, &stmt, null) != c.SQLITE_OK) {
        print("Failed to prepare statement(1): {s}\n", .{c.sqlite3_errmsg(db)});
        return;
    }
    defer _ = c.sqlite3_finalize(stmt);

    // ********** Binding
    _ = c.sqlite3_bind_int(stmt, 1, sessionID);

    // ********** Execute
    var curr_vals = [_]i32{ 0, 0 };
    var prev_vals = [_]i32{ 0, 0 };
    while (c.sqlite3_step(stmt) == c.SQLITE_ROW) {
        const rowid = c.sqlite3_column_int(stmt, 0);
        print("{d}\n", .{rowid});

        curr_vals[0] = c.sqlite3_column_int(stmt, 1);
        curr_vals[1] = c.sqlite3_column_int(stmt, 2);
        if (std.mem.eql(i32, &curr_vals, &prev_vals)) {
            print("!!!\n", .{});
        }
        prev_vals = curr_vals;
    }
}

// ************************************************************************************************
fn set_location(db: ?*c.sqlite3, X: i32, Y: i32, instanceID: i32, sessionID: i32) void {
    //print("{d}: {d},{d}\n", .{ instanceID, X, Y });
    // Prepare statement
    const query =
        \\UPDATE GameCombatant SET
        \\   hex_x = ?1,
        \\   hex_y = ?2,
        \\   flag1 = 1
        \\WHERE
        \\   sessionID = ?3
        \\   AND
        \\   instanceID = ?4
    ;

    var stmt: ?*c.sqlite3_stmt = null;

    if (c.sqlite3_prepare_v2(db, query, -1, &stmt, null) != c.SQLITE_OK) {
        print("Failed to prepare statement(1): {s}\n", .{c.sqlite3_errmsg(db)});
        return;
    }
    defer _ = c.sqlite3_finalize(stmt);

    // Binding
    _ = c.sqlite3_bind_int(stmt, 1, X);
    _ = c.sqlite3_bind_int(stmt, 2, Y);
    _ = c.sqlite3_bind_int(stmt, 3, sessionID);
    _ = c.sqlite3_bind_int(stmt, 4, instanceID);

    // Execute
    if (c.sqlite3_step(stmt) != c.SQLITE_DONE) {
        print("Execution failed: {s}\n", .{c.sqlite3_errmsg(db)});
        return;
    }
}
