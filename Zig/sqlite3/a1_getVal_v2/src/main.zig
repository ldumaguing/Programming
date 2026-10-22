const std = @import("std");

const c = @import("c");
const e = @import("lib/Engine.zig");

pub fn main() !void {
    var db: ?*c.sqlite3 = null;

    // Open the database (e.g., fish.db)
    if (c.sqlite3_open("fish.db", &db) != c.SQLITE_OK) {
        std.debug.print("Error opening database\n", .{});
        return;
    }
    defer _ = c.sqlite3_close(db);

    e.do_something(db);
}
