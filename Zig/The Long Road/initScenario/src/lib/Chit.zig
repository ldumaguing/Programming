const std = @import("std");
const print = std.debug.print;

const c = @import("c");

// ************************************************************************************************
pub fn adj_flag1(db: ?*c.sqlite3, sessionID: i32) void {
    const q1 =
        \\SELECT A_id, relationship, B_id
        \\FROM GameRelationship
        \\WHERE sessionID = ?1
    ;
    var stmt: ?*c.sqlite3_stmt = null;
    defer _ = c.sqlite3_finalize(stmt);

    // Prepare statement
    if (c.sqlite3_prepare_v2(db, q1, -1, &stmt, null) != c.SQLITE_OK) {
        print("Failed to prepare statement(1): {s}\n", .{c.sqlite3_errmsg(db)});
        return;
    }

    // Binding
    _ = c.sqlite3_bind_int(stmt, 1, sessionID);

    // Execute
    while (c.sqlite3_step(stmt) == c.SQLITE_ROW) {
        const A_id: i32 = c.sqlite3_column_int(stmt, 0);
        const relationship: i32 = c.sqlite3_column_int(stmt, 1);
        const B_id: i32 = c.sqlite3_column_int(stmt, 2);
        print("{d},{d},{d}\n", .{ A_id, relationship, B_id });
        flag1_A(db, sessionID, A_id, relationship);
        flag1_B(db, sessionID, B_id, relationship);
    }
}

// =============================
fn flag1_B(db: ?*c.sqlite3, sessionID: i32, B_id: i32, relationship: i32) void {
    const q1 =
        \\SELECT flag1
        \\FROM GameCombatant
        \\WHERE sessionID = ?1 AND instanceID = ?2
    ;
    var stmt: ?*c.sqlite3_stmt = null;
    defer _ = c.sqlite3_finalize(stmt);

    // ********** Prepare statement
    if (c.sqlite3_prepare_v2(db, q1, -1, &stmt, null) != c.SQLITE_OK) {
        print("Failed to prepare statement(1): {s}\n", .{c.sqlite3_errmsg(db)});
        return;
    }

    // ********** Binding
    _ = c.sqlite3_bind_int(stmt, 1, sessionID);
    _ = c.sqlite3_bind_int(stmt, 2, B_id);

    // ********** Execute
    var flag1: i32 = 0;
    if (c.sqlite3_step(stmt) == c.SQLITE_ROW) {
        flag1 = c.sqlite3_column_int(stmt, 0);
    }

    // ---------------------------
    const new_flag1: i32 = (relationship << 1) | (flag1);
    print("yo{d}\n", .{new_flag1});
    const q2 =
        \\UPDATE GameCombatant
        \\SET flag1 = ?1
        \\WHERE sessionID = ?2 AND instanceID = ?3
    ;

    // ********** Prepare statement
    if (c.sqlite3_prepare_v2(db, q2, -1, &stmt, null) != c.SQLITE_OK) {
        print("Failed to prepare statement(1): {s}\n", .{c.sqlite3_errmsg(db)});
        return;
    }

    // ********** Binding
    _ = c.sqlite3_bind_int(stmt, 1, new_flag1);
    _ = c.sqlite3_bind_int(stmt, 2, sessionID);
    _ = c.sqlite3_bind_int(stmt, 3, B_id);

    // ********** Execute
    if (c.sqlite3_step(stmt) != c.SQLITE_DONE) {
        print("Failed to clear: {s}\n", .{c.sqlite3_errmsg(db)});
        return;
    }
}

// =============================
fn flag1_A(db: ?*c.sqlite3, sessionID: i32, A_id: i32, relationship: i32) void {
    const q1 =
        \\SELECT flag1
        \\FROM GameCombatant
        \\WHERE sessionID = ?1 AND instanceID = ?2
    ;
    var stmt: ?*c.sqlite3_stmt = null;
    defer _ = c.sqlite3_finalize(stmt);

    // ********** Prepare statement
    if (c.sqlite3_prepare_v2(db, q1, -1, &stmt, null) != c.SQLITE_OK) {
        print("Failed to prepare statement(1): {s}\n", .{c.sqlite3_errmsg(db)});
        return;
    }

    // ********** Binding
    _ = c.sqlite3_bind_int(stmt, 1, sessionID);
    _ = c.sqlite3_bind_int(stmt, 2, A_id);

    // ********** Execute
    var flag1: i32 = 0;
    if (c.sqlite3_step(stmt) == c.SQLITE_ROW) {
        flag1 = c.sqlite3_column_int(stmt, 0);
    }

    // ---------------------------
    const new_flag1: i32 = (relationship << 1) | (flag1);
    print("yo{d}\n", .{new_flag1});
    const q2 =
        \\UPDATE GameCombatant
        \\SET flag1 = ?1
        \\WHERE sessionID = ?2 AND instanceID = ?3
    ;

    // ********** Prepare statement
    if (c.sqlite3_prepare_v2(db, q2, -1, &stmt, null) != c.SQLITE_OK) {
        print("Failed to prepare statement(1): {s}\n", .{c.sqlite3_errmsg(db)});
        return;
    }

    // ********** Binding
    _ = c.sqlite3_bind_int(stmt, 1, new_flag1);
    _ = c.sqlite3_bind_int(stmt, 2, sessionID);
    _ = c.sqlite3_bind_int(stmt, 3, A_id);

    // ********** Execute
    if (c.sqlite3_step(stmt) != c.SQLITE_DONE) {
        print("Failed to clear: {s}\n", .{c.sqlite3_errmsg(db)});
        return;
    }
}

// ************************************************************************************************
pub fn shipping(sessionID: i32, subject: []const u8, target: []const u8, shippage: []const u8, db: ?*c.sqlite3) void {
    const query1 =
        \\INSERT INTO GameRelationship
        \\(sessionID, A_id, B_id, relationship)
        \\VALUES
        \\(?1, ?2, ?3, (1 << ?4))
    ;
    var stmt: ?*c.sqlite3_stmt = null;
    defer _ = c.sqlite3_finalize(stmt);

    // Prepare statement
    if (c.sqlite3_prepare_v2(db, query1, -1, &stmt, null) != c.SQLITE_OK) {
        print("Failed to prepare statement(1): {s}\n", .{c.sqlite3_errmsg(db)});
        return;
    }

    // Binding
    const subj: i32 = std.fmt.parseInt(i32, subject, 10) catch 0;
    const targ: i32 = std.fmt.parseInt(i32, target, 10) catch 0;
    const ship: i32 = std.fmt.parseInt(i32, shippage, 10) catch 0;
    _ = c.sqlite3_bind_int(stmt, 1, sessionID);
    _ = c.sqlite3_bind_int(stmt, 2, subj);
    _ = c.sqlite3_bind_int(stmt, 3, targ);
    _ = c.sqlite3_bind_int(stmt, 4, ship);

    // Execute the insertion step
    if (c.sqlite3_step(stmt) != c.SQLITE_DONE) {
        print("Failed to clear: {s}\n", .{c.sqlite3_errmsg(db)});
        return;
    }
}

// ************************************************************************************************
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
    // ********** 1: open database
    var db: ?*c.sqlite3 = undefined;
    if (c.sqlite3_open("DB/TLR.db", &db) != c.SQLITE_OK) {
        std.debug.print("Can't open database\n", .{});
        return;
    }
    defer _ = c.sqlite3_close(db);

    // ********** statement
    const query =
        \\SELECT rowid, hex_x, hex_y, stack, instanceID
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
    var lvl: i32 = 0;
    while (c.sqlite3_step(stmt) == c.SQLITE_ROW) {
        //const rowid = c.sqlite3_column_int(stmt, 0);
        curr_vals[0] = c.sqlite3_column_int(stmt, 1);
        curr_vals[1] = c.sqlite3_column_int(stmt, 2);

        const instanceID = c.sqlite3_column_int(stmt, 4);

        if (std.mem.eql(i32, &curr_vals, &prev_vals)) {
            lvl += 1;
        } else {
            lvl = 0;
        }

        //print("{d}:{d},{d}---", .{ instanceID, curr_vals[0], curr_vals[1] });
        //print("{d}\n", .{lvl});

        // ========================================================================================
        const query1 =
            \\UPDATE GameCombatant
            \\SET stack = ?1
            \\WHERE sessionID = ?2
            \\AND
            \\instanceID = ?3
        ;

        var stmt1: ?*c.sqlite3_stmt = null;

        if (c.sqlite3_prepare_v2(db, query1, -1, &stmt1, null) != c.SQLITE_OK) {
            print("Failed to prepare statement(1): {s}\n", .{c.sqlite3_errmsg(db)});
            return;
        }
        defer _ = c.sqlite3_finalize(stmt1);

        // ********** Binding
        _ = c.sqlite3_bind_int(stmt1, 1, lvl);
        _ = c.sqlite3_bind_int(stmt1, 2, sessionID);
        _ = c.sqlite3_bind_int(stmt1, 3, instanceID);

        // ********** Execute
        _ = c.sqlite3_step(stmt1);

        // ========================================================================================
        prev_vals = curr_vals;
    }
}

// ************************************************************************************************
fn set_location(db: ?*c.sqlite3, X: i32, Y: i32, instanceID: i32, sessionID: i32) void {
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
