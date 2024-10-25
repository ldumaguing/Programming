const std = @import("std");
const foo = @import("foo.zig");

pub fn main() !void {
    const a1 = 33;
    const a2 = foo.c;
    std.debug.print("Hello, World!\n", .{});
    std.debug.print("a1:      {}\n", .{a1});
    std.debug.print("foo.c:   {}\n", .{foo.c});
    std.debug.print("a2:      {}\n", .{a2});
    foo.bar();
    std.debug.print("foo.fee: {}\n", .{foo.fee()});
    std.debug.print("foo.fie: {}\n", .{foo.fie(13)});
}
