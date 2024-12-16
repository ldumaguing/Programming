const std = @import("std");
const stdio = std.io.getStdOut().writer();
const zqlite = @import("zqlite");

pub fn main() !void {
    try stdio.print("<!DOCTYPE html>\n", .{});
    try stdio.print("<html lang=\"en\">\n", .{});
    try stdio.print("<head>\n", .{});
    try stdio.print("<meta charset=\"UTF-8\">\n", .{});
    try stdio.print("<title>My First Webpage</title>\n", .{});
    try stdio.print("</head>\n", .{});
    try stdio.print("<body>\n", .{});

    try foo();

    try stdio.print("</body>\n", .{});
    try stdio.print("</html>\n", .{});
}

fn foo() !void {
    const flags = zqlite.OpenFlags.Create | zqlite.OpenFlags.EXResCode;
    var conn = try zqlite.open("../db/NW68.db", flags);
    defer conn.close();

    try stdio.print("<table>\n", .{});

    {
        // var rows = try conn.rows("select * from v_units order by id", .{});
        var rows = try conn.rows("select * from v_chits order by id", .{});

        defer rows.deinit();
        while (rows.next()) |row| {
            // try stdio.print("{} {s}; {s}; {s}\n", .{ row.int(0), row.text(1), row.text(2), row.text(3) });
            try stdio.print("<tr>\n", .{});
            try stdio.print("<td>{}</td>\n", .{row.int(0)});
            try stdio.print("<td><img src=\"/home/ayeka/resource/Vassal/NW68/{s}\"</td>\n", .{row.text(2)});
            try stdio.print("<td><img src=\"/home/ayeka/resource/Vassal/NW68/{s}\"</td>\n", .{row.text(3)});
            try stdio.print("<td>{s}</td>\n", .{row.text(1)});

            try stdio.print("</tr>\n", .{});
        }
        if (rows.err) |err| return err;
    }

    try stdio.print("</table>\n", .{});
}
