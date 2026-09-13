const std = @import("std");
const print = std.debug.print;

const c = @cImport({
    @cInclude("sqlite3.h");
});

// 1. Define the struct with a string field
const User = struct {
    username: []const u8, // Strings are slices of constant u8 bytes
    id: u32,
};

pub fn main() !void {
    // 2. Initialize the struct (variable must be 'var' to mutate fields later)
    var user1 = User{
        .username = "Alice", // String literal assigned at initialization
        .id = 1,
    };

    print("Initial username: {s}\n", .{user1.username});

    var db: ?*c.sqlite3 = undefined;
    if (c.sqlite3_open("fish.db", &db) != c.SQLITE_OK) {
        print("Can't open database\n", .{});
        return;
    }
    defer _ = c.sqlite3_close(db);

    const sql = "SELECT notes FROM laptop where rowid = 244";
    var stmt: ?*c.sqlite3_stmt = undefined;
    if (c.sqlite3_prepare_v2(db, sql, -1, &stmt, null) != c.SQLITE_OK) {
        print("SQL error: {s}\n", .{c.sqlite3_errmsg(db)});
        return;
    }
    defer _ = c.sqlite3_finalize(stmt);

    if (c.sqlite3_step(stmt) == c.SQLITE_ROW) {
        // 1. Get raw C-string pointer (const [*c]const u8)
        const raw_str = c.sqlite3_column_text(stmt, 0);

        // 2. Convert to safe Zig slice without copying memory
        const name: []const u8 = std.mem.span(raw_str);

        print("Fetched string: {s}\n", .{name});

        // 3. Assign a new string to the struct variable at runtime
        user1.username = name;

        print("Updated username: {s}\n", .{user1.username});
    }
}
