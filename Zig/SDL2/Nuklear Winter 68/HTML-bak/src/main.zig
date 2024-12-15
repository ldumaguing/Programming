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
    try stdio.print("<h1>Yo</h1>\n", .{});
    const flags = zqlite.OpenFlags.Create | zqlite.OpenFlags.EXResCode;
    var conn = try zqlite.open("../db/NW68.db", flags);
    defer conn.close();

    {
        var rows = try conn.rows("select * from v_chits order by id", .{});
        defer rows.deinit();
        while (rows.next()) |row| {
            stdio.print("name: {}{s}{s}{s}\n", .{ row.text(0), row.text(1), row.text(2), row(3) });
        }
        if (rows.err) |err| return err;
    }
}
