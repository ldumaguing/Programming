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

    print(html_1, .{"Images"});
    show_chits(db);
    print(html_2, .{});
}

fn show_chits(db: ?*c.sqlite3) void {
    // ********** 2: prepare statement
    const query =
        \\SELECT * FROM v_chit ORDER BY descrip
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
        const name = c.sqlite3_column_text(stmt, 1);
        //const faction = c.sqlite3_column_text(stmt, 2);
        const front_img = c.sqlite3_column_text(stmt, 3);
        const back_img = c.sqlite3_column_text(stmt, 4);

        print("   <tr>", .{});
        print("<td>{d}</td><td><img src=\"TLR/{s}\"><img src=\"TLR/{s}\"></td>", .{ id, front_img, back_img });
        print("<td>{s}</td>", .{name});
        print("</tr>\n", .{});
    }
}
