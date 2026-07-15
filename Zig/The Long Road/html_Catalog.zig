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

    print(html_1, .{"Move Factor"});
    show_imgs(db);
    print(html_2, .{});
}

fn show_imgs(db: ?*c.sqlite3) void {
    // ********** 2: prepare statement
    const query =
        \\SELECT id, file, flag1, apf_val, apf_rng,
        \\apf2_val, apf2_rng,
        \\hef_val, hef_rng,
        \\hef2_val, hef2_rng
        \\FROM img WHERE mf_val >= 0
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
        const flag1 = c.sqlite3_column_int64(stmt, 2);
        const apf_val = c.sqlite3_column_int64(stmt, 3);
        const apf_rng = c.sqlite3_column_text(stmt, 4);
        const apf2_val = c.sqlite3_column_int64(stmt, 5);
        const apf2_rng = c.sqlite3_column_text(stmt, 6);
        const hef_val = c.sqlite3_column_int64(stmt, 7);
        const hef_rng = c.sqlite3_column_text(stmt, 8);
        const hef2_val = c.sqlite3_column_int64(stmt, 9);
        const hef2_rng = c.sqlite3_column_text(stmt, 10);

        print("   <tr>", .{});
        print("<td>{d}</td><td><img src=\"TLR/{s}\"></td>", .{ id, fname });

        if (apf_val >= 0) {
            print("<td valign=\"top\" style=\"border: 1px solid #ccc\">", .{});
            process_APF(flag1, apf_val, apf_rng);
            if (apf2_val >= 0)
                process_APF2(apf2_val, apf2_rng);
            print("</td>", .{});
        }

        if (hef_val >= 0) {
            print("<td valign=\"top\" style=\"border: 1px solid #ccc\">", .{});
            process_HEF(flag1, hef_val, hef_rng);
            if (hef2_val >= 0)
                process_HEF2(hef2_val, hef2_rng);
            print("</td>", .{});
        }

        print("</tr>\n", .{});
    }
}

fn process_HEF2(hef2_val: i64, hef2_rng: [*c]const u8) void {
    print("<b>HE2:</b> {d}", .{hef2_val});
    print(" ({s})<br>", .{hef2_rng});
}

fn process_HEF(flag1: i64, hef_val: i64, hef_rng: [*c]const u8) void {
    print("<b>HE:</b> {d}", .{hef_val});
    if ((flag1 & (3 << 6)) > 0) {
        if ((flag1 & (1 << 6)) > 0)
            print("<sup>-1</sup>", .{})
        else
            print("<sup>+1</sup>", .{});
    }
    print(" ({s})<br>", .{hef_rng});
    if ((flag1 & (1 << 8)) > 0) {
        print("May damage Armor <= 4.<br>", .{});
    }
    if ((flag1 & (1 << 9)) > 0) {
        print("Minimum range of 2.<br>", .{});
    }
    if ((flag1 & (1 << 10)) > 0) {
        print("Range effects do not apply.<br>", .{});
    }
}

fn process_APF2(apf2_val: i64, apf2_rng: [*c]const u8) void {
    print("<b>AP2:</b> {d}", .{apf2_val});
    print(" ({s})<br>", .{apf2_rng});
}

fn process_APF(flag1: i64, apf_val: i64, apf_rng: [*c]const u8) void {
    if ((flag1 & (1 << 2)) > 0)
        print("Wired guided missiles.<br>", .{});
    if ((flag1 & (1 << 5)) > 0)
        print("Range effects do not apply.<br>", .{});
    print("<b>AP:</b> {d}", .{apf_val});
    if ((flag1 & (3 << 3)) > 0) {
        if ((flag1 & (1 << 3)) > 0)
            print("<sup>-1</sup>", .{})
        else
            print("<sup>+1</sup>", .{});
    }
    print(" ({s})<br>", .{apf_rng});
}
