const rl = @import("raylib");
const std = @import("std");
const print = std.debug.print;

const c = @cImport({
    @cInclude("sqlite3.h");
});

pub const Database = struct {
    db: ?*c.sqlite3, // in-memory Database
    currSession: i64,

    // ********************************************************************************************
    pub fn init() Database {
        var dsk_db: ?*c.sqlite3 = null;
        var db: ?*c.sqlite3 = null;

        // Open the databases
        if (c.sqlite3_open("DB/TLR.db", &dsk_db) != c.SQLITE_OK) {
            std.debug.print("Error opening database\n", .{});
        }
        defer _ = c.sqlite3_close(dsk_db); // close disk connection after init.

        if (c.sqlite3_open(":memory:", &db) != c.SQLITE_OK) {
            std.debug.print("Error opening database\n", .{});
        }

        // Initialize
        const p_backup = c.sqlite3_backup_init(db, "main", dsk_db, "main");
        defer _ = c.sqlite3_backup_finish(p_backup);

        // Copy database pages iteratively
        var rc: c_int = c.SQLITE_OK;
        while (rc == c.SQLITE_OK or rc == c.SQLITE_BUSY or rc == c.SQLITE_LOCKED) {
            rc = c.sqlite3_backup_step(p_backup, -1); // -1 copies all remaining pages at once
        }

        // Prepare the SQL statement
        var stmt: ?*c.sqlite3_stmt = null;
        const sql = "SELECT val_int0 FROM GameMeta WHERE attrib = 'currSession'";
        _ = c.sqlite3_prepare_v2(dsk_db, sql, -1, &stmt, null);
        defer _ = c.sqlite3_finalize(stmt);

        // Evaluate the statement
        var currSession: i64 = 0;
        if (c.sqlite3_step(stmt) == c.SQLITE_ROW) {
            currSession = c.sqlite3_column_int64(stmt, 0);
        }

        // ======================================================
        return Database{
            .db = db,
            .currSession = currSession,
        };
    }

    // ********************************************************************************************
    pub fn add_tile(self: Database, allocator: std.mem.Allocator, images: *std.ArrayList(rl.Image), tname: [:0]const u8) !void {
        _ = self;
        try images.append(allocator, try rl.loadImage(tname));
    }

    // ********************************************************************************************
    pub fn foo(self: Database) void {
        print("{d}\n", .{self.currSession});
    }

    // ********************************************************************************************
    pub fn close(self: Database) void {
        _ = c.sqlite3_close(self.db);
    }
};
