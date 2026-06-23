const std = @import("std");
const print = @import("std").debug.print;

const c = @cImport({
    @cInclude("sqlite3.h");
});

pub fn main() !void {
    // ****************************************** connect to a database
    var db: ?*c.sqlite3 = undefined;
    _ = c.sqlite3_open("fish.db", &db);
    defer _ = c.sqlite3_close(db);

    if (db == null) {
        print("failed to open\n", .{});
        return;
    }

    // ******************************************
}

