const std = @import("std");
const print = @import("std").debug.print;
//const fish = @import("fish");

const c = @cImport({
    @cInclude("sqlite3.h");
});

pub fn main() !void {
    var db: ?*c.sqlite3 = undefined;
    var stmt: ?*c.sqlite3_stmt = undefined;

    _ = c.sqlite3_open("fish.db", &db);
    if (db == null) {
        print("failed to open\n", .{});
        return;
    }

    _ = c.sqlite3_prepare_v2(db, "select * from laptop", -1, &stmt, null);
    var count: i32 = 0;
    while (c.sqlite3_step(stmt) != c.SQLITE_DONE) {
        count += 1;
        print("{d}\n", .{count});
    }
}
