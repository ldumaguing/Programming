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
            // try stdio.print("<td>{s}</td>\n", .{row.text(1)});
            // try stdio.print("<td><b>{s}</b></td>\n", .{row.text(4)});
            // try stdio.print("<td>{s}</td>\n", .{row.text(5)});
            // try stdio.print("<td>{b}</td>\n", .{row.int(6)});
            // ***** AP
            if (row.int(8) == 1) {
                try stdio.print("<td><h1><span style='background-color:red'>&emsp;{}&emsp;</span></h1></td>\n", .{row.int(7)});
            } else if (row.int(8) == 2) {
                try stdio.print("<td><h1><span style='background-color:DodgerBlue'>&emsp;{}&emsp;</span></h1></td>\n", .{row.int(7)});
            } else if (row.int(8) == 4) {
                try stdio.print("<td><h1><span style='background-color:violet'>&emsp;{}&emsp;</span></h1></td>\n", .{row.int(7)});
            } else {
                try stdio.print("<td><h1>&emsp;{}&emsp;</h1></td>\n", .{row.int(7)});
            }
            // ***** AP_R
            if (row.int(10) == 1) {
                try stdio.print("<td><h2><span style='background-color:red'>&emsp;{}&emsp;</span></h2></td>\n", .{row.int(9)});
            } else if (row.int(10) == 2) {
                try stdio.print("<td><h2><span style='background-color:DodgerBlue'>&emsp;{}&emsp;</span></h2></td>\n", .{row.int(9)});
            } else {
                try stdio.print("<td><h2>&emsp;{}&emsp;</h2></td>\n", .{row.int(9)});
            }
            // ***** HE
            if (row.int(12) == 3) {
                try stdio.print("<td><h1><span style='background-color:yellow'>&emsp;{}&emsp;</span></h1></td>\n", .{row.int(11)});
            } else {
                try stdio.print("<td><h2>&emsp;{}&emsp;</h2></td>\n", .{row.int(11)});
            }
            // ***** HE_R
            if (row.int(14) == 3) {
                try stdio.print("<td><h2><span style='background-color:yellow'>&emsp;{}&emsp;</span></h2></td>\n", .{row.int(13)});
            } else {
                try stdio.print("<td><h2>&emsp;{}&emsp;</h2></td>\n", .{row.int(13)});
            }
            // ***** Arm
            if (row.int(16) == 1) {
                try stdio.print("<td><h1><span style='background-color:red'>&emsp;{}&emsp;</span></h1></td>\n", .{row.int(15)});
            } else if (row.int(16) == 2) {
                try stdio.print("<td><h1><span style='background-color:DodgerBlue'>&emsp;{}&emsp;</span></h1></td>\n", .{row.int(15)});
            } else if (row.int(16) == 3) {
                try stdio.print("<td><h1><span style='background-color:yellow'>&emsp;{}&emsp;</span></h1></td>\n", .{row.int(15)});
            } else {
                try stdio.print("<td><h1>&emsp;{}&emsp;</h1></td>\n", .{row.int(15)});
            }
            // ***** Spd
            try stdio.print("<td><h1><u>&emsp;{}&emsp;</u></h1></td>\n", .{row.int(17)});
            // ***** Spd_m
            try stdio.print("<td><h2><u>&emsp;{}&emsp;</u></h2></td>\n", .{row.int(18)});
            // ***** AP2
            if (row.int(20) == 1) {
                try stdio.print("<td><h1><span style='background-color:red'>&emsp;{}&emsp;</span></h1></td>\n", .{row.int(19)});
            } else if (row.int(20) == 2) {
                try stdio.print("<td><h1><span style='background-color:DodgerBlue'>&emsp;{}&emsp;</span></h1></td>\n", .{row.int(19)});
            } else if (row.int(20) == 4) {
                try stdio.print("<td><h1><span style='background-color:violet'>&emsp;{}&emsp;</span></h1></td>\n", .{row.int(19)});
            } else {
                try stdio.print("<td><h1>&emsp;{}&emsp;</h1></td>\n", .{row.int(19)});
            }
            // ***** AP_R2
            if (row.int(22) == 1) {
                try stdio.print("<td><h2><span style='background-color:red'>&emsp;{}&emsp;</span></h2></td>\n", .{row.int(21)});
            } else if (row.int(22) == 2) {
                try stdio.print("<td><h2><span style='background-color:DodgerBlue'>&emsp;{}&emsp;</span></h2></td>\n", .{row.int(21)});
            } else {
                try stdio.print("<td><h2>&emsp;{}&emsp;</h2></td>\n", .{row.int(21)});
            }
            // ***** HE2
            if (row.int(24) == 3) {
                try stdio.print("<td><h1><span style='background-color:yellow'>&emsp;{}&emsp;</span></h1></td>\n", .{row.int(23)});
            } else {
                try stdio.print("<td><h2>&emsp;{}&emsp;</h2></td>\n", .{row.int(23)});
            }
            // ***** HE_R_c2
            if (row.int(26) == 3) {
                try stdio.print("<td><h2><span style='background-color:yellow'>&emsp;{}&emsp;</span></h2></td>\n", .{row.int(25)});
            } else {
                try stdio.print("<td><h2>&emsp;{}&emsp;</h2></td>\n", .{row.int(25)});
            }
            try stdio.print("</tr>\n", .{});
        }
        if (rows.err) |err| return err;
    }

    try stdio.print("</table>\n", .{});
}
