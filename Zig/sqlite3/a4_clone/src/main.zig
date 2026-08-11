const std = @import("std");

const c = @cImport({
    @cInclude("sqlite3.h");
});

pub fn main() !void {
    var dsk_db: ?*c.sqlite3 = null;
    var mem_db: ?*c.sqlite3 = null;

    // Open the databases
    if (c.sqlite3_open("TLR.db", &dsk_db) != c.SQLITE_OK) {
        std.debug.print("Error opening database\n", .{});
        return;
    }

    if (c.sqlite3_open(":memory:", &mem_db) != c.SQLITE_OK) {
        std.debug.print("Error opening database\n", .{});
        return;
    }

    defer _ = c.sqlite3_close(dsk_db);
    defer _ = c.sqlite3_close(mem_db);

    // Initialize
    const p_backup = c.sqlite3_backup_init(mem_db, "main", dsk_db, "main");
    if (p_backup == null) return error.BackupInitFailed;
    defer _ = c.sqlite3_backup_finish(p_backup);

    // Copy database pages iteratively
    var rc: c_int = c.SQLITE_OK;
    while (rc == c.SQLITE_OK or rc == c.SQLITE_BUSY or rc == c.SQLITE_LOCKED) {
        rc = c.sqlite3_backup_step(p_backup, -1); // -1 copies all remaining pages at once
    }

    if (rc != c.SQLITE_DONE) return error.BackupFailed;

    // ********** 2: prepare statement
    const sql = "select * from map";
    var stmt: ?*c.sqlite3_stmt = undefined;
    if (c.sqlite3_prepare_v2(mem_db, sql, -1, &stmt, null) != c.SQLITE_OK) {
        std.debug.print("SQL error: {s}\n", .{c.sqlite3_errmsg(mem_db)});
        return;
    }
    defer _ = c.sqlite3_finalize(stmt);

    // ********** 3: loop result
    while (c.sqlite3_step(stmt) == c.SQLITE_ROW) {
        const num1 = c.sqlite3_column_int64(stmt, 0);
        const num2 = c.sqlite3_column_int64(stmt, 1);
        std.debug.print("{d},{d}\n", .{ num1, num2 });
    }
}
