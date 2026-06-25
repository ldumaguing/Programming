const std = @import("std");

const c = @cImport({
    @cInclude("sqlite3.h");
});

pub fn main() !void {
    // ********** 1: open database
    var db: ?*c.sqlite3 = undefined;
    if (c.sqlite3_open("fish.db", &db) != c.SQLITE_OK) {
        std.debug.print("Can't open database\n", .{});
        return;
    }
    defer _ = c.sqlite3_close(db);

    // ********** 2: prepare statement
    const sql = "SELECT man, notes FROM laptop";
    var stmt: ?*c.sqlite3_stmt = undefined;
    if (c.sqlite3_prepare_v2(db, sql, -1, &stmt, null) != c.SQLITE_OK) {
        std.debug.print("SQL error: {s}\n", .{c.sqlite3_errmsg(db)});
        return;
    }
    defer _ = c.sqlite3_finalize(stmt);

    // ********** 3: loop result
    while (c.sqlite3_step(stmt) == c.SQLITE_ROW) {
        const man_num = c.sqlite3_column_int64(stmt, 0);

        const string_p = c.sqlite3_column_text(stmt, 1);
        if (string_p == null) {
            std.debug.print("{d}; ---\n", .{man_num});
        } else {
            const notes = std.mem.span(string_p);
            std.debug.print("Notes: {s}\n", .{notes});
        }
    }
}
