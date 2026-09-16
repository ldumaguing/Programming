const std = @import("std");
const print = std.debug.print;

const card = @import("lib/Card.zig");

pub fn main() !void {
    const foo = card.Card.init("Larry was here");
    print("{s}\n", .{foo.name});
}
