const std = @import("std");
const print = std.debug.print;

const c = @cImport({
    @cInclude("sqlite3.h");
});

pub const SQLite = struct {
    db: ?*c.sqlite3,
    currSession: i64,

    // Conventional constructor function
    pub fn init() SQLite {
        var db: ?*c.sqlite3 = undefined;
        // ********** 1: open database
        if (c.sqlite3_open("DB/TLR.db", &db) != c.SQLITE_OK) {
            print("Can't open database\n", .{});
        }

        // Prepare statement
        const query1 =
            \\SELECT val_int0
            \\FROM GameMeta
            \\WHERE attrib = 'currSession'
            \\AND sessionID = 0
        ;

        var stmt: ?*c.sqlite3_stmt = null;

        if (c.sqlite3_prepare_v2(db, query1, -1, &stmt, null) != c.SQLITE_OK) {
            print("Failed to prepare statement(1): {s}\n", .{c.sqlite3_errmsg(db)});
        }
        defer _ = c.sqlite3_finalize(stmt);

        // Evaluate the statement
        var foo: i64 = 0;
        if (c.sqlite3_step(stmt) == c.SQLITE_ROW) {
            // Fetch the first column (index 0) directly as a 64-bit integer
            foo = c.sqlite3_column_int64(stmt, 0);
        }

        return SQLite{
            .db = db,
            .currSession = foo,
        };
    }

    // ********************************************************************************************
    pub fn is_hill(self: SQLite, x: usize, y: usize) bool {
        const X: i32 = @intCast(x);
        const Y: i32 = @intCast(y);

        // Prepare statement
        const query1 =
            \\SELECT 1 FROM GameMap
            \\WHERE hex_x = ?1
            \\AND hex_y = ?2
            \\AND sessionID = ?3
            \\AND terrainNum = 5
        ;

        var stmt: ?*c.sqlite3_stmt = null;

        if (c.sqlite3_prepare_v2(self.db, query1, -1, &stmt, null) != c.SQLITE_OK) {
            print("Failed to prepare statement(1): {s}\n", .{c.sqlite3_errmsg(self.db)});
        }
        defer _ = c.sqlite3_finalize(stmt);

        // Binding
        _ = c.sqlite3_bind_int(stmt, 1, X);
        _ = c.sqlite3_bind_int(stmt, 2, Y);
        const curS: i32 = @intCast(self.currSession);
        _ = c.sqlite3_bind_int(stmt, 3, curS);

        // Execute
        if (c.sqlite3_step(stmt) == c.SQLITE_ROW) return true;
        return false;
    }

    // ********************************************************************************************
    pub fn is_road_exit(self: SQLite, x: usize, y: usize, spine: i32) bool {
        const X: i32 = @intCast(x);
        const Y: i32 = @intCast(y);
        // Prepare statement
        const query1 =
            \\SELECT spineLoc FROM GameMap
            \\WHERE hex_x = ?1
            \\AND hex_y = ?2
            \\AND sessionID = ?3
            \\AND terrainNum = 9
            \\AND spineLoc = ?4
        ;

        var stmt: ?*c.sqlite3_stmt = null;

        if (c.sqlite3_prepare_v2(self.db, query1, -1, &stmt, null) != c.SQLITE_OK) {
            print("Failed to prepare statement(1): {s}\n", .{c.sqlite3_errmsg(self.db)});
        }
        defer _ = c.sqlite3_finalize(stmt);

        // Binding
        _ = c.sqlite3_bind_int(stmt, 1, X);
        _ = c.sqlite3_bind_int(stmt, 2, Y);
        const curS: i32 = @intCast(self.currSession);
        _ = c.sqlite3_bind_int(stmt, 3, curS);
        _ = c.sqlite3_bind_int(stmt, 4, spine);

        // Execute
        if (c.sqlite3_step(stmt) == c.SQLITE_ROW) return true;

        return false;
    }

    // ********************************************************************************************
    pub fn is_river_spine(self: SQLite, x: usize, y: usize, spine: i32) bool {
        const X: i32 = @intCast(x);
        const Y: i32 = @intCast(y);
        // Prepare statement
        const query1 =
            \\SELECT spineLoc FROM GameMap
            \\WHERE hex_x = ?1
            \\AND hex_y = ?2
            \\AND sessionID = ?3
            \\AND terrainNum = 8
            \\AND spineLoc = ?4
        ;

        var stmt: ?*c.sqlite3_stmt = null;

        if (c.sqlite3_prepare_v2(self.db, query1, -1, &stmt, null) != c.SQLITE_OK) {
            print("Failed to prepare statement(1): {s}\n", .{c.sqlite3_errmsg(self.db)});
        }
        defer _ = c.sqlite3_finalize(stmt);

        // Binding
        _ = c.sqlite3_bind_int(stmt, 1, X);
        _ = c.sqlite3_bind_int(stmt, 2, Y);
        const curS: i32 = @intCast(self.currSession);
        _ = c.sqlite3_bind_int(stmt, 3, curS);
        _ = c.sqlite3_bind_int(stmt, 4, spine);

        // Execute
        if (c.sqlite3_step(stmt) == c.SQLITE_ROW) return true;

        return false;
    }

    // ********************************************************************************************
    pub fn get_float_vals(self: SQLite, attrib: []const u8) struct { f32, f32, f32 } {
        // Prepare statement
        const query1 =
            \\SELECT val_real0, val_real1, val_real2 FROM GameMeta
            \\WHERE
            \\   attrib = ?1
            \\   AND
            \\   sessionID = 0
        ;

        var stmt: ?*c.sqlite3_stmt = null;

        if (c.sqlite3_prepare_v2(self.db, query1, -1, &stmt, null) != c.SQLITE_OK) {
            print("Failed to prepare statement(1): {s}\n", .{c.sqlite3_errmsg(self.db)});
        }
        defer _ = c.sqlite3_finalize(stmt);

        // Binding
        _ = c.sqlite3_bind_text(stmt, 1, attrib.ptr, @intCast(attrib.len), c.SQLITE_TRANSIENT);
        const curS: i32 = @intCast(self.currSession);
        _ = c.sqlite3_bind_int(stmt, 2, curS);

        // Evaluate the statement
        if (c.sqlite3_step(stmt) == c.SQLITE_ROW) {
            const x: f32 = @floatCast(c.sqlite3_column_double(stmt, 0));
            const y: f32 = @floatCast(c.sqlite3_column_double(stmt, 1));
            const z: f32 = @floatCast(c.sqlite3_column_double(stmt, 2));
            return .{ x, y, z };
        }

        return .{ 0.0, 0.0, 0.0 };
    }

    // ********************************************************************************************
    pub fn get_Point(self: SQLite, attrib: []const u8) struct { i32, i32 } {
        // Prepare statement
        const query1 =
            \\SELECT val_int0, val_int1 FROM GameMeta
            \\WHERE
            \\   attrib = ?1
            \\   AND
            \\   sessionID = 0
        ;

        var stmt: ?*c.sqlite3_stmt = null;

        if (c.sqlite3_prepare_v2(self.db, query1, -1, &stmt, null) != c.SQLITE_OK) {
            print("Failed to prepare statement(1): {s}\n", .{c.sqlite3_errmsg(self.db)});
        }
        defer _ = c.sqlite3_finalize(stmt);

        // Binding
        _ = c.sqlite3_bind_text(stmt, 1, attrib.ptr, @intCast(attrib.len), c.SQLITE_TRANSIENT);

        // Evaluate the statement
        if (c.sqlite3_step(stmt) == c.SQLITE_ROW) {
            const x: i32 = @intCast(c.sqlite3_column_int64(stmt, 0));
            const y: i32 = @intCast(c.sqlite3_column_int64(stmt, 1));
            return .{ x, y };
        }

        return .{ 0, 0 };
    }

    // ********************************************************************************************
    pub fn get_2int_vals(self: SQLite, attrib: []const u8) struct { i32, i32 } {
        // Prepare statement
        const query1 =
            \\SELECT val_int0, val_int1 FROM GameMeta
            \\WHERE
            \\   attrib = ?1
            \\   AND
            \\   sessionID = ?2
        ;

        var stmt: ?*c.sqlite3_stmt = null;

        if (c.sqlite3_prepare_v2(self.db, query1, -1, &stmt, null) != c.SQLITE_OK) {
            print("Failed to prepare statement(1): {s}\n", .{c.sqlite3_errmsg(self.db)});
        }
        defer _ = c.sqlite3_finalize(stmt);

        // Binding
        _ = c.sqlite3_bind_text(stmt, 1, attrib.ptr, @intCast(attrib.len), c.SQLITE_TRANSIENT);
        const curS: i32 = @intCast(self.currSession);
        _ = c.sqlite3_bind_int(stmt, 2, curS);

        // Evaluate the statement
        if (c.sqlite3_step(stmt) == c.SQLITE_ROW) {
            const x: i32 = @intCast(c.sqlite3_column_int64(stmt, 0));
            const y: i32 = @intCast(c.sqlite3_column_int64(stmt, 1));
            return .{ x, y };
        }

        return .{ 0, 0 };
    }

    // ********************************************************************************************
    pub fn close(self: SQLite) void {
        _ = c.sqlite3_close(self.db);
    }
};
