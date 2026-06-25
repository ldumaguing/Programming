const std = @import("std");
const c = @cImport({
    @cInclude("sqlite3.h");
});

pub fn main() !void {
    var db: ?*c.sqlite3 = undefined;
    if (c.sqlite3_open("fish.db", &db) != c.SQLITE_OK) {
        std.debug.print("Can't open database\n", .{});
        return;
    }
    defer _ = c.sqlite3_close(db);

    const sql = "SELECT notes FROM laptop where rowid = 244";
    var stmt: ?*c.sqlite3_stmt = undefined;
    if (c.sqlite3_prepare_v2(db, sql, -1, &stmt, null) != c.SQLITE_OK) {
        std.debug.print("SQL error: {s}\n", .{c.sqlite3_errmsg(db)});
        return;
    }
    defer _ = c.sqlite3_finalize(stmt);

    if (c.sqlite3_step(stmt) == c.SQLITE_ROW) {
        // 1. Get raw C-string pointer (const [*c]const u8)
        const raw_str = c.sqlite3_column_text(stmt, 0);

        // 2. Convert to safe Zig slice without copying memory
        const name: []const u8 = std.mem.span(raw_str);

        std.debug.print("Fetched string: {s}\n", .{name});
    }
}
