const std = @import("std");
const print = std.debug.print;

const sqlite3 = @import("Database.zig");

pub fn foo(db: sqlite3.Database) void {
    print("In asset... {d}\n", .{db.currSession});
    db.foo();
}
