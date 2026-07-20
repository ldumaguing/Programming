// to compile:
// zig build-exe <foo>.zig -lc -lsqlite3
const std = @import("std");
const print = std.debug.print;

const c = @cImport({
    @cInclude("sqlite3.h");
});

pub fn main() !void {
    // ********** 1: open database
    var db: ?*c.sqlite3 = undefined;
    if (c.sqlite3_open("DB/TLR.db", &db) != c.SQLITE_OK) {
        std.debug.print("Can't open database\n", .{});
        return;
    }
    defer _ = c.sqlite3_close(db);

    const html_1 =
        \\<!DOCTYPE html>
        \\<html>
        \\<head>
        \\   <meta charset="UTF-8">
        \\   <title>{s}</title>
        \\</head>
        \\<body>
        \\<table>
        \\
    ;
    const html_2 =
        \\</table>
        \\</body>
        \\</html>
        \\
    ;

    print(html_1, .{"158x158"});
    show_imgs(db);
    print(html_2, .{});
}

fn show_imgs(db: ?*c.sqlite3) void {
    // ********** 2: prepare statement
    const query =
        \\SELECT id, file
        \\FROM img
    ;

    var stmt: ?*c.sqlite3_stmt = undefined;
    if (c.sqlite3_prepare_v2(db, query, -1, &stmt, null) != c.SQLITE_OK) {
        std.debug.print("SQL error: {s}\n", .{c.sqlite3_errmsg(db)});
        return;
    }
    defer _ = c.sqlite3_finalize(stmt);

    // ********** 3: loop result
    while (c.sqlite3_step(stmt) == c.SQLITE_ROW) {
        const id = c.sqlite3_column_int64(stmt, 0);
        const fname = c.sqlite3_column_text(stmt, 1);
        print("   <tr><td>{d}</td><td><img src=\"TLR/{s}\"></td>", .{ id, fname });
        print("</tr>\n", .{});
        // const string_p = c.sqlite3_column_text(stmt, 1);
        // if (string_p == null) {
        //     std.debug.print("{d}\n", .{img_id});
        // } else {
        //     const fname = std.mem.span(string_p);
        //     std.debug.print("{s}\n", .{fname});
        // }
    }
}
