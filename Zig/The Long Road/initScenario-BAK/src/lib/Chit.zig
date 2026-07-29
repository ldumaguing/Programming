const std = @import("std");
const print = std.debug.print;

const c = @cImport({
    @cInclude("sqlite3.h");
});

pub fn place(unitID: []const u8, location: []const u8) void {
    print("{s}: {s}\n", .{unitID, location});
}
