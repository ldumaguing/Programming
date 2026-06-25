// https://medium.com/@swindlers-inc/using-sqlite-with-zig-6810a6d015fc
const std = @import("std");

const c = @cImport({
    @cInclude("sqlite3.h");
});

fn callback(
    _: ?*anyopaque,
    argc: c_int,
    argv: [*c][*c]u8,
    azColName: [*c][*c]u8,
) callconv(.c) c_int {
    for (0..@intCast(argc)) |i| {
        if (argv[i] != null) {
            std.debug.print("{s} = {s}\n", .{ azColName[i], argv[i] });
        } else {
            std.debug.print("{s} = NULL\n", .{azColName[i]});
        }
    }
    std.debug.print("---\n", .{});
    return 0;
}

pub fn main() !u8 {
    var db: ?*c.sqlite3 = null;
    var rc = c.sqlite3_open("fish.db", &db);
    defer _ = c.sqlite3_close(db);
    if (rc != c.SQLITE_OK) {
        std.debug.print("Cannot open database: {s}\n", .{c.sqlite3_errmsg(db)});
        return 1;
    }

    var errMsg: [*c]u8 = undefined;
    rc = c.sqlite3_exec(db, "select * from laptop", &callback, null, &errMsg);
    if (rc != c.SQLITE_OK) {
        std.debug.print("SQL error: {s}\n", .{errMsg});
        c.sqlite3_free(errMsg);
        return 1;
    }

    return 0;
}
