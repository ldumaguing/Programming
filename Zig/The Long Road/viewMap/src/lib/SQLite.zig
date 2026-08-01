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
    pub fn close(self: SQLite) void {
        _ = c.sqlite3_close(self.db);
    }
};
