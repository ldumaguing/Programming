//! By convention, main.zig is where your main function lives in the case that
//! you are building an executable. If you are making a library, the convention
//! is to delete this file and start with root.zig instead.
const sqlite = @import("sqlite");

pub fn main() !void {
    var db = try sqlite.Db.init(.{
        .mode = sqlite.Db.Mode{ .File = "mydata.db" },
        .open_flags = .{
            .write = true,
            .create = true,
        },
        .threading_mode = .MultiThread,
    });

    // ********************

    try db.exec("CREATE TABLE IF NOT EXISTS employees(id integer primary key, name text, age integer, salary integer)", .{}, .{});

    const query =
        \\SELECT id, name, age, salary FROM employees WHERE age > ? AND age < ?
    ;

    var stmt = try db.prepare(query);
    defer stmt.deinit();
}

const std = @import("std");
