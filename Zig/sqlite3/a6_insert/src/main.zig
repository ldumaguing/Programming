const std = @import("std");
const print = std.debug.print;

const c = @import("c");

pub fn main() !void {
    var db: ?*c.sqlite3 = undefined;
    if (c.sqlite3_open("../fish.db", &db) != c.SQLITE_OK) {
        std.debug.print("Can't open database\n", .{});
        return;
    }
    defer _ = c.sqlite3_close(db);

    const sql = "SELECT * FROM foo";
    var stmt: ?*c.sqlite3_stmt = undefined;
    if (c.sqlite3_prepare_v2(db, sql, -1, &stmt, null) != c.SQLITE_OK) {
        std.debug.print("SQL error: {s}\n", .{c.sqlite3_errmsg(db)});
        return;
    }
    defer _ = c.sqlite3_finalize(stmt);

    while (c.sqlite3_step(stmt) == c.SQLITE_ROW) {
        // 1. Get raw C-string pointer (const [*c]const u8)
        const raw_str = c.sqlite3_column_text(stmt, 0);

        // 2. Convert to safe Zig slice without copying memory
        const name: []const u8 = std.mem.span(raw_str);

        std.debug.print("Fetched string: {s}\n", .{name});
    }

    // ********************************************************************************************
    const sql_1 = "INSERT INTO foo (aText) VALUES ('larry was here2')";
    //const sql_1 = "SELECT * FROM foo";
    if (c.sqlite3_prepare_v2(db, sql_1, -1, &stmt, null) != c.SQLITE_OK) {
        std.debug.print("SQL error: {s}\n", .{c.sqlite3_errmsg(db)});
        return;
    }

    _ = c.sqlite3_step(stmt);
    //_ = c.sqlite3_exec(db, "commit", null, null, null);

    print("**************\n", .{});
    if (c.sqlite3_prepare_v2(db, sql, -1, &stmt, null) != c.SQLITE_OK) {
        std.debug.print("SQL error: {s}\n", .{c.sqlite3_errmsg(db)});
        return;
    }

    while (c.sqlite3_step(stmt) == c.SQLITE_ROW) {
        // 1. Get raw C-string pointer (const [*c]const u8)
        const raw_str = c.sqlite3_column_text(stmt, 0);

        // 2. Convert to safe Zig slice without copying memory
        const name: []const u8 = std.mem.span(raw_str);

        std.debug.print("Fetched string: {s}\n", .{name});
    }
}
