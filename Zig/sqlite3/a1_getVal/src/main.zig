const std = @import("std");

const c = @cImport({
    @cInclude("sqlite3.h");
});

pub fn main() !void {
    var db: ?*c.sqlite3 = null;

    // Open the database (e.g., fish.db)
    if (c.sqlite3_open("fish.db", &db) != c.SQLITE_OK) {
        std.debug.print("Error opening database\n", .{});
        return;
    }
    defer _ = c.sqlite3_close(db);

    // Prepare the SQL statement
    var stmt: ?*c.sqlite3_stmt = null;
    const sql = "SELECT COUNT(*) FROM laptop";
    if (c.sqlite3_prepare_v2(db, sql, -1, &stmt, null) != c.SQLITE_OK) {
        std.debug.print("Failed to prepare statement\n", .{});
        return;
    }
    defer _ = c.sqlite3_finalize(stmt);

    // Evaluate the statement
    if (c.sqlite3_step(stmt) == c.SQLITE_ROW) {
        // Fetch the first column (index 0) directly as a 64-bit integer
        const count = c.sqlite3_column_int64(stmt, 0);
        std.debug.print("Row count is: {d}\n", .{count});
    }
}
