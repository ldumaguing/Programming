const std = @import("std");
const stdio = std.io.getStdOut().writer();

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
}
