const std = @import("std");
const c = @cImport({
    @cInclude("sqlite3.h");
});

pub fn main() !void {
    var db: ?*c.sqlite3 = null;
    if (c.sqlite3_open("fish.db", &db) != c.SQLITE_OK) {
        return error.DatabaseOpenFailed;
    }
    defer _ = c.sqlite3_close(db);

    const query = "SELECT man, notes FROM laptop";
    var stmt: ?*c.sqlite3_stmt = null;

    // Prepare the statement
    if (c.sqlite3_prepare_v2(db, query, -1, &stmt, null) != c.SQLITE_OK) {
        return error.PrepareFailed;
    }
    defer _ = c.sqlite3_finalize(stmt);

    // Loop through the results manually using raw C semantics
    while (c.sqlite3_step(stmt) == c.SQLITE_ROW) {
        // Retrieve columns by their zero-indexed position
        const man = c.sqlite3_column_int64(stmt, 0);
        std.debug.print("Man#: {d}\n", .{ man });

        const name_ptr = c.sqlite3_column_text(stmt, 1);
        if (name_ptr == null) {
            std.debug.print("foo\n", .{});
        } else {
            const name = std.mem.span(name_ptr);
            std.debug.print("Notes: {s}\n", .{name});
        }
    }
}
